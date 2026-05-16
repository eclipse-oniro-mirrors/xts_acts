/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import ClassA from '../class/ClassA';
import ClassB from '../class/ClassB';
import ClassC from '../class/ClassC';
import { ClassD } from '../class/ClassD';
import { ClassE } from '../class/ClassE';
import { ClassF } from '../class/ClassF';
import * as Class11 from '../class/ClassG';
import { ClassTest } from '../class/ClassG';
import { ClsTest2 } from '../class/ClassH';
import { ClassTest2 } from '../class/ClassTest2';
import {
  ClassType1 as Class1,
  ClassType1 as Class3,
  ClassType3 as Class4,
  ClassType1,
  ClassType2,
  ClassType3
} from '../class/ClassType';
import { sleep } from '../utils/Utils';

export default function exportClassTest() {
  describe('ExportClassTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   exportClassTest0100
     * @tc.number SUB_EXPORT_CLASS_TEST_0100
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('exportClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'exportClassTest0100';
      console.info(`${caseName} test start`);
      try {
        let cla = new ClassA('test01');
        expect(cla.name).assertEqual(ClassA.name);
        expect(cla.value).assertEqual('test01');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0200
     * @tc.number SUB_EXPORT_CLASS_TEST_0200
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0200';
      console.info(`${caseName} test start`);
      try {
        let cla: ClassB = new ClassB();
        cla.value = caseName;
        expect(cla.name).assertEqual(ClassB.name);
        expect(cla.value).assertEqual(caseName);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0300
     * @tc.number SUB_EXPORT_CLASS_TEST_0300
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0300';
      console.info(`${caseName} test start`);
      try {
        let cla = new ClassC('test03');
        expect(cla.name).assertEqual(ClassC.name);
        expect(cla.value).assertEqual('test03');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0400
     * @tc.number SUB_EXPORT_CLASS_TEST_0400
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0400';
      console.info(`${caseName} test start`);
      try {
        let c1 = new ClassType1('test0401');
        let c2 = new ClassType2('test0402');
        let c3 = new Class1('test0403');
        let c4 = new Class3('test0404');
        let c5 = new Class4('test0405');
        let c6 = new ClassType3('test0406');
        expect(c1.name).assertEqual(ClassType1.name);
        expect(c1.text).assertEqual('test0401');
        expect(c2.name).assertEqual(ClassType2.name);
        expect(c2.text).assertEqual('test0402');
        expect(c3.name).assertEqual(Class1.name);
        expect(c3.text).assertEqual('test0403');
        expect(c4.name).assertEqual(Class3.name);
        expect(c4.text).assertEqual('test0404');
        expect(c5.name).assertEqual(Class4.name);
        expect(c5.text).assertEqual('test0405');
        expect(c6.name).assertEqual(ClassType3.name);
        expect(c6.text).assertEqual('test0406');
        expect(c1.name).assertEqual(c3.name);
        expect(c1.name).assertEqual(c4.name);
        expect(c3.name).assertEqual(c4.name);
        expect(c5.name).assertEqual(c6.name);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0500
     * @tc.number SUB_EXPORT_CLASS_TEST_0500
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0500';
      console.info(`${caseName} test start`);
      try {
        let cla = new ClassD('test05');
        expect(cla.name).assertEqual(ClassD.name);
        expect(cla.value).assertEqual('test05');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0600
     * @tc.number SUB_EXPORT_CLASS_TEST_0600
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0600';
      console.info(`${caseName} test start`);
      try {
        let cla = new ClassE('test06');
        expect(cla.name).assertEqual(ClassE.name);
        expect(cla.value).assertEqual('test06');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0700
     * @tc.number SUB_EXPORT_CLASS_TEST_0700
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0700';
      console.info(`${caseName} test start`);
      try {
        let cla = new ClassF('test07');
        expect(cla.tag).assertEqual('ClassF');
        expect(cla.value).assertEqual('test07');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0800
     * @tc.number SUB_EXPORT_CLASS_TEST_0800
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0800';
      console.info(`${caseName} test start`);
      try {
        let cla = new ClassTest('test08');
        expect(cla.name).assertEqual(ClassTest.name);
        expect(cla.value).assertEqual('test08');
        let cl2 = new Class11.ClassTest('test0801');
        expect(cl2.name).assertEqual(Class11.ClassTest.name);
        expect(cl2.value).assertEqual('test0801');
        expect(cla.name).assertEqual(cl2.name);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   exportClassTest0900
     * @tc.number SUB_EXPORT_CLASS_TEST_0900
     * @tc.desc   Testing export default class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest0900';
      console.info(`${caseName} test start`);
      try {
        let cla: ClassTest2 = new ClsTest2.ClassTest2('test09');
        expect(cla.name).assertEqual(ClsTest2.ClassTest2.name);
        expect(cla.value).assertEqual('test09');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

  })
}