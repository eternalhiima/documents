-- Project Name : hiima
-- Date/Time    : 2019/01/30 22:53:30
-- Author       : simplex
-- RDBMS Type   : MySQL
-- Application  : A5:SQL Mk-2

/*
  BackupToTempTable, RestoreFromTempTable�^�����߂��t������Ă��܂��B
  ����ɂ��Adrop table, create table ����f�[�^���c��܂��B
  ���̋@�\�͈ꎞ�I�� $$TableName �̂悤�Ȉꎞ�e�[�u�����쐬���܂��B
*/

-- �^�O
--* BackupToTempTable
drop table if exists `TAG` cascade;

--* RestoreFromTempTable
create table `TAG` (
  `TAG_ID` DECIMAL(8) not null comment '�^�OID'
  , `TAG_NAME` VARCHAR(12) not null comment '�^�O��'
  , `USER_ID` DECIMAL(8) not null comment '���[�U�[ID'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `DELETE_DATETIME` DATETIME comment '�폜����'
  , `USED_COUNT` DECIMAL(8) not null comment '�g�p��'
  , `LAST_USED_DATETIME` DATETIME not null comment '�ŏI�g�p����'
  , `IS_DELETED` INT not null comment '�폜�t���O'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
) comment '�^�O' ;

create unique index `TAG_PKI`
  on `TAG`(`TAG_ID`);

alter table `TAG`
  add constraint `TAG_PKC` primary key (`TAG_ID`);

-- �g�[�N�]��
--* BackupToTempTable
drop table if exists `TALK_EVALUATION` cascade;

--* RestoreFromTempTable
create table `TALK_EVALUATION` (
  `TALK_HISTORY_ID` DECIMAL(8) not null comment '�g�[�N�]��ID'
  , `USER_ID` VARCHAR(8) comment '���[�U�[ID'
  , `TALK_THEME_ID` VARCHAR(8) not null comment '�g�[�N�e�[�}ID'
  , `EVALUATION` INT not null comment '�]��'
  , `IS_DELETED` INT not null comment '�폜�t���O'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
) comment '�g�[�N�]��' ;

create unique index `TALK_EVALUATION_PKI`
  on `TALK_EVALUATION`(`TALK_HISTORY_ID`);

alter table `TALK_EVALUATION`
  add constraint `TALK_EVALUATION_PKC` primary key (`TALK_HISTORY_ID`);

-- �g�[�N����
--* BackupToTempTable
drop table if exists `TALK_HISTORY` cascade;

--* RestoreFromTempTable
create table `TALK_HISTORY` (
  `TALK_HISTORY_ID` DECIMAL(8) not null comment '�g�[�N����ID'
  , `USER_ID` VARCHAR(8) comment '���[�U�[ID'
  , `TALK_THEME_ID` VARCHAR(8) not null comment '�g�[�N�e�[�}ID'
  , `START_DATETIME` DATETIME not null comment '�J�n����'
  , `END_DATETIME` DATETIME comment '�I������'
  , `IS_DELETED` INT not null comment '�폜�t���O'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
) comment '�g�[�N����' ;

create unique index `TALK_HISTORY_PKI`
  on `TALK_HISTORY`(`TALK_HISTORY_ID`);

alter table `TALK_HISTORY`
  add constraint `TALK_HISTORY_PKC` primary key (`TALK_HISTORY_ID`);

-- �g�[�N�e�[�}�^�O�o�C���h
--* BackupToTempTable
drop table if exists `TALK_THEME_TAG_BIND` cascade;

--* RestoreFromTempTable
create table `TALK_THEME_TAG_BIND` (
  `TALK_THEME_TAG_BIND_ID` DECIMAL(8) not null comment '�g�[�N�e�[�}�^�O�o�C���hID'
  , `TAG_ID` DECIMAL(8) not null comment '�^�OID'
  , `TALK_THEME_ID` DECIMAL(8) not null comment '�g�[�N�e�[�}ID'
  , `USER_ID` DECIMAL(8) not null comment '���[�U�[ID'
  , `TAG_DATETIME` DATETIME not null comment '�^�O�t������'
  , `IS_DELETED` INT not null comment '�폜�t���O'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
) comment '�g�[�N�e�[�}�^�O�o�C���h' ;

create unique index `TALK_THEME_TAG_BIND_PKI`
  on `TALK_THEME_TAG_BIND`(`TALK_THEME_TAG_BIND_ID`);

alter table `TALK_THEME_TAG_BIND`
  add constraint `TALK_THEME_TAG_BIND_PKC` primary key (`TALK_THEME_TAG_BIND_ID`);

-- �R�����g
--* BackupToTempTable
drop table if exists `COMMENT` cascade;

--* RestoreFromTempTable
create table `COMMENT` (
  `COMMENT_ID` DECIMAL(8) not null comment '�R�����gID'
  , `COMMENT` VARCHAR(50) not null comment '�R�����g'
  , `USER_ID` DECIMAL(8) not null comment '���[�U�[ID'
  , `TALK_THEME_ID` DECIMAL(8) not null comment '�g�[�N�e�[�}ID'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `DELETE_DATETIME` DATETIME comment '�폜����'
  , `IS_DELETED` INT not null comment '�폜�t���O'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
) comment '�R�����g' ;

create unique index `COMMENT_PKI`
  on `COMMENT`(`COMMENT_ID`);

alter table `COMMENT`
  add constraint `COMMENT_PKC` primary key (`COMMENT_ID`);

-- �g�[�N�e�[�}
--* BackupToTempTable
drop table if exists `TALK_THEME` cascade;

--* RestoreFromTempTable
create table `TALK_THEME` (
  `TALK_THEME_ID` DECIMAL(8) not null comment '�g�[�N�e�[�}ID'
  , `TITLE` VARCHAR(30) not null comment '�^�C�g��'
  , `CONTENT` VARCHAR(500) not null comment '���e'
  , `THUMBNAIL_PATH` VARCHAR(50) not null comment '�T���l�C���p�X'
  , `RELATED_URL` VARCHAR(100) comment '�֘AURL'
  , `USER_ID` DECIMAL(8) not null comment '���[�U�[ID'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `DELETE_DATETIME` DATETIME comment '�폜����'
  , `IS_DELETED` INT not null comment '�폜�t���O'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
) comment '�g�[�N�e�[�}' ;

create unique index `TALK_THEME_PKI`
  on `TALK_THEME`(`TALK_THEME_ID`);

alter table `TALK_THEME`
  add constraint `TALK_THEME_PKC` primary key (`TALK_THEME_ID`);

-- ���[�U�[
--* BackupToTempTable
drop table if exists `USER` cascade;

--* RestoreFromTempTable
create table `USER` (
  `USER_ID` DECIMAL(8) not null comment '���[�U�[ID'
  , `USER_NAME` VARCHAR(10) not null comment '���[�U�[��'
  , `ICON_PATH` VARCHAR(100) not null comment '�A�C�R���p�X'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `DELETE_DATETIME` DATETIME comment '�폜����'
  , `IS_DELETED` INT not null comment '�폜�t���O'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
) comment '���[�U�[' ;

create unique index `USER_PKI`
  on `USER`(`USER_ID`);

alter table `USER`
  add constraint `USER_PKC` primary key (`USER_ID`);

