import JsonBasicTest from './JsonStringify/JSONStringifyBasicTest';
import replacerTest from './JsonStringify/JSONStringifyReplacerTest';
import classBasicTest from './JsonStringify/JSONStringifyClassTest';
import Json1Test from './supply_Json/Json1.test';
import Json2Test from './supply_Json/Json2.test';
import Json4Test from './supply_Json/Json4.test';
import Json5Test from './supply_Json/Json5.test';
import Json6Test from './supply_Json/Json6.test';

export default function testsuite() {
  JsonBasicTest();
  replacerTest();
  classBasicTest();
  Json1Test();
  Json2Test()
  Json4Test();
  Json5Test()
  Json6Test()
}