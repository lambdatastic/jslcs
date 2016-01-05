// import Ramda
var R = require('ramda');

// import db
var db = require('../helpers/db');

// init exported object
var leaguesModel = {};

/* League :: {
 *  id :: Int
 *  shortName :: String,
 *  fullName :: String
 * }
 */

// getLeagues :: Unit -> Task (Error, Array League)
leaguesModel.getLeagues = function() {
  return db.queryTask(
    db.queryBuild('Leagues')
    .select()
    .toString()
  );
};

// addLeague :: League -> Task (Error, Array League)
leaguesModel.addLeague = function(league) {
  return db.queryTask(
    db.queryBuild('Leagues')
    .insert(league)
    .toString()
  );
};

module.exports = leaguesModel;
