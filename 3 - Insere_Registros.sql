-- Usuários
insert into [User] values ('LuckPrize Admin', 'luckadmin', PWDENCRYPT('luckadmin'), 'no-reply@luckprize.com', '2010-01-01', 'M', 'j0434874.png', null, 0, 0, 0, 0, 9999, 0, 0, GETDATE(), null, 1, 1)
update [User] set credits=0, bonus=0, prize=0 where id = (select top 1 [id] from [User] where nick='luckadmin')

-- Bancos
insert into [BankAccount] values ((select top 1 [id] from [User] where nick='luckadmin'), 'BRADESCO', '12345-6', '987654-3', 'LuckPrize.com', '123.456.789-99', 0)
insert into [BankAccount] values ((select top 1 [id] from [User] where nick='luckadmin'), 'BANCO DO BRASIL', '12345-6', '987654-3', 'LuckPrize.com', '123.456.789-99', 0)
insert into [BankAccount] values ((select top 1 [id] from [User] where nick='luckadmin'), 'CAIXA ECONÔMICA', '12345-6', '987654-3', 'LuckPrize.com', '123.456.789-99', 0)

-- Faixas de Bônus (bônus de compras)
insert into [BonusRangesOnBuy] values (250, 2.5)
insert into [BonusRangesOnBuy] values (500, 5.0)
insert into [BonusRangesOnBuy] values (1000, 10.0)
insert into [BonusRangesOnBuy] values (1000000, 10.0)

-- Como encontrou o site
insert into [st_HowFound] values (1, 'Indicação')
insert into [st_HowFound] values (2, 'Ferramenta de Busca')
insert into [st_HowFound] values (3, 'Anúncio')
insert into [st_HowFound] values (4, 'Outros')

-- Configurações
insert into [MiscConfigurations] values (0, 20, 0, 5, 20.00, 0.00, 0.00, 0.00, 50.00, 10.00, 50, 500.00, 10.00, 50.00, 30.00, 20.00, 1.00, 3.00, 50.00, 500.00, 10.00, 1.00, 10.00, 50.00, 500.00, 10.00, 1.00, 10.00)
