CREATE TABLE [Fact].[Transaction] (
    [Transaction Key]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [Date Key]                    DATE            NOT NULL,
    [Customer Key]                INT             NULL,
    [Bill To Customer Key]        INT             NULL,
    [Supplier Key]                INT             NULL,
    [Transaction Type Key]        INT             NOT NULL,
    [Payment Method Key]          INT             NULL,
    [WWI Customer Transaction ID] INT             NULL,
    [WWI Supplier Transaction ID] INT             NULL,
    [WWI Invoice ID]              INT             NULL,
    [WWI Purchase Order ID]       INT             NULL,
    [Supplier Invoice Number]     NVARCHAR (20)   NULL,
    [Total Excluding Tax]         DECIMAL (18, 2) NOT NULL,
    [Tax Amount]                  DECIMAL (18, 2) NOT NULL,
    [Total Including Tax]         DECIMAL (18, 2) NOT NULL,
    [Outstanding Balance]         DECIMAL (18, 2) NOT NULL,
    [Is Finalized]                BIT             NOT NULL,
    [Lineage Key]                 INT             NOT NULL
);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for a row in the Transaction fact', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Transaction Key';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction date', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Date Key';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer (if applicable)', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Customer Key';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill to customer (if applicable)', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Bill To Customer Key';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier (if applicable)', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Supplier Key';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of transaction', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Transaction Type Key';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Payment method (if applicable)', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Payment Method Key';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer transaction ID in source system', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'WWI Customer Transaction ID';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier transaction ID in source system', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'WWI Supplier Transaction ID';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Invoice ID in source system', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'WWI Invoice ID';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase order ID in source system', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'WWI Purchase Order ID';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier invoice number (if applicable)', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Supplier Invoice Number';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount excluding tax', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Total Excluding Tax';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount of tax', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Tax Amount';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount including tax', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Total Including Tax';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Amount still outstanding for this transaction', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Outstanding Balance';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Has this transaction been finalized?', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Is Finalized';
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'COLUMN', @level2name = N'Lineage Key';
GO

ALTER TABLE [Fact].[Transaction]
    ADD CONSTRAINT [FK_Fact_Transaction_Payment_Method_Key_Dimension_Payment Method] FOREIGN KEY ([Payment Method Key]) REFERENCES [Dimension].[Payment Method] ([Payment Method Key]);
GO

ALTER TABLE [Fact].[Transaction]
    ADD CONSTRAINT [FK_Fact_Transaction_Supplier_Key_Dimension_Supplier] FOREIGN KEY ([Supplier Key]) REFERENCES [Dimension].[Supplier] ([Supplier Key]);
GO

ALTER TABLE [Fact].[Transaction]
    ADD CONSTRAINT [FK_Fact_Transaction_Date_Key_Dimension_Date] FOREIGN KEY ([Date Key]) REFERENCES [Dimension].[Date] ([Date]);
GO

ALTER TABLE [Fact].[Transaction]
    ADD CONSTRAINT [FK_Fact_Transaction_Transaction_Type_Key_Dimension_Transaction Type] FOREIGN KEY ([Transaction Type Key]) REFERENCES [Dimension].[Transaction Type] ([Transaction Type Key]);
GO

ALTER TABLE [Fact].[Transaction]
    ADD CONSTRAINT [FK_Fact_Transaction_Bill_To_Customer_Key_Dimension_Customer] FOREIGN KEY ([Bill To Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key]);
GO

ALTER TABLE [Fact].[Transaction]
    ADD CONSTRAINT [FK_Fact_Transaction_Customer_Key_Dimension_Customer] FOREIGN KEY ([Customer Key]) REFERENCES [Dimension].[Customer] ([Customer Key]);
GO

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Supplier_Key]
    ON [Fact].[Transaction]([Supplier Key] ASC);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'INDEX', @level2name = N'FK_Fact_Transaction_Supplier_Key';
GO

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Bill_To_Customer_Key]
    ON [Fact].[Transaction]([Bill To Customer Key] ASC);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'INDEX', @level2name = N'FK_Fact_Transaction_Bill_To_Customer_Key';
GO

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Customer_Key]
    ON [Fact].[Transaction]([Customer Key] ASC);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'INDEX', @level2name = N'FK_Fact_Transaction_Customer_Key';
GO

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Transaction_Type_Key]
    ON [Fact].[Transaction]([Transaction Type Key] ASC);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'INDEX', @level2name = N'FK_Fact_Transaction_Transaction_Type_Key';
GO

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Date_Key]
    ON [Fact].[Transaction]([Date Key] ASC);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'INDEX', @level2name = N'FK_Fact_Transaction_Date_Key';
GO

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Payment_Method_Key]
    ON [Fact].[Transaction]([Payment Method Key] ASC);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction', @level2type = N'INDEX', @level2name = N'FK_Fact_Transaction_Payment_Method_Key';
GO

ALTER TABLE [Fact].[Transaction]
    ADD CONSTRAINT [PK_Fact_Transaction] PRIMARY KEY CLUSTERED ([Transaction Key] ASC);
GO

EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Transaction fact table (financial transactions involving customers and supppliers)', @level0type = N'SCHEMA', @level0name = N'Fact', @level1type = N'TABLE', @level1name = N'Transaction';
GO

