create table user (
	id	varchar(100)	NOT NULL,
	password	varchar(100)	NOT NULL,
	nickname	varchar(100)	NOT NULL,
	email	varchar(100)	NOT NULL,
	phone_number	varchar(100)	NOT NULL,
	address	varchar(200)	NOT NULL
);

CREATE TABLE payment (
	reservation_idx	int auto_increment primary key NOT NULL,
	hospital_idx	int	NOT NULL,
	user_id	varchar(100)	NOT NULL,
	payment_amount	int	NOT NULL,
	payment_date	datetime	NOT NULL,
	payment_method	varchar(100)	NOT NULL,
	payment_status	varchar(100)	NOT NULL,
	update_at	timestamp	NOT NULL
);
drop table payment;

CREATE TABLE manager (
	id	varchar(100)	NOT NULL,
	name	varchar(50)	NOT NULL,
	password	varchar(100)	NOT NULL,
	email	varchar(100)	NOT NULL,
	phone_number	varchar(100)	NOT NULL,
	business_number	varchar(100)	NOT NULL
);

CREATE TABLE doctorInfo (
	hospital_idx	int	NOT NULL,
	name	varchar(100)	NOT NULL,
	detail	varchar(500)	NOT NULL
);

CREATE TABLE department (
	department	int	NOT NULL,
	hospital_idx	int	NOT NULL
);

create table review (
	user_id	varchar(100)	NOT NULL,
	hospital_idx	int	NOT NULL,
	title	varchar(200)	NOT NULL,
	contents	varchar(1000)	NOT NULL,
	created_at	timestamp	NOT NULL,
	rating	float	NOT NULL,
	password	varchar(100)	NOT NULL	DEFAULT 0000,
	released	boolean	NOT NULL
);

CREATE TABLE hospital (
	idx	int auto_increment primary key NOT NULL,
	manager_id	varchar(100)	NOT NULL,
	name	varchar (100)	NOT NULL,
	address	varchar(200)	NOT NULL,
	number	varchar(100)	NOT NULL,
	type	varchar(100)	NULL
);

CREATE TABLE reservation (
	idx	int auto_increment	primary key NOT NULL,
	hospital_idx	int	NOT NULL,
	user_id	varchar(100)	NOT NULL,
	visit_user	varchar(100)	NOT NULL,
	phone_number	varchar(100)	NOT NULL,
	content	varchar(500)	NOT NULL,
	admit	boolean	NOT NULL,
	reservation_date	timestamp	NOT NULL
);

CREATE TABLE monday (
	open	boolean	NOT NULL,
	open_time	time	NULL,
	close_time	time	NULL,
	hospital_idx	int	NOT NULL
);

CREATE TABLE tuesday (
	open	boolean	NOT NULL,
	open_time	time	NULL,
	close_time	time	NULL,
	hospital_idx	int	NOT NULL
);

CREATE TABLE wendsday (
	open	boolean	NOT NULL,
	open_time	time	NULL,
	close_time	time	NULL,
	hospital_idx	int	NOT NULL
);

CREATE TABLE thursday (
	open	boolean	NOT NULL,
	open_time	time	NULL,
	close_time	time	NULL,
	hospital_idx	int	NOT NULL
);

CREATE TABLE friday (
	open	boolean	NOT NULL,
	open_time	time	NULL,
	close_time	time	NULL,
	hospital_idx	int	NOT NULL
);

CREATE TABLE saturday (
	open	boolean	NOT NULL,
	open_time	time	NULL,
	close_time	time	NULL,
	hospital_idx	int	NOT NULL
);

CREATE TABLE sunday (
	open	boolean	NOT NULL,
	open_time	time	NULL,
	close_time	time	NULL,
	hospital_idx	int	NOT NULL
);

CREATE TABLE announcement (
	hospital_idx	int	NOT NULL,
	title	varchar(200)	NOT NULL,
	contents	varchar(2000)	NOT NULL,
	created_at	timestamp	NOT NULL
);

ALTER TABLE user ADD CONSTRAINT PK_USER PRIMARY KEY (
	id
);

ALTER TABLE payment ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	reservation_idx,
	hospital_idx,
	user_id
);

ALTER TABLE manager ADD CONSTRAINT PK_MANAGER PRIMARY KEY (
	id
);

ALTER TABLE doctorInfo ADD CONSTRAINT PK_DOCTORINFO PRIMARY KEY (
	hospital_idx
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	user_id,
	hospital_idx
);

ALTER TABLE hospital ADD CONSTRAINT PK_HOSPITAL PRIMARY KEY (
	idx,
	manager_id
);

ALTER TABLE reservation ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (
	idx,
	hospital_idx,
	user_id
);

ALTER TABLE announcement ADD CONSTRAINT PK_ANNOUNCEMENT PRIMARY KEY (
	hospital_idx
);

ALTER TABLE payment ADD CONSTRAINT FK_reservation_TO_payment_1 FOREIGN KEY (
	reservation_idx
)
REFERENCES reservation (
	idx
)ON DELETE CASCADE;

ALTER TABLE payment ADD CONSTRAINT FK_reservation_TO_payment_2 FOREIGN KEY (
	hospital_idx
)
REFERENCES reservation (
	hospital_idx
) ON DELETE CASCADE;

ALTER TABLE payment ADD CONSTRAINT FK_reservation_TO_payment_3 FOREIGN KEY (
	user_id
)
REFERENCES reservation (
	user_id
)ON DELETE CASCADE;

ALTER TABLE payment DROP CONSTRAINT FK_reservation_TO_payment_3;


ALTER TABLE doctorInfo ADD CONSTRAINT FK_hospital_TO_doctorInfo_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
)ON DELETE CASCADE;

ALTER TABLE department ADD CONSTRAINT FK_hospital_TO_department_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
)ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT FK_user_TO_review_1 FOREIGN KEY (
	user_id
)
REFERENCES user (
	id
)ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT FK_hospital_TO_review_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
)ON DELETE CASCADE;

ALTER TABLE hospital ADD CONSTRAINT FK_manager_TO_hospital_1 FOREIGN KEY (
	manager_id
)
REFERENCES manager (
	id
)ON DELETE CASCADE;

ALTER TABLE reservation ADD CONSTRAINT FK_hospital_TO_reservation_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
)ON DELETE CASCADE;

ALTER TABLE reservation ADD CONSTRAINT FK_user_TO_reservation_1 FOREIGN KEY (
	user_id
)
REFERENCES user (
	id
)ON DELETE CASCADE;

ALTER TABLE monday ADD CONSTRAINT FK_hospital_TO_monday_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
)ON DELETE CASCADE;

ALTER TABLE tuesday ADD CONSTRAINT FK_hospital_TO_tuesday_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
);

ALTER TABLE wendsday ADD CONSTRAINT FK_hospital_TO_wendsday_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
);

ALTER TABLE thursday ADD CONSTRAINT FK_hospital_TO_thursday_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
);

ALTER TABLE friday ADD CONSTRAINT FK_hospital_TO_friday_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
);

ALTER TABLE saturday ADD CONSTRAINT FK_hospital_TO_saturday_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
);

ALTER TABLE sunday ADD CONSTRAINT FK_hospital_TO_sunday_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
);

ALTER TABLE announcement ADD CONSTRAINT FK_hospital_TO_announcement_1 FOREIGN KEY (
	hospital_idx
)
REFERENCES hospital (
	idx
);

