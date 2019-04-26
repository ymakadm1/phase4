FactoryBot.define do
 
  factory :employee do
    first_name { "Ed" }
    last_name { "Gruberman" }
    ssn { rand(9 ** 9).to_s.rjust(9,'0') }
    date_of_birth { 19.years.ago.to_date }
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    role { "employee" }
    active { true }
  end
  
  factory :store do
    name {"CMU"}
    street {"5000 Forbes Avenue"}
    city {"Pittsburgh"}
    state {"PA"}
    zip {"15213"}
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    active {true}
  end
  
  factory :assignment do
    association :store
    association :employee
    start_date {1.year.ago.to_date}
    end_date {1.month.ago.to_date}
    pay_level {1}
  end
  
  factory :shift do
    association :assignment
    date {Date.today}
    start_time {2.hours.ago.to_time}
    end_time {1.hour.ago.to_time}
    notes {"Johnny was a bad boy on this shift"}
  end
  
  factory :shift_job do
    association :shift
    association :job
  end

factory :job do
    name {"Work cash register"}
    description {"Serving ice cream is a hard task - NOT"}
    active {true}
  end

factory :flavor do
    name {"Vanilla"}
    active {true}
  end

  factory :store_flavor do
    association :flavor
    association :store
  end

  factory :user do
    email {"alex@example.com"}
    password_digest {"password123"}
    active {true}
  end

end
