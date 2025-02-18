-- ==============================================
--        PHARMACY DATABASE MANAGEMENT SYSTEM
-- ==============================================

-- 1. Create the Database and Use It
CREATE DATABASE Pharmacydb;
USE Pharmacydb;

-- ==============================================
--       TABLE CREATION AND DATA INSERTION
-- ==============================================

-- 2. Suppliers Table
CREATE TABLE Suppliers (
    SupplierID VARCHAR(10) NOT NULL PRIMARY KEY,
    Supplier_Name VARCHAR(255) NOT NULL,
    AddressLine VARCHAR(500) NOT NULL,
    Postcode VARCHAR(20) NOT NULL,
    Email VARCHAR(500) NOT NULL UNIQUE,
    Rating DECIMAL(3, 2) NULL, -- Supplier rating out of 5
    Lead_time INT NOT NULL, -- Estimated lead time for supply
    Status VARCHAR(50) NOT NULL -- Active or inactive supplier
) ENGINE=InnoDB;

-- Insert Sample Suppliers Data
INSERT INTO Suppliers (SupplierID, Supplier_Name, AddressLine, Postcode, Email, Rating, Lead_time, Status) 
VALUES 
('SP1', 'PharmaTech Ltd.', '1234 Elm Street, Manchester', 'M1 2AB', 'contact@pharmatech.com', 4.5, 3, 'active'),
('SP2', 'HealthCare Distributors', '5678 Oak Road, Birmingham', 'B2 3CD', 'info@healthcaredist.com', 4.0, 5, 'active'),
('SP3', 'MediSupply UK', '9 Pine Crescent, London', 'WC1N 3AX', 'support@medisupply.co.uk', NULL, 7, 'inactive'),
('SP4', 'MedStock Suppliers', '101 Maple Avenue, Liverpool', 'L4 5EF', 'sales@medstocksuppliers.com', 3.8, 4, 'active'),
('SP5', 'Wellness Pharma', '456 Birch Lane, Leeds', 'LS1 4GH', 'contact@wellnesspharma.co.uk', 4.2, 6, 'active'),
('SP6', 'BioMedics Ltd.', '789 Cedar Drive, Glasgow', 'G3 2HI', 'bio@biomedics.com', 5.0, 2, 'inactive'),
('SP7', 'Global Medical Supplies', '321 Cherry Street, Sheffield', 'S1 3JQ', 'global@medsupplies.com', 4.7, 3, 'active'),
('SP8', 'PharmEx Ltd.', '654 Ash Road, Newcastle', 'NE1 4JL', 'support@pharmex.co.uk', NULL, 5, 'active'),
('SP9', 'WellCare Pharmaceuticals', '23 Redwood Street, Bristol', 'BS1 1AA', 'wellcare@pharmasupplies.co.uk', 4.3, 4, 'active'),
('SP10', 'HealthPlus Solutions', '12 Oakwood Drive, Edinburgh', 'EH1 2DJ', 'sales@healthplussolutions.co.uk', NULL, 6, 'active'),
('SP11', 'ProMed Supplies', '34 Cedar Grove, Cardiff', 'CF10 2AA', 'promed@supplies.co.uk', 4.6, 3, 'active'),
('SP12', 'Omega Pharma', '88 Park Lane, Oxford', 'OX1 4QR', 'info@omegapha.co.uk', 4.2, 5, 'inactive'),
('SP13', 'Sage Pharmaceuticals', '77 King’s Road, Southampton', 'SO1 4AS', 'contact@sagepharma.co.uk', 3.9, 4, 'active'),
('SP14', 'MedPro Distributors', '29 Willow Walk, York', 'YO1 5AT', 'medpro@distributors.co.uk', 5.0, 2, 'active'),
('SP15', 'PharmaMed Limited', '54 High Street, Coventry', 'CV1 2QD', 'support@pharmamed.co.uk', 4.1, 6, 'inactive'),
('SP16', 'Core Health Supplies', '13 Beechwood Road, Nottingham', 'NG1 3HP', 'corehealth@supplies.com', 4.4, 4, 'active'),
('SP17', 'NextGen Pharmaceuticals', '21 Juniper Way, Durham', 'DH1 4HR', 'info@nextgenpharma.co.uk', 4.8, 3, 'active'),
('SP18', 'Silverstone Pharma', '30 Ashford Lane, Derby', 'DE1 5AN', 'sales@silverstonepharma.co.uk', NULL, 7, 'inactive');

-- 3. Drugs Table
CREATE TABLE Drugs (
    DrugID VARCHAR(10) NOT NULL PRIMARY KEY,
    Drug_name VARCHAR(255) NOT NULL,
    Dosage_form VARCHAR(50) NOT NULL,
    Strength VARCHAR(50) NOT NULL,
    Class VARCHAR(100) NOT NULL, -- Drug category
    SupplierID VARCHAR(10) NOT NULL,
    Price_per_unit DECIMAL(10, 2) NOT NULL, 
    Expiry_date DATE NOT NULL,
    Barcode_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
) ENGINE=InnoDB;

