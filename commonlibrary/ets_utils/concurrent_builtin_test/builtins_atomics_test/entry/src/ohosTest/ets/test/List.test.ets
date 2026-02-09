import atomicsAddTest from './atomics/atomicAddTest.test';
import atomicsAndTest from './atomics/atomicAndTest.test';
import atomicsCompareExchangeTest from './atomics/atomicCompareExchangeTest.test';
import atomicsExchangeTest from './atomics/atomicExchangeTest.test';
import atomicsIsLockFreeTest from './atomics/atomicIsLockFreeTest.test';
import atomicsLoadTest from './atomics/atomicLoadTest.test';
import atomicsOrTest from './atomics/atomicOrTest.test';
import atomicsCombTest from './atomics/atomicsCombTest.test';
import atomicsStoreTest from './atomics/atomicStoreTest.test';
import atomicsSubTest from './atomics/atomicSubTest.test';
import atomicsWaitTest from './atomics/atomicWaitTest.test';
import atomicsXorTest from './atomics/atomicXorTest.test';

export default function testsuite() {
  atomicsCombTest()
  atomicsAddTest()
  atomicsAndTest()
  atomicsCompareExchangeTest()
  atomicsExchangeTest()
  atomicsIsLockFreeTest()
  atomicsLoadTest()
  atomicsOrTest()
  atomicsStoreTest()
  atomicsSubTest()
  atomicsXorTest()
  atomicsWaitTest()
}