USE [Veterinary]
GO
/****** Object:  Table [dbo].[Animals]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[IDClient] [int] NULL,
	[Type] [int] NOT NULL,
	[Breed] [int] NULL,
 CONSTRAINT [PK_Animals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NULL,
	[Firstname] [nvarchar](max) NULL,
	[Patronymic] [nvarchar](max) NULL,
	[Phone] [nvarchar](10) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medication]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Medication] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDClient] [int] NULL,
	[IDPet] [int] NULL,
	[Sum] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMedication]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMedication](
	[IDOrder] [int] NOT NULL,
	[IDMedication] [int] NOT NULL,
 CONSTRAINT [PK_OrderMedication] PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC,
	[IDMedication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[IDOrder] [int] NOT NULL,
	[IDService] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC,
	[IDService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeAnimal]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeAnimal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_TypeAnimal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeBreed]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeBreed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TypeBreed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.05.2022 6:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Access] [tinyint] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animals] ON 

INSERT [dbo].[Animals] ([ID], [Title], [IDClient], [Type], [Breed]) VALUES (1, N'Кьют', NULL, 2, NULL)
INSERT [dbo].[Animals] ([ID], [Title], [IDClient], [Type], [Breed]) VALUES (2, N'Биба', NULL, 2, NULL)
INSERT [dbo].[Animals] ([ID], [Title], [IDClient], [Type], [Breed]) VALUES (3, N'Гектор', NULL, 1, 1)
INSERT [dbo].[Animals] ([ID], [Title], [IDClient], [Type], [Breed]) VALUES (4, N'Пес', NULL, 1, 6)
INSERT [dbo].[Animals] ([ID], [Title], [IDClient], [Type], [Breed]) VALUES (5, N'Мышка', 3, 3, 7)
SET IDENTITY_INSERT [dbo].[Animals] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (1, N'Середкина', N'Дарья', N'Сергеевна', N'9527564122', NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (2, N'Алешина', N'Евгения', N'Александровна', N'9525465898', NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (3, N'Буданов', N'Иван', N'Михайлович', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (4, N'Бывшев', N'Николай', N'Андреевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (5, N'Веренич', N'Алена', N'Владимировна', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (6, N'Горбачев', N'Артём', N'Юрьевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (7, N'Давыдова', N'Алина', N'Андреевна', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (8, N'Зайцев', N'Александр', N'Сергеевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (9, N'Киселева', N'Анна', N'Дмитриевна', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (10, N'Клочков', N'Павел', N'Аркадьевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (11, N'Корнишина', N'Карина', N'Сергеевна', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (12, N'Малахов', N'Максим', N'Сергеевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (13, N'Митрофанов', N'Алексей', N'Сергеевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (14, N'Молчанов', N'Артём', N'Владимирович', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (15, N'Семикопенко', N'Евгений', N'Валерьевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (16, N'Серов', N'Данила', N'Сергеевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (17, N'Смирнов', N'Владимир', N'Андреевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (18, N'Стешина', N'Вероника', N'Эдуардовна', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (19, N'Суфиярова', N'Лиана', N'Рафаэльевна', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (20, N'Теодор', N'Дарья', N'Алексеевна', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (21, N'Ульянин', N'Роман', N'Евгеньевич', NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Firstname], [Patronymic], [Phone], [Email], [Address]) VALUES (22, N'Яшин', N'Илья', N'Андреевич', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Medication] ON 

INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (1, N'Азитронит', CAST(4500.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (2, N'Альвет', CAST(1564.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (3, N'Альвет-суспензия', CAST(3426.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (4, N'Амоксигард', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (5, N'Амоксигард WS.', CAST(2310.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (6, N'Амоксициллин', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (7, N'Бутофан', CAST(234.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (8, N'Бутофан OR.', CAST(678.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (9, N'Золетил', CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[Medication] ([ID], [Title], [Cost]) VALUES (10, N'Телазол', CAST(4850.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Medication] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [IDClient], [IDPet], [Sum]) VALUES (1, 4, 3, CAST(5026.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([ID], [IDClient], [IDPet], [Sum]) VALUES (3, 3, 5, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([ID], [IDClient], [IDPet], [Sum]) VALUES (4, 12, 4, CAST(6278.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([ID], [IDClient], [IDPet], [Sum]) VALUES (5, 1, 4, CAST(8724.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (1, 3)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (1, 4)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (3, 4)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (3, 6)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (4, 8)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (4, 9)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (5, 2)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (5, 5)
INSERT [dbo].[OrderMedication] ([IDOrder], [IDMedication]) VALUES (5, 10)
GO
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (1, 6)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (3, 3)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (3, 4)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (4, 4)
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (1, N'Терапия', CAST(750.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (2, N'Кастрация', CAST(4900.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (3, N'Вакцинирование', CAST(1250.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (4, N'Хирургия', CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (5, N'УЗИ', CAST(1600.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (6, N'Груминк', CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (7, N'Офтомология', CAST(1650.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (8, N'ЭКГ', CAST(1800.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (9, N'Дерматология', CAST(1250.00 AS Decimal(18, 2)))
INSERT [dbo].[Service] ([ID], [Title], [Cost]) VALUES (10, N'Чипирование', CAST(1300.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeAnimal] ON 

INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (1, N'Собака')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (2, N'Крыса')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (3, N'Кошка')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (4, N'Енот')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (5, N'Попугай')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (6, N'Рысь')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (7, N'Пантера')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (8, N'Ягуар')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (9, N'Хомяк')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (10, N'Шиншила')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (11, N'Тигр')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (12, N'Птица')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (13, N'Змея')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (14, N'Ящерица')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (15, N'Белка')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (16, N'Лошадь')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (17, N'Леопард')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (18, N'Курица')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (19, N'Лев')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (20, N'Корова')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (21, N'Овца')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (22, N'Свинья')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (23, N'Медведь')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (24, N'Лиса')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (25, N'Волк')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (26, N'Обезьяна')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (27, N'Осел')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (28, N'Сова')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (29, N'Ёж')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (30, N'Пони')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (31, N'Дельфин')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (32, N'Пингвин')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (33, N'Олень')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (34, N'Лось')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (35, N'Кенгуру')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (36, N'Паук')
INSERT [dbo].[TypeAnimal] ([ID], [Title]) VALUES (37, N'Гусь')
SET IDENTITY_INSERT [dbo].[TypeAnimal] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeBreed] ON 

INSERT [dbo].[TypeBreed] ([ID], [Type], [Title]) VALUES (1, 1, N'Немецкая овчарка')
INSERT [dbo].[TypeBreed] ([ID], [Type], [Title]) VALUES (2, 1, N'Доберман')
INSERT [dbo].[TypeBreed] ([ID], [Type], [Title]) VALUES (3, 3, N'Мейкун')
INSERT [dbo].[TypeBreed] ([ID], [Type], [Title]) VALUES (4, 1, N'Гончая')
INSERT [dbo].[TypeBreed] ([ID], [Type], [Title]) VALUES (5, 12, N'Голубь')
INSERT [dbo].[TypeBreed] ([ID], [Type], [Title]) VALUES (6, 1, N'Шпиц')
INSERT [dbo].[TypeBreed] ([ID], [Type], [Title]) VALUES (7, 3, N'Веслоухая')
SET IDENTITY_INSERT [dbo].[TypeBreed] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password], [Access]) VALUES (1, N'admin', N'qwe', NULL)
INSERT [dbo].[User] ([ID], [Login], [Password], [Access]) VALUES (2, N'1', N'1', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Access]  DEFAULT ((0)) FOR [Access]
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK_Animals_Client] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK_Animals_Client]
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK_Animals_TypeAnimal] FOREIGN KEY([Type])
REFERENCES [dbo].[TypeAnimal] ([ID])
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK_Animals_TypeAnimal]
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK_Animals_TypeBreed] FOREIGN KEY([Breed])
REFERENCES [dbo].[TypeBreed] ([ID])
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK_Animals_TypeBreed]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Animals] FOREIGN KEY([IDPet])
REFERENCES [dbo].[Animals] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Animals]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[OrderMedication]  WITH CHECK ADD  CONSTRAINT [FK_OrderMedication_Medication] FOREIGN KEY([IDMedication])
REFERENCES [dbo].[Medication] ([ID])
GO
ALTER TABLE [dbo].[OrderMedication] CHECK CONSTRAINT [FK_OrderMedication_Medication]
GO
ALTER TABLE [dbo].[OrderMedication]  WITH CHECK ADD  CONSTRAINT [FK_OrderMedication_Order] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderMedication] CHECK CONSTRAINT [FK_OrderMedication_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Service] FOREIGN KEY([IDService])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Service]
GO
ALTER TABLE [dbo].[TypeBreed]  WITH CHECK ADD  CONSTRAINT [FK_TypeBreed_TypeAnimal] FOREIGN KEY([Type])
REFERENCES [dbo].[TypeAnimal] ([ID])
GO
ALTER TABLE [dbo].[TypeBreed] CHECK CONSTRAINT [FK_TypeBreed_TypeAnimal]
GO
