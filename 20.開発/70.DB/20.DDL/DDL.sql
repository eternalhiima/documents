-- Project Name : hiima
-- Date/Time    : 2019/02/11 15:24:38
-- Author       : rebor
-- RDBMS Type   : MySQL
-- Application  : A5:SQL Mk-2

-- �J�e�S��
drop table `CATEGORY` cascade;

create table `CATEGORY` (
  `CATEGORY_ID` DECIMAL(13,0) not null comment '�J�e�S��ID'
  , `CATEGORY_NAME` VARCHAR(12) not null comment '�J�e�S����'
  , `USER_ID` DECIMAL(13,0) not null comment '���[�U�[ID'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `USED_COUNT` DECIMAL(13,0) not null comment '�g�p��'
  , `LAST_USED_DATETIME` DATETIME not null comment '�ŏI�g�p����'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
  , constraint `CATEGORY_PKC` primary key (`CATEGORY_ID`)
) comment '�J�e�S��' ;

-- �g�[�N�]��
drop table `TALK_EVALUATION` cascade;

create table `TALK_EVALUATION` (
  `TALK_EVALUATION_ID` DECIMAL(13,0) not null comment '�g�[�N�]��ID'
  , `USER_ID` DECIMAL(13,0) comment '���[�U�[ID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment '�g�[�N�e�[�}ID'
  , `EVALUATION` DECIMAL(2,0) not null comment '�]��'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
  , constraint `TALK_EVALUATION_PKC` primary key (`TALK_EVALUATION_ID`)
) comment '�g�[�N�]��' ;

-- �g�[�N����
drop table `TALK_HISTORY` cascade;

create table `TALK_HISTORY` (
  `TALK_HISTORY_ID` DECIMAL(13,0) not null comment '�g�[�N����ID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment '�g�[�N�e�[�}ID'
  , `USER_ID` DECIMAL(13,0) comment '���[�U�[ID'
  , `START_DATETIME` DATETIME not null comment '�J�n����'
  , `END_DATETIME` DATETIME not null comment '�I������'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
  , constraint `TALK_HISTORY_PKC` primary key (`TALK_HISTORY_ID`)
) comment '�g�[�N����' ;

-- �g�[�N�e�[�}�J�e�S���o�C���h
drop table `TALK_THEME_CATEGORY_BIND` cascade;

create table `TALK_THEME_CATEGORY_BIND` (
  `TALK_THEME_CATEGORY_BIND_ID` DECIMAL(13,0) not null comment '�g�[�N�e�[�}�J�e�S���o�C���hID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment '�g�[�N�e�[�}ID'
  , `CATEGORY_ID` DECIMAL(13,0) not null comment '�J�e�S��ID'
  , `USER_ID` DECIMAL(13,0) not null comment '���[�U�[ID'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
  , constraint `TALK_THEME_CATEGORY_BIND_PKC` primary key (`TALK_THEME_CATEGORY_BIND_ID`)
) comment '�g�[�N�e�[�}�J�e�S���o�C���h' ;

-- �R�����g
drop table `COMMENT` cascade;

create table `COMMENT` (
  `COMMENT_ID` DECIMAL(13,0) not null comment '�R�����gID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment '�g�[�N�e�[�}ID'
  , `COMMENT` VARCHAR(50) not null comment '�R�����g'
  , `USER_ID` DECIMAL(13,0) not null comment '���[�U�[ID'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
  , constraint `COMMENT_PKC` primary key (`COMMENT_ID`)
) comment '�R�����g' ;

-- �g�[�N�e�[�}
drop table `TALK_THEME` cascade;

create table `TALK_THEME` (
  `TALK_THEME_ID` DECIMAL(13,0) not null comment '�g�[�N�e�[�}ID'
  , `TITLE` VARCHAR(30) not null comment '�^�C�g��'
  , `CONTENT` VARCHAR(500) not null comment '���e'
  , `THUMBNAIL_PATH` VARCHAR(2100) comment '�T���l�C���p�X'
  , `RELATED_URL` VARCHAR(2100) comment '�֘AURL'
  , `GOOD_COUNT` DECIMAL(13,0) default 0 not null comment '���]����'
  , `BAD_COUNT` DECIMAL(13,0) default 0 not null comment '��]����'
  , `TALK_COUNT` DECIMAL(13,0) default 0 not null comment '�g�[�N��'
  , `USER_ID` DECIMAL(13,0) not null comment '���[�U�[ID'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
  , constraint `TALK_THEME_PKC` primary key (`TALK_THEME_ID`)
) comment '�g�[�N�e�[�}' ;

-- ���[�U�[
drop table `USER` cascade;

create table `USER` (
  `USER_ID` DECIMAL(13,0) not null comment '���[�U�[ID'
  , `USER_NAME` VARCHAR(10) not null comment '���[�U�[��'
  , `ICON_PATH` VARCHAR(100) comment '�A�C�R���p�X'
  , `CREATE_DATETIME` DATETIME not null comment '�쐬����'
  , `INPUT_DATETIME` DATETIME not null comment '���͓���'
  , `UPDATE_DATETIME` DATETIME not null comment '�X�V����'
  , constraint `USER_PKC` primary key (`USER_ID`)
) comment '���[�U�[' ;

