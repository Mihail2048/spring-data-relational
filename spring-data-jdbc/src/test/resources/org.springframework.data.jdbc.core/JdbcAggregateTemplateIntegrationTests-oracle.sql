DROP TABLE MANUAL CASCADE CONSTRAINTS PURGE;
DROP TABLE LEGO_SET CASCADE CONSTRAINTS PURGE;
DROP TABLE CHILD_NO_ID CASCADE CONSTRAINTS PURGE;
DROP TABLE ONE_TO_ONE_PARENT CASCADE CONSTRAINTS PURGE;
DROP TABLE ELEMENT_NO_ID CASCADE CONSTRAINTS PURGE;
DROP TABLE LIST_PARENT CASCADE CONSTRAINTS PURGE;
DROP TABLE SIMPLE_LIST_PARENT CASCADE CONSTRAINTS PURGE;
DROP TABLE BYTE_ARRAY_OWNER CASCADE CONSTRAINTS PURGE;
DROP TABLE CHAIN0 CASCADE CONSTRAINTS PURGE;
DROP TABLE CHAIN1 CASCADE CONSTRAINTS PURGE;
DROP TABLE CHAIN2 CASCADE CONSTRAINTS PURGE;
DROP TABLE CHAIN3 CASCADE CONSTRAINTS PURGE;
DROP TABLE CHAIN4 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_CHAIN0 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_CHAIN1 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_CHAIN2 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_CHAIN3 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_CHAIN4 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_LIST_CHAIN0 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_LIST_CHAIN1 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_LIST_CHAIN2 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_LIST_CHAIN3 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_LIST_CHAIN4 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_MAP_CHAIN0 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_MAP_CHAIN1 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_MAP_CHAIN2 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_MAP_CHAIN3 CASCADE CONSTRAINTS PURGE;
DROP TABLE NO_ID_MAP_CHAIN4 CASCADE CONSTRAINTS PURGE;
DROP TABLE VERSIONED_AGGREGATE CASCADE CONSTRAINTS PURGE;
DROP TABLE WITH_READ_ONLY CASCADE CONSTRAINTS PURGE;
DROP TABLE WITH_LOCAL_DATE_TIME CASCADE CONSTRAINTS PURGE;
DROP TABLE WITH_ID_ONLY CASCADE CONSTRAINTS PURGE;
DROP TABLE WITH_INSERT_ONLY CASCADE CONSTRAINTS PURGE;

DROP TABLE MULTIPLE_COLLECTIONS CASCADE CONSTRAINTS PURGE;
DROP TABLE MAP_ELEMENT CASCADE CONSTRAINTS PURGE;
DROP TABLE LIST_ELEMENT CASCADE CONSTRAINTS PURGE;
DROP TABLE SET_ELEMENT CASCADE CONSTRAINTS PURGE;

DROP TABLE BOOK CASCADE CONSTRAINTS PURGE;
DROP TABLE AUTHOR CASCADE CONSTRAINTS PURGE;

DROP TABLE ENUM_MAP_OWNER CASCADE CONSTRAINTS PURGE;

CREATE TABLE LEGO_SET
(
    "id1" NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    NAME VARCHAR(30)
);
CREATE TABLE MANUAL
(
    "id2" NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    LEGO_SET    NUMBER,
    ALTERNATIVE NUMBER,
    CONTENT     VARCHAR(2000)
);

ALTER TABLE MANUAL
    ADD FOREIGN KEY (LEGO_SET)
        REFERENCES LEGO_SET ("id1");

CREATE TABLE ONE_TO_ONE_PARENT
(
    "id3" NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    content VARCHAR(30)
);
CREATE TABLE Child_No_Id
(
    ONE_TO_ONE_PARENT INTEGER PRIMARY KEY,
    "content"           VARCHAR(30)
);

CREATE TABLE LIST_PARENT
(
    "id4"   NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    NAME VARCHAR(100)
);
CREATE TABLE SIMPLE_LIST_PARENT
(
    ID   NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    NAME VARCHAR(100)
);
CREATE TABLE element_no_id
(
    CONTENT         VARCHAR(100),
    SIMPLE_LIST_PARENT_key NUMBER,
    SIMPLE_LIST_PARENT     NUMBER,
    LIST_PARENT_key NUMBER,
    LIST_PARENT     NUMBER
);

