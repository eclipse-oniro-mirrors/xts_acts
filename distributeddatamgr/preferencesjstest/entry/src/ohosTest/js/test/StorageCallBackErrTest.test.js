/*
* Copyright (c) 2021-2022 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import storage from '@ohos.data.storage'

const PATH = '/data/storage/el2/database/test_storage';
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
var mPref;

export default function storageCallBackTest() {
  describe('storageCallBackTest', function () {
    beforeAll(async function () {
      console.info('beforeAll')
    })

    afterAll(async function () {
      console.info('afterAll')
    })
    beforeEach(async function () {
      console.info('beforeEach')
      mPref = storage.getStorageSync(PATH);
    })

    afterEach(async function () {
      console.info('afterEach')
      storage.deleteStorageSync(PATH);
    })

    /**
     * @tc.name   testGetStorageCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStorageCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.getStorage('', function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testGetStorageCallBackTestErr0100" );
            return;
          }
        })
      } catch (err) {
        console.info("testGetStorageCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetStorageCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStorageCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.getStorage(null, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testGetStorageCallBackTestErr0200" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testGetStorageCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetStorageCallBackTestErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStorageCallBackTestErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.getStorage(undefined, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testGetStorageCallBackTestErr0300" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testGetStorageCallBackTestErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStorageCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStorageCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.deleteStorage('', function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testDeleteStorageCallBackTestErr0100" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testDeleteStorageCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStorageCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStorageCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.deleteStorage(null, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testDeleteStorageCallBackTestErr0200" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testDeleteStorageCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStorageCallBackTestErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStorageCallBackTestErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.deleteStorage(undefined, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testDeleteStorageCallBackTestErr0300" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testDeleteStorageCallBackTestErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStorageCallBackTestErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStorageCallBackTestErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.deleteStorage(undefined, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testDeleteStorageCallBackTestErr0400" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testDeleteStorageCallBackTestErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCacheCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCacheCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.removeStorageFromCache(undefined, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testRemoveStorageFromCacheCallBackTestErr0100" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testRemoveStorageFromCacheCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCacheCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_0900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCacheCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.removeStorageFromCache(undefined, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testRemoveStorageFromCacheCallBackTestErr0200" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testRemoveStorageFromCacheCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCacheCallBackTestErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCacheCallBackTestErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        data_storage.removeStorageFromCache(undefined, function (err, storage) {
          if (err) {
            console.info("Failed to get the storage. path: testRemoveStorageFromCacheCallBackTestErr0300" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testRemoveStorageFromCacheCallBackTestErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.get(undefined, "defaultValue", function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testGetCallBackTestErr0100" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testGetCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.get(null, "defaultValue", function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testGetCallBackTestErr0200" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testGetCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetCallBackTestErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCallBackTestErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.get('', "defaultValue", function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testGetCallBackTestErr0300" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testGetCallBackTestErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetCallBackTestErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCallBackTestErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.get(KEY_TEST_STRING_ELEMENT, null, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testGetCallBackTestErr0400" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testGetCallBackTestErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetCallBackTestErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCallBackTestErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.get(KEY_TEST_STRING_ELEMENT, undefined, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testGetCallBackTestErr0500" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testGetCallBackTestErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testHasCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.has('', function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testHasCallBackTestErr0100" );
            expect(ret).assertEqual(false);
            return;
          }
        })
      } catch (err) {
        console.info("testHasCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testHasCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.has(null, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testHasCallBackTestErr0200" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testHasCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testHasCallBackTestErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasCallBackTestErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.has(undefined, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testHasCallBackTestErr0300" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testHasCallBackTestErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_1900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.put(undefined, "defaultValue", function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testPutCallBackTestErr0100" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testPutCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.put(null, "defaultValue", function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testPutCallBackTestErr0200" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testPutCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutCallBackTestErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutCallBackTestErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.put('', null, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testPutCallBackTestErr0300" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testPutCallBackTestErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutCallBackTestErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutCallBackTestErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.put(KEY_TEST_STRING_ELEMENT, null, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testPutCallBackTestErr0400" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testPutCallBackTestErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutCallBackTestErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutCallBackTestErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.put(KEY_TEST_STRING_ELEMENT, undefined, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testPutCallBackTestErr0500" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testPutCallBackTestErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.delete('', function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testDeleteCallBackTestErr0100" );
            expect(ret).assertEqual(false);
            return;
          }
        })
      } catch (err) {
        console.info("testDeleteCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testDeleteCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.delete(null, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testDeleteCallBackTestErr0200" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testDeleteCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteCallBackTestErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteCallBackTestErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.delete(undefined, function (err, ret) {
          if (err) {
            console.info("Failed to get the storage. path: testDeleteCallBackTestErr0300" );
            expect().assertFail();
            return;
          }
        })
      } catch (err) {
        console.info("testDeleteCallBackTestErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testOnCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        var observer = function (key) {
          console.info("The key of " + key + " changed.");
        };
        mPref.on(null, observer);
      } catch (err){
        console.info("testOnCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testOnCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        var observer = function (key) {
          console.info("The key of " + key + " changed.");
        };
        mPref.on(undefined, observer);
      } catch (err){
        console.info("testOnCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testOffCallBackTestErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_2900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffCallBackTestErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        var observer = function (key) {
          console.info("The key of " + key + " changed.");
        };
        mPref.off(null, observer);
      } catch (err){
        console.info("testOffCallBackTestErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testOffCallBackTestErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_CallBack_Err_Test_3000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffCallBackTestErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        var observer = function (key) {
          console.info("The key of " + key + " changed.");
        };
        mPref.off(undefined, observer);
      } catch (err){
        console.info("testOffCallBackTestErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })
  })
}