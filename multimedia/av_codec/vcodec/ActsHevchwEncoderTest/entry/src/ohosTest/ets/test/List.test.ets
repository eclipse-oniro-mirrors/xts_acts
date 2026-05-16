import BframeFuncTest from './BframeFuncTest.test';
import PostSqrFuncTest from './PostSqrFuncTest.test';
import PtsApiTest from './PtsApiTest.test';
import RoiFuncTest from './RoiFuncTest.test';
import SqrFuncTest from './SqrFuncTest.test';

export default function testsuite() {
  BframeFuncTest();
  PostSqrFuncTest();
  PtsApiTest();
  RoiFuncTest();
  SqrFuncTest();
}