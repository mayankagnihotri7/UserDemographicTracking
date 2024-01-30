# UserDemographicTracking

A Rails application that tracks user information and calculates some interesting statistics.

### Highlights -
- **Automatic user data import**: Every hour, fresh user data (20 users) is fetched from an API and stored in the database (Postgresql) with deduplication.
- **Gender-based stats**: Thw app tracks the total number of male and female users throughout the day, stored in redis and summarised in daily records.
- **Dynamic average age**: As user data changes, the average age the average age for both genders is automatically recalculated and stored in daily records.
- **User interface**: A liquid powered dashboard displays -
  - A table of all users with search and delete functionality (updating gender counts accordingly).
  - Total user count.
  - A list of daily records with key statistics.

 ### Tech stack:
 - Rails
 - Postgresql
 - Redis
 - Sidekiq
 - Liquid
