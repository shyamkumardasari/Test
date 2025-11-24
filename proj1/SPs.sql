--⚙️ Create a Stored Procedure (Return Total Orders for a Customer)
CREATE OR REPLACE PROCEDURE DEMO_DB.PUBLIC.SP_GET_ORDERS(CUST_ID FLOAT)
RETURNS VARCHAR
LANGUAGE JAVASCRIPT
AS
$$
var sql_cmd = `
    SELECT ORDER_ID, ORDER_AMOUNT, ORDER_DATE
    FROM DEMO_DB.PUBLIC.ORDERS
    WHERE CUSTOMER_ID = ${CUST_ID}
`;

snowflake.execute({ sqlText: sql_cmd });

return 'OK';
$$;


CALL DEMO_DB.PUBLIC.SP_GET_ORDERS(2);