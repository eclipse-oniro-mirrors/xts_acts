/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { sleep } from '../testability/pages/Utils';


export default function builtinsArrayReverseTest() {
  describe('builtinsArrayReverseTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1000
     * @tc.name Builtins_Array_Reverse_Test_1000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1000'
      let array: Array<number> = [1, 2, 3];
      let revers = array.reverse()
      expect('[3,2,1]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1100
     * @tc.name Builtins_Array_Reverse_Test_1100
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1100'
      let array: Array<number> = [];
      let revers = array.reverse()
      expect('[]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1200
     * @tc.name Builtins_Array_Reverse_Test_1200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1200'
      let array: Array<number> = [1];
      let revers = array.reverse()
      expect('[1]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1300
     * @tc.name Builtins_Array_Reverse_Test_1300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1300'
      let array: Array<number | undefined> = [1, , 3];
      console.log('ssss' + JSON.stringify(array))
      let revers = array.reverse()
      console.log('ddddd' + Array.isArray(revers))
      expect('[3,null,1]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1400
     * @tc.name Builtins_Array_Reverse_Test_1400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1400'
      let array: Array<number | undefined> = [, ,];
      console.log('ssss' + JSON.stringify(array))
      let revers = array.reverse()
      console.log('ddddd' + Array.isArray(revers))
      expect('[null,null]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1500
     * @tc.name Builtins_Array_Reverse_Test_1500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1500'
      let array: Array<boolean> = [true, false];
      console.log('ssss' + JSON.stringify(array))
      let revers = array.reverse()
      console.log('ddddd' + Array.isArray(revers))
      expect('[false,true]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1600
     * @tc.name Builtins_Array_Reverse_Test_1600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1600'
      let array: Array<number | null> = [1, null, 3, 4];
      console.log('ssss' + JSON.stringify(array))
      let revers = array.reverse()
      console.log('ddddd' + JSON.stringify(revers))
      expect('[4,3,null,1]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1800
     * @tc.name Builtins_Array_Reverse_Test_1800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1800'
      let array: Array<string> = ['apple', 'banana,cherry']
      console.log('ssss' + JSON.stringify(array))
      let revers = array.reverse()
      console.log('ddddd' + JSON.stringify(revers))
      expect('["banana,cherry","apple"]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1900
     * @tc.name Builtins_Array_Reverse_Test_1900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_1900'
      let array: Array<string | undefined> = ['apple', , 'cherry']
      console.log('ssss' + JSON.stringify(array))
      let revers = array.reverse()
      console.log('ddddd' + JSON.stringify(revers))
      expect('["cherry",null,"apple"]').assertEqual(JSON.stringify(revers));
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2000
     * @tc.name Builtins_Array_Reverse_Test_2000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Builtins_Array_Reverse_Test_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const Tag: string = 'Builtins_Array_Reverse_Test_2000'
      let array: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]]
      console.log('ssss' + JSON.stringify(array))
      let revers = array.reverse()
      console.log('ddddd' + JSON.stringify(revers))
      expect('[[5,6],[3,4],[1,2]]').assertEqual(JSON.stringify(revers));
      Done();
    })
  })
}