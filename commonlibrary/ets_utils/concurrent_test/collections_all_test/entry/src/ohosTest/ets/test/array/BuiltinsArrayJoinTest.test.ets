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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { myNull } from '../../testability/pages/Data'
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS'

interface Keyof {
  prop: string;
}

export default function builtinsArrayJoinTest() {
  describe('BuiltinsArrayJoinTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
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
     * @tc.name   builtinsArrayJoinTest1001
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1001
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayJoinTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let joinedString = array.join('');
      expect('123').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1002
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1002
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayJoinTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let joinedString = array.join('-');
      expect('1-2-3').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1003
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1003
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, , 3]);
      let joinedString = array.join('');
      expect('13').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1004
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1004
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, , 3]);
      let joinedString = array.join('-');
      expect('1--3').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1005
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1005
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array =collections.Array.from([null, undefined, 'a']);
      let joinedString = array.join('');
      expect('a').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1006
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1006
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([NaN]);
      let joinedString = array.join('');
      expect('NaN').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1007
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1007
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let joinedString = array.join(undefined);
      expect('1,2,3').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1008
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1008
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let joinedString = array.join();
      expect('1,2,3').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1009
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1009
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let joinedString = array.join('');
      expect('123').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1010
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1010
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([]);
      let joinedString = array.join('');
      expect('').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1011
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1011
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([undefined, undefined]);
      let joinedString = array.join('');
      expect('').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1012
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1012
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let joinedString = array.join(',');
      expect('1,2,3').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1013
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1013
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from<string|number|boolean>(["apple", 123, true]);
      let joinedString = array.join(',');
      expect('apple,123,true').assertEqual(joinedString);
      Done();
    });

    /**
     * @tc.name   builtinsArrayJoinTest1014
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1014
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from(['a', 'b', 'c']);
      let joinedString = array.join('!');
      expect('a!b!c').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1015
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1015
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from(['a', 'b', 'c']);
      let joinedString = array.join(undefined);
      expect('a,b,c').assertEqual(joinedString);
      Done();
    })



    /**
     * @tc.name   builtinsArrayJoinTest1017
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1017
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from(['a', 'b', 'c']);
      let joinedString = array.join('\u{1F600}');
      expect('a😀b😀c').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsArrayJoinTest1018
     * @tc.number SUB_BUILTINS_ARRAY_JOIN_TEST_1018
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayJoinTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from(['a', 'b', 'c']);
      let joinedString = array.join('\u{1Fabc}');
      expect('a🪼b🪼c').assertEqual(joinedString);
      Done();
    })
  })
}