-- Insert Sample Drugs Data
INSERT INTO Drugs (DrugID, Drug_name, Dosage_form, Strength, Class, SupplierID, Price_per_unit, Expiry_date, Barcode_number) 
VALUES
('D1', 'Amoxicillin', 'Tablet', '500mg', 'Antibiotic', 'SP1', 3.50, '2026-10-10', '123456789012'),
('D2', 'Ibuprofen', 'Tablet', '200mg', 'Painkiller', 'SP2', 1.75, '2025-05-05', '987654321098'),
('D3', 'Paracetamol', 'Tablet', '500mg', 'Painkiller', 'SP3', 0.99, '2025-12-12', '567890123456'),
('D4', 'Aspirin', 'Tablet', '300mg', 'Painkiller', 'SP4', 2.00, '2026-01-01', '876543210987'),
('D5', 'Metformin', 'Tablet', '500mg', 'Diabetic', 'SP5', 4.25, '2027-03-03', '135792468024'),
('D6', 'Simvastatin', 'Tablet', '20mg', 'Cholesterol', 'SP6', 8.50, '2026-09-09', '246801357913'),
('D7', 'Lisinopril', 'Tablet', '10mg', 'Blood Pressure', 'SP7', 3.75, '2026-08-25', '456789012345'),
('D8', 'Cetirizine', 'Tablet', '10mg', 'Antihistamine', 'SP8', 2.20, '2025-11-11', '789012345678'),
('D9', 'Omeprazole', 'Capsule', '20mg', 'Antacid', 'SP9', 4.00, '2026-06-30', '890123456789'),
('D10', 'Salbutamol', 'Inhaler', '100mcg', 'Asthma', 'SP10', 15.00, '2025-09-15', '234567890123'),
('D11', 'Diazepam', 'Tablet', '5mg', 'Anxiolytic', 'SP11', 3.10, '2025-07-10', '345678901234'),
('D12', 'Prednisolone', 'Tablet', '5mg', 'Steroid', 'SP12', 2.50, '2026-05-01', '456789012346'),
('D13', 'Ciprofloxacin', 'Tablet', '250mg', 'Antibiotic', 'SP13', 5.50, '2026-02-28', '567890123457'),
('D14', 'Furosemide', 'Tablet', '40mg', 'Diuretic', 'SP14', 1.80, '2025-04-25', '678901234568'),
('D15', 'Losartan', 'Tablet', '50mg', 'Blood Pressure', 'SP15', 4.50, '2027-01-01', '789012345679'),
('D16', 'Gabapentin', 'Capsule', '300mg', 'Neurologic', 'SP16', 5.00, '2025-08-01', '890123456790'),
('D17', 'Lorazepam', 'Tablet', '1mg', 'Anxiolytic', 'SP17', 3.00, '2026-04-20', '123456789013'),
('D18', 'Doxycycline', 'Capsule', '100mg', 'Antibiotic', 'SP18', 6.00, '2026-07-10', '234567890124'),
('D19', 'Codeine', 'Tablet', '30mg', 'Painkiller', 'SP1', 2.80, '2025-06-30', '345678901235'),
('D20', 'Clonazepam', 'Tablet', '2mg', 'Anxiolytic', 'SP2', 4.60, '2026-12-12', '456789012347'),
('D21', 'Fentanyl Patch', 'Patch', '50mcg/hr', 'Painkiller', 'SP1', 12.00, '2025-11-20', '987654321200'),
('D22', 'Insulin Glargine', 'Injection', '100 IU/ml', 'Diabetic', 'SP5', 22.50, '2027-01-01', '234567890121'),
('D23', 'Lisinopril Patch', 'Patch', '5mg', 'Blood Pressure', 'SP7', 6.00, '2025-12-05', '543210987654'),
('D24', 'Vitamin D3', 'Liquid', '1000 IU/ml', 'Supplements', 'SP6', 7.00, '2026-05-15', '432109876543'),
('D25', 'Semaglutide', 'Injection', '0.25mg', 'Weight Loss', 'SP9', 85.00, '2025-10-10', '567890987654'),
('D26', 'Cetrizine Liquid', 'Liquid', '10mg/5ml', 'Antihistamine', 'SP8', 4.00, '2025-08-21', '890123456781'),
('D27', 'Tobramycin', 'Inhaler', '300mg', 'Antibiotic', 'SP13', 30.00, '2026-07-15', '234567890123'),
('D28', 'Loratadine', 'Tablet', '10mg', 'Antihistamine', 'SP8', 3.10, '2026-09-30', '876543210321'),
('D29', 'Clindamycin', 'Capsule', '150mg', 'Antibiotic', 'SP1', 4.00, '2025-07-20', '123498765432'),
('D30', 'Methotrexate', 'Tablet', '2.5mg', 'Cancer Treatment', 'SP12', 10.00, '2026-12-15', '234569876543'),
('D31', 'Nicotine Patch', 'Patch', '21mg/24hr', 'Smoking Cessation', 'SP14', 5.50, '2026-05-10', '876543210321'),
('D32', 'Melatonin', 'Tablet', '5mg', 'Sleep Aid', 'SP18', 3.00, '2025-11-15', '567890123459'),
('D33', 'Prazosin', 'Capsule', '1mg', 'Blood Pressure', 'SP7', 2.25, '2025-09-30', '890123456786'),
('D34', 'Bupropion', 'Tablet', '150mg', 'Antidepressant', 'SP9', 8.00, '2025-08-20', '234567890122'),
('D35', 'Testosterone', 'Injection', '200mg', 'Hormone Replacement', 'SP2', 75.00, '2026-03-12', '345678901235'),
('D36', 'Adrenaline', 'Injection', '1mg/ml', 'Emergency Treatment', 'SP6', 15.00, '2025-12-10', '987654321231'),
('D37', 'Caffeine', 'Tablet', '100mg', 'Stimulant', 'SP10', 1.50, '2025-04-30', '123456789032'),
('D38', 'Morphine Sulfate', 'Injection', '10mg/ml', 'Painkiller', 'SP4', 20.00, '2026-06-05', '456789012341'),
('D39', 'Saline Solution', 'Injection', '0.9%', 'Intravenous Solution', 'SP15', 4.50, '2026-02-25', '567890987612'),
('D40', 'Piroxicam', 'Gel', '0.5%', 'Painkiller', 'SP16', 6.25, '2027-05-15', '789012345689'),
('D41', 'Wegovy', 'Injection', '2.4mg', 'Weight Loss', 'SP9', 150.00, '2025-12-30', '543216789012'),
('D42', 'Mounjaro', 'Injection', '10mg', 'Weight Loss', 'SP10', 180.00, '2026-01-15', '654321789012');


