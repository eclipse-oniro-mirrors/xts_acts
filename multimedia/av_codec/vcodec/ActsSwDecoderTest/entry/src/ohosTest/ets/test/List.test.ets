import ActsFuncTest from './ActsFuncTest.test';
import ActsApiTest from './ActsApiTest.test';
import ActsStateTest from './ActsStateTest.test';

export default function testsuite() {
  ActsFuncTest();
  ActsApiTest();
  ActsStateTest();
}