CREATE TABLE BYTE_ARRAY_OWNER
(
    ID          NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    BINARY_DATA RAW(100) NOT NULL
);

CREATE TABLE CHAIN4
(
    FOUR        NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    FOUR_VALUE VARCHAR(20)
);


CREATE TABLE CHAIN3
(
    THREE       NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    THREE_VALUE VARCHAR(20),
    CHAIN4      NUMBER,
    FOREIGN KEY (CHAIN4) REFERENCES CHAIN4 (FOUR)
);

CREATE TABLE CHAIN2
(
    TWO       NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    TWO_VALUE VARCHAR(20),
    CHAIN3    NUMBER,
    FOREIGN KEY (CHAIN3) REFERENCES CHAIN3 (THREE)
);

CREATE TABLE CHAIN1
(
    ONE       NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    ONE_VALUE VARCHAR(20),
    CHAIN2    NUMBER,
    FOREIGN KEY (CHAIN2) REFERENCES CHAIN2 (TWO)
);

CREATE TABLE CHAIN0
(
    ZERO       NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    ZERO_VALUE VARCHAR(20),
    CHAIN1     NUMBER,
    FOREIGN KEY (CHAIN1) REFERENCES CHAIN1 (ONE)
);

CREATE TABLE NO_ID_CHAIN4
(
    FOUR       NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    FOUR_VALUE VARCHAR(20)
);

CREATE TABLE NO_ID_CHAIN3
(
    THREE_VALUE  VARCHAR(20),
    NO_ID_CHAIN4 NUMBER,
    FOREIGN KEY (NO_ID_CHAIN4) REFERENCES NO_ID_CHAIN4 (FOUR)
);

CREATE TABLE NO_ID_CHAIN2
(
    TWO_VALUE    VARCHAR(20),
    NO_ID_CHAIN4 NUMBER,
    FOREIGN KEY (NO_ID_CHAIN4) REFERENCES NO_ID_CHAIN4 (FOUR)
);

CREATE TABLE NO_ID_CHAIN1
(
    ONE_VALUE    VARCHAR(20),
    NO_ID_CHAIN4 NUMBER,
    FOREIGN KEY (NO_ID_CHAIN4) REFERENCES NO_ID_CHAIN4 (FOUR)
);

CREATE TABLE NO_ID_CHAIN0
(
    ZERO_VALUE   VARCHAR(20),
    NO_ID_CHAIN4 NUMBER,
    FOREIGN KEY (NO_ID_CHAIN4) REFERENCES NO_ID_CHAIN4 (FOUR)
);

CREATE TABLE NO_ID_LIST_CHAIN4
(
    FOUR       NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    FOUR_VALUE VARCHAR(20)
);

CREATE TABLE NO_ID_LIST_CHAIN3
(
    THREE_VALUE           VARCHAR(20),
    NO_ID_LIST_CHAIN4     NUMBER,
    NO_ID_LIST_CHAIN4_KEY NUMBER,
    PRIMARY KEY (NO_ID_LIST_CHAIN4,
                 NO_ID_LIST_CHAIN4_KEY),
    FOREIGN KEY (NO_ID_LIST_CHAIN4) REFERENCES NO_ID_LIST_CHAIN4 (FOUR)
);

CREATE TABLE NO_ID_LIST_CHAIN2
(
    TWO_VALUE             VARCHAR(20),
    NO_ID_LIST_CHAIN4     NUMBER,
    NO_ID_LIST_CHAIN4_KEY NUMBER,
    NO_ID_LIST_CHAIN3_KEY NUMBER,
    PRIMARY KEY (NO_ID_LIST_CHAIN4,
                 NO_ID_LIST_CHAIN4_KEY,
                 NO_ID_LIST_CHAIN3_KEY),
    FOREIGN KEY (
                 NO_ID_LIST_CHAIN4,
                 NO_ID_LIST_CHAIN4_KEY
        ) REFERENCES NO_ID_LIST_CHAIN3 (
                                        NO_ID_LIST_CHAIN4,
                                        NO_ID_LIST_CHAIN4_KEY
        )
);

