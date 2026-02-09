import promiseAllSettledTest from './promise/promiseAllSettledTest.test';
import promiseAllTest from './promise/promiseAllTest.test';
import promiseAnyTest from './promise/promiseAnyTest.test';
import promiseCatchTest from './promise/promiseCatchTest.test';
import promiseCombTest from './promise/promiseCombTest.test';
import promiseFinallyTest from './promise/promiseFinallyTest.test';
import promiseRaceTest from './promise/promiseRaceTest.test';
import promiseRejectTest from './promise/promiseRejectTest.test';
import promiseResolveTest from './promise/promiseResolveTest.test';
import promiseTest from './promise/promiseTest.test';
import promiseThenTest from './promise/promiseThenTest.test';
//import promiseWithResolversTest from './promise/promiseWithResolversTest.test';

export default function testsuite() {
  promiseAnyTest()
  promiseRaceTest()
  promiseResolveTest()
  promiseTest()
  promiseThenTest()
  promiseCatchTest()
  promiseFinallyTest()
  promiseAllTest()
  promiseAllSettledTest()
  promiseRejectTest()
  promiseCombTest()
}