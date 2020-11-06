-- Searches for an Order register by its Id value. If at least one register is found commit is performed. Otherwise, a rollback is performed.

DO $$
DECLARE
  orders_count INTEGER = 0;

BEGIN

SELECT COUNT(*) INTO orders_count
FROM "Orders"
WHERE "Id" = '7e56947b-6a14-4389-8470-2f7a824ffdf2';

IF orders_count > 0 THEN
  RAISE NOTICE 'FOUND ORDER, COMMIT!';
  COMMIT;
ELSE
  RAISE NOTICE 'NOT FOUND ORDER, ROLLBACK!';
  ROLLBACK;
END IF;

END$$;