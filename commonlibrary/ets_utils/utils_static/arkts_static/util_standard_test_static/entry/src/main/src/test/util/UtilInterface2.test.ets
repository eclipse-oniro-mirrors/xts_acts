/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import util from '@ohos.util';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';

class Temperature implements util.ScopeType<Temperature> {
  n: number
  constructor(n: number) {
    this.n = n
  }
  compareTo(other: Temperature): boolean {
    return this.n >= other.n
  }
  compareTo(other: Object): boolean {
    return this.compareTo(other as Temperature)
  }
  toString(): string {
    return `${this.n}`
  }
}

class ChildLRUCache extends util.LRUCache<number, number> {
  constructor() {
    super();
  }

  createDefault(key: number): number | undefined {
    return key;
  }
}


export default function Util2Test() {
  describe('Util2Test', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.name   testUtilTest_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_001
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let num = 10.5;
      let formattedString = util.format('The number is %d', num);
      expect(formattedString).assertEqual("The number is 10.5");
    })

    /**
     * @tc.name   testUtilTest_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_002
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let formattedString = util.format('The number is');
      expect(formattedString).assertEqual("The number is");
    })
    /**
     * @tc.name   testUtilTest_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_003
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uuid = util.generateRandomUUID(true);
      expect(uuid.length).assertEqual(36);
    })

    /**
     * @tc.name   testUtilTest_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_004
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uuid = util.generateRandomUUID();
      expect(uuid.length).assertEqual(36);
    })

    /**
     * @tc.name   testUtilTest_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_005
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(util.Type.BASIC).assertEqual(0);
      expect(util.Type.MIME).assertEqual(1);
      expect(util.Type.BASIC_URL_SAFE).assertEqual(2);
      expect(util.Type.MIME_URL_SAFE).assertEqual(3);
    })

    /**
     * @tc.name   testUtilTest_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_006
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      let result = base64Helper.encodeSync(array);
      expect(result.toString()).assertEqual("99,122,69,122");
    })

    /**
     * @tc.name   testUtilTest_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_007
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      let result = base64Helper.encodeSync(array, util.Type.BASIC);
      expect(result.toString()).assertEqual("99,122,69,122");
    })

    /**
     * @tc.name   testUtilTest_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_008
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      let result = base64Helper.encodeSync(array, util.Type.BASIC_URL_SAFE);
      expect(result.toString()).assertEqual("99,122,69,122");
    })
    /**
     * @tc.name   testUtilTest_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_009
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      try {
        let result = base64Helper.encodeSync(array, util.Type.MIME);
        let arrayResult = new Uint8Array([99, 122, 69, 122]);
        expect(result.toString()).assertEqual(arrayResult);
      } catch (e) {
        e = e as Error;
        if (e instanceof BusinessError) {
          expect(e.code).assertEqual(401)
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testUtilTest_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_010
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116,
          111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
          115,
          115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104,
          101,
          114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116, 111, 102, 116,
          104,
          101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111, 114, 116, 118, 101,
          104,
          101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101, 97, 115, 117,
          114,
          101]);
      let result = base64Helper.encodeToStringSync(array, util.Type.MIME);
      let result2 = JSON.stringify(result);
      expect(result2).assertEqual('"TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwY' +
        'XNz\\r\\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\\r\\naGVtZW5jZW9m' +
        'YW55Y2FybmFscGxlYXN1cmU=\\r\\n"');
    })

    /**
     * @tc.name   testUtilTest_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_011
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116,
          111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
          115,
          115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104,
          101,
          114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116, 111, 102, 116,
          104,
          101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111, 114, 116, 118, 101,
          104,
          101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101, 97, 115, 117,
          114,
          101]);
      let result = base64Helper.encodeToStringSync(array, util.Type.BASIC);
      expect(result).assertEqual("TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJ" +
        "vbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=");
    })

    /**
     * @tc.name   testUtilTest_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_012
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116,
          111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
          115,
          115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104,
          101,
          114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116, 111, 102, 116,
          104,
          101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111, 114, 116, 118, 101,
          104,
          101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101, 97, 115, 117,
          114,
          101]);
      let result = base64Helper.encodeToStringSync(array, util.Type.BASIC_URL_SAFE);
      expect(result)
        .assertEqual("TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJv" +
          "bW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU");
    })

    /**
     * @tc.name   testUtilTest_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_013
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116,
          111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
          115,
          115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104,
          101,
          114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116, 111, 102, 116,
          104,
          101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111, 114, 116, 118, 101,
          104,
          101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101, 97, 115, 117,
          114,
          101]);
      let result = base64Helper.encodeToStringSync(array, util.Type.MIME_URL_SAFE);
      let result2 = JSON.stringify(result);
      expect(result2).assertEqual('"TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3' +
        'VsYXJwYXNz\\r\\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aG' +
        'VzaG9ydHZl\\r\\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU\\r\\n"');
    })

    /**
     * @tc.name   testUtilTest_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_014
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116,
          111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
          115,
          115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104,
          101,
          114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116, 111, 102, 116,
          104,
          101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111, 114, 116, 118, 101,
          104,
          101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101, 97, 115, 117,
          114,
          101]);
      let result = base64Helper.encodeToStringSync(array, util.Type.MIME);
      let result2 = JSON.stringify(result);
      expect(result2).assertEqual('"TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYX' +
        'Nz\\r\\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\\r\\naGVtZW5jZW9mYW' +
        '55Y2FybmFscGxlYXN1cmU=\\r\\n"');
    })

    /**
     * @tc.name   testUtilTest_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_015
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      base64Helper.encode(array).then((val) => {
        expect(val.toString()).assertEqual("99,122,69,122");
      })
    })

    /**
     * @tc.name   testUtilTest_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_016
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      base64Helper.encode(array, util.Type.BASIC).then((val) => {
        expect(val.toString()).assertEqual("99,122,69,122");
      })
    })

    /**
     * @tc.name   testUtilTest_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_017
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      base64Helper.encode(array, util.Type.BASIC_URL_SAFE).then((val) => {
        expect(val.toString()).assertEqual("99,122,69,122");
      })
    })

    /**
     * @tc.name   testUtilTest_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_018
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      try {
        base64Helper.encode(array, util.Type.MIME).then((val) => {
          expect(val.toString()).assertEqual("99,122,69,122");
        })
      } catch (e) {
        e = e as Error;
        if (e instanceof BusinessError) {
          expect(e.code).assertEqual(401)
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testUtilTest_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_019
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116, 111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116,
          104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109,
          111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115,
          116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104,
          111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
          112, 108, 101, 97, 115, 117, 114, 101]);
      base64Helper.encodeToString(array).then((val) => {
        expect(val.toString())
          .assertEqual("TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz" +
            "aW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl" +
            "aGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=");
      })
    })

    /**
     * @tc.name   testUtilTest_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEST_020
     * @tc.desc   Util interface testcase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilTest_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116, 111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116,
          104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109,
          111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115,
          116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104,
          111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
          112, 108, 101, 97, 115, 117, 114, 101]);
      base64Helper.encodeToString(array, util.Type.BASIC).then((val) => {
        expect(val.toString())
          .assertEqual("TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz" +
            "aW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl" +
            "aGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=");
      })
    })
    /**
     * @tc.name   testUtil_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_021
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116, 111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116,
          104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109,
          111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115,
          116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104,
          111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
          112, 108, 101, 97, 115, 117, 114, 101]);
      base64Helper.encodeToString(array, util.Type.MIME).then((val) => {
        expect(val.toString())
          .assertEqual("TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\n" +
            "aW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\n" +
            "aGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n");
      })
    })

    /**
     * @tc.name   testUtil_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_022
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116, 111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116,
          104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109,
          111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115,
          116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104,
          111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
          112, 108, 101, 97, 115, 117, 114, 101]);
      base64Helper.encodeToString(array, util.Type.BASIC_URL_SAFE).then((val) => {
        expect(val.toString())
          .assertEqual("TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz" +
            "aW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl" +
            "aGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU");
      })
    })

    /**
     * @tc.name   testUtil_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_023
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116, 111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116,
          104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109,
          111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115,
          116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104,
          111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
          112, 108, 101, 97, 115, 117, 114, 101]);
      base64Helper.encodeToString(array, util.Type.MIME_URL_SAFE).then((val) => {
        expect(val.toString())
          .assertEqual("TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\n" +
            "aW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\n" +
            "aGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU\r\n");
      })
    })

    /**
     * @tc.name   testUtil_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_024
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
      base64Helper.decode(array).then((val) => {
        expect(val.toString())
          .assertEqual("77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,"+
          "98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,"+
          "115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,"+
          "117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,"+
          "101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101");
      })
    })
    /**
     * @tc.name   testUtil_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_025
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
      base64Helper.decode(array, util.Type.BASIC).then((val) => {
        expect(val.toString())
          .assertEqual("77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,"+
          "98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,"+
          "115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,"+
          "117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,"+
          "101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101");
      })
    })

    /**
     * @tc.name   testUtil_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_026
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
      base64Helper.decode(array, util.Type.MIME).then((val) => {
        expect(val.toString())
          .assertEqual("77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,"+
          "98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,"+
          "115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,"+
          "117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,"+
          "101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101");
      })
    })
    /**
     * @tc.name   testUtil_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_027
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
      base64Helper.decode(array, util.Type.BASIC_URL_SAFE).then((val) => {
        expect(val.toString())
          .assertEqual("77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,"+
          "98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,"+
          "115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,"+
          "117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,"+
          "101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101");
      })
    })
    /**
     * @tc.name   testUtil_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_028
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let base64Helper = new util.Base64Helper();
      let array =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
      base64Helper.decode(array, util.Type.MIME_URL_SAFE).then((val) => {
        expect(val.toString())
          .assertEqual("77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,"+
          "98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,"+
          "115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,"+
          "117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,"+
          "101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101");
      })
    })

    /**
     * @tc.name   testUtil_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_029
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.toString();
      expect(result.toString()).assertEqual("[30, 40]")
    })

    /**
     * @tc.name   testUtil_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_030
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let rangeFir = new util.ScopeHelper<Temperature>(tempMiDF, tempMidS);
      let result = range.intersect(rangeFir);
      expect(result.toString()).assertEqual("[35, 39]")
    })

    /**
     * @tc.name   testUtil_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_031
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.intersect(tempMiDF, tempMidS);
      expect(result.toString()).assertEqual("[35, 39]")
    })

    /**
     * @tc.name   testUtil_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_032
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.getUpper();
      expect(result.toString()).assertEqual("40");

    })

    /**
     * @tc.name   testUtil_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_033
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.getLower();
      expect(result.toString()).assertEqual("30");
    })

    /**
     * @tc.name   testUtil_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_034
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.expand(tempMiDF, tempMidS);
      expect(result.toString()).assertEqual("[30, 40]");
    })

    /**
     * @tc.name   testUtil_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_035
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let rangeFir = new util.ScopeHelper<Temperature>(tempMiDF, tempMidS);
      let result = range.expand(rangeFir);
      console.info("result = " + result);
      expect(result.toString()).assertEqual("[30, 40]");
    })

    /**
     * @tc.name   testUtil_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_036
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.expand(tempMiDF);
      expect(result.toString()).assertEqual("[30, 40]");
    })

    /**
     * @tc.name   testUtil_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_037
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.contains(tempMiDF);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testUtil_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_038
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let tempLess = new Temperature(20);
      let tempMore = new Temperature(45);
      let rangeSec = new util.ScopeHelper<Temperature>(tempLess, tempMore);
      let result = range.contains(rangeSec);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testUtil_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_039
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.ScopeHelper<Temperature>(tempLower, tempUpper);
      let result = range.clamp(tempMiDF);
      expect(result.toString()).assertEqual("35");
    })

    /**
     * @tc.name   testUtil_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_040
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(1, 8);
      let result = pro.length;
      expect(result).assertEqual(2);
    })
    /**
     * @tc.name   testUtil_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_041
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(1, 8);
      let result = pro.length;
      pro.updateCapacity(100);
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   testUtil_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_042
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.get(2);
      pro.get(3);
      expect(pro.toString()).assertEqual("LRUCache[ maxSize = 64, hits = 1, misses = 1, hitRate = 50% ]");
    })

    /**
     * @tc.name   testUtil_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_043
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.get(2);
      pro.get(7);
      let result = pro.getCapacity();
      expect(result).assertEqual(64);
    })

    /**
     * @tc.name   testUtil_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_044
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      let result = pro.getCapacity();
      expect(result).assertEqual(64);
    })

    /**
     * @tc.name   testUtil_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_045
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.length;
      pro.clear();
      let res = pro.length;
      expect(result).assertEqual(1);
      expect(res).assertEqual(0);
    })

    /**
     * @tc.name   testUtil_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_046
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lru = new ChildLRUCache();
      lru.put(2, 10);
      lru.get(3);
      lru.get(5);
      let res = lru.getCreateCount();
      expect(res).assertEqual(2);
    })

    /**
     * @tc.name   testUtil_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_047
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.get(2);
      let result = pro.getMissCount();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testUtil_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_048
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.updateCapacity(2);
      pro.put(50, 22);
      let result = pro.getRemovalCount();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testUtil_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_049
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.get(2);
      let result = pro.getMatchCount();
      expect(result).assertEqual(1);
    })

    /**
     * @tc.name   testUtil_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_050
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.getPutCount();
      expect(result).assertEqual(1);
    })

    /**
     * @tc.name   testUtil_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_051
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.isEmpty();
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testUtil_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_052
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.get(2);
      expect(result).assertEqual(10);
    })

    /**
     * @tc.name   testUtil_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_053
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.get(100);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   testUtil_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_054
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      let result = pro.put(2, 10);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   testUtil_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_055
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number | string, number | string>();
      pro.put(2, 10);
      pro.put(2, "anhu");
      pro.put("afaf", "grfb");
      let result = pro.values();
      expect(result.toString()).assertEqual("anhu,grfb");
    })

    /**
     * @tc.name   testUtil_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_056
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(3, 1);
      let result = pro.keys();
      expect(result.toString()).assertEqual("2,3");
    })

    /**
     * @tc.name   testUtil_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_057
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.remove(20);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   testUtil_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_058
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let that = new util.LRUCache<number, number>(21);
      let res: number = that.getCapacity();
      expect(res).assertEqual(21);
    })

    /**
     * @tc.name   testUtil_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_059
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result = pro.contains(2);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testUtil_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_060
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      let result = pro.createDefault(50);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   testUtil_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_061
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      let res = "";
      pro.put(2, 10);
      let pair = pro.entries();
      for (let value of pair) {
        res = value[0]+ ', '+ value[1];
      }
      expect(res).assertEqual("2, 10");
    })

    /**
     * @tc.name   testUtil_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_062
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      let res = "";
      pro.put(2, 10);
      pro.put(3, 15);
      let pair = pro.entries();
      for (let value of pair) {
        res = value[0]+ ', '+ value[1];
      }
      expect(res).assertEqual("3, 15");
    })

    /**
     * @tc.name   testUtil_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_063
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pro = new util.LRUCache<number, number>();
      let res = "";
      pro.put(2, 10);
      pro.put(3, 15);
      let pair = pro.$_iterator();
      for (let value of pair) {
        res = value[0]+ ', '+ value[1];
      }
      expect(res).assertEqual("3, 15");
    })

    /**
     * @tc.name   testUtil_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_064
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let textDecode = util.TextDecoder.create('utf-8');
      let uint8 = new Uint8Array([0xE4, 0xBD, 0xA0]);
      let resStr = textDecode.decodeToString(uint8, {});
      let res = '你';
      expect(resStr).assertEqual(res);
    })

    /**
     * @tc.name   testUtil_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_065
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let textDecoderOptions : util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : true
      };
      let textDecode = util.TextDecoder.create('utf-8', textDecoderOptions);
      let retStr = textDecode.encoding;
      expect(retStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   testUtil_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_066
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:false});
      let uint8 = new Uint8Array();
      let resStr = textDecoder.decodeToString(uint8);
      let res = '';
      expect(resStr).assertEqual(res);
    })

    /**
     * @tc.name   testUtil_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_067
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc = new util.TextEncoder()
      let buffer = new ArrayBuffer(10)
      let typedArray = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = enc.encodeIntoUint8Array('@1h-+=&^', typedArray);
      const encc = new util.TextEncoder('utf-8');
      let str = '@1h-+=&^';
      const bytes = encc.encodeInto(str);
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(8);
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(8);
      for (let i = 0; i < bytes.length; i++) {
        expect(bytes[i]).assertEqual(typedArray[i]);
      }
    })

    /**
     * @tc.name   testUtil_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_068
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc = new util.TextEncoder('utf-16be');
      let buffer = new ArrayBuffer(20);
      let typedArray = new Uint8Array(buffer);
      let encodeIntoUint8ArrayInfo = enc.encodeIntoUint8Array('abcdefg', typedArray);
      const encc = new util.TextEncoder('utf-16be');
      let str = 'abcdefg';
      const bytes = encc.encodeInto(str);
      for (let i = 0; i < bytes.length; i++) {
        expect(bytes[i]).assertEqual(typedArray[i]);
      }
    })

    /**
     * @tc.name   testUtil_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_069
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let textDecoderOptions : util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : false
      };
      let decodeWithStreamOptions : util.DecodeToStringOptions = {
        stream: false
      };
      let textDecode = util.TextDecoder.create('utf-16le', textDecoderOptions);
      let arr = new Uint8Array(8);
      arr[0] = 0xFF;
      arr[1] = 0xFE;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00;
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = textDecode.decodeToString(arr, decodeWithStreamOptions);
      let BOM = '\uFEFF';
      let rel = 'abc';
      let re = BOM + rel;
      expect(retStr).assertEqual(re);
    })

    /**
     * @tc.name   testUtil_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_070
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc = new util.TextEncoder('utf-16le');
      let str = enc.encoding;
      expect(str).assertEqual('utf-16le');
      enc = new util.TextEncoder('Utf-16le');
      str = enc.encoding;
      expect(str).assertEqual('Utf-16le');
    })

    /**
     * @tc.name   testUtil_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_071
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc = new util.TextEncoder()
      let buffer = new ArrayBuffer(10)
      let typedArray = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = enc.encodeIntoUint8Array('@1h-+=&^', typedArray);

      const encc = new util.TextEncoder('utf-8');
      let str = '@1h-+=&^';
      const bytes = encc.encodeInto(str);
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(8);
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(8);
      for (let i = 0; i < bytes.length; i++) {
        expect(bytes[i]).assertEqual(typedArray[i]);
      }
    })

    /**
     * @tc.name   testUtil_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_072
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc = new util.TextEncoder('ISO-8859-3');
      let str = enc.encoding;
      expect(str).assertEqual('ISO-8859-3');
      enc = new util.TextEncoder('IBM866');
      str = enc.encoding;
      expect(str).assertEqual('IBM866');
    })

    /**
     * @tc.name   testUtil_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_073
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
      expect(rationalNumber.valueOf()).assertEqual(0.5);
    })

    /**
     * @tc.name   testUtil_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_074
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rational = util.RationalNumber.createRationalFromString("3/4");
      expect(rational.valueOf()).assertEqual(0.75);
    })

    /**
     * @tc.name   testUtil_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_075
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
      let rational = util.RationalNumber.createRationalFromString("3/4");
      let result = rationalNumber.compare(rational);
      expect(result).assertEqual(-1);
    })

    /**
     * @tc.name   testUtil_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_076
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(10,2);
      let result = rationalNumber.valueOf();
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   testUtil_077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_077
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result = util.RationalNumber.getCommonFactor(4,6);
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   testUtil_078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_078
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
      let result = rationalNumber.getNumerator();
      expect(result).assertEqual(1);
    })

    /**
     * @tc.name   testUtil_079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_079
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2)
      let result = rationalNumber.getDenominator();
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   testUtil_080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_080
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
      let result = rationalNumber.isZero();
      expect(result).assertEqual(false);
    })
    /**
     * @tc.name   testUtil_081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_081
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
      let result = rationalNumber.isNaN();
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testUtil_082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_082
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
      let result = rationalNumber.isFinite();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testUtil_083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_083
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1,2);
      let result = rationalNumber.toString();
      expect(result).assertEqual("1/2");
    })

    /**
     * @tc.name   testUtil_084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL_084
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let type = new util.types();
      const set : Set<number> = new Set<number>();
      let result = type.isSetIterator(set.keys());
      expect(result).assertEqual(true);
    })
  });
}
