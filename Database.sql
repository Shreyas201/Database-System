/* SQL Commands to create following Tables */
/*Start*/

/* 1. SQL Scripts to create table for Locations */

CREATE TABLE Locations (
    Country_name       VARCHAR NOT NULL
                               PRIMARY KEY,
    ISO_code           VARCHAR NOT NULL,
    Vaccine_name       VARCHAR REFERENCES Available_Vaccine (Vaccine_name),
    last_observed_date DATE,
    source_name        VARCHAR,
    source_url         VARCHAR
);

/* 2. SQL Script to create table for US_State_Vaccinations */

CREATE TABLE US_State_Vaccinations (
    Date                                DATE    NOT NULL
                                                REFERENCES AUS_GER_IT_US (Date),
    State_name                          VARCHAR,
    Total_vaccinations                  INTEGER,
    Total_distributed                   INTEGER,
    People_vaccinated                   INTEGER,
    People_fully_vaccinated_per_hundred REAL,
    Total_vaccinations_per_hundred      REAL,
    [ People_fully_vaccinated]          INTEGER,
    People_vaccinated_per_hundred       REAL,
    Distrubuted_per_hundred             REAL,
    Daily_vaccinations_raw              INTEGER,
    Daily_vaccinations                  INTEGER,
    Daily_vaccinations_per_millon       REAL,
    Share_doses_used                    REAL,
    Total_boosters                      INTEGER,
    Total_booster_per_hundred           REAL
);

/* 3. SQL Scripts to create Vaccinations table */

CREATE TABLE Vaccinations (
    Location                            VARCHAR NOT NULL
                                                REFERENCES Locations (Country_name),
    ISO_code                            VARCHAR NOT NULL,
    Date                                DATE,
    Total_vaccinations                  INTEGER,
    People_vaccinated                   INTEGER,
    People_fully_vaccinated             INTEGER,
    Total_boosters                      INTEGER,
    Daily_vaccinations_raw              INTEGER,
    Daily_vaccinations                  INTEGER,
    Total_vaccinations_per_hundred      REAL,
    People_vaccinated_per_hundred       REAL,
    People_fully_vaccinated_per_hundred REAL,
    Total_boosters_per_hundred          REAL,
    Daily_vaccinations_per_million      REAL,
    Daily_people_vaccinated             INTEGER,
    Daily_people_vaccinated_per_hundred REAL
);

/* 4. SQL Scripts to create Vaccinations_by_Age_Group table */

CREATE TABLE Vaccinations_by_Age_Group (
    Location                            VARCHAR NOT NULL
                                                REFERENCES Locations (Country_name),
    Date                                DATE,
    Age_group                           VARCHAR,
    People_vaccinated_per_hundred       REAL,
    People_fully_vaccinated_per_hundred REAL,
    People_with_booster_per_hundred     REAL
);

/* 5. SQL Scripts to create Vaccinations_by_Manufacturer table */

CREATE TABLE Vaccinations_by_Manufacturer (
    Location                    VARCHAR NOT NULL
                                        REFERENCES Locations (Country_name),
    Date                        DATE,
    Vaccine_name                VARCHAR REFERENCES Available_Vaccine (Vaccine_name),
    Total_vaccinations_produced VARCHAR
);

/* 6. SQL Scripts to create Available_Vaccine */

CREATE TABLE Available_Vaccine (
    Vaccine_name VARCHAR PRIMARY KEY
                       NOT NULL
);

/* 7. SQL Scripts to create AUS_GER_IT_US */
CREATE TABLE AUS_GER_IT_US (
    Country_name            VARCHAR,
    Date                    DATE    NOT NULL,
    Vaccine_name            VARCHAR,
    Source_url              VARCHAR,
    Total_vaccinations      INTEGER,
    People_vaccinated       INTEGER,
    People_fully_vaccinated INTEGER,
    Total_boosters          INTEGER
);

/*END*?
