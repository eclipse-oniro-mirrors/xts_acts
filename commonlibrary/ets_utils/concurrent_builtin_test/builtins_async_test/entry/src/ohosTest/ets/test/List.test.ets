import asyncFunctionTest from './async/asyncFunctionTest.test';
import asyncGeneratorTest from './async/asyncGeneratorTest.test';
import asyncIteratorTest from './async/asyncIteratorTest.test';

export default function testsuite() {
  asyncFunctionTest()
  asyncGeneratorTest()
  asyncIteratorTest()
}