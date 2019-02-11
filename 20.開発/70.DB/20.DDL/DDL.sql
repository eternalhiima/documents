-- Project Name : hiima
-- Date/Time    : 2019/02/11 15:24:38
-- Author       : rebor
-- RDBMS Type   : MySQL
-- Application  : A5:SQL Mk-2

-- カテゴリ
drop table `CATEGORY` cascade;

create table `CATEGORY` (
  `CATEGORY_ID` DECIMAL(13,0) not null comment 'カテゴリID'
  , `CATEGORY_NAME` VARCHAR(12) not null comment 'カテゴリ名'
  , `USER_ID` DECIMAL(13,0) not null comment 'ユーザーID'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `USED_COUNT` DECIMAL(13,0) not null comment '使用回数'
  , `LAST_USED_DATETIME` DATETIME not null comment '最終使用日時'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
  , constraint `CATEGORY_PKC` primary key (`CATEGORY_ID`)
) comment 'カテゴリ' ;

-- トーク評価
drop table `TALK_EVALUATION` cascade;

create table `TALK_EVALUATION` (
  `TALK_EVALUATION_ID` DECIMAL(13,0) not null comment 'トーク評価ID'
  , `USER_ID` DECIMAL(13,0) comment 'ユーザーID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment 'トークテーマID'
  , `EVALUATION` DECIMAL(2,0) not null comment '評価'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
  , constraint `TALK_EVALUATION_PKC` primary key (`TALK_EVALUATION_ID`)
) comment 'トーク評価' ;

-- トーク履歴
drop table `TALK_HISTORY` cascade;

create table `TALK_HISTORY` (
  `TALK_HISTORY_ID` DECIMAL(13,0) not null comment 'トーク履歴ID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment 'トークテーマID'
  , `USER_ID` DECIMAL(13,0) comment 'ユーザーID'
  , `START_DATETIME` DATETIME not null comment '開始時刻'
  , `END_DATETIME` DATETIME not null comment '終了時刻'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
  , constraint `TALK_HISTORY_PKC` primary key (`TALK_HISTORY_ID`)
) comment 'トーク履歴' ;

-- トークテーマカテゴリバインド
drop table `TALK_THEME_CATEGORY_BIND` cascade;

create table `TALK_THEME_CATEGORY_BIND` (
  `TALK_THEME_CATEGORY_BIND_ID` DECIMAL(13,0) not null comment 'トークテーマカテゴリバインドID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment 'トークテーマID'
  , `CATEGORY_ID` DECIMAL(13,0) not null comment 'カテゴリID'
  , `USER_ID` DECIMAL(13,0) not null comment 'ユーザーID'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
  , constraint `TALK_THEME_CATEGORY_BIND_PKC` primary key (`TALK_THEME_CATEGORY_BIND_ID`)
) comment 'トークテーマカテゴリバインド' ;

-- コメント
drop table `COMMENT` cascade;

create table `COMMENT` (
  `COMMENT_ID` DECIMAL(13,0) not null comment 'コメントID'
  , `TALK_THEME_ID` DECIMAL(13,0) not null comment 'トークテーマID'
  , `COMMENT` VARCHAR(50) not null comment 'コメント'
  , `USER_ID` DECIMAL(13,0) not null comment 'ユーザーID'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
  , constraint `COMMENT_PKC` primary key (`COMMENT_ID`)
) comment 'コメント' ;

-- トークテーマ
drop table `TALK_THEME` cascade;

create table `TALK_THEME` (
  `TALK_THEME_ID` DECIMAL(13,0) not null comment 'トークテーマID'
  , `TITLE` VARCHAR(30) not null comment 'タイトル'
  , `CONTENT` VARCHAR(500) not null comment '内容'
  , `THUMBNAIL_PATH` VARCHAR(2100) comment 'サムネイルパス'
  , `RELATED_URL` VARCHAR(2100) comment '関連URL'
  , `GOOD_COUNT` DECIMAL(13,0) default 0 not null comment '高評価数'
  , `BAD_COUNT` DECIMAL(13,0) default 0 not null comment '低評価数'
  , `TALK_COUNT` DECIMAL(13,0) default 0 not null comment 'トーク数'
  , `USER_ID` DECIMAL(13,0) not null comment 'ユーザーID'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
  , constraint `TALK_THEME_PKC` primary key (`TALK_THEME_ID`)
) comment 'トークテーマ' ;

-- ユーザー
drop table `USER` cascade;

create table `USER` (
  `USER_ID` DECIMAL(13,0) not null comment 'ユーザーID'
  , `USER_NAME` VARCHAR(10) not null comment 'ユーザー名'
  , `ICON_PATH` VARCHAR(100) comment 'アイコンパス'
  , `CREATE_DATETIME` DATETIME not null comment '作成日時'
  , `INPUT_DATETIME` DATETIME not null comment '入力日時'
  , `UPDATE_DATETIME` DATETIME not null comment '更新日時'
  , constraint `USER_PKC` primary key (`USER_ID`)
) comment 'ユーザー' ;

