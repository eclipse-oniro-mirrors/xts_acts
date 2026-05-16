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

export default function storageSyncErrTest() {
  describe('storageSyncErrTest', function () {
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
     * @tc.name   testGetStorageSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStorageSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.getStorageSync("");
        console.info("testGetStorageSyncErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetStorageSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStorageSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.getStorageSync(null);
        console.info("testGetStorageSyncErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetStorageSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStorageSyncErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.getStorageSync(undefined);
        console.info("testGetStorageSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStorageSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStorageSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.deleteStorageSync(undefined);
        console.info("testDeleteStorageSyncErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStorageSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStorageSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.deleteStorageSync(null);
        console.info("testDeleteStorageSyncErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStorageSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStorageSyncErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.deleteStorageSync("");
        console.info("testDeleteStorageSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCacheSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCacheSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.removeStorageFromCacheSync("");
        console.info("testDeleteStorageSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })



    /**
     * @tc.name   testRemoveStorageFromCacheSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCacheSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.removeStorageFromCacheSync(null);
        console.info("testDeleteStorageSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCacheSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_0900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCacheSyncErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        let mPref = storage.removeStorageFromCacheSync(null);
        console.info("testRemoveStorageFromCacheSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.putSync("", undefined);
        console.info("testPutSyncErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.putSync(KEY_TEST_STRING_ELEMENT, undefined);
        console.info("testPutSyncErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutSyncErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.putSync(KEY_TEST_STRING_ELEMENT, null);
        console.info("testPutSyncErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutSyncErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutSyncErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.putSync(null, "test");
        console.info("testPutSyncErr0400" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutSyncErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutSyncErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.putSync(undefined, "test");
        console.info("testPutSyncErr0500" + mPref);
        expect().assertFail();
      } catch (err) {
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


      /**
       * @tc.name   testGetSyncErr0100
       * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1500
       * @tc.desc   interface test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testGetSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        try {
          mPref.getSync("", undefined);
          console.info("testGetSyncErr0100" + mPref);
          expect().assertFail();
        } catch (err){
          console.info("v fail: " + err.message + "code: " + err.code);
          expect("401").assertEqual(err.code);
        }
      })


    /**
     * @tc.name   testGetSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.getSync(null, "test");
        console.info("testGetSyncErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetSyncErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.getSync(undefined, "test");
        console.info("testGetSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetSyncErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetSyncErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.getSync(KEY_TEST_STRING_ELEMENT, null);
        console.info("testGetSyncErr0400" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetSyncErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_1900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetSyncErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.getSync(KEY_TEST_STRING_ELEMENT, null);
        console.info("testGetSyncErr0500" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_2000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.deleteSync("");
        console.info("testDeleteSyncErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_2100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.deleteSync(null);
        console.info("testDeleteSyncErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_2200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteSyncErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.deleteSync(undefined);
        console.info("testDeleteSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testHasSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_2300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        expect(false).assertEqual(mPref.hasSync(""));
        console.info("testHasSyncErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testHasSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_2400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasSyncErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.hasSync(null);
        console.info("testHasSyncErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })

    /**
     * @tc.name   testHasSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Sync_Err_Test_2500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasSyncErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        mPref.hasSync(undefined);
        console.info("testHasSyncErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })
  })
}