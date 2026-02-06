import bufferTest from './Buffer.test';
import ConcurrentLibTest from './ConcurrentLibTest.test';
import xmlDynamic1 from './DynamicXml.test';
import LinkedTest from './LinkedList.test';
import PlainArraydTest from './PlainArray.test';
import processTest from './Process.test';
import QueueTest from './Queue.test';
import SpecialChar from './SpecialChar.test';
import Stack1 from './Stack.test';
import Stream from './Stream.test';
import TimerTest from './Timer.test';
import TreeMapTest from './TreeMap.test';
import TreeSetTest from './TreeSet.test';
import uriTest from './Uri.test';
import urlTest from './Url.test';
import utilTest from './Utill.test';

export default function testsuite() {
  xmlDynamic1();
  utilTest();
  urlTest();
  uriTest();
  TreeSetTest();
  TreeMapTest();
  TimerTest();
  bufferTest();
  ConcurrentLibTest();
  LinkedTest();
  PlainArraydTest();
  processTest();
  QueueTest();
  Stream();
  Stack1();
  SpecialChar();
}