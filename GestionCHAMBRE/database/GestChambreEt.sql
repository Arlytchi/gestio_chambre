/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  22/01/2023 22:54:26                      */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CHAMBRE_ATTRIBUER_ADMINIST') then
    alter table CHAMBRE
       delete foreign key FK_CHAMBRE_ATTRIBUER_ADMINIST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CHAMBRE_LOUER2_UTILISAT') then
    alter table CHAMBRE
       delete foreign key FK_CHAMBRE_LOUER2_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UTILISAT_AJOUTER_ADMINIST') then
    alter table UTILISATEUR
       delete foreign key FK_UTILISAT_AJOUTER_ADMINIST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UTILISAT_LOUER_CHAMBRE') then
    alter table UTILISATEUR
       delete foreign key FK_UTILISAT_LOUER_CHAMBRE
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ADMINISTRATEUR_PK'
     and t.table_name='ADMINISTRATEUR'
) then
   drop index ADMINISTRATEUR.ADMINISTRATEUR_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ADMINISTRATEUR'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ADMINISTRATEUR
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='LOUER2_FK'
     and t.table_name='CHAMBRE'
) then
   drop index CHAMBRE.LOUER2_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ATTRIBUER_FK'
     and t.table_name='CHAMBRE'
) then
   drop index CHAMBRE.ATTRIBUER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='CHAMBRE_PK'
     and t.table_name='CHAMBRE'
) then
   drop index CHAMBRE.CHAMBRE_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='CHAMBRE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table CHAMBRE
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='LOUER_FK'
     and t.table_name='UTILISATEUR'
) then
   drop index UTILISATEUR.LOUER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='AJOUTER_FK'
     and t.table_name='UTILISATEUR'
) then
   drop index UTILISATEUR.AJOUTER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='UTILISATEUR_PK'
     and t.table_name='UTILISATEUR'
) then
   drop index UTILISATEUR.UTILISATEUR_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='UTILISATEUR'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table UTILISATEUR
end if;

/*==============================================================*/
/* Table : ADMINISTRATEUR                                       */
/*==============================================================*/
create table ADMINISTRATEUR 
(
   ID_ADMIN             integer                        not null,
   NOM_ADMIN            long varchar                   null,
   MOT_DE_PASSE         char(10)                       null,
   constraint PK_ADMINISTRATEUR primary key (ID_ADMIN)
);

/*==============================================================*/
/* Index : ADMINISTRATEUR_PK                                    */
/*==============================================================*/
create unique index ADMINISTRATEUR_PK on ADMINISTRATEUR (
ID_ADMIN ASC
);

/*==============================================================*/
/* Table : CHAMBRE                                              */
/*==============================================================*/
create table CHAMBRE 
(
   ROOM_ID              integer                        not null,
   ID_ADMIN             integer                        not null,
   ID_USER              integer                        null,
   NUM_ROOM             smallint                       null,
   constraint PK_CHAMBRE primary key (ROOM_ID)
);

/*==============================================================*/
/* Index : CHAMBRE_PK                                           */
/*==============================================================*/
create unique index CHAMBRE_PK on CHAMBRE (
ROOM_ID ASC
);

/*==============================================================*/
/* Index : ATTRIBUER_FK                                         */
/*==============================================================*/
create index ATTRIBUER_FK on CHAMBRE (
ID_ADMIN ASC
);

/*==============================================================*/
/* Index : LOUER2_FK                                            */
/*==============================================================*/
create index LOUER2_FK on CHAMBRE (
ID_USER ASC
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR 
(
   ID_USER              integer                        not null,
   ID_ADMIN             integer                        not null,
   ROOM_ID              integer                        null,
   NOM_USER             long varchar                   null,
   MDP                  char(10)                       null,
   constraint PK_UTILISATEUR primary key (ID_USER)
);

/*==============================================================*/
/* Index : UTILISATEUR_PK                                       */
/*==============================================================*/
create unique index UTILISATEUR_PK on UTILISATEUR (
ID_USER ASC
);

/*==============================================================*/
/* Index : AJOUTER_FK                                           */
/*==============================================================*/
create index AJOUTER_FK on UTILISATEUR (
ID_ADMIN ASC
);

/*==============================================================*/
/* Index : LOUER_FK                                             */
/*==============================================================*/
create index LOUER_FK on UTILISATEUR (
ROOM_ID ASC
);

alter table CHAMBRE
   add constraint FK_CHAMBRE_ATTRIBUER_ADMINIST foreign key (ID_ADMIN)
      references ADMINISTRATEUR (ID_ADMIN)
      on update restrict
      on delete restrict;

alter table CHAMBRE
   add constraint FK_CHAMBRE_LOUER2_UTILISAT foreign key (ID_USER)
      references UTILISATEUR (ID_USER)
      on update restrict
      on delete restrict;

alter table UTILISATEUR
   add constraint FK_UTILISAT_AJOUTER_ADMINIST foreign key (ID_ADMIN)
      references ADMINISTRATEUR (ID_ADMIN)
      on update restrict
      on delete restrict;

alter table UTILISATEUR
   add constraint FK_UTILISAT_LOUER_CHAMBRE foreign key (ROOM_ID)
      references CHAMBRE (ROOM_ID)
      on update restrict
      on delete restrict;

