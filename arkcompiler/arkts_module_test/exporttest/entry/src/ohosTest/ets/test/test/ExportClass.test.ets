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
import { ClassWithGetterSetter } from '../class/ClassWithGetterSetter';
import { ClassWithGetterOnly } from '../class/ClassWithGetterOnly';
import { ClassWithSetterOnly } from '../class/ClassWithSetterOnly';
import { ClassWithThisMethod } from '../class/ClassWithThisMethod';
import { ClassWithThisInConstructor } from '../class/ClassWithThisInConstructor';
import { BaseClass } from '../class/BaseClass';
import { DerivedClass } from '../class/DerivedClass';
import { ClassWithOverride } from '../class/ClassWithOverride';
import { Level3Class } from '../class/MultiLevelInheritance';
import { ComplexClassIntegration } from '../class/ComplexClassIntegration';
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
    })

    /**
     * @tc.name   exportClassTest1000
     * @tc.number SUB_EXPORT_CLASS_TEST_1000
     * @tc.desc   Testing class with getter/setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest1000';
      try {
        let cla = new ClassWithGetterSetter();
        expect(cla.name).assertEqual('ClassWithGetterSetter');
        expect(cla.value).assertEqual('default');
        cla.value = 'updated';
        expect(cla.value).assertEqual('updated');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1100
     * @tc.number SUB_EXPORT_CLASS_TEST_1100
     * @tc.desc   Testing class with getter only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest1100';
      try {
        let cla = new ClassWithGetterOnly();
        expect(cla.name).assertEqual('ClassWithGetterOnly');
        expect(cla.readonlyValue).assertEqual('readonly');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1200
     * @tc.number SUB_EXPORT_CLASS_TEST_1200
     * @tc.desc   Testing class with setter only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest1200';
      try {
        let cla = new ClassWithSetterOnly();
        expect(cla.name).assertEqual('ClassWithSetterOnly');
        cla.writeonlyValue = 'new_value';
        expect(cla.getInternalValue()).assertEqual('new_value');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1300
     * @tc.number SUB_EXPORT_CLASS_TEST_1300
     * @tc.desc   Testing class with this in member functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest1300';
      try {
        let cla = new ClassWithThisMethod('test13');
        expect(cla.name).assertEqual('ClassWithThisMethod');
        expect(cla.getValue()).assertEqual('test13');
        expect(cla.incrementCounter()).assertEqual(1);
        expect(cla.getCounter()).assertEqual(1);
        expect(cla.getFullInfo()).assertEqual('ClassWithThisMethod: test13, counter: 1');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1400
     * @tc.number SUB_EXPORT_CLASS_TEST_1400
     * @tc.desc   Testing class with this in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest1400';
      try {
        let cla = new ClassWithThisInConstructor('test14');
        expect(cla.name).assertEqual('ClassWithThisInConstructor');
        expect(cla.value).assertEqual('test14');
        expect(cla.getComputedValue()).assertContain('test14');
        expect(cla.getComputedValue()).assertContain('id_test14');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1500
     * @tc.number SUB_EXPORT_CLASS_TEST_1500
     * @tc.desc   Testing base class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('exportClassTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'exportClassTest1500';
      try {
        let cla = new BaseClass('base15');
        expect(cla.name).assertEqual('BaseClass');
        expect(cla.getBaseValue()).assertEqual('base15');
        expect(cla.getBaseInfo()).assertContain('BaseClass');
        expect(cla.getBaseInfo()).assertContain('base15');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1600
     * @tc.number SUB_EXPORT_CLASS_TEST_1600
     * @tc.desc   Testing derived class with inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest1600';
      try {
        let cla = new DerivedClass('base16', 'derived16');
        expect(cla.name).assertEqual('DerivedClass');
        expect(cla.getBaseValue()).assertEqual('base16');
        expect(cla.getDerivedValue()).assertEqual('derived16');
        expect(cla.getFullInfo()).assertContain('base16');
        expect(cla.getFullInfo()).assertContain('derived16');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1700
     * @tc.number SUB_EXPORT_CLASS_TEST_1700
     * @tc.desc   Testing class with override and super
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportClassTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'exportClassTest1700';
      try {
        let cla = new ClassWithOverride('base17', 'override17');
        expect(cla.name).assertEqual('ClassWithOverride');
        expect(cla.getOverrideValue()).assertEqual('override17');
        expect(cla.getBaseInfo()).assertContain('[OVERRIDE]');
        expect(cla.getBaseInfo()).assertContain('base17');
        expect(cla.getBaseInfo()).assertContain('override17');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1800
     * @tc.number SUB_EXPORT_CLASS_TEST_1800
     * @tc.desc   Testing multi-level inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('exportClassTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const caseName = 'exportClassTest1800';
      try {
        let cla3 = new Level3Class('base18', 'level2_18', 'level3_18');
        expect(cla3.level3Value).assertEqual('level3_18');
        expect(cla3.getLevel3Info()).assertContain('base18');
        expect(cla3.getLevel3Info()).assertContain('level2_18');
        expect(cla3.getLevel3Info()).assertContain('level3_18');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   exportClassTest1900
     * @tc.number SUB_EXPORT_CLASS_TEST_1900
     * @tc.desc   Testing complex class integration with all features
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('exportClassTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const caseName = 'exportClassTest1900';
      try {
        let cla = new ComplexClassIntegration('base19', 'derived19', 'private19');
        expect(cla.name).assertEqual('BaseClass');
        expect(cla.getBaseValue()).assertEqual('base19');
        expect(cla.derivedValue).assertEqual('derived19');
        expect(cla.privateValue).assertEqual('private19');
        expect(cla.computedValue).assertEqual('base19_derived19_private19');
        expect(cla.validateThisBinding()).assertTrue();
        cla.updateValues('new_base', 'new_derived', 'new_private');
        expect(cla.getBaseValue()).assertEqual('new_base');
        expect(cla.derivedValue).assertEqual('new_derived');
        expect(cla.privateValue).assertEqual('new_private');
        expect(cla.computedValue).assertEqual('new_base_new_derived_new_private');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

  })
}