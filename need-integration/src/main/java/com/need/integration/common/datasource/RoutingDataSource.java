package com.need.integration.common.datasource;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.jdbc.datasource.AbstractDataSource;
import org.springframework.util.CollectionUtils;


public class RoutingDataSource extends AbstractDataSource implements InitializingBean {
    private static final Logger log = LoggerFactory.getLogger(RoutingDataSource.class);
    
    private DataSource writeDataSource;
    private Map<String, DataSource> readDataSourceMap;
    
    
    private String[] readDataSourceNames;
    private DataSource[] readDataSources;
    private int readDataSourceCount;

    private AtomicInteger counter = new AtomicInteger(1);

    
    /**
     * 设置读库（name, DataSource）
     * @param readDataSourceMap
     */
    public void setReadDataSourceMap(Map<String, DataSource> readDataSourceMap) {
        this.readDataSourceMap = readDataSourceMap;
    }
    public void setWriteDataSource(DataSource writeDataSource) {
        this.writeDataSource = writeDataSource;
    }
    
    
    public void afterPropertiesSet() throws Exception {
//        if(writeDataSource == null) { modify by liyongran 20150823  
//            throw new IllegalArgumentException("property 'writeDataSource' is required");
//        }
        if(CollectionUtils.isEmpty(readDataSourceMap)) {
            throw new IllegalArgumentException("property 'readDataSourceMap' is required");
        }
        readDataSourceCount = readDataSourceMap.size();
        
        readDataSources = new DataSource[readDataSourceCount];
        readDataSourceNames = new String[readDataSourceCount];
        
        int i = 0;
        for(Entry<String, DataSource> e : readDataSourceMap.entrySet()) {
            readDataSources[i] = e.getValue();
            readDataSourceNames[i] = e.getKey();
            i++;
        }
        
        
    }
    
    
    private DataSource determineDataSource() {
        if(RoutingDataSourceCommon.isChoiceWrite()) {
            log.debug("current determine write datasource");
            return writeDataSource;
        }
        if(RoutingDataSourceCommon.isChoiceNone()) {
            log.debug("no choice read/write, default determine write datasource");
            return writeDataSource;
        }
        return determineReadDataSource();
    }
    
    private DataSource determineReadDataSource() {
        //按照顺序选择读库 
        //TODO 算法改进 
        int index = counter.incrementAndGet() % readDataSourceCount;
        if(index < 0) {
            index = - index;
        }
            
        String dataSourceName = readDataSourceNames[index];
        
        log.debug("current determine read datasource : {}", dataSourceName);

        return readDataSources[index];
    }
    
    public Connection getConnection() throws SQLException {
        return determineDataSource().getConnection();
    }
    
    public Connection getConnection(String username, String password) throws SQLException {
        return determineDataSource().getConnection(username, password);
    }

}
