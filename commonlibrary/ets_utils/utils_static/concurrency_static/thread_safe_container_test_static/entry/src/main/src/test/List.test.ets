import ArrayBlockingQueuetest from './ArrayBlockingQueue.test';
import LinkedBlockingQueuetest from './LinkedBlockingQueuetest.test';

export default function testsuite() {
  LinkedBlockingQueuetest()
  ArrayBlockingQueuetest()
}