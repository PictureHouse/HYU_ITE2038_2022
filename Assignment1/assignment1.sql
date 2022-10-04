#1 Grass타입의 포켓몬의 이름을 사전순으로 출력
select name from Pokemon where type = 'Grass' order by name;

#2 Brown City나 Rainbow City출신 트레이너의 이름을 사전순으로 출력
select name from Trainer where hometown = 'Brown City' or hometown = 'Rainbow City' order by name;

#3 모든 포켓몬의 type을 중복없이 사전순으로 출력
select distinct type from Pokemon order by type;

#4 도시의 이름이 B로 시작하는 모든 도시의 이름을 사전순으로 출력
select name from City where name like 'B%' order by name;

#5 이름이 M으로 시작하지 않는 트레이너의 고향을 사전순으로 출력
select hometown from Trainer where name not like 'M%' order by hometown;

#6 잡힌 포켓몬 중 가장 레벨이 높은 포켓몬의 별명을 사전순으로 출력
select nickname from CatchedPokemon where level = (select max(level) from CatchedPokemon) order by nickname;

#7 포켓몬의 이름이 알파벳 모음으로 시작하는 포켓몬의 이름을 사전순으로 출력
select name from Pokemon 
where name like 'A%' or name like 'E%' or name like 'I%' or name like 'O%' or name like 'U%' order by name;

#8 잡힌 포켓몬의 평균 레벨을 출력
select avg(level) from CatchedPokemon;

#9 Yellow가 잡은 포켓몬의 최대 레벨을 출력
select max(level) from CatchedPokemon where owner_id = (select id from Trainer where name = 'Yellow');

#10 트레이너의 고향 이름을 중복없이 사전순으로 출력
select distinct hometown from Trainer order by hometown;

#11 닉네임이 A로 시작하는 포켓몬을 잡은 트레이너의 이름과 포켓몬의 닉네임을 트레이너의 이름의 사전순으로 출력
select name, nickname from Trainer join CatchedPokemon on Trainer.id = CatchedPokemon.owner_id 
where CatchedPokemon.nickname like 'A%' order by Trainer.name;

#12 Amazon 특성을 가진 도시의 리더의 트레이너 이름을 출력
select name from Trainer where id = (select leader_id from Gym where city = (select name from City where description = 'Amazon'));

#13 불속성 포켓몬을 가장 많이 잡은 트레이너의 id와, 그 트레이너가 잡은 불속성 포켓몬의 수를 출력
select owner_id, count(pid) from CatchedPokemon join Pokemon on CatchedPokemon.pid = Pokemon.id 
where type = 'Fire' group by owner_id order by count(pid) desc limit 1;

#14 포켓몬 ID가 한 자리 수인 포켓몬의 type을 중복 없이 포켓몬 ID의 내림차순으로 출력
select distinct type from Pokemon where id like '_' order by id desc;

#15 포켓몬의 type이 Fire이 아닌 포켓몬의 수를 출력
select count(id) from Pokemon where type not like 'Fire';

#16 진화하면 id가 작아지는 포켓몬의 진화 전 이름을 사전순으로 출력
select name from Pokemon where id = (select before_id from Evolution where before_id > after_id) order by name;

#17 트레이너에게 잡힌 모든 물속성 포켓몬의 평균 레벨을 출력
select avg(level) from CatchedPokemon join Pokemon on CatchedPokemon.pid = Pokemon.id where type = 'Water';

#18 체육관리더가 잡은 모든 포켓몬 중 레벨이 가장 높은 포켓몬의 별명을 출력
select nickname from CatchedPokemon where level = (select max(level) from CatchedPokemon where owner_id in (select leader_id from Gym));

#19 Blue city 출신 트레이너들 중 잡은 포켓몬들의 레벨의 평균이 가장 높은 트레이너의 이름을 사전순으로 출력
select name from CatchedPokemon join Trainer on CatchedPokemon.owner_id = Trainer.id 
where hometown = 'Blue city' group by name order by avg(level) desc, name asc limit 1;

#20 같은 출신이 없는 트레이너들이 잡은 포켓몬 중 진화가 가능하고 Electric 속성을 가진 포켓몬의 이름을 출력
select distinct name
from (((select owner_id, pid from CatchedPokemon) as C join (select id, hometown from Trainer) as T on C.owner_id = T.id) join (select * from Pokemon where type = 'Electric') as P on C.pid = P.id) join Evolution as E on P.id = E.before_id
order by name;