CREATE TABLE NO_ID_LIST_CHAIN1
(
    ONE_VALUE             VARCHAR(20),
    NO_ID_LIST_CHAIN4     NUMBER,
    NO_ID_LIST_CHAIN4_KEY NUMBER,
    NO_ID_LIST_CHAIN3_KEY NUMBER,
    NO_ID_LIST_CHAIN2_KEY NUMBER,
    PRIMARY KEY (NO_ID_LIST_CHAIN4,
                 NO_ID_LIST_CHAIN4_KEY,
                 NO_ID_LIST_CHAIN3_KEY,
                 NO_ID_LIST_CHAIN2_KEY),
    FOREIGN KEY (
                 NO_ID_LIST_CHAIN4,
                 NO_ID_LIST_CHAIN4_KEY,
                 NO_ID_LIST_CHAIN3_KEY
        ) REFERENCES NO_ID_LIST_CHAIN2 (
                                        NO_ID_LIST_CHAIN4,
                                        NO_ID_LIST_CHAIN4_KEY,
                                        NO_ID_LIST_CHAIN3_KEY
        )
);

CREATE TABLE NO_ID_LIST_CHAIN0
(
    ZERO_VALUE            VARCHAR(20),
    NO_ID_LIST_CHAIN4     NUMBER,
    NO_ID_LIST_CHAIN4_KEY NUMBER,
    NO_ID_LIST_CHAIN3_KEY NUMBER,
    NO_ID_LIST_CHAIN2_KEY NUMBER,
    NO_ID_LIST_CHAIN1_KEY NUMBER,
    PRIMARY KEY (NO_ID_LIST_CHAIN4,
                 NO_ID_LIST_CHAIN4_KEY,
                 NO_ID_LIST_CHAIN3_KEY,
                 NO_ID_LIST_CHAIN2_KEY,
                 NO_ID_LIST_CHAIN1_KEY),
    FOREIGN KEY (
                 NO_ID_LIST_CHAIN4,
                 NO_ID_LIST_CHAIN4_KEY,
                 NO_ID_LIST_CHAIN3_KEY,
                 NO_ID_LIST_CHAIN2_KEY
        ) REFERENCES NO_ID_LIST_CHAIN1 (
                                        NO_ID_LIST_CHAIN4,
                                        NO_ID_LIST_CHAIN4_KEY,
                                        NO_ID_LIST_CHAIN3_KEY,
                                        NO_ID_LIST_CHAIN2_KEY
        )
);



CREATE TABLE NO_ID_MAP_CHAIN4
(
    FOUR       NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    FOUR_VALUE VARCHAR(20)
);

CREATE TABLE NO_ID_MAP_CHAIN3
(
    THREE_VALUE          VARCHAR(20),
    NO_ID_MAP_CHAIN4     NUMBER,
    NO_ID_MAP_CHAIN4_KEY VARCHAR(20),
    PRIMARY KEY (NO_ID_MAP_CHAIN4,
                 NO_ID_MAP_CHAIN4_KEY),
    FOREIGN KEY (NO_ID_MAP_CHAIN4) REFERENCES NO_ID_MAP_CHAIN4 (FOUR)
);

CREATE TABLE NO_ID_MAP_CHAIN2
(
    TWO_VALUE            VARCHAR(20),
    NO_ID_MAP_CHAIN4     NUMBER,
    NO_ID_MAP_CHAIN4_KEY VARCHAR(20),
    NO_ID_MAP_CHAIN3_KEY VARCHAR(20),
    PRIMARY KEY (NO_ID_MAP_CHAIN4,
                 NO_ID_MAP_CHAIN4_KEY,
                 NO_ID_MAP_CHAIN3_KEY),
    FOREIGN KEY (
                 NO_ID_MAP_CHAIN4,
                 NO_ID_MAP_CHAIN4_KEY
        ) REFERENCES NO_ID_MAP_CHAIN3 (
                                       NO_ID_MAP_CHAIN4,
                                       NO_ID_MAP_CHAIN4_KEY
        )
);

