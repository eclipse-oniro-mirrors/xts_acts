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
         * @tc.name testClear0012
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0400
         * @tc.desc clear callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testClear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            mPref.flushSync();
            await mPref.clear(function (err, ret) {
                expect("defaultvalue").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                done();
            });
        })

        /**
         * @tc.name testHasKey0032
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1600
         * @tc.desc has string callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPref.has(KEY_TEST_STRING_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testHasKey0033
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1400
         * @tc.desc has int callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_INT_ELEMENT, 1);
            await mPref.has(KEY_TEST_INT_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testHasKey0034
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1300
         * @tc.desc has float callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 1.1);
            await mPref.has(KEY_TEST_FLOAT_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testHasKey0035
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1500
         * @tc.desc has long callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 0);
            await mPref.has(KEY_TEST_LONG_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testHasKey0036
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1200
         * @tc.desc has boolean callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testHasKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            await mPref.has(KEY_TEST_BOOLEAN_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testGetDefValue0062
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0700
         * @tc.desc get defaultValue callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetDefValue0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            await mPref.get(KEY_TEST_STRING_ELEMENT, "defaultValue", function (err, ret) {
                expect('defaultValue').assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testGetFloat0072
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0800
         * @tc.desc get float callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetFloat0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_FLOAT_ELEMENT, 3.0);
            await mPref.get(KEY_TEST_FLOAT_ELEMENT, 0.0, function (err, ret) {
                expect(3.0).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testGetInt0082
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0900
         * @tc.desc get int callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetInt0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_INT_ELEMENT, 3);
            await mPref.get(KEY_TEST_INT_ELEMENT, 0.0, function (err, ret) {
                expect(3).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testGetLong0092
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1000
         * @tc.desc get long callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetLong0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 3);
            expect(3).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
            await mPref.get(KEY_TEST_LONG_ELEMENT, 0, function (err, ret) {
                expect(3).assertEqual(ret);
                done();
            });
        })

        /**
         * @tc.name testGetString102
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1100
         * @tc.desc get String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetString102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            mPref.flushSync();
            await mPref.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, ret) {
                expect('test').assertEqual(ret);
                done();
            });
        })

        /**
         * @tc.name testPutBoolean0122
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1800
         * @tc.desc put boolean callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutBoolean0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            await mPref.put(KEY_TEST_BOOLEAN_ELEMENT, true, function (err, ret) {
                expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
                mPref.flushSync();
                expect(true).assertEqual(mPref.getSync(KEY_TEST_BOOLEAN_ELEMENT, false));
                done();
            });
        })

        /**
         * @tc.name testPutFloat0132
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1900
         * @tc.desc put float callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutFloat0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            await mPref.put(KEY_TEST_FLOAT_ELEMENT, 4.0, function (err, ret) {
                expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
                mPref.flushSync();
                expect(4.0).assertEqual(mPref.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0));
                done();
            });
        })

        /**
         * @tc.name testPutInt0142
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_2000
         * @tc.desc put int callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutInt0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            await mPref.put(KEY_TEST_INT_ELEMENT, 4, function (err, ret) {
                expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
                mPref.flushSync();
                expect(4).assertEqual(mPref.getSync(KEY_TEST_INT_ELEMENT, 0));
                done();
            });
        })

        /**
         * @tc.name testPutLong0152
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_2100
         * @tc.desc put long callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutLong0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            mPref.putSync(KEY_TEST_LONG_ELEMENT, 4);
            await mPref.put(KEY_TEST_LONG_ELEMENT, 4, function (err, ret) {
                expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
                mPref.flushSync();
                expect(4).assertEqual(mPref.getSync(KEY_TEST_LONG_ELEMENT, 0));
                done();
            });
        })

        /**
         * @tc.name testPutString0162
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_2200
         * @tc.desc put String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPutString0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.clearSync();
            await mPref.put(KEY_TEST_STRING_ELEMENT, '', function (err, ret) {
                expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                mPref.flushSync();
                expect('').assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue"));
                done();
            });
        })

        /**
         * @tc.name testFluesh00172
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0200
         * @tc.desc flush callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testFluesh00172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPref.flush(function (err, ret) {
                expect("test").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "default"));
                done();
            });
        })


        /**
         * @tc.name testCallback0172
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0300
         * @tc.desc flush String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testCallback0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.info("*******************testCallback0172 begin.");
            mPref.clear(function (err, val) {
                if(err){
                    console.info("*******************clear error: " + err);
                    expect(false).assertTrue();
                }
                mPref.put(KEY_TEST_STRING_ELEMENT, '', function (err, ret) {
                    if(err){
                        console.info("*******************put error: " + err);
                        expect(false).assertTrue();
                    }
                    console.info("*******************put done.");
                    mPref.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
                        if(err){
                            console.info("*******************get error: " + err);
                            expect(false).assertTrue();
                        }
                        expect('').assertEqual(pre);
                        mPref.flush(function (err, val) {
                            if(err){
                                console.info("*******************flush error: " + err);
                                expect(false).assertTrue();
                            }
                            mPref.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre2) {
                                if(err){
                                    console.info("*******************get error: " + err);
                                    expect(false).assertTrue();
                                }
                                expect('').assertEqual(pre2);
                                done();
                                console.info("*******************testCallback0172 end.");
                            })
                        });
                    })
                });
            });
        })

        /**
         * @tc.name testDelete0182
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_0500
         * @tc.desc delete callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testDelete0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPref.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            expect("abc").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            mPref.delete(KEY_TEST_STRING_ELEMENT,(err,ret)=>{
                expect("default").assertEqual(mPref.getSync(KEY_TEST_STRING_ELEMENT, "default"))
            });
            done();
        })

        /**
         * @tc.name testGetDefValue0192
         * @tc.number SUB_DistributedData_Preference_SDK_StorageJsApiCallbackTest_1700
         * @tc.desc get defaultValue callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetDefValue0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPref.clear();
            await mPref.get(KEY_TEST_BOOLEAN_ELEMENT, true, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })
    })
}
