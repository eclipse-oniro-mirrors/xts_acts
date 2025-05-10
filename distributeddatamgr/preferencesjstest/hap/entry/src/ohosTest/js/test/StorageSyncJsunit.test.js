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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
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
         * @tc.name Clear test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0100
         * @tc.desc Clear test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testClear001', 0, function () {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            mPref.flushSync();
            mPref.clearSync();
            expect("defaultvalue").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
            expect(0).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
        })

        /**
         * @tc.name Constructor test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0100
         * @tc.desc Constructor test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testConstructor002', 0, function () {
            expect(typeof mPref).assertEqual("object");
        })

        /**
         * @tc.name put string sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_2000
         * @tc.desc put string sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey003', 0, function () {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_STRING_ELEMENT));
        })

        /**
         * @tc.name put int sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1800
         * @tc.desc put int sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey004', 0, function () {
            mPref.putSync(KEY_TEST_INT_ELEMENT, 1);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_INT_ELEMENT));
        })

        /**
         * @tc.name put boolean sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1600
         * @tc.desc put boolean sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey005', 0, function () {
            mPref.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_BOOLEAN_ELEMENT));
        })

        /**
         * @tc.name put long sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1900
         * @tc.desc put long sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey006', 0, function () {
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 0);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_LONG_ELEMENT));
        })

        /**
         * @tc.name put float sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1700
         * @tc.desc put float sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey007', 0, function () {
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 1.1);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_FLOAT_ELEMENT));
        })

        /**
         * @tc.name put boolean sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1500
         * @tc.desc put boolean sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetBoolean005', 0, function () {
            mPref.putSync(KEY_TEST_LONG_ELEMENT, true);
            expect(true).assertEqual(mPref.hasSync(KEY_TEST_LONG_ELEMENT));
        })

        /**
         * @tc.name get defaultValue sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0300
         * @tc.desc get defaultValue sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetDefValue006', 0, function () {
            mPref.clearSync();
            expect(-1).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, -1));
            expect(1.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 1.0));
            expect(10000).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 10000));
            expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, true));
            expect('defaultValue').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue"));
        })

        /**
         * @tc.name put float sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0400
         * @tc.desc put float sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetFloat007', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 3.0);
            expect(3.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
            expect(0.0).assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, 0.0));
        })

        /**
         * @tc.name put int sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0600
         * @tc.desc put int sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetInt008', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            expect(3).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0.0));
        })

        /**
         * @tc.name put long sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0800
         * @tc.desc put long sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetLong009', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 3);
            expect(3).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
            expect(0).assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, 0));
        })

        /**
         * @tc.name put String & int sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1000
         * @tc.desc put String & int sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetString10', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            mPref.flushSync();
            expect('test').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
            expect('defaultvalue').assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, "defaultvalue"));
        })

        /**
         * @tc.name put boolean sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0200
         * @tc.desc put boolean sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutBoolean012', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_BOOLEAN_ELEMENT, true);
            expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
            mPref.flushSync();
            expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
        })

        /**
         * @tc.name put float sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0500
         * @tc.desc put float sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutFloat013', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 4.0);
            expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
            mPref.flushSync();
            expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
        })

        /**
         * @tc.name put int sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0700
         * @tc.desc put int sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutInt014', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_INT_ELEMENT, 4);
            expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
            mPref.flushSync();
            expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
        })

        /**
         * @tc.name put long sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_0900
         * @tc.desc put long sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutLong015', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 4);
            expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
            mPref.flushSync();
            expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
        })

        /**
         * @tc.name put String sync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1100
         * @tc.desc put String sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutString016', 0, function () {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            mPref.putSync(KEY_TEST_STRING_ELEMENT, '');
            expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
            mPref.flushSync();
            expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
        })

        /**
         * @tc.name put interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1200
         * @tc.desc put interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRegisterObserver001', 0, function () {
            mPref.clearSync();
            var observer = function (key) {
                expect('abcd').assertEqual(key);
            };
            mPref.on('change', observer);
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abcd");
        })

        /**
         * @tc.name repeat on interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1300
         * @tc.desc repeat on interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRegisterObserver002', 0, function () {
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
         * @tc.name off interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiAsyncTest_1400
         * @tc.desc off interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testUnRegisterObserver001', 0, function () {
            var observer = function (key) {
                console.info('testUnRegisterObserver001 key' + key);
                expect('').assertEqual(key);
            };
            mPref.on('change', observer);
            mPref.off('change', observer);
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
        })

        /**
         * @tc.name get defaultValue callback interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0600
         * @tc.desc get defaultValue callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetDefValue001', 0, async function (done) {
            await mPref.clear();
            var ret = mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, true)
            expect(ret).assertTrue();
            done();
        })
    })}