CREATE TABLE NO_ID_MAP_CHAIN1
(
    ONE_VALUE            VARCHAR(20),
    NO_ID_MAP_CHAIN4     NUMBER,
    NO_ID_MAP_CHAIN4_KEY VARCHAR(20),
    NO_ID_MAP_CHAIN3_KEY VARCHAR(20),
    NO_ID_MAP_CHAIN2_KEY VARCHAR(20),
    PRIMARY KEY (NO_ID_MAP_CHAIN4,
                 NO_ID_MAP_CHAIN4_KEY,
                 NO_ID_MAP_CHAIN3_KEY,
                 NO_ID_MAP_CHAIN2_KEY),
    FOREIGN KEY (
                 NO_ID_MAP_CHAIN4,
                 NO_ID_MAP_CHAIN4_KEY,
                 NO_ID_MAP_CHAIN3_KEY
        ) REFERENCES NO_ID_MAP_CHAIN2 (
                                       NO_ID_MAP_CHAIN4,
                                       NO_ID_MAP_CHAIN4_KEY,
                                       NO_ID_MAP_CHAIN3_KEY
        )
);

CREATE TABLE NO_ID_MAP_CHAIN0
(
    ZERO_VALUE           VARCHAR(20),
    NO_ID_MAP_CHAIN4     NUMBER,
    NO_ID_MAP_CHAIN4_KEY VARCHAR(20),
    NO_ID_MAP_CHAIN3_KEY VARCHAR(20),
    NO_ID_MAP_CHAIN2_KEY VARCHAR(20),
    NO_ID_MAP_CHAIN1_KEY VARCHAR(20),
    PRIMARY KEY (NO_ID_MAP_CHAIN4,
                 NO_ID_MAP_CHAIN4_KEY,
                 NO_ID_MAP_CHAIN3_KEY,
                 NO_ID_MAP_CHAIN2_KEY,
                 NO_ID_MAP_CHAIN1_KEY),
    FOREIGN KEY (
                 NO_ID_MAP_CHAIN4,
                 NO_ID_MAP_CHAIN4_KEY,
                 NO_ID_MAP_CHAIN3_KEY,
                 NO_ID_MAP_CHAIN2_KEY
        ) REFERENCES NO_ID_MAP_CHAIN1 (
                                       NO_ID_MAP_CHAIN4,
                                       NO_ID_MAP_CHAIN4_KEY,
                                       NO_ID_MAP_CHAIN3_KEY,
                                       NO_ID_MAP_CHAIN2_KEY
        )
);

CREATE TABLE VERSIONED_AGGREGATE
(
    ID      NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    VERSION NUMBER
);

CREATE TABLE WITH_READ_ONLY
(
    ID        NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    NAME      VARCHAR(200),
    READ_ONLY VARCHAR(200) DEFAULT 'from-db'
);


CREATE TABLE WITH_LOCAL_DATE_TIME
(
  ID        NUMBER PRIMARY KEY,
  TEST_TIME TIMESTAMP(9)
);

CREATE TABLE WITH_ID_ONLY
(
  ID NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY
);


CREATE TABLE WITH_INSERT_ONLY
(
  ID NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
  INSERT_ONLY VARCHAR(100)
);

CREATE TABLE MULTIPLE_COLLECTIONS
(
    ID NUMBER GENERATED by default on null as IDENTITY PRIMARY KEY,
    NAME VARCHAR(100)
);

CREATE TABLE SET_ELEMENT
(
    MULTIPLE_COLLECTIONS NUMBER,
    NAME VARCHAR(100)
);

CREATE TABLE LIST_ELEMENT
(
    MULTIPLE_COLLECTIONS NUMBER,
    MULTIPLE_COLLECTIONS_KEY INT,
    NAME VARCHAR(100)
);

CREATE TABLE MAP_ELEMENT
(
    MULTIPLE_COLLECTIONS NUMBER,
    MULTIPLE_COLLECTIONS_KEY VARCHAR(10),
    ENUM_MAP_OWNER NUMBER,
    ENUM_MAP_OWNER_KEY VARCHAR(10),
    NAME VARCHAR(100)
);

CREATE TABLE AUTHOR
(
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY
);

CREATE TABLE BOOK
(
    AUTHOR NUMBER,
    NAME VARCHAR(100)
);

CREATE TABLE ENUM_MAP_OWNER
(
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    NAME VARCHAR(100)
);