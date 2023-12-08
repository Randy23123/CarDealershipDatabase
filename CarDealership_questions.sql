USE Car_Dealership;


-- 1. Get all dealerships
SELECT dealership_id, Name, Address, Phone FROM dealerships;

-- 2. Find all vehicles for a specific dealership
SELECT vehicles.*
FROM inventory
JOIN vehicles ON inventory.VIN = vehicles.VIN
WHERE inventory.dealership_id = 2;

-- 3. Find a car by VIN
SELECT *
FROM vehicles
WHERE VIN = 'JGH17378H83473GH2';

-- 4. Find the dealership where a certain car is located, by VIN
SELECT dealerships.*
FROM inventory
JOIN dealerships ON inventory.dealership_id = dealerships.dealership_id
WHERE inventory.VIN = 'JGH17378H83473GH2';

-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT DISTINCT dealerships.*
FROM dealerships
JOIN inventory ON dealerships.dealership_id = inventory.dealership_id
JOIN vehicles ON inventory.VIN = vehicles.VIN
WHERE vehicles.Model = '370z';

-- 6. Get all sales information for a specific dealer for a specific date range
SELECT sales_contracts.*, vehicles.*, dealerships.*
FROM sales_contracts
JOIN vehicles ON sales_contracts.VIN = vehicles.VIN
JOIN inventory ON vehicles.VIN = inventory.VIN
JOIN dealerships ON inventory.dealership_id = dealerships.dealership_id
WHERE dealerships.dealership_id = 1
  AND sales_contracts.contract_date BETWEEN '2020-01-01' AND '2023-12-31';
