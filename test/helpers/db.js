// include Tape and Ramda
var test = require('tape');
var R = require('ramda');

// include Task to test types
var Task = require('data.task');

// import tested module
var db = require('../../src/helpers/db');

// Unit function for when we don't care about output
var unit = R.always(undefined);

test('db module', function(t) {
  t.plan(1);

  t.equal(typeof db.queryTask, 'function', 'should export a queryTask function');
});

test('db.queryTask', {timeout: 2000}, function(t) {
  t.plan(3);

  var passTask = db.queryTask('SELECT 1 + 1 as solution');
  var failTask = db.queryTask('nonsense');

  t.equal(passTask instanceof Task, true, 'should return a Task instance');

  passTask.fork(
    unit,
    (x) => { t.equal(x[0][0]['solution'], 2, 'should fork to resolve with query response'); }
  );

  failTask.fork(
    (x) => { t.equal(x.errno, 1064, 'should fork to reject with an error object'); },
    unit
  );

  db.conn.end();
});
