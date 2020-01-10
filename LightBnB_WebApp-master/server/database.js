const properties = require('./json/properties.json');
const users = require('./json/users.json')
const { Pool } = require('pg')
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return pool.query( `
      SELECT * FROM users
      WHERE email = $1
      LIMIT 1;`, [email])
    .then((res) => {
      if (res.rows.length) {
        return res.rows[0];
      }
      else {
        return null;
      }
    })
 
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool.query( `
  SELECT * FROM users
  WHERE id = $1
  LIMIT 1`, [id]).then(res =>  res.rows[0]);


}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */

const addUser =  function(user) {
  return pool.query( `
  INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3) 
  RETURNING *`, [user.name, user.email, user.password])
  .then(res =>  res.rows[0]);

}


exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  console.log('guest id ->',guest_id)
  return pool.query(`SELECT reservations.*, properties.*, AVG(rating) as average_rating
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON properties.id = property_reviews.property_id 
  WHERE reservations.guest_id = $1
  AND reservations.end_date < now()::date
  GROUP BY  properties.id, reservations.id
  ORDER BY reservations.start_date
  LIMIT $2;`,[guest_id,limit]).then(res=> res.rows)
}
exports.getAllReservations = getAllReservations;


// This function accepts a guest_id, limits the properties to 10 and returns a promise. The promise should resolve reservations for that user. Use the All My Reservations query that you made in a previous assignments.
/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  return pool.query(`
  SELECT properties.*, AVG(rating) AS average_rating 
  FROM properties
  JOIN  property_reviews ON properties.id = property_id
  GROUP BY properties.id
  LIMIT $1
  `, [limit])
  .then(res => res.rows);
}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