-- 4. Inventory Table
CREATE TABLE Inventory (
    InventoryID VARCHAR(10) NOT NULL PRIMARY KEY,
    DrugID VARCHAR(10) NOT NULL,
    Quantity_in_stock INT NOT NULL,
    Last_restocked DATE NOT NULL,
    Restock_threshold INT NOT NULL,
    Batch_no VARCHAR(20) NOT NULL,
    Expiry_date DATE NOT NULL,
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
) ENGINE=InnoDB;

-- Insert Sample Inventory Data
INSERT INTO Inventory (InventoryID, DrugID, Quantity_in_stock, Last_restocked, Restock_threshold, Batch_no, Expiry_date)
VALUES 
('I1', 'D1', 150, '2025-01-10', 50, 'BATCH123', '2026-10-10'),
('I2', 'D2', 300, '2025-01-15', 100, 'BATCH124', '2025-05-05'),
('I3', 'D3', 500, '2025-01-20', 150, 'BATCH125', '2025-12-12'),
('I4', 'D4', 100, '2025-01-05', 30, 'BATCH126', '2026-01-01'),
('I5', 'D5', 80, '2025-01-18', 50, 'BATCH127', '2027-03-03'),
('I6', 'D6', 60, '2025-01-12', 25, 'BATCH128', '2026-09-09'),
('I7', 'D7', 200, '2025-01-25', 75, 'BATCH129', '2026-08-25'),
('I8', 'D8', 350, '2025-01-14', 100, 'BATCH130', '2025-11-11'),
('I9', 'D9', 400, '2025-01-10', 150, 'BATCH131', '2026-06-30'),
('I10', 'D10', 50, '2025-01-22', 20, 'BATCH132', '2025-09-15'),
('I11', 'D11', 150, '2025-01-17', 50, 'BATCH133', '2025-07-10'),
('I12', 'D12', 250, '2025-01-11', 100, 'BATCH134', '2026-05-01'),
('I13', 'D13', 180, '2025-01-20', 60, 'BATCH135', '2026-02-28'),
('I14', 'D14', 120, '2025-01-08', 40, 'BATCH136', '2025-04-25'),
('I15', 'D15', 220, '2025-01-05', 80, 'BATCH137', '2027-01-01'),
('I16', 'D16', 500, '2025-01-20', 150, 'BATCH138', '2025-08-01'),
('I17', 'D17', 60, '2025-01-18', 25, 'BATCH139', '2026-04-20'),
('I18', 'D18', 350, '2025-01-14', 100, 'BATCH140', '2026-07-10'),
('I19', 'D19', 75, '2025-01-23', 25, 'BATCH141', '2025-06-30'),
('I20', 'D20', 100, '2025-01-25', 50, 'BATCH142', '2026-12-12'),
('I21', 'D21', 80, '2025-01-22', 30, 'BATCH143', '2025-11-20'),
('I22', 'D22', 120, '2025-01-05', 50, 'BATCH144', '2027-01-01'),
('I23', 'D23', 90, '2025-01-10', 30, 'BATCH145', '2025-12-05'),
('I24', 'D24', 200, '2025-01-15', 80, 'BATCH146', '2026-05-15'),
('I25', 'D25', 50, '2025-01-12', 25, 'BATCH147', '2025-10-10'),
('I26', 'D26', 300, '2025-01-18', 120, 'BATCH148', '2025-08-21'),
('I27', 'D27', 50, '2025-01-14', 20, 'BATCH149', '2026-07-15'),
('I28', 'D28', 250, '2025-01-20', 80, 'BATCH150', '2026-09-30'),
('I29', 'D29', 100, '2025-01-22', 40, 'BATCH151', '2025-07-20'),
('I30', 'D30', 180, '2025-01-10', 60, 'BATCH152', '2026-12-15'),
('I31', 'D31', 400, '2025-01-05', 150, 'BATCH153', '2026-05-10'),
('I32', 'D32', 250, '2025-01-12', 100, 'BATCH154', '2025-11-15'),
('I33', 'D33', 120, '2025-01-22', 40, 'BATCH155', '2025-09-30'),
('I34', 'D34', 180, '2025-01-20', 60, 'BATCH156', '2025-08-20'),
('I35', 'D35', 90, '2025-01-10', 30, 'BATCH157', '2026-03-12'),
('I36', 'D36', 100, '2025-01-05', 40, 'BATCH158', '2025-12-10'),
('I37', 'D37', 500, '2025-01-22', 200, 'BATCH159', '2025-04-30'),
('I38', 'D38', 60, '2025-01-18', 20, 'BATCH160', '2026-06-05'),
('I39', 'D39', 300, '2025-01-15', 100, 'BATCH161', '2026-02-25'),
('I40', 'D40', 150, '2025-01-20', 50, 'BATCH162', '2027-05-15'),
('I41', 'D41', 80, '2025-01-12', 30, 'BATCH163', '2025-12-30'),
('I42', 'D42', 90, '2025-01-22', 40, 'BATCH164', '2026-01-15');

