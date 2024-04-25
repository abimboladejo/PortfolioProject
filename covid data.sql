use portfolio;
select location, date, total_cases, new_cases, total_deaths, population from coviddeaths;

### Total Cases vs Toatal Death - Chances of dying from covid if contracted
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage 
from coviddeaths
where location = 'Germany';

### Total Cases vs Population - Chances of contracting covid in your country of residence

select location, date, population, total_cases, (total_cases/population)*100 as case_percentage
from coviddeaths
where location = 'Germany'
order by 5 desc;

### Countries with Highest Infection Rate
select location, population, MAX(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as MaxInfectionRate_Percentage
from coviddeaths
group by location, population
order by 4 desc;

### Countries with Highest Death Rate
select location, MAX(cast(total_deaths as signed)) as HighestDeathCount
from coviddeaths
where continent is not null
group by location
order by 2 desc;

select continent, max(cast(total_deaths as unsigned)) as DeathCount
from coviddeaths
where continent is not null
group by continent
order by 2 desc;

select sum(new_cases) as total_cases, sum(cast(new_deaths as unsigned)) as total_deaths, sum(cast(new_deaths as unsigned)) /sum(new_cases) * 100 as DeathPercentage
from coviddeaths
where continent is not null