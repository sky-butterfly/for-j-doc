CREATE TABLE days
(
  id            bigint   NOT NULL AUTO_INCREMENT COMMENT 'days id',
  plans id      bigint   NOT NULL COMMENT 'plans id',
  day_num       int      NOT NULL COMMENT '1~30',
  day_date      datetime NOT NULL COMMENT 'day datetime',
  created_date  datetime NOT NULL COMMENT 'created datetime',
  modified_date datetime NOT NULL COMMENT 'modified datetime',
  PRIMARY KEY (id)
) COMMENT '여행일';

CREATE TABLE plans
(
  id            bigint   NOT NULL AUTO_INCREMENT COMMENT 'plans id',
  user_id       varchar  NOT NULL COMMENT 'user id',
  type          varchar  NOT NULL COMMENT 'A, B, C, D, E',
  name          varchar  NOT NULL COMMENT 'plan name',
  is_current    tinyint  NOT NULL DEFAULT 0 COMMENT '현재 여행여부(0, 1)',
  is_deleted    tinyint  NOT NULL DEFAULT 0 COMMENT '삭제여부(0, 1)',
  start_date    datetime NOT NULL COMMENT 'start datetime',
  end_date      datetime NOT NULL COMMENT 'end datetime',
  created_date  datetime NOT NULL COMMENT 'created datetime',
  modified_date datetime NOT NULL COMMENT 'modified datetime',
  PRIMARY KEY (id)
) COMMENT '플랜';

CREATE TABLE times
(
  id            bigint   NOT NULL AUTO_INCREMENT COMMENT 'times id',
  days_id       bigint   NOT NULL COMMENT 'days id',
  start_time    datetime NOT NULL COMMENT 'start time',
  end_time      datetime NOT NULL COMMENT 'end time',
  contents      varchar  NOT NULL COMMENT '일정 내용',
  details       varchar  NULL     COMMENT '상세일정 내용',
  created_date  datetime NOT NULL COMMENT 'created datetime',
  modified_date datetime NOT NULL COMMENT 'modified datetime',
  PRIMARY KEY (id)
) COMMENT '시간별 일정';

ALTER TABLE days
  ADD CONSTRAINT FK_plans_TO_days
    FOREIGN KEY (plans id)
    REFERENCES plans (id);

ALTER TABLE times
  ADD CONSTRAINT FK_days_TO_times
    FOREIGN KEY (days_id)
    REFERENCES days (id);