-- 5. Customers Table
CREATE TABLE Customers (
    CustomerID VARCHAR(10) NOT NULL PRIMARY KEY,
    Customer_name VARCHAR(255) NOT NULL,
    Customer_address VARCHAR(255) NOT NULL,
    Customer_email VARCHAR(100) NOT NULL UNIQUE,
    Customer_phone_no VARCHAR(20) NOT NULL,
    Type ENUM('Pharmacy', 'Hospital', 'Clinic', 'Other') NOT NULL,  
    Registration_date DATE NOT NULL,
    Customer_status ENUM('Active', 'Inactive') NOT NULL
) ENGINE=InnoDB;

-- Insert Sample Customers Data
INSERT INTO Customers (CustomerID, Customer_name, Customer_address, Customer_email, Customer_phone_no, Type, Registration_date, Customer_status)
VALUES
('C1', 'Greenfield Pharmacy', '123 Main St, Greenfield, England', 'greenfield@pharmacy.com', '0123456789', 'Pharmacy', '2023-05-12', 'active'),
('C2', 'City Health Clinic', '456 Elm St, Cityville, England', 'contact@cityhealth.com', '0987654321', 'Clinic', '2022-08-23', 'active'),
('C3', 'Sunrise Hospital', '789 Oak Ave, Sunnytown, England', 'info@sunrisehospital.com', '0112233445', 'Hospital', '2020-11-05', 'active'),
('C4', 'Royal Care Pharmacy', '321 High St, Royal City, England', 'contact@royalcarepharmacy.com', '0778899001', 'Pharmacy', '2024-01-15', 'active'),
('C5', 'Hearts and Minds Hospital', '101 Park Lane, Heartsville, England', 'admin@heartsandminds.com', '0162547890', 'Hospital', '2021-02-27', 'active'),
('C6', 'Greenhill Clinic', '202 Maple Rd, Greenhill, England', 'contact@greenhillclinic.com', '0198765432', 'Clinic', '2023-06-10', 'active'),
('C7', 'Lakeside Pharmacy', '303 Lakeview Dr, Lakeside, England', 'support@lakesidepharmacy.com', '0134567890', 'Pharmacy', '2022-11-09', 'active'),
('C8', 'Wellness Care Clinic', '150 Health Blvd, Wellville, England', 'wellness@careclinic.com', '0145789246', 'Clinic', '2024-01-25', 'active'),
('C9', 'Central City Hospital', '500 Downtown Rd, Central City, England', 'contact@centralcityhospital.com', '0178976532', 'Hospital', '2022-03-18', 'active'),
('C10', 'Bright Path Pharmacy', '100 Bright Ave, Brighttown, England', 'info@brightpathpharmacy.com', '0212345678', 'Pharmacy', '2023-12-03', 'active');

