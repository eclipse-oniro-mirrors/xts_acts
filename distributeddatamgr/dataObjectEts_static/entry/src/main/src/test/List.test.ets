import DataObjectErrTest from './DataObjectErrTest.test';
import ObjectStoreJsunitV9 from './ObjectStoreJsunitV9.test';
import ObjectStoreJsunitV9Ets from './ObjectStoreJsunitV9Ets.test';

export default function testsuite() {
  DataObjectErrTest();
  ObjectStoreJsunitV9();
  ObjectStoreJsunitV9Ets();
}