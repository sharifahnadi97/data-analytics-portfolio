select *
from PortfolioProject..CovidDeaths
where continent is not null
order by 3,4 

--select *
--from PortfolioProject..CovidVaccinations
--order by 3,4 

-- Select the data to use
select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

-- Total cases vs total deaths
-- Likelihood of dying if you contract COVID in your country (rough est)
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_rate
from PortfolioProject..CovidDeaths
where location like 'Malaysia'
and continent is not null
order by 1,2

-- Total cases vs population
-- Percentage of population infected with COVID
select location, date, population, total_cases, (total_cases/population)*100 as case_rate
from PortfolioProject..CovidDeaths
where location like 'Malaysia'
and continent is not null
order by 1,2

-- Looking at countries with highest infection rate compared to population
select location, population, max(total_cases) as highest_infection_count, max((total_cases/population))*100 as percent_population_infected
from PortfolioProject..CovidDeaths
where continent is not null
group by location, population
order by percent_population_infected desc

-- Looking at countries with highest death count per population
select location, max(cast(total_deaths as int)) as highest_death_count
from PortfolioProject..CovidDeaths
where continent is not null
group by location
order by highest_death_count desc

-- Looking at continents with highest death count per population
select continent, max(cast(total_deaths as int)) as highest_death_count
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by highest_death_count desc 



-- GLOBAL NUMBERS --

select date, SUM(new_cases) as total_global_cases, SUM(cast(new_deaths as int)) as total_global_deaths, 
	SUM(cast(new_deaths as int))/SUM(new_cases)*100 as global_death_percentage
from PortfolioProject..CovidDeaths
where continent is not null
group by date
order by 1,2

