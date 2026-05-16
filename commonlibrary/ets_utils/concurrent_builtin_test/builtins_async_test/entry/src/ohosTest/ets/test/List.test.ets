import asyncFunctionTest from './async/asyncFunctionTest.test';
import asyncGeneratorTest from './async/asyncGeneratorTest.test';
import asyncIteratorTest from './async/asyncIteratorTest.test';
import asyncAdvancedTest from './async/AsyncAdvancedTest.test';
import asyncBoundaryTest from './async/AsyncBoundaryTest.test';
import asyncGenericsTest from './async/AsyncGenericsTest.test';
import asyncInteropTest from './async/AsyncInteropTest.test';
import asyncPerformanceTest from './async/AsyncPerformanceTest.test';
import asyncRealWorldTest from './async/AsyncRealWorldTest.test';
import asyncFirTest from './async/AsyncFirTest.test';
import asyncSecTest from './async/AsyncSecTest.test';

export default function testsuite() {
  asyncFunctionTest()
  asyncGeneratorTest()
  asyncIteratorTest()
  asyncAdvancedTest()
  asyncBoundaryTest()
  asyncGenericsTest()
  asyncInteropTest()
  asyncPerformanceTest()
  asyncRealWorldTest()
  asyncFirTest()
  asyncSecTest()
}