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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from "@ohos/hypium";
import { sleep } from "../testability/pages/CommonUtils";
import { main1, main10,
  main11,
  main12,
  main13,
  main14,
  main15,
  main16,
  main17,
  main18,
  main19,
  main2,
  main20,
  main21,
  main22,
  main23,
  main24,
  main25,
  main26,
  main27,
  main28,
  main29,
  main3,
  main30,
  main31,
  main32,
  main33,
  main34,
  main35,
  main36,
  main4, main5, main6, main7, main8, main9 } from "../testability/pages/Reflect";

export default function ReflectTest() {
  describe('ReflectTest', () => {
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
     * @tc.number SUB_Reflect_TEST_0100
     * @tc.name ReflectTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0100';
      console.info(`${caseName} test start`);
      let a:string | undefined = main1();
      console.log(a);
      expect(a).assertEqual("TypeError");
      console.info(`${caseName} test end`);
      Done();
    });



    /**
     * @tc.number SUB_Reflect_TEST_0200
     * @tc.name ReflectTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0200';
      console.info(`${caseName} test start`);
      let a:string | undefined = main2();
      console.log(a);
      expect(a).assertEqual("TypeError");
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_0300
     * @tc.name ReflectTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0300';
      console.info(`${caseName} test start`);
      let a:string | undefined = main3();
      console.log(a);
      expect(a).assertEqual("TypeError");
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_0400
     * @tc.name ReflectTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0300'
      console.info(`${caseName} test start`);
      let a:string | undefined = main4();
      console.log(a);
      expect(a).assertEqual("TypeError");
      console.info(`${caseName} test end`);
      Done();
    });



    /**
     * @tc.number SUB_Reflect_TEST_0500
     * @tc.name ReflectTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0500';
      console.info(`${caseName} test start`);
      let a:string | undefined = main5();
      console.log(a);
      expect(a).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_0600
     * @tc.name ReflectTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0600';
      console.info(`${caseName} test start`);
      let a:string | undefined = main6();
      console.log(a);
      expect(a).assertEqual(' !"#$%&\'(*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_0700
     * @tc.name ReflectTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0700';
      console.info(`${caseName} test start`);
      let a:string | undefined = main7();
      console.log(a);
      expect(a).assertEqual('!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_0800
     * @tc.name ReflectTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0800';
      console.info(`${caseName} test start`);
      let a:string | undefined = main8();
      console.log(a);
      expect(a).assertEqual('\\a');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_0900
     * @tc.name ReflectTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest0900';
      console.info(`${caseName} test start`);
      let a:string | undefined = main9();
      console.log(a);
      expect(a).assertEqual('\\b');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_1000
     * @tc.name ReflectTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1000';
      console.info(`${caseName} test start`);
      let a:string | undefined = main10();
      console.log(a);
      expect(a).assertEqual('\\f');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_1100
     * @tc.name ReflectTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1100';
      console.info(`${caseName} test start`);
      let a:string | undefined = main11();
      console.log(a);
      expect(a).assertEqual('\\n');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_1200
     * @tc.name ReflectTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1200';
      console.info(`${caseName} test start`);
      let a:string | undefined = main12();
      console.log(a);
      expect(a).assertEqual('\\r');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_1300
     * @tc.name ReflectTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1300';
      console.info(`${caseName} test start`);
      let a:string | undefined = main13();
      console.log(a);
      expect(a).assertEqual('\\t');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_1400
     * @tc.name ReflectTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1400';
      console.info(`${caseName} test start`);
      let a:string | undefined = main14();
      console.log(a);
      expect(a).assertEqual('\\v');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_1500
     * @tc.name ReflectTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1500';
      console.info(`${caseName} test start`);
      let a:string | undefined = main15();
      console.log(a);
      expect(a).assertEqual('\\');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_1600
     * @tc.name ReflectTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1600';
      console.info(`${caseName} test start`);
      let a:string | undefined = main16();
      console.log(a);
      expect(a).assertEqual('\'');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_1700
     * @tc.name ReflectTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1700';
      console.info(`${caseName} test start`);
      let a:string | undefined = main17();
      console.log(a);
      expect(a).assertEqual('\"');
      console.info(`${caseName} test end`);
      Done();
    });



    /**
     * @tc.number SUB_Reflect_TEST_1800
     * @tc.name ReflectTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1800';
      console.info(`${caseName} test start`);
      let a:string | undefined = main18();
      console.log(a);
      expect(a).assertEqual('\?');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_1900
     * @tc.name ReflectTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest1900';
      console.info(`${caseName} test start`);
      let a:string | undefined = main19();
      console.log(a);
      expect(a).assertEqual('\0');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_2000
     * @tc.name ReflectTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2000';
      console.info(`${caseName} test start`);
      let a:string | undefined = main20();
      console.log(a);
      expect(a).assertEqual('\\141\\142\\143');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_2100
     * @tc.name ReflectTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2100';
      console.info(`${caseName} test start`);
      let a:string | undefined = main21();
      console.log(a);
      expect(a).assertEqual('\\x61\\x62\\x63');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_2200
     * @tc.name ReflectTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2200';
      console.info(`${caseName} test start`);
      let a:string | undefined = main22();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\udc46');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_2300
     * @tc.name ReflectTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2300';
      console.info(`${caseName} test start`);
      let a:string | undefined = main23();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\udc7f');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_2400
     * @tc.name ReflectTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2400';
      console.info(`${caseName} test start`);
      let a:string | undefined = main24();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\udc40');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_2500
     * @tc.name ReflectTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2500';
      console.info(`${caseName} test start`);
      let a:string | undefined = main25();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\udcaf');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_2600
     * @tc.name ReflectTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2600';
      console.info(`${caseName} test start`);
      let a:string | undefined = main26();
      console.log(a);
      expect(a).assertEqual('\\ud83c\\udf85');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_2700
     * @tc.name ReflectTest2700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2700';
      console.info(`${caseName} test start`);
      let a:string | undefined = main27();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\ude3c');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_2800
     * @tc.name ReflectTest2800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2800';
      console.info(`${caseName} test start`);
      let a:string | undefined = main28();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\udd27');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_2900
     * @tc.name ReflectTest2900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest2900';
      console.info(`${caseName} test start`);
      let a:string | undefined = main29();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\udc87');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_3000
     * @tc.name ReflectTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest3000';
      console.info(`${caseName} test start`);
      let a:string | undefined = main30();
      console.log(a);
      expect(a).assertEqual('\\ud83e\\udd3c\\u200d\\u2642');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_3100
     * @tc.name ReflectTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest3100';
      console.info(`${caseName} test start`);
      let a:string | undefined = main31();
      console.log(a);
      expect(a).assertEqual('\\ud83d\\udee2');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_3200
     * @tc.name ReflectTest3200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest3200';
      console.info(`${caseName} test start`);
      let a:string | undefined = main32();
      console.log(a);
      expect(a).assertEqual('\\ud83c\\udc04');
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_Reflect_TEST_3300
     * @tc.name ReflectTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest3300';
      console.info(`${caseName} test start`);
      let a:string | undefined = main33();
      console.log(a);
      expect(a).assertEqual('\\ud83c\\udff4');
      console.info(`${caseName} test end`);
      Done();
    });



    /**
     * @tc.number SUB_Reflect_TEST_3400
     * @tc.name ReflectTest3400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest3400';
      console.info(`${caseName} test start`);
      let a:string | undefined = main34();
      console.log(a);
      expect(a).assertEqual('0NaN');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_3500
     * @tc.name ReflectTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest3500';
      console.info(`${caseName} test start`);
      let a:string | undefined = main35();
      console.log(a);
      expect(a).assertEqual('ReferenceError');
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_Reflect_TEST_3600
     * @tc.name ReflectTest3600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReflectTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'ReflectTest3600';
      console.info(`${caseName} test start`);
      let a:string | undefined = main36();
      console.log(a);
      expect(a).assertEqual('循环次数: 11, 值是否稳定: true');
      console.info(`${caseName} test end`);
      Done();
    });


  })
}