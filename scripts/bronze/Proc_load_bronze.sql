/* 
===========================================================================================================================
Stored Procedure: Load Bronze Layer (source - . Bronze)
===========================================================================================================================
Script Purpose: 
  This SP loads data into the 'bronze' schema from external CSV files.
  It performs the following actions: 
  - Truncates the bronze tables before loading data. 
  - uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters: 
  None. 

This SP does not accept any parameters or return any values. 

Usage Example: 

EXEC bronze.load_bronze; 
===========================================================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
		DECLARE @start_time DATETIME , @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
		BEGIN TRY
		PRINT '==============================================';
		PRINT ' Loading Bronze Layer';
		PRINT '==============================================';

		PRINT '----------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '----------------------------------------------';

		SET @batch_start_time = GETDATE();
		SET @start_time = GETDATE();
		PRINT  '>> Truncating Table: bronze.crm_cust_info';

		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into: bronze.crm_cust_info';

		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Divya\SQL DW Project\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);


		SELECT COUNT(*) FROM bronze.crm_cust_info;
		
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------------------------------------------------------------------';

		PRINT '----------------------------------------------';

		PRINT  '>> Truncating Table: bronze.crm_prd_info';

		
		SET @start_time = GETDATE();

		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into: bronze.crm_prd_info';

		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Divya\SQL DW Project\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);

		SELECT COUNT(*) FROM bronze.crm_prd_info;
		--SELECT * FROM bronze.crm_prd_info;

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------------------------------------------------------------------';

		PRINT '----------------------------------------------';

		PRINT  '>> Truncating Table: crm_sales_details';

		SET @start_time = GETDATE();

		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into: bronze.crm_sales_details';


		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Divya\SQL DW Project\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);

		SELECT COUNT(*) FROM bronze.crm_sales_details;
		--SELECT * FROM bronze.crm_sales_details;

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------------------------------------------------------------------';

		PRINT '----------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '----------------------------------------------';


		PRINT  '>> Truncating Table: bronze.erp_cust_az12';
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';

		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Divya\SQL DW Project\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);

		SELECT COUNT(*) FROM bronze.erp_cust_az12;
		

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------------------------------------------------------------------';

		PRINT '----------------------------------------------';


		PRINT  '>> Truncating Table: bronze.erp_loc_a101';
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';

		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Divya\SQL DW Project\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);

		SELECT COUNT(*) FROM bronze.erp_loc_a101;
	
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------------------------------------------------------------------';


		PRINT '----------------------------------------------';


		PRINT  '>> Truncating Table: bronze.erp_px_cat_g1v2';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Divya\SQL DW Project\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);

		SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------------------------------------------------------------------';

			SET @batch_end_time = GETDATE();
			PRINT '========================================================================================================='
			PRINT ' Loading Bronze Layer is Completed';
			PRINT '>> - Total Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
			PRINT '>> -----------------------------------------------------------------------------------------';

		END TRY

	BEGIN CATCH
		PRINT '================================================================================'
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '================================================================================'

	END CATCH

END
