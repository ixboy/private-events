User.create!(
  [
    { username: 'Alycia Rojas', email: 'alycia@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'George Shammah', email: 'george@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Ismael Bruno', email: 'myemail@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Grace Temi', email: 'temi@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Abdul Kaliq', email: 'abdul@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Jordan Kaweesi', email: 'ordon@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Akello Joan', email: 'joan@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Elizabeth Kirabo', email: 'liz@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Agatha Gwth', email: 'agatha@gmail.com', password: '123456', password_confirmation: '123456' },
    { username: 'Suzan Oboo', email: 'suzan@gmail.com', password: '123456', password_confirmation: '123456' }
  ]
)

Event.create!(
  [
    { event_name: 'First Event', description: 'The Best Fashoin Show in Town', venue: 'Kampala',
      event_date: '2021-06-27', user_id: 5 },
    { event_name: 'Dev Conference', description: 'The Annual Ruby on Rails Conference', venue: 'Tokyo',
      event_date: '2021-07-27', user_id: 6 },
    { event_name: 'PHP Past Conf', description: 'Why PHP is still the best', venue: 'Pakistan',
      event_date: '2021-01-27', user_id: 3 },
    { event_name: 'Lisp Conference', description: 'The father of all Functional Programming', venue: 'USA',
      event_date: '2021-02-27', user_id: 4 }
  ]
)
