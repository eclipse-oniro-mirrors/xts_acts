/*
 * Copyright (c) 2026 Huawei Technology Development Co., LTD.
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
import util from '@ohos.util';

let TAG = '';

async function fn1(input: string) {
  return input;
}

async function fn2(input: string) {
  throw new Error('Test error');
}

async function fn3() {
  return 'no args result';
}

async function fn4(input: string) {
  return input;
}

function callbackFn(arg: string, cb: (err: Object | undefined, value: string) => void) {
  cb(undefined, 'success: ' + arg);
}

function callbackFn2(arg: string, cb: (err: Object, value: string | null) => void) {
  cb(new Error('Test error'), null);

}

function callbackFn3(arg1: string, cb: (err: Object | null, value: string) => void) {
  cb(null, arg1);
}

class TestLRUCache extends util.LRUCache<number, string> {
  createDefault(key: number): string {
    return 'default:' + key.toString();
  }
}

class Temperature implements util.ScopeComparable {
  private readonly _temp: number;

  constructor(value: number) {
    this._temp = value;
  }

  compareTo(value: Temperature) {
    return this._temp >= value.getTemp();
  }

  getTemp() {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  age: number;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
  age: number;
}

export default function Util3Test() {
  describe('Util3Test', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   testCallbackWrapper001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CALLBACK_WRAPPER_0100
     * @tc.desc   Test util.callbackWrapper with async function that resolves.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCallbackWrapper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testCallbackWrapper001';
      try {

        let cb = util.callbackWrapper(fn1);
        cb('hello world', (err: Object, ret: string) => {
          if (err) {
            expect().assertFail();
          } else {
            expect(ret).assertEqual('hello world');
          }

        });
      } catch (e) {
        console.error(TAG, `testCallbackWrapper001 failed, message is ${e.message}`);
        expect().assertFail();

      }
    });

    /**
     * @tc.name   testCallbackWrapper002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CALLBACK_WRAPPER_0200
     * @tc.desc   Test util.callbackWrapper with async function that rejects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCallbackWrapper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testCallbackWrapper002';
      try {

        let cb = util.callbackWrapper(fn2);
        cb('hello', (err: Object, ret: string) => {
          if (err) {
            expect(err !== null).assertTrue();
          } else {
            expect().assertFail();
          }

        });
      } catch (e) {
        console.error(TAG, `testCallbackWrapper002 failed, message is ${e.message}`);
        expect().assertFail();

      }
    });

    /**
     * @tc.name   testCallbackWrapper003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CALLBACK_WRAPPER_0300
     * @tc.desc   Test util.callbackWrapper with no-argument async function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCallbackWrapper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testCallbackWrapper003';
      try {
        let cb = util.callbackWrapper(fn3);
        cb(null, (err: Object, ret: string) => {
          if (err) {
            expect().assertFail();
          } else {
            expect(ret).assertEqual('no args result');
          }

        });
      } catch (e) {
        console.error(TAG, `testCallbackWrapper003 failed, message is ${e.message}`);
        expect().assertFail();

      }
    });

    /**
     * @tc.name   testPromisify001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0100
     * @tc.desc   Test util.promisify with callback that succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPromisify001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testPromisify001';
      const promisified = util.promisify(callbackFn);
      let result: object = promisified('{}');
      expect(JSON.stringify(result)).assertEqual('{}');


    });

    /**
     * @tc.name   testPromisify002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0200
     * @tc.desc   Test util.promisify with callback that fails.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPromisify002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      TAG = 'testPromisify002';

      const promisified = util.promisify(callbackFn2);
      try {
        await promisified('test');
        expect().assertFail();
      } catch (err) {
        expect(err !== null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testPromisify003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0300
     * @tc.desc   Test util.promisify combined with util.callbackWrapper.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPromisify003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testPromisify003';
      const addCall = util.promisify(util.callbackWrapper(fn4));
      let result: object = addCall('hello world');
      expect(JSON.stringify(result)).assertEqual('{}');

    });

    /**
     * @tc.name   testUtil004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0400
     * @tc.desc   Test printf null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res1 = util.printf(null, "hello world!");
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let res2 = util.printf(undefined, "hello world!");
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      let res3 = util.printf("", "hello world!");
      let res4 = util.printf("%s", null);
      let res5 = util.printf("%s", undefined);
      expect(res3).assertEqual("");
      expect(res4).assertEqual("null");
      expect(res5).assertEqual("undefined");
    });

    /**
     * @tc.name   testUtil005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0500
     * @tc.desc   Test format null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res1 = util.format(null, "hello world!");
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let res2 = util.format(undefined, "hello world!");
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let res3 = util.format("", "hello world!");
      let res4 = util.format("%s", null);
      try {
        let res5 = util.format("%s", undefined);
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      expect(res3).assertEqual("");
      expect(res4).assertEqual("null");
    });

    /**
     * @tc.name   testUtil006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0600
     * @tc.desc   Test parseUUID null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result1 = util.getErrorString(null);
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result2 = util.getErrorString(undefined);
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0700
     * @tc.desc   Test parseUUID null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let uuid1 = util.parseUUID("");
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(10200002);
      }
      try {
        let uuid2 = util.parseUUID(null);
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(10200002);
      }
      try {
        let uuid3 = util.parseUUID(undefined);
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(10200002);
      }
    })

    /**
     * @tc.name   testUtil008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0800
     * @tc.desc   Test decode null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let textDecoder = new util.TextDecoder("utf-8", { ignoreBOM: true });
      try {
        let retStr1 = textDecoder.decode(null, { stream: false });
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let retStr2 = textDecoder.decode(undefined, { stream: false });
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_0900
     * @tc.desc   Test decodeToString null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let textDecoderOptions: util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
      }
      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: false
      }
      let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);

      try {
        let retStr1 = textDecoder.decodeToString(null, decodeToStringOptions);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let retStr2 = textDecoder.decodeToString(undefined, decodeToStringOptions);
      expect(retStr2).assertEqual("");

    })


    /**
     * @tc.name   testUtil0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01000
     * @tc.desc   Test create null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let textEncoder1 = util.TextEncoder.create(null);
      expect(textEncoder1 != null).assertTrue();
      let textEncoder2 = util.TextEncoder.create(undefined);
      expect(textEncoder2 != null).assertTrue();
      try {
        let textEncoder3 = util.TextEncoder.create("");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01100
     * @tc.desc   Test encodeInto null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let textEncoder = new util.TextEncoder();
      let buffer = new ArrayBuffer(4);
      let uint8 = new Uint8Array(buffer);
      let result1 = textEncoder.encodeInto('', uint8);
      expect(JSON.stringify(result1)).assertEqual("{\"read\":0,\"written\":0}")
      try {
        let result2 = textEncoder.encodeInto(null, uint8);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result3 = textEncoder.encodeInto(undefined, uint8);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result4 = textEncoder.encodeInto("undefined", null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result5 = textEncoder.encodeInto("undefined", undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01200
     * @tc.desc   Test compareTo null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rationalNumber = new util.RationalNumber(1, 2);
      try {
        let result1 = rationalNumber.compareTo(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result2 = rationalNumber.compareTo(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })


    /**
     * @tc.name   testUtil0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01300
     * @tc.desc   Test getCommonDivisor null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result1 = util.RationalNumber.getCommonDivisor(null, 6);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result2 = util.RationalNumber.getCommonDivisor(undefined, 6);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result3 = util.RationalNumber.getCommonDivisor(3, null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result4 = util.RationalNumber.getCommonDivisor(3, undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })


    /**
     * @tc.name   testUtil0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01400
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new util.LRUCache<number, number>();
      try {
        pro.updateCapacity(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        pro.updateCapacity(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testUtil0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01500
     * @tc.desc   Test get null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      try {
        let result1 = pro.get(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = pro.get(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01600
     * @tc.desc   Test put null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new util.LRUCache<number | null | undefined, number | null | undefined>();
      try {
        let result1 = pro.put(null, 10);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = pro.put(undefined, 10);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      try {
        let result3 = pro.put(10, null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result4 = pro.put(20, undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01700
     * @tc.desc   Test remove null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      try {
        let result1 = pro.remove(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = pro.remove(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01800
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result1 = pro.contains(null);
      expect(result1).assertEqual(false);
      try {
        let result2 = pro.contains(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_01900
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new util.LRUCache<number, number>();
      let result1 = pro.createDefault(null);
      expect(result1).assertEqual(undefined)
      try {
        let result2 = pro.createDefault(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02000
     * @tc.desc   Test intersect null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      try {
        let result1 = range.intersect(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.intersect(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02100
     * @tc.desc   Test intersect null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      try {
        let result1 = range.intersect(null, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.intersect(undefined, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result3 = range.intersect(tempMiDF, null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result4 = range.intersect(tempMiDF, undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02200
     * @tc.desc   Test expand null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      try {
        let result1 = range.expand(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.expand(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02300
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      try {
        let result1 = range.clamp(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.clamp(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02400
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let rangeFir = new util.ScopeHelper(tempMiDF, tempMidS);
      try {
        let result1 = range.intersect(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.intersect(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02500
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      try {
        let result1 = range.expand(null, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.expand(undefined, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result3 = range.expand(tempMiDF, null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result4 = range.expand(tempMiDF, undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02600
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let tempMidS = new Temperature(39);
      let range = new util.Scope(tempLower, tempUpper);
      try {
        let result1 = range.expand(null, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.expand(undefined, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result3 = range.expand(tempMiDF, null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result4 = range.expand(tempMiDF, undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result5 = range.expand(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result6 = range.expand(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02700
     * @tc.desc   Test contains null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.Scope(tempLower, tempUpper);
      try {
        let result1 = range.contains(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.contains(401);
      } catch (err) {
        console.log('111111111: ' + err.code)
        console.log('111111111: ' + err.name)
        console.log('111111111: ' + err.message)
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02800
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.Scope(tempLower, tempUpper);
      try {
        let result1 = range.clamp(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.clamp(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_02900
     * @tc.desc   Test encodeSync null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base64 = new util.Base64();
      try {
        let result1 = base64.encodeSync(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result2 = base64.encodeSync(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03000
     * @tc.desc   Test encodeToStringSync null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base64 = new util.Base64();
      try {
        let result1 = base64.encodeToStringSync(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result2 = base64.encodeToStringSync(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03100
     * @tc.desc   Test decodeSync null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base64 = new util.Base64();
      try {
        let result1 = base64.decodeSync(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result2 = base64.decodeSync(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result3 = base64.decodeSync("");
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let result4 = base64.decodeSync("xxxx");
      expect(result4.toString()).assertEqual('199,28,113');
    })

    /**
     * @tc.name   testUtil0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03200
     * @tc.desc   Test encode null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base64 = new util.Base64();
      try {
        let res1 = base64.encode(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let res2 = base64.encode(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03300
     * @tc.desc   Test encodeToString null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base64 = new util.Base64();
      try {
        let res1 = base64.encodeToString(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let res2 = base64.encodeToString(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    })

    /**
     * @tc.name   testUtil0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03400
     * @tc.desc   Test decode null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let base64 = new util.Base64();
      let array = new Uint8Array([99, 122, 69, 122]);
      try {
        let res1 = await base64.decode(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let res2 = await base64.decode(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let res3 = await base64.decode("");
      } catch (err) {
        expect(err.code).assertEqual('-2');
      }
      try {
        let res4 = await base64.decode("aaa");
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

    })

    /**
     * @tc.name   testUtil0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03500
     * @tc.desc   Test encodeSync null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base64Helper = new util.Base64Helper();
      try {
        let result1 = base64Helper.encodeSync(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = base64Helper.encodeSync(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let array = new Uint8Array([115, 49, 51]);
      let result3 = base64Helper.encodeSync(array, util.Type.BASIC_URL_SAFE);
      expect(result3.toString()).assertEqual('99,122,69,122');
    })
    /**
     * @tc.name   testUtil0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03600
     * @tc.desc   Test decodeSync null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base64Helper = new util.Base64Helper();
      let buff = 'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2lU=\r\n';
      let result1 = base64Helper.decodeSync(buff, util.Type.BASIC_URL_SAFE);
      expect(result1.toString())
        .assertEqual("77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105")
      try {
        let result2 = base64Helper.decodeSync(null, util.Type.BASIC_URL_SAFE);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result3 = base64Helper.decodeSync(undefined, util.Type.BASIC_URL_SAFE);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result4 = base64Helper.decodeSync("", util.Type.BASIC_URL_SAFE);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let result5 = base64Helper.decodeSync("aaaaa", util.Type.MIME_URL_SAFE);
      expect(result5.toString()).assertEqual("105,166,154")
    })

    /**
     * @tc.name   testUtil0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03700
     * @tc.desc   Test encode null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      try {
        await base64Helper.encode(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await base64Helper.encode(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testUtil0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03800
     * @tc.desc   Test encodeToString null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let base64Helper = new util.Base64Helper();
      let array =
        new Uint8Array([77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110,
          111, 116, 111, 110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116,
          104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109,
          111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115,
          116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104,
          111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
          112, 108, 101, 97, 115, 117, 114, 101]);
      let result1 = await base64Helper.encodeToString(array, util.Type.MIME);
      expect(result1.length).assertEqual(194);
      try {
        let result2 = await base64Helper.encodeToString(null, util.Type.MIME);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result3 = await base64Helper.encodeToString(undefined, util.Type.MIME);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let result4 = await base64Helper.encodeToString(array, util.Type.MIME_URL_SAFE);
      expect(result4.length).assertEqual(193)
    })

    /**
     * @tc.name   testUtil0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_03900
     * @tc.desc   Test decode null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let base64Helper = new util.Base64Helper();
      let array = 'TWFuaXN0Ynl0a';
      let res1 = await base64Helper.decode(array, util.Type.MIME_URL_SAFE);
      expect(res1.toString()).assertEqual("77,97,110,105,115,116,98,121,116")
      try {
        let res2 = await base64Helper.decode(null, util.Type.MIME_URL_SAFE);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let res3 = await base64Helper.decode(undefined, util.Type.MIME_URL_SAFE);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let res4 = await base64Helper.decode("", util.Type.MIME_URL_SAFE);
      } catch (err) {
        expect(err.code).assertEqual('-2');
      }
      let res5 = await base64Helper.decode("xxx", util.Type.MIME_URL_SAFE);
      expect(res5.toLocaleString()).assertEqual("199,28");
    })

    /**
     * @tc.name   testUtil0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_04000
     * @tc.desc   Test isBoxedPrimitive null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let result1 = type.isBoxedPrimitive(null);
      expect(result1).assertFalse()
      let result2 = type.isBoxedPrimitive(undefined);
      expect(result2).assertFalse()
    })

    /**
     * @tc.name   testUtil0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_04100
     * @tc.desc   Test isNumberObject null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let result1 = type.isNumberObject(null);
      expect(result1).assertFalse()
      let result2 = type.isNumberObject(undefined);
      expect(result2).assertFalse()
    })

    /**
     * @tc.name   testUtil0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_04200
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decoder = new util.StringDecoder('utf-8');
      try {
        const decoded1 = decoder.write(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        const decoded2 = decoder.write(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      const decoded3 = decoder.write("");
      expect(decoded3).assertEqual("");
      const decoded4 = decoder.write("aa");
      expect(decoded4).assertEqual("aa");
    })

    /**
     * @tc.name   testUtil0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISIFY_04300
     * @tc.desc   Test updateCapacity null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let decoder = new util.StringDecoder('utf-8');
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const writeString = decoder.write(input.slice(0, 5));
      try {
        const endString1 = decoder.end(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        const endString2 = decoder.end(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      const endString3 = decoder.end("");
      expect(endString3).assertEqual("");
      const endString4 = decoder.end("aa");
      expect(endString4).assertEqual("aa");
    })
    /**
     * @tc.name   testUtilFormatString001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_STRING_0100
     * @tc.desc   Test util.format with %s specifier for string conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatString001';
      try {
        let name = 'John';
        let age = 20;
        let result = util.format('My name is %s and I am %s years old', name, age);
        expect(result).assertEqual('My name is John and I am 20 years old');
      } catch (e) {
        console.error(TAG, `testUtilFormatString001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatDecimal001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_DECIMAL_0100
     * @tc.desc   Test util.format with %d specifier for decimal number formatting.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatDecimal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatDecimal001';
      try {
        let num = 10.5;
        let result = util.format('The number is %d', num);
        expect(result).assertEqual('The number is 10.5');
      } catch (e) {
        console.error(TAG, `testUtilFormatDecimal001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatInteger001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_INTEGER_0100
     * @tc.desc   Test util.format with %i specifier for integer conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatInteger001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatInteger001';
      try {
        let num = 100.5;
        let result = util.format('The number is %i', num);
        expect(result).assertEqual('The number is 100');
      } catch (e) {
        console.error(TAG, `testUtilFormatInteger001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatFloat001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_FLOAT_0100
     * @tc.desc   Test util.format with %f specifier for float conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatFloat001';
      try {
        const pi = 3.141592653;
        let result = util.format('The value of pi is %f', pi);
        expect(result).assertEqual('The value of pi is 3.141592653');
      } catch (e) {
        console.error(TAG, `testUtilFormatFloat001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatJSON001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_JSON_0100
     * @tc.desc   Test util.format with %j specifier for JSON conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatJSON001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatJSON001';
      try {
        const obj: Record<string, number | string> = { "name": 'John', "age": 20 };
        let result = util.format('The object is %j', obj);
        expect(result).assertEqual('The object is {"name":"John","age":20}');
      } catch (e) {
        console.error(TAG, `testUtilFormatJSON001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatObject001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_OBJECT_0100
     * @tc.desc   Test util.format with %O specifier for object formatting.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatObject001';
      try {
        const obj: GeneratedObjectLiteralInterface_1 = { name: 'John', age: 20 };
        let result = util.format('Object: %O', obj);
        expect(result).assertEqual('Object: { name: \'John\',\n' +
          '  age: 20 }');
      } catch (e) {
        console.error(TAG, `testUtilFormatObject001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatObject002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_OBJECT_0200
     * @tc.desc   Test util.format with %o specifier for object formatting.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatObject002';
      try {
        const obj: GeneratedObjectLiteralInterface_2 = { name: 'John', age: 20 };
        let result = util.format('Object: %o', obj);
        expect(result).assertEqual("Object: { name: 'John',\n" +
          "  age: 20 }");
      } catch (e) {
        console.error(TAG, `testUtilFormatObject002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatPercent001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_PERCENT_0100
     * @tc.desc   Test util.format with %% specifier for percent escape.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatPercent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatPercent001';
      try {
        const percentage = 80;
        let arg = 'homework';
        let result = util.format('John finished %d%% of the %s', percentage, arg);
        expect(result).assertEqual('John finished 80% of the homework');
      } catch (e) {
        console.error(TAG, `testUtilFormatPercent001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatNestedObject001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_NESTED_0100
     * @tc.desc   Test util.format with nested object using %O.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatNestedObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatNestedObject001';
      try {
        interface AddressType {
          city: string;
          country: string;
        }

        interface PersonType {
          name: string;
          age: number;
          address: AddressType;
        }

        const person: PersonType = {
          name: 'John',
          age: 20,
          address: {
            city: 'New York',
            country: 'USA'
          }
        };
        let result = util.format('Person: %O', person);
        expect(result).assertEqual('Person: { name: \'John\',\n' +
          '  age: 20,\n' +
          '  address:\n' +
          '  { city: \'New York\',\n' +
          '    country: \'USA\' } }');
      } catch (e) {
        console.error(TAG, `testUtilFormatNestedObject001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUtilFormatMixed001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FORMAT_MIXED_0100
     * @tc.desc   Test util.format with mixed format specifiers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilFormatMixed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUtilFormatMixed001';
      try {
        let name = 'Alice';
        let age = 25;
        let score = 95.5;
        let result = util.format('Name: %s, Age: %d, Score: %f, Percent: %d%%', name, age, score, 100);
        expect(result).assertEqual('Name: Alice, Age: 25, Score: 95.5, Percent: 100%%');
      } catch (e) {
        console.error(TAG, `testUtilFormatMixed001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheConstructor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_CONSTRUCTOR_0100
     * @tc.desc   Test LRUCache constructor with capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheConstructor001';
      try {
        let cache = new TestLRUCache(10);
        expect(cache != null).assertTrue();
        expect(cache.getCapacity()).assertEqual(10);
      } catch (e) {
        console.error(TAG, `testLRUCacheConstructor001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCachePut001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_PUT_0100
     * @tc.desc   Test LRUCache put and get operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCachePut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCachePut001';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        cache.put(2, 'value2');
        expect(cache.get(1)).assertEqual('value1');
        expect(cache.get(2)).assertEqual('value2');
      } catch (e) {
        console.error(TAG, `testLRUCachePut001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCachePut002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_PUT_0200
     * @tc.desc   Test LRUCache put with same key updates value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCachePut002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCachePut002';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        cache.put(1, 'value2');
        expect(cache.get(1)).assertEqual('value2');
      } catch (e) {
        console.error(TAG, `testLRUCachePut002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheGet001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_GET_0100
     * @tc.desc   Test LRUCache get with non-existent key returns default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheGet001';
      try {
        let cache = new TestLRUCache(10);
        let result = cache.get(999);
        expect(result).assertEqual('default:999');
      } catch (e) {
        console.error(TAG, `testLRUCacheGet001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheRemove001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_REMOVE_0100
     * @tc.desc   Test LRUCache remove operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheRemove001';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        cache.put(2, 'value2');
        cache.remove(1);
        expect(cache.get(1)).assertEqual('default:1');
        expect(cache.get(2)).assertEqual('value2');
      } catch (e) {
        console.error(TAG, `testLRUCacheRemove001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheClear001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_CLEAR_0100
     * @tc.desc   Test LRUCache clear operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheClear001';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        cache.put(2, 'value2');
        cache.clear();
        expect(cache.isEmpty()).assertTrue();
        expect(cache.get(1)).assertEqual('default:1');
      } catch (e) {
        console.error(TAG, `testLRUCacheClear001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheIsEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_IS_EMPTY_0100
     * @tc.desc   Test LRUCache isEmpty operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheIsEmpty001';
      try {
        let cache = new TestLRUCache(10);
        expect(cache.isEmpty()).assertTrue();
        cache.put(1, 'value1');
        expect(cache.isEmpty()).assertFalse();
      } catch (e) {
        console.error(TAG, `testLRUCacheIsEmpty001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheUpdateCapacity001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_CAPACITY_0100
     * @tc.desc   Test LRUCache updateCapacity operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheUpdateCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheUpdateCapacity001';
      try {
        let cache = new TestLRUCache(10);
        expect(cache.getCapacity()).assertEqual(10);
        cache.updateCapacity(20);
        expect(cache.getCapacity()).assertEqual(20);
      } catch (e) {
        console.error(TAG, `testLRUCacheUpdateCapacity001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheStats001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_STATS_0100
     * @tc.desc   Test LRUCache statistics methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheStats001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheStats001';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        cache.put(2, 'value2');
        cache.get(1);
        cache.get(3);
        expect(cache.getPutCount()).assertEqual(4);
        expect(cache.getMatchCount()).assertEqual(1);
        expect(cache.getMissCount()).assertEqual(1);
      } catch (e) {
        console.error(TAG, `testLRUCacheStats001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheKeys001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_KEYS_0100
     * @tc.desc   Test LRUCache keys iteration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheKeys001';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        cache.put(2, 'value2');
        cache.put(3, 'value3');
        let keys = cache.keys();
        let keyArray: number[] = [];
        for (let key of keys) {
          keyArray.push(key);
        }
        expect(keyArray.length).assertEqual(3);
      } catch (e) {
        console.error(TAG, `testLRUCacheKeys001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheValues001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_VALUES_0100
     * @tc.desc   Test LRUCache values iteration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheValues001';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        cache.put(2, 'value2');
        cache.put(3, 'value3');
        let values = cache.values();
        let valueArray: string[] = [];
        for (let value of values) {
          valueArray.push(value);
        }
        expect(valueArray.length).assertEqual(3);
      } catch (e) {
        console.error(TAG, `testLRUCacheValues001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheToString001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_TO_STRING_0100
     * @tc.desc   Test LRUCache toString operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheToString001';
      try {
        let cache = new TestLRUCache(10);
        cache.put(1, 'value1');
        let result = cache.toString();
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(60);
      } catch (e) {
        console.error(TAG, `testLRUCacheToString001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testLRUCacheEviction001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LRU_CACHE_EVICTION_0100
     * @tc.desc   Test LRUCache eviction policy when capacity is exceeded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheEviction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testLRUCacheEviction001';
      try {
        let cache = new TestLRUCache(3);
        cache.put(1, 'value1');
        cache.put(2, 'value2');
        cache.put(3, 'value3');
        cache.put(4, 'value4');
        expect(cache.get(1)).assertEqual('default:1');
        expect(cache.get(2)).assertEqual('default:2');
        expect(cache.get(3)).assertEqual('default:3');
        expect(cache.get(4)).assertEqual('default:4');
      } catch (e) {
        console.error(TAG, `testLRUCacheEviction001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextEncoderCreate001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_ENCODER_CREATE_0100
     * @tc.desc   Test util.TextEncoder.create with default encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEncoderCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextEncoderCreate001';
      try {
        let encoder = util.TextEncoder.create();
        expect(encoder != null).assertTrue();
      } catch (e) {
        console.error(TAG, `testTextEncoderCreate001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextEncoderCreate002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_ENCODER_CREATE_0200
     * @tc.desc   Test util.TextEncoder.create with utf-8 encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEncoderCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextEncoderCreate002';
      try {
        let encoder = util.TextEncoder.create('utf-8');
        expect(encoder != null).assertTrue();
      } catch (e) {
        console.error(TAG, `testTextEncoderCreate002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextEncoderEncodeInto001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_ENCODER_ENCODE_0100
     * @tc.desc   Test util.TextEncoder.encodeInto with simple string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEncoderEncodeInto001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextEncoderEncodeInto001';
      try {
        let encoder = util.TextEncoder.create();
        let input = 'Hello';
        let dest = new Uint8Array(10);
        let result = encoder.encodeInto(input, dest);
        expect(result.read).assertEqual(5);
        expect(result.written).assertEqual(5);
        expect(String.fromCharCode(dest[0])).assertEqual('H');
      } catch (e) {
        console.error(TAG, `testTextEncoderEncodeInto001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextEncoderEncodeInto002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_ENCODER_ENCODE_0200
     * @tc.desc   Test util.TextEncoder.encodeInto with Unicode string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEncoderEncodeInto002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextEncoderEncodeInto002';
      try {
        let encoder = util.TextEncoder.create();
        let input = '你好';
        let dest = new Uint8Array(10);
        let result = encoder.encodeInto(input, dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(6);
      } catch (e) {
        console.error(TAG, `testTextEncoderEncodeInto002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextEncoderEncodeIntoUint8Array001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_ENCODER_ENCODE_UINT8_0100
     * @tc.desc   Test util.TextEncoder.encodeIntoUint8Array with simple string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEncoderEncodeIntoUint8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextEncoderEncodeIntoUint8Array001';
      try {
        let encoder = util.TextEncoder.create();
        let input = 'Test';
        let dest = new Uint8Array(10);
        let result = encoder.encodeIntoUint8Array(input, dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(4);
      } catch (e) {
        console.error(TAG, `testTextEncoderEncodeIntoUint8Array001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextDecoderCreate001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_DECODER_CREATE_0100
     * @tc.desc   Test util.TextDecoder.create with default encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextDecoderCreate001';
      try {
        let decoder = util.TextDecoder.create();
        expect(decoder != null).assertTrue();
      } catch (e) {
        console.error(TAG, `testTextDecoderCreate001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextDecoderCreate002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_DECODER_CREATE_0200
     * @tc.desc   Test util.TextDecoder.create with utf-8 encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextDecoderCreate002';
      try {
        let decoder = util.TextDecoder.create('utf-8');
        expect(decoder != null).assertTrue();
      } catch (e) {
        console.error(TAG, `testTextDecoderCreate002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextDecoderDecodeToString001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_DECODER_DECODE_0100
     * @tc.desc   Test util.TextDecoder.decodeToString with ASCII bytes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderDecodeToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextDecoderDecodeToString001';
      try {
        let decoder = util.TextDecoder.create('utf-8');
        let input = new Uint8Array([72, 101, 108, 108, 111]);
        let result = decoder.decodeToString(input);
        expect(result).assertEqual('Hello');
      } catch (e) {
        console.error(TAG, `testTextDecoderDecodeToString001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextDecoderDecodeToString002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_DECODER_DECODE_0200
     * @tc.desc   Test util.TextDecoder.decodeToString with UTF-8 bytes (Chinese).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderDecodeToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextDecoderDecodeToString002';
      try {
        let decoder = util.TextDecoder.create('utf-8');

        let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let result = decoder.decodeToString(input);
        expect(result).assertEqual('你好');
      } catch (e) {
        console.error(TAG, `testTextDecoderDecodeToString002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextDecoderDecodeToString003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_DECODER_DECODE_0300
     * @tc.desc   Test util.TextDecoder.decodeToString with stream option.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderDecodeToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextDecoderDecodeToString003';
      try {
        let decoder = util.TextDecoder.create('utf-8');
        let input = new Uint8Array([72, 101, 108, 108, 111]);
        let result = decoder.decodeToString(input, { stream: true });
        expect(result).assertEqual('Hello');
      } catch (e) {
        console.error(TAG, `testTextDecoderDecodeToString003 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testTextEncodingRoundTrip002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TEXT_ENCODING_ROUNDTRIP_0200
     * @tc.desc   Test round-trip encoding and decoding with Unicode string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEncodingRoundTrip002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testTextEncodingRoundTrip002';
      try {
        let original = '你好世界';
        let encoder = util.TextEncoder.create();
        let dest = new Uint8Array(20);
        let encodeResult = encoder.encodeInto(original, dest);
        let decoder = util.TextDecoder.create('utf-8');
        let decoded = decoder.decodeToString(dest.subarray(0, encodeResult.written));
        expect(decoded).assertEqual(original);
      } catch (e) {
        console.error(TAG, `testTextEncodingRoundTrip002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testGenerateRandomUUID001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_GENERATE_0100
     * @tc.desc   Test util.generateRandomUUID with cache enabled (default).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGenerateRandomUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testGenerateRandomUUID001';
      try {
        let uuid = util.generateRandomUUID(true);
        expect(uuid.length).assertEqual(36);
      } catch (e) {
        console.error(TAG, `testGenerateRandomUUID001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testGenerateRandomUUID002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_GENERATE_0200
     * @tc.desc   Test util.generateRandomUUID without cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGenerateRandomUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testGenerateRandomUUID002';
      try {
        let uuid = util.generateRandomUUID(false);
        expect(uuid.length).assertEqual(36);
      } catch (e) {
        console.error(TAG, `testGenerateRandomUUID002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testGenerateRandomUUID003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_GENERATE_0300
     * @tc.desc   Test util.generateRandomUUID uniqueness.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGenerateRandomUUID003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testGenerateRandomUUID003';
      try {
        let uuid1 = util.generateRandomUUID();
        let uuid2 = util.generateRandomUUID();
        expect(uuid1).not().assertEqual(uuid2);
      } catch (e) {
        console.error(TAG, `testGenerateRandomUUID003 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testGenerateRandomBinaryUUID001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_BINARY_0100
     * @tc.desc   Test util.generateRandomBinaryUUID with cache enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGenerateRandomBinaryUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testGenerateRandomBinaryUUID001';
      try {
        let uuid = util.generateRandomBinaryUUID(true);
        expect(uuid.length).assertEqual(16);
      } catch (e) {
        console.error(TAG, `testGenerateRandomBinaryUUID001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testGenerateRandomBinaryUUID002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_BINARY_0200
     * @tc.desc   Test util.generateRandomBinaryUUID without cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGenerateRandomBinaryUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testGenerateRandomBinaryUUID002';
      try {
        let uuid = util.generateRandomBinaryUUID(false);
        expect(uuid.length).assertEqual(16);
      } catch (e) {
        console.error(TAG, `testGenerateRandomBinaryUUID002 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testGenerateRandomBinaryUUID003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_BINARY_0300
     * @tc.desc   Test util.generateRandomBinaryUUID uniqueness.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGenerateRandomBinaryUUID003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testGenerateRandomBinaryUUID003';
      try {
        let uuid1 = util.generateRandomBinaryUUID();
        let uuid2 = util.generateRandomBinaryUUID();
        let equal = true;
        for (let i = 0; i < 16; i++) {
          if (uuid1[i] !== uuid2[i]) {
            equal = false;
            break;
          }
        }
        expect(equal).assertFalse();
      } catch (e) {
        console.error(TAG, `testGenerateRandomBinaryUUID003 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseUUID001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_PARSE_0100
     * @tc.desc   Test util.parseUUID with valid UUID string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseUUID001';
      try {
        let uuidStr = '84bdf796-66cc-4655-9b89-d6218d100f9c';
        let uuid = util.parseUUID(uuidStr);
        expect(uuid.length).assertEqual(16);
      } catch (e) {
        console.error(TAG, `testParseUUID001 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseUUID002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_PARSE_0200
     * @tc.desc   Test util.parseUUID with invalid UUID string - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testParseUUID002';
      try {
        let uuidStr = 'invalid-uuid-string';
        util.parseUUID(uuidStr);
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testParseUUID002 failed, message is ${e.message}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testParseUUID003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_PARSE_0300
     * @tc.desc   Test util.parseUUID round-trip conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseUUID003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseUUID003';
      try {
        let uuidStr = util.generateRandomUUID();
        let uuidBinary = util.parseUUID(uuidStr);
        expect(uuidBinary.length).assertEqual(16);
      } catch (e) {
        console.error(TAG, `testParseUUID003 failed, message is ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseUUID004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_PARSE_0400
     * @tc.desc   Test util.parseUUID with empty string - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseUUID004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testParseUUID004';
      try {
        util.parseUUID('');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testParseUUID004 failed, message is ${e.message}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testUUIDVersion001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UUID_VERSION_0100
     * @tc.desc   Test that generated UUIDs are RFC 4122 version 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUUIDVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUUIDVersion001';
      try {
        let uuid = util.generateRandomUUID();

        expect(uuid[14]).assertEqual('4');
      } catch (e) {
        console.error(TAG, `testUUIDVersion001 failed, message is ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHash_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3532
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      try {
        let result1 = pro.get(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = pro.get(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testGetHash_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3533
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      try {
        let result1 = pro.put(null, 1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = pro.put(undefined, 1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result3 = pro.put(1, null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result4 = pro.put(1, undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetHash_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3535
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      try {
        let result1 = pro.remove(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = pro.remove(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetHash_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3536
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      let result1 = pro.createDefault(null);
      expect(result1).assertEqual(undefined);
      try {
        let result2 = pro.createDefault(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetHash_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3537
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let tempLower = new TemperatureScope(30);
      let tempUpper = new TemperatureScope(40);
      let range = new util.Scope(tempLower, tempUpper);
      try {
        let result1 = range.intersect(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.intersect(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetHash_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3538
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let tempLower = new TemperatureScope(30);
      let tempUpper = new TemperatureScope(40);
      let range = new util.Scope(tempLower, tempUpper);
      let tempMiDF = new TemperatureScope(35);
      let tempMidS = new TemperatureScope(39);
      try {
        let result1 = range.intersect(null, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.intersect(undefined, tempMidS);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result3 = range.intersect(tempMiDF, null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result4 = range.intersect(tempMiDF, undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.name   testGetHash_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3539
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let textDecoderOptions: util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
      }
      let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);
      let uint8 = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]);
      let retStr1 = textDecoder.decodeToString(uint8, null);
      expect(retStr1).assertEqual("abc");
      let retStr2 = textDecoder.decodeToString(uint8, undefined);
      expect(retStr2).assertEqual("abc");

      let tempLower = new Temperature(30);
      let tempUpper = new Temperature(40);
      let tempMiDF = new Temperature(35);
      let range = new util.ScopeHelper(tempLower, tempUpper);
      try {
        let result1 = range.contains(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result2 = range.contains(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let tempLower2 = new Temperature(30);
      let tempUpper2 = new Temperature(40);
      let range2 = new util.ScopeHelper(tempLower2, tempUpper2);
      let tempLess2 = new Temperature(20);
      let tempMore2 = new Temperature(45);
      let rangeSec2 = new util.ScopeHelper(tempLess2, tempMore2);
      try {
        let result3 = range2.contains(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        let result4 = range2.contains(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetHash_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETHASH_3540
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
      try {
        let result1 = base64Helper.encodeToStringSync(null, util.Type.MIME);
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let result2 = base64Helper.encodeToStringSync(undefined, util.Type.MIME);
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      let result3 = base64Helper.encodeToStringSync(array, util.Type.MIME_URL_SAFE);
      expect(result3.length).assertEqual(193);
    })
  })
}

class TemperatureScope implements util.ScopeComparable {
  private readonly _temp: number;

  constructor(value: number) {
    this._temp = value;
  }

  compareTo(value: Temperature) {
    return this._temp >= value.getTemp();
  }

  getTemp() {
    return this._temp;
  }

  toString(): string {
    return this._temp.toString();
  }
}