-- 6. Orders Table
CREATE TABLE Orders (
    OrderID VARCHAR(10) NOT NULL PRIMARY KEY,
    CustomerID VARCHAR(10) NOT NULL,
    Order_date DATE NOT NULL,
    Delivery_date DATE NOT NULL,
    Order_status ENUM('pending', 'shipped', 'completed', 'cancelled') NOT NULL,
    Total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
) ENGINE=InnoDB;

-- Insert Sample Orders Data
INSERT INTO Orders (OrderID, CustomerID, Order_date, Delivery_date, Order_status, Total_amount)
VALUES 
('O1', 'C1', '2025-01-10', '2025-01-12', 'pending', 1500.00),
('O2', 'C2', '2025-01-15', '2025-01-18', 'shipped', 800.00),
('O3', 'C3', '2025-01-05', '2025-01-07', 'completed', 1200.00),
('O4', 'C4', '2025-01-12', '2025-01-14', 'shipped', 2200.50),
('O5', 'C5', '2025-01-10', '2025-01-13', 'pending', 1350.75),
('O6', 'C6', '2025-01-18', '2025-01-20', 'completed', 500.00),
('O7', 'C7', '2025-01-15', '2025-01-17', 'shipped', 1800.25),
('O8', 'C8', '2025-01-23', '2025-01-25', 'pending', 950.00),
('O9', 'C9', '2025-01-10', '2025-01-12', 'completed', 1700.50),
('O10', 'C10', '2025-01-20', '2025-01-22', 'shipped', 2100.75);