#21 관장들의 이름과 각 관장들이 잡은 포켓몬들의 레벨 합을 레벨 합의 내림차 순으로 출력
select name, sum(level) from CatchedPokemon join Trainer on CatchedPokemon.owner_id = Trainer.id 
where Trainer.id in (select leader_id from Gym) group by name order by sum(level) desc;

#22 가장 트레이너가 많은 고향의 이름을 출력
select hometown from Trainer group by hometown order by count(id) desc limit 1;

#23 Sangnok City 출신 트레이너와 Brown City 출신 트레이너가 공통으로 잡은 포켓몬의 이름을 중복을 제거하여 사전순으로 출력
select distinct (select name from Pokemon where C_S.pid = id) as name
from ((select owner_id as s_owner_id, pid from CatchedPokemon) as C_S join (select id, hometown from Trainer where hometown = 'Sangnok city') as S on C_S.s_owner_id = S.id) join ((select owner_id as b_owner_id, pid from CatchedPokemon) as C_B join (select id, hometown from Trainer where hometown = 'Brown city') as B on C_B.b_owner_id = B.id)
where C_S.pid = C_B.pid order by name;

#24 이름이 P로 시작하는 포켓몬을 잡은 트레이너중 상록시티출신인 트레이너의 이름을 사전순으로 모두출력
select name from CatchedPokemon join Trainer on CatchedPokemon.owner_id = Trainer.id and hometown = 'Sangnok city' 
where pid in (select id from Pokemon where name like 'P%') order by name;

#25 트레이너의 이름과 그 트레이너가 잡은 포켓몬의 이름을 출력. 트레이너 이름의 사전 순으로 정렬하고, 각 트레이너가 잡은 포켓몬 간에도 사전 순으로 정렬
select t_name, p_name from ((select owner_id, pid from CatchedPokemon) as C join (select id, name as t_name, hometown from Trainer) as T on C.owner_id = T.id) join (select id, name as p_name from Pokemon) as P on C.pid = P.id order by t_name, p_name;

#26 2단계 진화만 가능한 포켓몬의 이름을 사전순으로 출력
select name from Pokemon left outer join Evolution on Pokemon.id = Evolution.before_id 
where Pokemon.id = any (select before_id from Evolution) and Evolution.after_id != all (select before_id from Evolution) and Evolution.before_id != all (select after_id from Evolution) order by name;

#27 상록 시티의 관장이 잡은 포켓몬들 중 포켓몬의 타입이 WATER인 포켓몬의 별명을 사전순으로 출력
select nickname from CatchedPokemon join Gym on CatchedPokemon.owner_id = Gym.leader_id and city = 'Sangnok city' 
where pid in (select id from Pokemon where type = 'Water') order by nickname;

#28 트레이너들이 잡은 포켓몬 중 진화한 포켓몬이 3마리 이상인 경우 해당 트레이너의 이름을 사전순으로 출력
select name from ((select id as t_id, name from Trainer) as T join (select owner_id, pid from CatchedPokemon) as C on T.t_id = C.owner_id) join Evolution on C.pid = Evolution.after_id 
group by name having count(pid) >= 3 order by name;

#29 어느 트레이너에게도 잡히지 않은 포켓몬의 이름을 사전 순으로 출력
select name from Pokemon where id not in (select pid from CatchedPokemon) order by name;

#30 각 출신 도시별로 트레이너가 잡은 포켓몬 중 가장 레벨이 높은 포켓몬의 레벨을 내림차순으로 출력
select max(level) from CatchedPokemon join Trainer on CatchedPokemon.owner_id = Trainer.id group by hometown order by max(level) desc;

#31 포켓몬 중 3단 진화가 가능한 포켓몬의 ID 와 해당 포켓몬의이름을 1단진화 형태 포켓몬의이름, 2단진화 형태 포켓몬의 이름, 3단 진화 형태 포켓몬의 이름을 ID 의 오름차순으로 출력
select id, name as firstName, (select name from Pokemon where id = E1.a1) as secondName, (select name from Pokemon where id = E2.a2) as thirdName
from ((select id, name from Pokemon) as P join (select before_id as b1, after_id as a1 from Evolution) as E1 on P.id = E1.b1) join (select before_id as b2, after_id as a2 from Evolution) as E2 on E1.a1 = E2.b2
order by id;
