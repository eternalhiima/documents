-- Project Name : hiima
-- Date/Time    : 2019/01/30 22:53:30
-- Author       : simplex
-- RDBMS Type   : MySQL
-- Application  : A5:SQL Mk-2

/*
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
*/

-- タグ
--* BackupToTempTable
drop table if exists `TAG` cascade;

--* RestoreFromTempTable
create table `TAG` (
  `TAG_ID` DECIMAL(8) not null comment 'タグID'
  , `TAG_NAME` VARCHAR(12) not null comment 'タグ名'
  , `USER_ID` DECIMAL(8) not null comment 'ユーザーID'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `DELETE_DATETIME` DATETIME comment '削除日時'
  , `USED_COUNT` DECIMAL(8) not null comment '使用回数'
  , `LAST_USED_DATETIME` DATETIME not null comment '最終使用日時'
  , `IS_DELETED` INT not null comment '削除フラグ'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
) comment 'タグ' ;

create unique index `TAG_PKI`
  on `TAG`(`TAG_ID`);

alter table `TAG`
  add constraint `TAG_PKC` primary key (`TAG_ID`);

-- トーク評価
--* BackupToTempTable
drop table if exists `TALK_EVALUATION` cascade;

--* RestoreFromTempTable
create table `TALK_EVALUATION` (
  `TALK_HISTORY_ID` DECIMAL(8) not null comment 'トーク評価ID'
  , `USER_ID` VARCHAR(8) comment 'ユーザーID'
  , `TALK_THEME_ID` VARCHAR(8) not null comment 'トークテーマID'
  , `EVALUATION` INT not null comment '評価'
  , `IS_DELETED` INT not null comment '削除フラグ'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
) comment 'トーク評価' ;

create unique index `TALK_EVALUATION_PKI`
  on `TALK_EVALUATION`(`TALK_HISTORY_ID`);

alter table `TALK_EVALUATION`
  add constraint `TALK_EVALUATION_PKC` primary key (`TALK_HISTORY_ID`);

-- トーク履歴
--* BackupToTempTable
drop table if exists `TALK_HISTORY` cascade;

--* RestoreFromTempTable
create table `TALK_HISTORY` (
  `TALK_HISTORY_ID` DECIMAL(8) not null comment 'トーク履歴ID'
  , `USER_ID` VARCHAR(8) comment 'ユーザーID'
  , `TALK_THEME_ID` VARCHAR(8) not null comment 'トークテーマID'
  , `START_DATETIME` DATETIME not null comment '開始時刻'
  , `END_DATETIME` DATETIME comment '終了時刻'
  , `IS_DELETED` INT not null comment '削除フラグ'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
) comment 'トーク履歴' ;

create unique index `TALK_HISTORY_PKI`
  on `TALK_HISTORY`(`TALK_HISTORY_ID`);

alter table `TALK_HISTORY`
  add constraint `TALK_HISTORY_PKC` primary key (`TALK_HISTORY_ID`);

-- トークテーマタグバインド
--* BackupToTempTable
drop table if exists `TALK_THEME_TAG_BIND` cascade;

--* RestoreFromTempTable
create table `TALK_THEME_TAG_BIND` (
  `TALK_THEME_TAG_BIND_ID` DECIMAL(8) not null comment 'トークテーマタグバインドID'
  , `TAG_ID` DECIMAL(8) not null comment 'タグID'
  , `TALK_THEME_ID` DECIMAL(8) not null comment 'トークテーマID'
  , `USER_ID` DECIMAL(8) not null comment 'ユーザーID'
  , `TAG_DATETIME` DATETIME not null comment 'タグ付け日時'
  , `IS_DELETED` INT not null comment '削除フラグ'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
) comment 'トークテーマタグバインド' ;

create unique index `TALK_THEME_TAG_BIND_PKI`
  on `TALK_THEME_TAG_BIND`(`TALK_THEME_TAG_BIND_ID`);

alter table `TALK_THEME_TAG_BIND`
  add constraint `TALK_THEME_TAG_BIND_PKC` primary key (`TALK_THEME_TAG_BIND_ID`);

-- コメント
--* BackupToTempTable
drop table if exists `COMMENT` cascade;

--* RestoreFromTempTable
create table `COMMENT` (
  `COMMENT_ID` DECIMAL(8) not null comment 'コメントID'
  , `COMMENT` VARCHAR(50) not null comment 'コメント'
  , `USER_ID` DECIMAL(8) not null comment 'ユーザーID'
  , `TALK_THEME_ID` DECIMAL(8) not null comment 'トークテーマID'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `DELETE_DATETIME` DATETIME comment '削除日時'
  , `IS_DELETED` INT not null comment '削除フラグ'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
) comment 'コメント' ;

create unique index `COMMENT_PKI`
  on `COMMENT`(`COMMENT_ID`);

alter table `COMMENT`
  add constraint `COMMENT_PKC` primary key (`COMMENT_ID`);

-- トークテーマ
--* BackupToTempTable
drop table if exists `TALK_THEME` cascade;

--* RestoreFromTempTable
create table `TALK_THEME` (
  `TALK_THEME_ID` DECIMAL(8) not null comment 'トークテーマID'
  , `TITLE` VARCHAR(30) not null comment 'タイトル'
  , `CONTENT` VARCHAR(500) not null comment '内容'
  , `THUMBNAIL_PATH` VARCHAR(50) not null comment 'サムネイルパス'
  , `RELATED_URL` VARCHAR(100) comment '関連URL'
  , `USER_ID` DECIMAL(8) not null comment 'ユーザーID'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `DELETE_DATETIME` DATETIME comment '削除日時'
  , `IS_DELETED` INT not null comment '削除フラグ'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
) comment 'トークテーマ' ;

create unique index `TALK_THEME_PKI`
  on `TALK_THEME`(`TALK_THEME_ID`);

alter table `TALK_THEME`
  add constraint `TALK_THEME_PKC` primary key (`TALK_THEME_ID`);

-- ユーザー
--* BackupToTempTable
drop table if exists `USER` cascade;

--* RestoreFromTempTable
create table `USER` (
  `USER_ID` DECIMAL(8) not null comment 'ユーザーID'
  , `USER_NAME` VARCHAR(10) not null comment 'ユーザー名'
  , `ICON_PATH` VARCHAR(100) not null comment 'アイコンパス'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `DELETE_DATETIME` DATETIME comment '削除日時'
  , `IS_DELETED` INT not null comment '削除フラグ'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
) comment 'ユーザー' ;

create unique index `USER_PKI`
  on `USER`(`USER_ID`);

alter table `USER`
  add constraint `USER_PKC` primary key (`USER_ID`);

