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
const MAX_KEY_LENGTH = 'X'.repeat(1024)
const MAX_VALUE_LENGTH = 'y'.repeat(16*1024*1024)
let mPref;

export default function storagePromiseTest() {
    describe('storagePromiseTest', function () {
        beforeAll(async function () {
            console.info('beforeAll')
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
         * @tc.name testClear0011
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0400
         * @tc.desc clear promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testClear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPref.flushSync();
            await mPref.clear().then((ret) => {
                expect("defaultvalue").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testHasKey0031
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1700
         * @tc.desc has string interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPref.has(KEY_TEST_STRING_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testHasKey0032
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1500
         * @tc.desc has int interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_INT_ELEMENT, 1);
            await mPref.has(KEY_TEST_INT_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testHasKey0033
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1400
         * @tc.desc has float interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 2.0);
            await mPref.has(KEY_TEST_FLOAT_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testHasKey0034
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1600
         * @tc.desc has boolean interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            await mPref.has(KEY_TEST_BOOLEAN_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testHasKey0035
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1300
         * @tc.desc has long interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_LONG_ELEMENT, 0);
            await mPref.has(KEY_TEST_LONG_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testGetDefValue0061
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0800
         * @tc.desc get string promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetDefValue0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.get(KEY_TEST_STRING_ELEMENT, "defaultValue").then((ret) => {
                expect('defaultValue').assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testGetFloat0071
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0900
         * @tc.desc get float promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetFloat0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 3.0);
            await mPref.get(KEY_TEST_FLOAT_ELEMENT, 0.0).then((ret) => {
                expect(3.0).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testGetInt0081
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1000
         * @tc.desc get int promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetInt0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            await mPref.get(KEY_TEST_INT_ELEMENT, 0.0).then((ret) => {
                expect(3).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testGetLong0091
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1100
         * @tc.desc get long promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetLong0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync(KEY_TEST_LONG_ELEMENT, 3);
            await mPref.get(KEY_TEST_LONG_ELEMENT, 0).then((ret) => {
                expect(3).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testGetString101
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1200
         * @tc.desc get String promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetString101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPref.flushSync();
            await mPref.get(KEY_TEST_STRING_ELEMENT, "defaultvalue").then((ret) => {
                expect('test').assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testPutBoolean0121
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1900
         * @tc.desc put boolean promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutBoolean0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.put(KEY_TEST_BOOLEAN_ELEMENT, true).then(async (ret) => {
                expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
                await mPref.flushSync();
                expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testPutFloat0131
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_2000
         * @tc.desc put float promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutFloat0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.put(KEY_TEST_FLOAT_ELEMENT, 4.0).then(async (ret) => {
                expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
                await mPref.flushSync();
                expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testPutInt0141
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_2100
         * @tc.desc put int promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutInt0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.put(KEY_TEST_INT_ELEMENT, 4).then((ret) => {
                expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
                mPref.flushSync();
                expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testPutLong0151
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_2200
         * @tc.desc put long promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutLong0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync(KEY_TEST_LONG_ELEMENT, 4);
            await mPref.put(KEY_TEST_LONG_ELEMENT, 4).then(async (ret) => {
                expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
                await mPref.flushSync();
                expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testPutString0161
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_2300
         * @tc.desc put String promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutString0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            await mPref.put(KEY_TEST_STRING_ELEMENT, '').then(async (ret) => {
                expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                await mPref.flushSync();
                expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testPutString0171
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_2500
         * @tc.desc deleteSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutString0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            await mPref.put(KEY_TEST_STRING_ELEMENT, '').then(async (ret) => {
                expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "default"));
                await mPref.deleteSync(KEY_TEST_STRING_ELEMENT);
                expect("default").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "default"));
                done();
            }).catch((err) => {
                expect('').assertFail();
                done();
            });
        })

        /**
         * @tc.name testFlush00181
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0600
         * @tc.desc flush promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testFlush00181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            await mPref.put(KEY_TEST_STRING_ELEMENT, 'test').then(async (ret) => {
                expect('test').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                await mPref.flush();
                expect('test').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testMaxLengthofKey0200
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_1800
         * @tc.desc Maximum length of key test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMaxLengthofKey0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.put(MAX_KEY_LENGTH, "value1").then((ret) => {
                expect("value1").assertEqual(mPref.getSync(MAX_KEY_LENGTH, "defaultvalue"));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            })
        })

        /**
         * @tc.name testMaxLengthofValue0210
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_2400
         * @tc.desc Maximum length of value test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testMaxLengthofValue0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync("test", "abc");
            await mPref.put("test", MAX_VALUE_LENGTH).then((ret) => {
                expect(MAX_VALUE_LENGTH).assertEqual(mPref.getSync("test", "defaultvalue"));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })


        /**
         * @tc.name testMaxLengthofValue0220
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0300
         * @tc.desc Maximum length of value test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testMaxLengthofValue0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync("test", MAX_VALUE_LENGTH);
            await mPref.put("test", "y".repeat(16*1024*1024)).then((ret) => {
                expect(MAX_VALUE_LENGTH).assertEqual(mPref.getSync("test", "defaultvalue"));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testDelete0230
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0500
         * @tc.desc delete promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testDelete0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            expect("abc").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            await mPref.delete(KEY_TEST_STRING_ELEMENT).then((ret) => {
                expect("default").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "default"));
                done();
            }).catch((err) => {
                expect('').assertFail();
                done();
            });
        })

        /**
         * @tc.name testMaxLengthofKey0240
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0200
         * @tc.desc Maximum length of key test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMaxLengthofKey0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.putSync(MAX_KEY_LENGTH, "value1");
            expect("value1").assertEqual(mPref.getSync(MAX_KEY_LENGTH, "default"));
            await mPref.delete(MAX_KEY_LENGTH).then((ret) => {
                expect("default").assertEqual(mPref.getSync(MAX_KEY_LENGTH, "default"));
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testMaxLengthofValue0250
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0100
         * @tc.desc Maximum length of value test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testMaxLengthofValue0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clearSync();
            await mPref.putSync("test", MAX_VALUE_LENGTH)
            await mPref.put("test", "y".repeat(16*1024*1024)).then((ret) => {
                expect(MAX_VALUE_LENGTH).assertEqual(mPref.getSync("test", "defaultvalue"));
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
            await mPref.putSync("test", MAX_VALUE_LENGTH)
            expect(MAX_VALUE_LENGTH).assertEqual(mPref.getSync("test", "defaultvalue"));
            done();
        })

        /**
         * @tc.name testGetDefValue0260
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiPromiseTest_0700
         * @tc.desc get string promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetDefValue0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clear();
            await mPref.get(KEY_TEST_BOOLEAN_ELEMENT, true).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })
    })
}
