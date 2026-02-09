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

export default function storageSyncTest() {
    describe('storageSyncTest', function () {
        beforeAll(async function() {
            console.info('beforeAll')
        })

        afterAll(async function () {
            console.info('afterAll')
        })

        beforeEach(async function() {
            console.info('beforeEach')
            mPref = storage.getStorageSync(PATH);
        })

        afterEach(async function () {
            console.info('afterEach')
            storage.deleteStorageSync(PATH);
        })
        /**
         * @tc.name   testClear001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0100
         * @tc.desc   Clear test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            mPref.flushSync();
            mPref.clearSync();
            expect("defaultvalue").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
            expect(0).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
        })

        /**
         * @tc.name   testConstructor002
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0100
         * @tc.desc   Constructor test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            expect(typeof mPref).assertEqual("object");
        })

        /**
         * @tc.name   testHasKey003
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_2000
         * @tc.desc   put string sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHasKey003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_STRING_ELEMENT));
        })

        /**
         * @tc.name   testHasKey004
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1800
         * @tc.desc   put int sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHasKey004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.putSync(KEY_TEST_INT_ELEMENT, 1);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_INT_ELEMENT));
        })

        /**
         * @tc.name   testHasKey005
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1600
         * @tc.desc   put boolean sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHasKey005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_BOOLEAN_ELEMENT));
        })

        /**
         * @tc.name   testHasKey006
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1900
         * @tc.desc   put long sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHasKey006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 0);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_LONG_ELEMENT));
        })

        /**
         * @tc.name   testHasKey007
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1700
         * @tc.desc   put float sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHasKey007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 1.1);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_FLOAT_ELEMENT));
        })

        /**
         * @tc.name   testGetBoolean005
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1500
         * @tc.desc   put boolean sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetBoolean005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.putSync(KEY_TEST_LONG_ELEMENT, true);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_LONG_ELEMENT));
        })

        /**
         * @tc.name   testGetDefValue006
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0300
         * @tc.desc   get defaultValue sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetDefValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            expect(-1).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, -1));
            expect(1.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 1.0));
            expect(10000).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 10000));
            expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, true));
            expect('defaultValue').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue"));
        })

        /**
         * @tc.name   testGetFloat007
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0400
         * @tc.desc   put float sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetFloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 3.0);
            expect(3.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
            expect(0.0).assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, 0.0));
        })

        /**
         * @tc.name   testGetInt008
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0600
         * @tc.desc   put int sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            expect(3).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0.0));
        })

        /**
         * @tc.name   testGetLong009
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0800
         * @tc.desc   put long sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetLong009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 3);
            expect(3).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
            expect(0).assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, 0));
        })

        /**
         * @tc.name   testGetString10
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1000
         * @tc.desc   put String & int sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetString10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            mPref.flushSync();
            expect('test').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
            expect('defaultvalue').assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, "defaultvalue"));
        })

        /**
         * @tc.name   testPutBoolean012
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0200
         * @tc.desc   put boolean sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPutBoolean012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_BOOLEAN_ELEMENT, true);
            expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
            mPref.flushSync();
            expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
        })

        /**
         * @tc.name   testPutFloat013
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0500
         * @tc.desc   put float sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPutFloat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 4.0);
            expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
            mPref.flushSync();
            expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
        })

        /**
         * @tc.name   testPutInt014
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0700
         * @tc.desc   put int sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPutInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_INT_ELEMENT, 4);
            expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
            mPref.flushSync();
            expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
        })

        /**
         * @tc.name   testPutLong015
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0900
         * @tc.desc   put long sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPutLong015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 4);
            expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
            mPref.flushSync();
            expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
        })

        /**
         * @tc.name   testPutString016
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1100
         * @tc.desc   put String sync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPutString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            mPref.putSync(KEY_TEST_STRING_ELEMENT, '');
            expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
            mPref.flushSync();
            expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
        })

        /**
         * @tc.name   testRegisterObserver001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1200
         * @tc.desc   put interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRegisterObserver001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            var observer = function (key) {
                expect('abcd').assertEqual(key);
            };
            mPref.on('change', observer);
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abcd");
        })

        /**
         * @tc.name   testRegisterObserver002
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1300
         * @tc.desc   repeat on interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRegisterObserver002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            mPref.clearSync();
            var observer = function (key) {
                console.info('testRegisterObserver001 key' + key);
                expect('abc').assertEqual(key);
            };
            mPref.on('change', observer);
            mPref.on('change', observer);
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
        })

        /**
         * @tc.name   testUnRegisterObserver001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1400
         * @tc.desc   off interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testUnRegisterObserver001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            var observer = function (key) {
                console.info('testUnRegisterObserver001 key' + key);
                expect('').assertEqual(key);
            };
            mPref.on('change', observer);
            mPref.off('change', observer);
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
        })

        /**
         * @tc.name   testGetDefValue001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0600
         * @tc.desc   get defaultValue callback interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetDefValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clear();
            var ret = mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, true)
            expect(ret).assertTrue();
            done();
        })
    })}
