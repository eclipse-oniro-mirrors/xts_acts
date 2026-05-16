import ArrayConcurrentQueuetest from './ArrayConcurrentQueue.test';
import LinkedConcurrentQueuetest from './LinkedConcurrentQueuetest.test';
import ArrayConcurrentQueueStressTest from './ArrayConcurrentQueueStressTest.test';
import LinkedConcurrentQueueStressTest from './LinkedConcurrentQueueStressTest.test';

export default function testsuite() {
  LinkedConcurrentQueuetest()
  ArrayConcurrentQueuetest()
  ArrayConcurrentQueueStressTest()
  LinkedConcurrentQueueStressTest()
}