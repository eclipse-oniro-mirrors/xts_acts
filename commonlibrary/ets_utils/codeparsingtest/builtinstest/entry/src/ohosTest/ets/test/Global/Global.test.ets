/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import util from '@ohos.util';
import worker, { MessageEvents } from '@ohos.worker';
import {
  ArrayList,
  buffer,
  Deque,
  HashMap,
  HashSet,
  JSON,
  LightWeightMap,
  LightWeightSet,
  LinkedList,
  List,
  PlainArray,
  Queue,
  Stack,
  TreeMap,
  TreeSet,
  uri,
  url
} from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function globalTest() {
  describe('globalTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0100
     * @tc.name       : test_Global_test_001
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURI(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
        expect(result)
          .assertEqual("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~")
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0200
     * @tc.name       : test_Global_test_002
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURI("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        expect(result)
          .assertEqual("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~")
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0300
     * @tc.name       : test_Global_test_003
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURI("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
        expect(result).assertEqual("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb")
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0400
     * @tc.name       : test_Global_test_004
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURI("💇 === \ud83d\udc87");
        expect(result).assertEqual("%F0%9F%92%87%20===%20%F0%9F%92%87")
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0500
     * @tc.name       : test_Global_test_005
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURI("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
        expect(result).assertEqual(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0600
     * @tc.name       : test_Global_test_006
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURI("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
        expect(result).assertEqual("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0700
     * @tc.name       : test_Global_test_007
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURI("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
        expect(result).assertEqual("\\\\b\\0\\💇\\开$\\v\\t\\r\\n\\f\\b");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0800
     * @tc.name       : test_Global_test_008
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURI("%F0%9F%92%87%20===%20%F0%9F%92%87");
        expect(result).assertEqual("💇 === \ud83d\udc87");
      } catch (e) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_0900
     * @tc.name       : test_Global_test_009
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURIComponent(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
        expect(result)
          .assertEqual("%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F" +
            "%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1000
     * @tc.name       : test_Global_test_010
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURIComponent("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        expect(result)
          .assertEqual("!!%22%22%23%23%24%24%25%25%26%26''(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%" +
            "5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1100
     * @tc.name       : test_Global_test_011
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURIComponent("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
        expect(result).assertEqual("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1200
     * @tc.name       : test_Global_test_012
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURIComponent("💇 === \ud83d\udc87");
        expect(result).assertEqual("%F0%9F%92%87%20%3D%3D%3D%20%F0%9F%92%87");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1300
     * @tc.name       : test_Global_test_013
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURIComponent("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
        expect(result).assertEqual(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1400
     * @tc.name       : test_Global_test_014
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURIComponent("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
        expect(result).assertEqual("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1500
     * @tc.name       : test_Global_test_015
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURIComponent("%F0%9F%92%87%20===%20%F0%9F%92%87");
        expect(result).assertEqual("💇 === \ud83d\udc87");
      } catch (e) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1600
     * @tc.name       : test_Global_test_016
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURIComponent("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
        expect(result).assertEqual("\\\\b\\0\\💇\\开$\\v\\t\\r\\n\\f\\b");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1700
     * @tc.name       : test_Global_test_017
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result =
          decodeURIComponent("%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
        expect(result)
          .assertEqual(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
            "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1800
     * @tc.name       : test_Global_test_018
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = decodeURIComponent("!!%22%22%23%23%24%24%25%25%26%26''(())**%2B%2B%2C%2C--..%2F%2F%3A%3A" +
          "%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%" +
          "60%7B%7B%7C%7C%7D%7D~~");
        expect(result)
          .assertEqual("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_1900
     * @tc.name       : test_Global_test_019
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = decodeURIComponent("%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
        expect(result).assertEqual("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2000
     * @tc.name       : test_Global_test_020
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = decodeURIComponent("%F0%9F%92%87%20%3D%3D%3D%20%F0%9F%92%87");
        expect(result).assertEqual("💇 === \ud83d\udc87");
      } catch (err) {
        expect().assertFail()
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2100
     * @tc.name       : test_Global_test_021
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = escape(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
        expect(result).assertEqual("%20%21%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A" +
          "%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2200
     * @tc.name       : test_Global_test_022
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = escape("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        expect(result).assertEqual("%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%29%29**++%2C%2C--." +
          ".//%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2300
     * @tc.name       : test_Global_test_023
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = escape("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
        expect(result).assertEqual("%5C%5Cb%5C0%5C%uD83D%uDC87%5C%u5F00%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2400
     * @tc.name       : test_Global_test_024
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = escape("💇 === \ud83d\udc87");
        expect(result).assertEqual("%uD83D%uDC87%20%3D%3D%3D%20%uD83D%uDC87");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2500
     * @tc.name       : test_Global_test_025
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(123);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2600
     * @tc.name       : test_Global_test_026
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(3.14);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2700
     * @tc.name       : test_Global_test_027
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(456);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2800
     * @tc.name       : test_Global_test_028
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(Infinity);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_2900
     * @tc.name       : test_Global_test_029
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(-Infinity);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3000
     * @tc.name       : test_Global_test_030
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(NaN);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3100
     * @tc.name       : test_Global_test_031
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(Number.EPSILON);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3200
     * @tc.name       : test_Global_test_032
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(Number.MAX_VALUE);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3300
     * @tc.name       : test_Global_test_033
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isFinite(Number.MIN_VALUE);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3400
     * @tc.name       : test_Global_test_034
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = unescape("%20%21%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A" +
          "%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E");
        expect(result).assertEqual(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
          "GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3500
     * @tc.name       : test_Global_test_035
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = unescape("%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%29%29**++%2C%2C--." +
          ".//%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E");
        expect(result).assertEqual("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3600
     * @tc.name       : test_Global_test_036
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = unescape("%5C%5Cb%5C0%5C%uD83D%uDC87%5C%u5F00%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb");
        expect(result).assertEqual("\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3700
     * @tc.name       : test_Global_test_037
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = unescape("%uD83D%uDC87%20%3D%3D%3D%20%uD83D%uDC87");
        expect(result).assertEqual("💇 === \ud83d\udc87");
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3800
     * @tc.name       : test_Global_test_038
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(123);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_3900
     * @tc.name       : test_Global_test_039
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(-45.6);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4000
     * @tc.name       : test_Global_test_040
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(0);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4100
     * @tc.name       : test_Global_test_041
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(Infinity);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4200
     * @tc.name       : test_Global_test_042
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(-Infinity);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4300
     * @tc.name       : test_Global_test_043
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(Number.MAX_VALUE);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4400
     * @tc.name       : test_Global_test_044
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(Number.MIN_VALUE);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4500
     * @tc.name       : test_Global_test_045
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(Number.EPSILON);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4600
     * @tc.name       : test_Global_test_046
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(Number.NEGATIVE_INFINITY);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4700
     * @tc.name       : test_Global_test_047
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(Number.POSITIVE_INFINITY);
        expect(result).assertFalse();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4800
     * @tc.name       : test_Global_test_048
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(Number.NaN);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_4900
     * @tc.name       : test_Global_test_049
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = isNaN(NaN);
        expect(result).assertTrue();
      } catch (err) {
        expect().assertFail()
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_5000
     * @tc.name       : test_Global_test_050
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURI("\ud83d");
        expect(result).assertFail();
      } catch (err) {
        expect(err.message).assertContain("DecodeURI: invalid chara");
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_GLOBAL_BASE_TEST_5100
     * @tc.name       : test_Global_test_051
     * @tc.desc       : Testing the global
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_Global_test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result = encodeURIComponent("\ud83d");
        expect(result).assertFail();
      } catch (err) {
        expect(err.message).assertContain("DecodeURI: invalid chara");
      }
    })
  })
}