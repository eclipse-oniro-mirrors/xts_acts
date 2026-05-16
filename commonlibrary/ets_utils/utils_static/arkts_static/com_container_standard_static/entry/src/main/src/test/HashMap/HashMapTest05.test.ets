
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index'
import { buffer, HashMap,util } from '@kit.ArkTS';

interface MapPropertyTestObject {
  map: Map<string, string>;
}

class ParsedType {
  a: number = 0;
}

interface SetPropertyTestObject {
  setData: Set<number>;
}

interface PromisePropertyTestObject {
  promise: Promise<string>;
}

interface RegExpPropertyTestObject {
  regex: RegExp;
  flags: RegExp;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function HashMapTest05Test(): void {
  describe('hashMapTest05Test', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0100
     * @tc.name      testHashMap0356
     * @tc.desc      Check the integrity of the key-value pairs, or Map objects, stored in the Map collection
     *               (nested structure/iteration order) in the HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0356", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0356';
      console.log(TAG + ' start');
      const testObj: MapPropertyTestObject = {
        map: new Map<string, string>([
          ['key1', 'value1'],
          ['key2', '{"a":1}']
        ])
      };
      const hashMap = new HashMap<string, MapPropertyTestObject>();
      hashMap.set("mapPropObjKey", testObj);
      const getTestObj = hashMap.get("mapPropObjKey");
      expect(getTestObj!=null).assertTrue();
      expect(getTestObj?.map instanceof Map).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0200
     * @tc.name      testHashMap0357
     * @tc.desc      Check the JSON nested structure processing in the key-value pairs of the Map collection
     *               (nested structure/iteration order) stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0357", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0357';
      console.log(TAG + ' start');
      const testObj: MapPropertyTestObject = {
        map: new Map<string, string>([
          ['key1', 'value1'],
          ['key2', '{"a":1}']
        ])
      };
      const hashMap = new HashMap<string, MapPropertyTestObject>();
      hashMap.set("mapPropObjKey", testObj);
      const getTestObj = hashMap.get("mapPropObjKey");

      let key2Value = '';
      if (getTestObj && getTestObj.map) {
        const tempValue = getTestObj.map.get('key2');
        if (tempValue) {
          key2Value = tempValue;
        }
      }
      const parsedValue = JSON.parse<ParsedType>(key2Value, Type.from<ParsedType>())!;
      expect(getTestObj?.map.get('key1')).assertEqual('value1');
      expect(parsedValue.a).assertEqual(1);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0300
     * @tc.name      testHashMap0358
     * @tc.desc      Check the synchronization of nested data modifications in the key-value pairs of the
     * Map collection (nested structure/iteration order) stored in the HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0358", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0358';
      console.log(TAG + ' start');

      const testObj: MapPropertyTestObject = {
        map: new Map<string, string>([
          ['key1', 'value1'],
          ['key2', '{"a":1}']
        ])
      };
      const hashMap = new HashMap<string, MapPropertyTestObject>();
      hashMap.set("mapPropObjKey", testObj);
      const getTestObj = hashMap.get("mapPropObjKey");

      let key2Value = '';
      if (getTestObj && getTestObj.map) {
        const tempValue = getTestObj.map.get('key2');
        if (tempValue) {
          key2Value = tempValue;
        }
      }
      const parsedValue = JSON.parse<ParsedType>(key2Value, Type.from<ParsedType>())!;
      parsedValue.a = 999;
      const updatedJsonStr = JSON.stringify(parsedValue);
      testObj.map.set('key2', updatedJsonStr);
      let updatedKey2Value = '';
      if (getTestObj && getTestObj.map) {
        const temp = getTestObj.map.get('key2');
        if (temp) {
          updatedKey2Value = temp;
        }
      }
      const updatedParsedValue = JSON.parse<ParsedType>(updatedKey2Value, Type.from<ParsedType>())!;
      expect(updatedParsedValue.a).assertEqual(999);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0400
     * @tc.name      testHashMap0359
     * @tc.desc      Check the iteration order of key-value pairs in the Map collection
     *               (nested structure/iteration order) stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0359", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0359';
      console.log(TAG + ' start');

      const testObj: MapPropertyTestObject = {
        map: new Map<string, string>([
          ['key1', 'value1'],
          ['key2', '{"a":1}']
        ])
      };
      const hashMap = new HashMap<string, MapPropertyTestObject>();
      hashMap.set("mapPropObjKey", testObj);
      const getTestObj = hashMap.get("mapPropObjKey");

      const entryList: string[] = [];
      if (getTestObj && getTestObj.map) {
        for (const key of getTestObj.map.keys()) {
          entryList.push(key);
        }
      }
      expect(entryList[0]).assertEqual('key1');
      expect(entryList[1]).assertEqual('key2');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0500
     * @tc.name      testHashMap0360
     * @tc.desc      Check the synchronization of operations on the Map collection stored in the HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0360';
      console.log(TAG + ' start');

      const testObj: MapPropertyTestObject = {
        map: new Map<string, string>([
          ['key1', 'value1'],
          ['key2', '{"a":1}']
        ])
      };
      const hashMap = new HashMap<string, MapPropertyTestObject>();
      hashMap.set("mapPropObjKey", testObj);
      const getTestObj = hashMap.get("mapPropObjKey");

      testObj.map.set('key3', 'value3');
      expect(getTestObj?.map.has('key3')).assertTrue();
      expect(getTestObj?.map.size).assertEqual(3);

      testObj.map.delete('key1');
      expect(getTestObj?.map.has('key1')).assertFalse();
      expect(getTestObj?.map.size).assertEqual(2);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0600
     * @tc.name      testHashMap0361
     * @tc.desc      Verify the integrity of the Set object stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0361", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0361';
      console.log(TAG + ' start');

      const testObj: SetPropertyTestObject = {
        setData: new Set<number>([1, 2, 3, 2, 1])
      };
      const hashMap = new HashMap<string, SetPropertyTestObject>();
      hashMap.set("setPropObjKey", testObj);
      const getTestObj = hashMap.get("setPropObjKey");

      expect(getTestObj!=null).assertTrue();
      expect(getTestObj?.setData instanceof Set).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0700
     * @tc.name      testHashMap0362
     * @tc.desc      Verify that Set objects stored in HashMap are automatically deduplicated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0362", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0362';
      console.log(TAG + ' start');

      const testObj: SetPropertyTestObject = {
        setData: new Set<number>([1, 2, 3, 2, 1])
      };
      const hashMap = new HashMap<string, SetPropertyTestObject>();
      hashMap.set("setPropObjKey", testObj);
      const getTestObj = hashMap.get("setPropObjKey");
      expect(getTestObj?.setData.size).assertEqual(3);
      expect(getTestObj?.setData.has(1)).assertTrue();
      expect(getTestObj?.setData.has(2)).assertTrue();
      expect(getTestObj?.setData.has(3)).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0800
     * @tc.name      testHashMap0363
     * @tc.desc      Verify the iteration order of Set objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0363", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0363';
      console.log(TAG + ' start');

      const testObj: SetPropertyTestObject = {
        setData: new Set<number>([1, 2, 3, 2, 1])
      };
      const hashMap = new HashMap<string, SetPropertyTestObject>();
      hashMap.set("setPropObjKey", testObj);
      const getTestObj = hashMap.get("setPropObjKey");
      const iteratedValues: number[] = [];
      if (getTestObj && getTestObj.setData) {
        for (const value of getTestObj.setData) {
          iteratedValues.push(value);
        }
      }
      expect(iteratedValues.length).assertEqual(3);
      expect(iteratedValues[0]).assertEqual(1);
      expect(iteratedValues[1]).assertEqual(2);
      expect(iteratedValues[2]).assertEqual(3);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_0900
     * @tc.name      testHashMap0364
     * @tc.desc      Verify the synchronization of operations on Set objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0364", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0364';
      console.log(TAG + ' start');

      const testObj: SetPropertyTestObject = {
        setData: new Set<number>([1, 2, 3, 2, 1])
      };
      const hashMap = new HashMap<string, SetPropertyTestObject>();
      hashMap.set("setPropObjKey", testObj);
      const getTestObj = hashMap.get("setPropObjKey");
      testObj.setData.add(4);
      expect(getTestObj?.setData.has(4)).assertTrue();
      expect(getTestObj?.setData.size).assertEqual(4);
      testObj.setData.add(2);
      expect(getTestObj?.setData.size).assertEqual(4);
      testObj.setData.delete(1);
      expect(getTestObj?.setData.has(1)).assertFalse();
      expect(getTestObj?.setData.size).assertEqual(3);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1000
     * @tc.name      testHashMap0365
     * @tc.desc      Verify the synchronization of the clearing operation of Set objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0365", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0365';
      console.log(TAG + ' start');

      const testObj: SetPropertyTestObject = {
        setData: new Set<number>([1, 2, 3, 2, 1])
      };
      const hashMap = new HashMap<string, SetPropertyTestObject>();
      hashMap.set("setPropObjKey", testObj);
      const getTestObj = hashMap.get("setPropObjKey");
      testObj.setData.clear();
      expect(getTestObj?.setData.size).assertEqual(0);
      expect(getTestObj?.setData.has(2)).assertFalse();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1100
     * @tc.name      testHashMap0366
     * @tc.desc      Check the integrity of Promise objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0366", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0366';
      console.log(TAG + ' start');

      const testObj: PromisePropertyTestObject = {
        promise: new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('done');
          }, 100);
        })
      };

      const hashMap = new HashMap<string, PromisePropertyTestObject>();
      hashMap.set("promisePropObjKey", testObj);
      const getTestObj = hashMap.get("promisePropObjKey");
      expect(getTestObj!=null).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1200
     * @tc.name      testHashMap0367
     * @tc.desc      Check the Promise thenable handling and asynchronous status stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0367", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0367';
      console.log(TAG + ' start');
      const testObj: PromisePropertyTestObject = {
        promise: new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('done');
          }, 100);
        })
      };

      const hashMap = new HashMap<string, PromisePropertyTestObject>();
      hashMap.set("promisePropObjKey", testObj);
      const getTestObj = hashMap.get("promisePropObjKey");
      getTestObj?.promise.then((value: string) => {
        expect(value).assertEqual('done');
      });
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1300
     * @tc.name      testHashMap0368
     * @tc.desc      Check the consistency of Promise object references stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0368", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0368';
      console.log(TAG + ' start');
      const testObj: PromisePropertyTestObject = {
        promise: new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('done');
          }, 100);
        })
      };
      const hashMap = new HashMap<string, PromisePropertyTestObject>();
      hashMap.set("promisePropObjKey", testObj);
      const getTestObj = hashMap.get("promisePropObjKey");
      expect(getTestObj?.promise === testObj.promise).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1400
     * @tc.name      testHashMap0369
     * @tc.desc      Check the asynchronous processing of reconstructing Promises within the Promise
     *               objects stored in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0369", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0369';
      console.log(TAG + ' start');
      const testObj: PromisePropertyTestObject = {
        promise: new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('done');
          }, 100);
        })
      };
      const hashMap = new HashMap<string, PromisePropertyTestObject>();
      hashMap.set("promisePropObjKey", testObj);
      const getTestObj = hashMap.get("promisePropObjKey");
      getTestObj?.promise.then((value: string) => {
        const newPromise = new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('new done');
          }, 50);
        });
        testObj.promise = newPromise;
        expect(getTestObj?.promise === newPromise).assertTrue();
        newPromise.then((newValue: string) => {
          expect(newValue).assertEqual('new done');
        });
      });
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1500
     * @tc.name      testHashMap0370
     * @tc.desc      Verify the integrity of the RegExp objects stored in the HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0370';
      console.log(TAG + ' start');

      const testObj: RegExpPropertyTestObject = {
        regex: new RegExp("abc", "gi"),
        flags: new RegExp("def", "m")
      };

      const hashMap = new HashMap<string, RegExpPropertyTestObject>();
      hashMap.set("regexPropObjKey", testObj);
      const getTestObj = hashMap.get("regexPropObjKey");
      expect(getTestObj!=null).assertTrue();
      expect(getTestObj?.regex instanceof RegExp).assertTrue();
      expect(getTestObj?.flags instanceof RegExp).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1600
     * @tc.name      testHashMap0371
     * @tc.desc      Verify that the regular expression matching pattern string stored in the RegExp object in
     *               HashMap has not been tampered with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0371", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0371';
      console.log(TAG + ' start');

      const testObj: RegExpPropertyTestObject = {
        regex: new RegExp("abc", "gi"),
        flags: new RegExp("def", "m")
      };
      const hashMap = new HashMap<string, RegExpPropertyTestObject>();
      hashMap.set("regexPropObjKey", testObj);
      const getTestObj = hashMap.get("regexPropObjKey");
      expect(getTestObj?.regex.source).assertEqual('abc');
      expect(getTestObj?.flags.source).assertEqual('def');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1700
     * @tc.name      testHashMap0373
     * @tc.desc      Verify the pattern matching capability of the RegExp object stored in the HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0373", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0373';
      console.log(TAG + ' start');

      const testObj: RegExpPropertyTestObject = {
        regex: new RegExp("abc", "gi"),
        flags: new RegExp("def", "m")
      };

      const hashMap = new HashMap<string, RegExpPropertyTestObject>();
      hashMap.set("regexPropObjKey", testObj);
      const getTestObj = hashMap.get("regexPropObjKey");
      const testStr1 = 'ABCabc123AbC';
      const matchResult1 = testStr1.match(getTestObj!.regex);
      expect(matchResult1?.length).assertEqual(3);
      expect(matchResult1?.[0]).assertEqual('ABC');
      expect(matchResult1?.[1]).assertEqual('abc');
      expect(matchResult1?.[2]).assertEqual('AbC');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1800
     * @tc.name      testHashMap0374
     * @tc.desc      Verify the consistency of references to RegExp objects stored in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0374", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0374';
      console.log(TAG + ' start');

      const testObj: RegExpPropertyTestObject = {
        regex: new RegExp("abc", "gi"),
        flags: new RegExp("def", "m")
      };

      const hashMap = new HashMap<string, RegExpPropertyTestObject>();
      hashMap.set("regexPropObjKey", testObj);
      const getTestObj = hashMap.get("regexPropObjKey");
      expect(getTestObj?.regex === testObj.regex).assertTrue();
      expect(getTestObj?.flags === testObj.flags).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTFIVE_1900
     * @tc.name      testHashMap0375
     * @tc.desc      Verify the ability to call regular expression methods on RegExp objects stored in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0375", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0375';
      console.log(TAG + ' start');

      const testObj: RegExpPropertyTestObject = {
        regex: new RegExp("abc", "gi"),
        flags: new RegExp("def", "m")
      };

      const hashMap = new HashMap<string, RegExpPropertyTestObject>();
      hashMap.set("regexPropObjKey", testObj);
      const getTestObj = hashMap.get("regexPropObjKey");
      expect(getTestObj?.regex.test('abc')).assertTrue();
      expect(getTestObj?.regex.test('xyz')).assertFalse();
      const execResult = getTestObj?.flags.exec('def123');
      expect(execResult?.[0]).assertEqual('def');

      console.log(TAG + ' end');
    });


  })
}
