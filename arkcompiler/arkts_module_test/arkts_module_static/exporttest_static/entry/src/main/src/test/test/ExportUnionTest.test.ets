'use static'
/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import myDefaultExport from '../exports/ExportUnion2'
import {ComplexUnion} from '../exports/ExportUnion2'
import myValue, { myUnionType } from '../exports/ExportUnion';
import myComplexObject2, {
  myComplexObject3,
  myComplexObject4,
  ComplexObject1,
  myExport1,
  aaExport2
} from '../exports/ExportUnion3';
import { sleep } from '../utils/Utils';

let flag: boolean = false;

export default function exportUnionTest() {
  describe('ExportUnionTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      flag = false
      await sleep(100)
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
     * @tc.number SUB_EXPORT_UNION_TEST_0100
     * @tc.name exportUnionTest0100
     * @tc.desc test Default the union type is exported based on the default type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('exportUnionTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // Defines a test case. This ApI supports three parameters: test case name, filter parameter, and test case function.console.info(0x0000,'testTag''%{public}s','it begin');
      console.info('testTag', '%{public}s', 'it begin');
      let a: myValue = Math.random() < 0.5 ? 42.0 : 'Hello, World!';
      if (typeof a === 'number') {
        expect('42').assertEqual(a.toString());
        flag = true;
      } else if (typeof a === 'string') {
        flag = true;
        expect('Hello, World!').assertEqual(a.toString());
      }
      ;
      expect(flag).assertTrue();
    })

    // /**
    //  * @tc.number SUB_EXPORT_UNION_TEST_0200
    //  * @tc.name exportUnionTest0200
    //  * @tc.desc test Default define and export in a single statement
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('exportUnionTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
    //   let a:ComplexUnion = myDefaultExport;
    //   if (myDefaultExport.type === 'number') {
    //     expect('42').assertEqual(a.value.toString());
    //     flag = true;
    //   }
    //   ;
    //   expect(flag).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_EXPORT_UNION_TEST_0300
    //  * @tc.name exportUnionTest0300
    //  * @tc.desc test Default define first, then export the object
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('exportUnionTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
    //   let a:ComplexUnion = myComplexObject2;
    //   if (myComplexObject2.type === 'number') {
    //     expect('42').assertEqual(a.value.toString());
    //     flag = true;
    //   }
    //   ;
    //   expect(flag).assertTrue();
    // })
    // /**
    //  * @tc.number SUB_EXPORT_UNION_TEST_0400
    //  * @tc.name exportUnionTest0400
    //  * @tc.desc test Define and export in a single statement
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('exportUnionTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
    //   console.info('testTag', '%{public}s', 'it begin');
    //   let a:ComplexUnion = myComplexObject3;
    //   if (a.type === 'number') {
    //     expect('43').assertEqual(a.value.toString());
    //     flag = true;
    //   }
    //   ;
    //   expect(flag).assertTrue();
    // })
    //
    // /**
    //  * @tc.number SUB_EXPORT_UNION_TEST_0500
    //  * @tc.name exportUnionTest0500
    //  * @tc.desc test Define first, then export the object
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('exportUnionTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
    //   let a:ComplexUnion = myComplexObject4;
    //   if (a.type === 'number') {
    //     expect('45').assertEqual(a.value.toString());
    //     flag = true;
    //   }
    //   ;
    //   expect(flag).assertTrue();
    // })
    //
    // /**
    //  * @tc.number SUB_EXPORT_UNION_TEST_0600
    //  * @tc.name exportUnionTest0600
    //  * @tc.desc test Define and export objects with aliases
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('exportUnionTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
    //   let a:ComplexUnion = ComplexObject1;
    //   if (a.type === 'number') {
    //     expect('46').assertEqual(a.value.toString());
    //     flag = true;
    //   }
    //   ;
    //   expect(flag).assertTrue();
    // })
    //
    // /**
    //  * @tc.number SUB_EXPORT_UNION_TEST_0700
    //  * @tc.name exportUnionTest0700
    //  * @tc.desc test Exporting all files is equivalent to passing the export
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('exportUnionTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
    //   let a:ComplexUnion = myExport1;
    //   if (a.type === 'number') {
    //     expect('50').assertEqual(a.value.toString());
    //     flag = true;
    //   }
    //   ;
    //   expect(flag).assertTrue();
    // })
    //
    // /**
    //  * @tc.number SUB_EXPORT_UNION_TEST_0800
    //  * @tc.name exportUnionTest0800
    //  * @tc.desc test Export file aliases
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('exportUnionTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
    //   let a:ComplexUnion = aaExport2;
    //   if (a.myExport1.type === 'number') {
    //     expect('50').assertEqual(a.myExport1.value.toString());
    //     flag = true;
    //   }
    //   ;
    //   expect(flag).assertTrue();
    // })
    /**
     * @tc.number SUB_EXPORT_UNION_TEST_0900
     * @tc.name exportUnionTest0900
     * @tc.desc test Type export
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportUnionTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let a: myUnionType = Math.random() < 0.5 ? 42.0 : 'Hello, World!';
      if (typeof a === 'number') {
        expect('42').assertEqual(a.toString());
        flag = true;
      } else if (typeof a === 'string') {
        flag = true;
        expect('Hello, World!').assertEqual(a.toString());
      }
      ;
      expect(flag).assertTrue();
    })
  })
}