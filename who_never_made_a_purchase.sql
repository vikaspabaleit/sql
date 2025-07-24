#	Write query users who never made a purchase?
Select u.user_id, u.user_name 
from users u join purchase p on u.user_id = p.user_id 
where p.user_id is null;
