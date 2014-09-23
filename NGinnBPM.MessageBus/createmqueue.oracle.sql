﻿CREATE TABLE MQ_TEST1 (
  id NUMBER(10) PRIMARY KEY,
  from_endpoint VARCHAR(50) NOT NULL,
  to_endpoint VARCHAR(50) NOT NULL,
  subqueue CHAR(1) NOT NULL,
  insert_time DATE NOT NULL,
  last_processed DATE NOT NULL,
  retry_time DATE NOT NULL,
  retry_count NUMBER(2) NOT NULL,
  error_info CLOB NULL,
  correlation_id VARCHAR2(100) NULL,
  label VARCHAR2(100) NULL,
  msg_text NCLOB NULL,
  msg_headers NCLOB NULL,
  unique_id VARCHAR2(40) NULL
  )
  
  CREATE SEQUENCE MQ_TEST1_SEQ;
  
  
CREATE OR REPLACE TRIGGER MQ_TEST1_BIR
BEFORE INSERT ON MQ_TEST1
FOR EACH ROW
WHEN (new.id IS NULL)
BEGIN
  SELECT MQ_TEST1_SEQ.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
