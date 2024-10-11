# Heritage Site Query Tool

## Overview

The **Heritage Site Query Tool** is a command-line tool written in **Elixir**. It enables users to query and filter data from a CSV file containing information about UNESCO World Heritage Sites. You can query data by category, such as filtering all sites under the `Cultural` category.

This project focuses on simplicity, efficiency, and production-readiness, using **NimbleCSV** for fast CSV parsing and **ExUnit** for testing.

## Features

- **CSV Parsing**: Uses the efficient NimbleCSV library to parse and read the CSV file.
- **Command-Line Interface (CLI)**: Query and filter World Heritage Site data directly from the command line.
- **Category Filter**: Easily filter sites based on `Cultural` or `Natural` categories.
- **Production Ready**: The project is designed with production in mind, including a modular codebase, error handling, and unit tests.
- **Unit Tests**: The project includes tests using **ExUnit** to ensure robust behavior of the core parsing and querying logic.

## Setup Instructions

### Prerequisites

- **Elixir**: Make sure you have Elixir installed on your machine. To install Elixir, follow the official guide [here](https://elixir-lang.org/install.html).

### Installation

1. Clone this repository to your local machine:

   ``` bash
   git clone https://github.com/starglow-v/heritage-tool.git
   cd heritage-tool
  ```

2. Fetch the dependencies by running the following command:

  ``` bash
  mix deps.get
  ```

3. Usage
Once you have the project set up, you can use the CLI to query the CSV data.

Query by Category: To filter and retrieve all Cultural sites from the dataset, run:

  ``` bash
  mix heritage.query --category Cultural
  To filter Natural sites, run:
  ```

  ``` bash
  mix heritage.query --category Natural
  ```
