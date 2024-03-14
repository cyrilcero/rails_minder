# RailsMinder

RailsMinder is a Ruby on Rails application that helps users organize tasks by creating unique categories and tracking tasks specific to each user.

## Features

- **User-specific Categories:** Users can create unique categories to organize their tasks.
  
- **Task Management:** Add, edit, and delete tasks within each category.

- **Due Today:** Easily view tasks due today based on the target completion date.

- **Task Completion:** Mark tasks as completed when finished.

## Demo Video
https://www.loom.com/share/18497056afbb451296ad53d423192ea4?sid=fe65db28-ee6c-4681-adf7-6cacdb4d93e7]
## Getting Started

### Prerequisites

- Ruby
- Ruby on Rails
- PostgreSQL

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/cyrilcero/rails_minder.git
2. Navigate to the project directory:
    ```bash
   cd rails_minder
3. Install dependencies:
    ```bash
   bundle install
4. Set up the database:
    ```bash
    rails db:create
    rails db:migrate
5. Start the Rails server:
    ```bash
    bin/dev
6. Visit http://localhost:3000 in your web browser.

## Usage
1. Sign up or log in to your account.
2. Create categories to organize your tasks.
3. View tasks due today on the homepage.
4. Mark tasks as completed when finished.

## Technologies used:
- Devise
- Tailwind
- Stimulus Components
- PostgreSQL

## Testing:
- System Test using MiniTest
