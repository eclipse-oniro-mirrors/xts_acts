import asyncFunctionTest from './async/asyncFunctionTest.test';
import asyncGeneratorTest from './async/asyncGeneratorTest.test';
import asyncIteratorTest from './async/asyncIteratorTest.test';
import asyncFirTest from './async/AsyncFirTest.test';
import asyncSecTest from './async/AsyncSecTest.test';

export default function testsuite() {
  asyncFunctionTest()
  asyncGeneratorTest()
  asyncIteratorTest()
  asyncFirTest()
  asyncSecTest()
}