-- 7. Order_Items Table
CREATE TABLE `Order_items` (
    `Order_item_ID` VARCHAR(10) NOT NULL,
    `OrderID` VARCHAR(10) NOT NULL,
    `DrugID` VARCHAR(10) NOT NULL,
    `Quantity_ordered` INT NOT NULL,
    `Unit_price` DECIMAL(10, 2) NOT NULL,
    `Total_price` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`Order_item_ID`),
    CONSTRAINT `fk_OrderItems_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `Orders`(`OrderID`),
    CONSTRAINT `fk_OrderItems_DrugID` FOREIGN KEY (`DrugID`) REFERENCES `Drugs`(`DrugID`));
   
INSERT INTO Order_Items (Order_item_ID, OrderID, DrugID, Quantity_ordered, Unit_price, Total_price)
VALUES
('OI1', 'O1', 'D1', 10, 50.00, 500.00),
('OI2', 'O1', 'D2', 5, 150.00, 750.00),
('OI3', 'O1', 'D3', 15, 20.00, 300.00),
('OI4', 'O1', 'D6', 8, 180.00, 1440.00),
('OI5', 'O2', 'D3', 15, 20.00, 300.00),
('OI6', 'O2', 'D4', 10, 80.00, 800.00),
('OI7', 'O2', 'D5', 8, 150.00, 1200.00),
('OI8', 'O2', 'D6', 5, 180.00, 900.00),
('OI9', 'O3', 'D5', 10, 150.00, 1500.00),
('OI10', 'O3', 'D6', 7, 180.00, 1260.00),
('OI11', 'O3', 'D7', 12, 50.00, 600.00),
('OI12', 'O3', 'D9', 6, 30.00, 180.00),
('OI13', 'O4', 'D6', 5, 180.00, 900.00),
('OI14', 'O4', 'D10', 20, 60.00, 1200.00),
('OI15', 'O4', 'D2', 4, 150.00, 600.00),
('OI16', 'O4', 'D4', 3, 80.00, 240.00),
('OI17', 'O5', 'D1', 10, 50.00, 500.00),
('OI18', 'O5', 'D3', 5, 20.00, 100.00),
('OI19', 'O5', 'D8', 6, 90.00, 540.00),
('OI20', 'O5', 'D7', 7, 50.00, 350.00),
('OI21', 'O6', 'D8', 8, 90.00, 720.00),
('OI22', 'O6', 'D5', 12, 150.00, 1800.00),
('OI23', 'O6', 'D9', 5, 30.00, 150.00),
('OI24', 'O6', 'D4', 6, 80.00, 480.00),
('OI25', 'O7', 'D2', 15, 150.00, 2250.00),
('OI26', 'O7', 'D3', 5, 20.00, 100.00),
('OI27', 'O7', 'D8', 4, 90.00, 360.00),
('OI28', 'O7', 'D10', 8, 60.00, 480.00),
('OI29', 'O8', 'D1', 10, 50.00, 500.00),
('OI30', 'O8', 'D2', 7, 150.00, 1050.00),
('OI31', 'O8', 'D4', 5, 80.00, 400.00),
('OI32', 'O8', 'D7', 9, 50.00, 450.00),
('OI33', 'O9', 'D9', 10, 30.00, 300.00),
('OI34', 'O9', 'D4', 12, 80.00, 960.00),
('OI35', 'O9', 'D6', 6, 180.00, 1080.00),
('OI36', 'O9', 'D10', 15, 60.00, 900.00),
('OI37', 'O10', 'D5', 7, 150.00, 1050.00),
('OI38', 'O10', 'D8', 8, 90.00, 720.00),
('OI39', 'O10', 'D3', 10, 20.00, 200.00),
('OI40', 'O10', 'D6', 12, 180.00, 2160.00),
('OI41', 'O1', 'D7', 5, 50.00, 250.00),
('OI42', 'O1', 'D9', 10, 30.00, 300.00),
('OI43', 'O2', 'D11', 4, 200.00, 800.00),
('OI44', 'O2', 'D12', 5, 120.00, 600.00),
('OI45', 'O2', 'D13', 7, 220.00, 1540.00),
('OI46', 'O3', 'D14', 15, 35.00, 525.00),
('OI47', 'O3', 'D16', 10, 70.00, 700.00),
('OI48', 'O4', 'D17', 9, 40.00, 360.00),
('OI49', 'O4', 'D18', 6, 200.00, 1200.00),
('OI50', 'O4', 'D19', 4, 100.00, 400.00),
('OI51', 'O5', 'D20', 10, 55.00, 550.00),
('OI52', 'O5', 'D21', 12, 150.00, 1800.00),
('OI53', 'O5', 'D22', 8, 95.00, 760.00),
('OI54', 'O6', 'D23', 5, 180.00, 900.00),
('OI55', 'O6', 'D24', 15, 60.00, 900.00),
('OI56', 'O6', 'D25', 10, 130.00, 1300.00),
('OI57', 'O7', 'D26', 6, 200.00, 1200.00),
('OI58', 'O7', 'D27', 5, 250.00, 1250.00),
('OI59', 'O7', 'D28', 8, 120.00, 960.00),
('OI60', 'O8', 'D29', 10, 50.00, 500.00),
('OI61', 'O8', 'D30', 6, 110.00, 660.00),
('OI62', 'O8', 'D31', 12, 90.00, 1080.00),
('OI63', 'O9', 'D32', 7, 160.00, 1120.00),
('OI64', 'O9', 'D33', 4, 140.00, 560.00),
('OI65', 'O9', 'D34', 5, 75.00, 375.00),
('OI66', 'O9', 'D35', 9, 220.00, 1980.00),
('OI67', 'O10', 'D36', 10, 45.00, 450.00),
('OI68', 'O10', 'D37', 8, 60.00, 480.00),
('OI69', 'O10', 'D38', 7, 80.00, 560.00),
('OI70', 'O10', 'D39', 6, 130.00, 780.00),
('OI71', 'O10', 'D40', 5, 150.00, 750.00),
('OI72', 'O10', 'D41', 4, 100.00, 400.00),
('OI73', 'O1', 'D42', 10, 200.00, 2000.00),
('OI74', 'O2', 'D6', 15, 180.00, 2700.00),
('OI75', 'O3', 'D1', 6, 50.00, 300.00),
('OI76', 'O4', 'D2', 5, 150.00, 750.00),
('OI77', 'O5', 'D3', 8, 20.00, 160.00),
('OI78', 'O6', 'D7', 4, 50.00, 200.00),
('OI79', 'O7', 'D9', 3, 30.00, 90.00),
('OI80', 'O8', 'D10', 12, 60.00, 720.00);

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o8';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o1';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o2';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o3';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o4';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o5';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o6';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o7';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o9';

UPDATE Orders
SET Total_amount = (
    SELECT SUM(oi.total_price)
    FROM Order_items oi
    WHERE oi.orderid = Orders.OrderID
)
WHERE OrderID = 'o10';

CREATE TABLE `Sales` (
    `SaleID` VARCHAR(10) NOT NULL,
    `OrderID` VARCHAR(10) NOT NULL,
    `Sale_date` DATE NOT NULL,
    `Payment_method` VARCHAR(50) NOT NULL,
    `Payment_status` VARCHAR(50) NOT NULL,
    `Amount_paid` DECIMAL(10, 2) NOT NULL,
    `Outstanding_balance` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`SaleID`),
    FOREIGN KEY (`OrderID`) REFERENCES `Orders`(`OrderID`)
);

INSERT INTO Sales (SaleID, OrderID, Sale_date, Payment_method, Payment_status, Amount_paid, Outstanding_balance)
VALUES
('S1', 'O1', '2025-01-11', 'Credit Card', 'pending', 3000.00, 2540.00),  
('S2', 'O2', '2025-01-16', 'PayPal', 'paid', 8840.00, 0.00),            
('S3', 'O3', '2025-01-06', 'Bank Transfer', 'completed', 5065.00, 0.00),  
('S4', 'O4', '2025-01-13', 'Credit Card', 'paid', 4000.00, 1650.50),     
('S5', 'O5', '2025-01-11', 'Cash', 'pending', 1000.00, 3760.00),        
('S6', 'O6', '2025-01-19', 'PayPal', 'completed', 6450.00, 0.00),        
('S7', 'O7', '2025-01-16', 'Bank Transfer', 'shipped', 6690.00, 0.00),   
('S8', 'O8', '2025-01-24', 'Credit Card', 'pending', 2500.00, 2860.00),  
('S9', 'O9', '2025-01-11', 'PayPal', 'completed', 7275.00, 0.00),        
('S10', 'O10', '2025-01-21', 'Credit Card', 'shipped', 5000.00, 2550.00);

CREATE TABLE `Purchases` (
    `PurchaseID` VARCHAR(10) NOT NULL,
    `SupplierID` VARCHAR(10) NOT NULL,
    `DrugID` VARCHAR(10) NOT NULL,
    `Quantity_purchased` INT NOT NULL,
    `Purchase_price` DECIMAL(10, 2) NOT NULL, 
    `Purchase_date` DATE NOT NULL,
    `Total_cost` DECIMAL(10, 2) NOT NULL,  
    PRIMARY KEY (`PurchaseID`),
    FOREIGN KEY (`DrugID`) REFERENCES `Drugs`(`DrugID`),  
    FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers`(`SupplierID`)
);

