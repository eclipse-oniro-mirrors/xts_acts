import atomicReferenceTest from './AtomicReference.test';
import atomicIntTest from './AtomicInt.test';
import atomicLongTest from './AtomicLong.test';
import atomicShortTest from './AtomicShort.test';
import atomicByteTest from './AtomicByte.test';
import atomicFloatTest from './AtomicFloat.test';
import atomicDoubleTest from './AtomicDouble.test';
import atomicCharTest from './AtomicChar.test';
import atomicBooleanTest from './AtomicBoolean.test';
import atomicsFunctionalTest from './AtomicsFunctional.test';
import atomicConcurrentTest from './AtomicConcurrent.test';
import atomicsParamTest from './AtomicsParamTest.test';

export default function testsuite() {
  atomicReferenceTest()
  atomicIntTest()
  atomicLongTest()
  atomicShortTest()
  atomicByteTest()
  atomicFloatTest()
  atomicDoubleTest()
  atomicCharTest()
  atomicBooleanTest()
  atomicsFunctionalTest()
  atomicConcurrentTest()
  atomicsParamTest()
}
