import atomicsAddTest from './AtomicAddTest.test';
import atomicsAndTest from './AtomicAndTest.test';
import atomicsCompareExchangeTest from './AtomicCompareExchangeTest.test';
import atomicsExchangeTest from './AtomicExchangeTest.test';
import atomicsIsLockFreeTest from './AtomicIsLockFreeTest.test';
import atomicsLoadTest from './AtomicLoadTest.test';
import atomicsOrTest from './AtomicOrTest.test';
import atomicsCombTest from './AtomicsCombTest.test';
import atomicsStoreTest from './AtomicStoreTest.test';
import atomicsSubTest from './AtomicSubTest.test';
import atomicsWaitTest from './AtomicWaitTest.test';
import atomicsXorTest from './AtomicXorTest.test';
import atomicsTest from "./Atomics.test";
import atomicsAPITest from './AtomicsAPITest.test';
import atomicsAPISecondTest from './AtomicsAPISecondTest.test';
import AtomicsAPIThirdlyTest from './AtomicsAPIThirdlyTest.test';
import AtomicsFunctionTest from './AtomicsFunctionTest.test';
import AtomicsMultithreadTest from './AtomicsMultithreadTest.test';

export default function testsuite() {
  atomicsTest()
  atomicsAPITest();
  atomicsAPISecondTest();
  AtomicsAPIThirdlyTest();
  AtomicsFunctionTest();
  AtomicsMultithreadTest();
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