INSERT INTO Purchases (PurchaseID, SupplierID, DrugID, Quantity_purchased, Purchase_price, Purchase_date, Total_cost)
VALUES
('P1', 'SP1', 'D1', 100, 3.50, '2025-01-05', 350.00),
('P2', 'SP2', 'D2', 200, 1.75, '2025-01-06', 350.00),
('P3', 'SP3', 'D3', 150, 0.99, '2025-01-07', 148.50),
('P4', 'SP4', 'D4', 250, 2.00, '2025-01-08', 500.00),
('P5', 'SP5', 'D5', 100, 4.25, '2025-01-09', 425.00),
('P6', 'SP6', 'D6', 50, 8.50, '2025-01-10', 425.00),
('P7', 'SP7', 'D7', 75, 3.75, '2025-01-11', 281.25),
('P8', 'SP8', 'D8', 120, 2.20, '2025-01-12', 264.00),
('P9', 'SP9', 'D9', 60, 4.00, '2025-01-13', 240.00),
('P10', 'SP10', 'D10', 80, 15.00, '2025-01-14', 1200.00),
('P11', 'SP11', 'D11', 150, 3.10, '2025-01-15', 465.00),
('P12', 'SP12', 'D12', 90, 2.50, '2025-01-16', 225.00),
('P13', 'SP13', 'D13', 200, 5.50, '2025-01-17', 1100.00),
('P14', 'SP14', 'D14', 180, 1.80, '2025-01-18', 324.00),
('P15', 'SP15', 'D15', 130, 4.50, '2025-01-19', 585.00),
('P16', 'SP16', 'D16', 90, 5.00, '2025-01-20', 450.00),
('P17', 'SP17', 'D17', 150, 3.00, '2025-01-21', 450.00),
('P18', 'SP18', 'D18', 100, 6.00, '2025-01-22', 600.00),
('P19', 'SP1', 'D19', 200, 2.80, '2025-01-23', 560.00),
('P20', 'SP5', 'D20', 75, 4.60, '2025-01-24', 345.00),
('P21', 'SP1', 'D21', 120, 12.00, '2025-01-25', 1440.00),
('P22', 'SP5', 'D22', 90, 22.50, '2025-01-26', 2025.00),
('P23', 'SP7', 'D23', 140, 6.00, '2025-01-27', 840.00),
('P24', 'SP6', 'D24', 150, 7.00, '2025-01-28', 1050.00),
('P25', 'SP9', 'D25', 60, 85.00, '2025-01-29', 5100.00),
('P26', 'SP8', 'D26', 150, 4.00, '2025-01-30', 600.00),
('P27', 'SP13', 'D27', 100, 30.00, '2025-01-31', 3000.00),
('P28', 'SP8', 'D28', 130, 3.10, '2025-02-01', 403.00),
('P29', 'SP1', 'D29', 80, 4.00, '2025-02-02', 320.00),
('P30', 'SP12', 'D30', 150, 10.00, '2025-02-03', 1500.00),
('P31', 'SP14', 'D31', 120, 5.50, '2025-02-04', 660.00),
('P32', 'SP18', 'D32', 90, 3.00, '2025-02-05', 270.00),
('P33', 'SP7', 'D33', 110, 2.25, '2025-02-06', 247.50),
('P34', 'SP9', 'D34', 100, 8.00, '2025-02-07', 800.00),
('P35', 'SP2', 'D35', 60, 75.00, '2025-02-08', 4500.00),
('P36', 'SP6', 'D36', 150, 15.00, '2025-02-09', 2250.00),
('P37', 'SP10', 'D37', 80, 1.50, '2025-02-10', 120.00),
('P38', 'SP4', 'D38', 140, 20.00, '2025-02-11', 2800.00);

-- ==============================================
--             VIEWS & ANALYSIS
-- ==============================================

