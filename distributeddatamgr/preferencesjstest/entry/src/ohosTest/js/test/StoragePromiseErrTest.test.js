/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
import storage from '@ohos.data.storage';
import deviceInfo from '@ohos.deviceInfo';

const TAG = ['STORAGE_PROMISE_TEST'];
const PATH = '/data/storage/el2/database/test_storage';
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const MAX_KEY_LENGTH = 'X'.repeat(1024)
const MAX_VALUE_LENGTH = 'y'.repeat(16*1024*1024)
let mPref;
let currentDeviceIsWatch = false;

export default function storagePromiseTest() {
  describe('storagePromiseTest', function () {
    beforeAll(async function () {
      console.info('beforeAll');
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsWatch = deviceTypeInfo === 'wearable' ? true : false;
      console.info(TAG + "the value of the deviceType is : " + deviceInfo.deviceType);
    })

    afterAll(async function () {
      console.info('afterAll')
    })

    beforeEach(async function () {
      console.info('beforeEach')
      await storage.getStorage(PATH).then((Storage) => {
        mPref = Storage;
      });
    })

    afterEach(async function () {
      console.info('afterEach')
      await storage.deleteStorage(PATH).then(() => {
        console.info('Delete Storage finish');
      });
    })


    /**
     * @tc.name   testGetStoragePromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStoragePromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.getStorage("");
        console.info("testGetStoragePromiseErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetStoragePromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStoragePromiseErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.getStorage(null);
        console.info("testGetStoragePromiseErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetStoragePromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetStoragePromiseErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.getStorage(undefined);
        console.info("testGetStoragePromiseErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStoragePromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStoragePromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.deleteStorage("");
        console.info("testDeleteStoragePromiseErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStoragePromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStoragePromiseErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.deleteStorage(null);
        console.info("testDeleteStoragePromiseErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeleteStoragePromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteStoragePromiseErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.deleteStorage(undefined);
        console.info("testDeleteStoragePromiseErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCachePromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCachePromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.removeStorageFromCache("");
        console.info("testRemoveStorageFromCachePromiseErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCachePromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCachePromiseErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.removeStorageFromCache(null);
        console.info("testRemoveStorageFromCachePromiseErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testRemoveStorageFromCachePromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_0900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveStorageFromCachePromiseErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await storage.removeStorageFromCache(undefined);
        console.info("testRemoveStorageFromCachePromiseErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.get("", null);
        console.info("testGetPromiseErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetPromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPromiseErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.get(null, "defaultValue");
        console.info("testGetPromiseErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetPromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPromiseErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.get(undefined, "defaultValue");
        console.info("testGetPromiseErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetPromiseErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPromiseErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.get(KEY_TEST_STRING_ELEMENT, null);
        console.info("testGetPromiseErr0400" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testGetPromiseErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPromiseErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.get(KEY_TEST_STRING_ELEMENT, undefined);
        console.info("testGetPromiseErr0500" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutPromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.put("", null);
        console.info("testPutPromiseErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutPromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutPromiseErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.put(null, "defaultValue");
        console.info("testPutPromiseErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutPromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutPromiseErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.put(undefined, "defaultValue");
        console.info("testPutPromiseErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutPromiseErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutPromiseErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.put(KEY_TEST_STRING_ELEMENT, null);
        console.info("testPutPromiseErr0400" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testPutPromiseErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_1900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPutPromiseErr0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.put(KEY_TEST_STRING_ELEMENT, undefined);
        console.info("testPutPromiseErr0500" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeletePromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_2000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeletePromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.delete("");
        console.info("testDeletePromiseErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeletePromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_2100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeletePromiseErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.delete(undefined);
        console.info("testDeletePromiseErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testDeletePromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_2200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeletePromiseErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.delete(null);
        console.info("testDeletePromiseErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })






    /**
     * @tc.name   testHasPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_2300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasPromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.has("");
        console.info("testHasPromiseErr0100" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testHasPromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_2400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasPromiseErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.has(undefined);
        console.info("testHasPromiseErr0200" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })


    /**
     * @tc.name   testHasPromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Storage_Promise_Err_Test_2500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasPromiseErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      try {
        await mPref.has(null);
        console.info("testHasPromiseErr0300" + mPref);
        expect().assertFail();
      } catch (err){
        console.info("v fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
      }
    })
  })
}