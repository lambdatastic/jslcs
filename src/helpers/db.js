// Import Data.Task and Ramda
var Task = require('data.task');
var R = require('ramda');

// import Mysql dependency
var mysql = require('mysql');

var conn = mysql.createConnection('mysql://root@localhost/jslcs');

var queryTask = function(query) {
  return new Task(function(rej, res) {
    conn.query(query, function(err, results, fields) {
      if (err) { rej(err); }
      else { res([results, fields]); }
    });
  });
};

module.exports = {
  queryTask: queryTask,
  conn: conn
};