-- Create a View for Customer Order Analysis
CREATE VIEW customer_order_analysis AS
SELECT 
    c.Customer_name,
    c.Customer_email,
    o.Order_date,
    o.Order_status,
    oi.Quantity_ordered,
    oi.Total_price,
    d.Drug_name,
    sp.Supplier_name
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Order_Items oi ON o.OrderID = oi.OrderID
JOIN Drugs d ON oi.DrugID = d.DrugID
JOIN Suppliers sp ON d.SupplierID = sp.SupplierID;

-- ==============================================
--          FUNCTIONS, PROCEDURES, TRIGGERS
-- ==============================================

DELIMITER $$
-- Function: Get the average sale amount within a given date range
CREATE FUNCTION average_sale_by_date(start_date DATE, end_date DATE) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_sale DECIMAL(10,2);
    SELECT AVG(o.total_amount) INTO avg_sale 
    FROM sales s
    JOIN orders o ON s.orderid = o.orderid  
    WHERE s.sale_date BETWEEN start_date AND end_date;
    RETURN avg_sale;
END$$

DELIMITER ;

-- Stored Procedure: Insert or Update Inventory
DELIMITER //
CREATE PROCEDURE InsertInventory(
    new_InventoryID VARCHAR(10),
    new_DrugID VARCHAR(10),
    new_Quantity_in_stock INT,
    new_last_restocked DATE,
    restock_threshold INT,
    new_batch_no VARCHAR(20),
    new_expiry_date DATE
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM inventory WHERE DrugID = new_DrugID AND InventoryID = new_InventoryID)
    THEN
        INSERT INTO inventory (InventoryID, DrugID, Quantity_in_stock, last_restocked, Restock_threshold, batch_no, expiry_date)
        VALUES (new_InventoryID, new_DrugID, new_Quantity_in_stock, new_last_restocked, restock_threshold, new_batch_no, new_expiry_date);
    ELSE
        UPDATE inventory SET Quantity_in_stock = Quantity_in_stock + new_Quantity_in_stock
        WHERE DrugID = new_DrugID AND InventoryID = new_InventoryID;
    END IF;
END //
DELIMITER ;

  -- Trigger code automatically inserts a new drug into the Drugs table whenever a new entry is added to the Inventory table.
DELIMITER //
CREATE TRIGGER auto_insert_drug
BEFORE INSERT ON Inventory
FOR EACH ROW
BEGIN
    INSERT INTO Drugs (DrugID, Drug_name, Dosage_form, Strength, Class, SupplierID, Price_per_unit, Expiry_date, Barcode_number)
    VALUES (NEW.DrugID, 'Placeholder Name', 'Unknown', 'Unknown', 'Unknown', 'SP1', 0.00, NEW.Expiry_date, '000000000000');
END //
DELIMITER ;

-- ==============================================
--             EVENT SCHEDULING
-- ==============================================

-- Create an Event to Log Expiring Drugs
CREATE TABLE expiring_drugs_log (
    DrugID VARCHAR(10),
    Expiry_date DATE,
    Logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE EVENT log_expiring_drugs
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
  INSERT INTO expiring_drugs_log (drugid, expiry_date)
  SELECT drugid, expiry_date
  FROM inventory
  WHERE expiry_date < CURDATE() + INTERVAL 6 MONTH;
    
  --          BUSINESS INSIGHTS QUERIES
  
  -- This query identifies the drug that has been ordered the most across all customers. 
-- It helps in restocking decisions and supplier negotiations.
--  Query to Find the Most Ordered Drug Across All Customers
SELECT 
    d.DrugID, 
    d.Drug_name, 
    SUM(oi.Quantity_ordered) AS Total_Quantity_Ordered
FROM Order_Items oi
JOIN Drugs d ON oi.DrugID = d.DrugID
GROUP BY d.DrugID, d.Drug_name
ORDER BY Total_Quantity_Ordered DESC
LIMIT 1; -- Returns only the top most ordered drug

-- Identify cheaper drugs frequently ordered in bulk
SELECT d.SupplierID, s.Supplier_name, d.Drug_name
FROM Drugs d
JOIN Suppliers s ON d.SupplierID = s.SupplierID
WHERE d.DrugID IN (
    SELECT oi.DrugID
    FROM Order_Items oi
    JOIN Orders o ON oi.OrderID = o.OrderID
    WHERE o.Total_amount > 500
    GROUP BY oi.DrugID
    HAVING AVG(oi.Unit_price) <= 50
);

-- Find the customer with the highest average order value
SELECT o.CustomerID, c.Customer_name, AVG(o.Total_amount) AS Avg_Order_Value
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID, c.Customer_name
ORDER BY Avg_Order_Value DESC
LIMIT 1;

-- Find the most purchased drug by customers
SELECT DISTINCT drug_name, SUM(quantity_ordered) AS total_quantity_ordered
FROM customer_order_analysis
GROUP BY drug_name
ORDER BY total_quantity_ordered DESC;

-- ==============================================
--              END OF SCRIPT
-- ==============================================
