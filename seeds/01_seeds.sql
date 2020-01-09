INSERT INTO users ( name, email, password)
VALUES ('Anisa Mohamed', 'anisa@mohamed.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
( 'Beyonce Knowles', 'beyonce@knowles.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
( 'Kelly Rowland', 'kelly@rowland.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
( 'Michelle Williams', 'michelle@williams.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
( 'Letoya Luckett', 'letoya@luckett.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
( 'LaTavia Robertson', 'latavia@robertson.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties ( owner_id, title,description,  thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES ( 3, 'Kelly Villa','description',  'thumbnail_photo_url', 'cover_photo_url', 300, 2, 1, 5, 'United States', 'destinys child street', 'Houston', 'Texas', 'P0S C0D3', false),
 ( 1, 'Anisa Castle','description',  'thumbnail_photo_url', 'cover_photo_url', 450, 3, 4, 10, 'Somalia', 'windy street', 'Mogadishu', 'Puntland', 'S0M4L14', true),
  ( 2, 'Beyonce Mansion','description',  'thumbnail_photo_url', 'cover_photo_url', 6798, 79, 27, 40, 'Haiti', 'Brown SKin Girl Street', 'Port-au-Prince', 'North Haiti', 'H41t1', false);

  INSERT INTO reservations ( start_date, end_date, property_id, guest_id)
  VALUES 
  ( '2018-09-11', '2018-09-26',2 ,6),
  ('2019-01-04', '2019-02-01',1, 5),
  ( '2021-10-01', '2021-10-14',2, 4);
  
  INSERT INTO property_reviews ( guest_id, property_id, reservation_id, rating, message) 
  VALUES 
  ( 5, 3, 1, 5, 'message'),
  ( 6, 2, 2, 10, 'message' ),
  ( 4, 1, 3, 7, 'message');

  INSERT INTO rates ( start_date, end_date, cost_per_night, property_id)
  VALUES ( '2019-09-11', '2019-09-16', 450, 1),
  ('2020-11-01', '2020-11-26', 490, 2),
  ( '2018-06-02', '2018-06-03',342, 3);

  INSERT INTO guest_reviews ( guest_id, owner_id, rating, message)
  VALUES ( 6, 1, 10, 'message'), 
  ( 4,  3, 9, 'message'), 
  (5,  2, 6, 'message');