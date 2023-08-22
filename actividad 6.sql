use miguel
select * from [dbo].[datos]

delete from [dbo].[datos] where MONTH([cfechanacimient])=05;


select * from [dbo].[datos] where [cfechanacimient] like '%-05-%';
