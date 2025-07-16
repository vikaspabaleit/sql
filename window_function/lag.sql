/* Find users who booked a ride more than once within a 10-minute window (self-join or window functions) */

WITH driver_data AS (
  SELECT driver_id,driver_name,car_num,booking_time,
  LAG(booking_time) OVER(PARTITION BY driver_id ORDER BY booking_time) AS prev_booking_time
  FROM driver_table
)
SELECT driver_id,driver_name,car_num,booking_time,prev_booking_time FROM driver_data
WHERE prev_booking_time IS NOT NULL AND booking_time <= prev_booking_time + INTERVAL 10 MINUTE ORDER BY driver_id, booking_time;
