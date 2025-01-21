/*
* Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import dataPreferences from '@ohos.data.preferences';
import featureAbility from '@ohos.ability.featureAbility';

const NAME = 'test_preferences';
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';
let mPreferences;
let context;

export default function preferencesPromiseTest(){
    describe('preferencesPromiseTest', function () {
        beforeAll(async function () {
            console.info('beforeAll')
            context = featureAbility.getContext()
        })

        afterAll(async function () {
            console.info('afterAll')
        })

        beforeEach(async function () {
            console.info('beforeEach')
            mPreferences = await dataPreferences.getPreferences(context, NAME);
        })
        
        afterEach(async function () {
            console.info('afterEach')
            await dataPreferences.deletePreferences(context, NAME);
        })

        /**
         * @tc.name put StringArray promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0800
         * @tc.desc put StringArray promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutStringArray0131', 0, async function (done) {
            await mPreferences.clear();
            var stringArr = ['1', '2', '3'];
            await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            await mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ['123', '321']).then((pre) => {
                for (let i = 0; i < stringArr.length; i++) {
                    expect(stringArr[i]).assertEqual(pre[i]);
                }
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            })
        });

        /**
         * @tc.name put NumberArray promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0700
         * @tc.desc put NumberArray promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutNumberArray0132', 0, async function (done) {
            await mPreferences.clear();
            var numberArr = [11, 22, 33, 44, 55];
            await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, numberArr);
            await mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321]).then((pre) => {
                for (let i = 0; i < numberArr.length; i++) {
                    expect(numberArr[i]).assertEqual(pre[i]);
                }
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            })
        });

        /**
         * @tc.name put BoolArray promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0600
         * @tc.desc put BoolArray promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutBoolArray0133', 0, async function (done) {
            await mPreferences.clear();
            var boolArr = [true, true, false];
            await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
            await mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [false, true]).then((pre) => {
                for (let i = 0; i < boolArr.length; i++) {
                    expect(boolArr[i]).assertEqual(pre[i]);
                }
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            })
        });

        /**
         * @tc.name getAll promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1000
         * @tc.desc getAll promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetAll0001', 0, async function (done) {
            await mPreferences.clear();
            let doubleArr = [11, 22, 33];
            let stringArr = ['11', '22', '33'];
            let boolArr = [true, false, false, true];
            await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
            await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

            await mPreferences.flush();

            await mPreferences.getAll().then((obj) => {
                expect(false).assertEqual(obj.key_test_boolean);
                expect("123").assertEqual(obj.key_test_string);
                expect(123.1).assertEqual(obj.key_test_float);
                let sArr = obj.key_test_string_array;
                for (let i = 0; i < sArr.length; i++) {
                    expect(sArr[i]).assertEqual(stringArr[i]);
                }

                let bArr = obj.key_test_bool_array;
                for (let i = 0; i < bArr.length; i++) {
                    expect(bArr[i]).assertEqual(boolArr[i]);
                }

                let nArr = obj.key_test_number_array
                for (let i = 0; i < nArr.length; i++) {
                    expect(nArr[i]).assertEqual(doubleArr[i]);
                }
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            })
        })

        /**
         * @tc.name clear promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_2100
         * @tc.desc clear promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesClear0011', 0, async function (done) {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            await mPreferences.clear().then(async (ret) => {
                let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
                expect("defaultvalue").assertEqual(per);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name has string interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0900
         * @tc.desc has string interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0031', 0, async function (done) {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.has(KEY_TEST_STRING_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name has int interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1700
         * @tc.desc has int interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0032', 0, async function (done) {
            await mPreferences.put(KEY_TEST_INT_ELEMENT, 1);
            await mPreferences.has(KEY_TEST_INT_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
            done();
        })

        /**
         * @tc.name has float interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1500
         * @tc.desc has float interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0033', 0, async function (done) {
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 2.0);
            await mPreferences.has(KEY_TEST_FLOAT_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name has boolean interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1300
         * @tc.desc has boolean interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0034', 0, async function (done) {
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
            await mPreferences.has(KEY_TEST_BOOLEAN_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name has long interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1800
         * @tc.desc has long interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0035', 0, async function (done) {
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 0);
            await mPreferences.has(KEY_TEST_LONG_ELEMENT).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });

        })

        /**
         * @tc.name get string promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1100
         * @tc.desc get string promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetDefValue0061', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultValue").then((ret) => {
                expect('defaultValue').assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name get float promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1400
         * @tc.desc get float promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetFloat0071', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
            await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0).then((ret) => {
                expect(3.0).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name get int promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1600
         * @tc.desc get int promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetInt0081', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_INT_ELEMENT, 3);
            await mPreferences.get(KEY_TEST_INT_ELEMENT, 0.0).then((ret) => {
                expect(3).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name get long promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1900
         * @tc.desc get long promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetLong0091', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 3);
            await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0).then((ret) => {
                expect(3).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name get String promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_2000
         * @tc.desc get String promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('tesPreferencesGetString101', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue").then((ret) => {
                expect('test').assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name put boolean promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0100
         * @tc.desc put boolean promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutBoolean0121', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, true);
            let per = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
            expect(true).assertEqual(per);
            await mPreferences.flush();
            let per2 = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
            expect(true).assertEqual(per2);
            done();
        })

        /**
         * @tc.name put float promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0200
         * @tc.desc put float promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutFloat0131', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 4.0);
            let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
            expect(4.0).assertEqual(per);
            await mPreferences.flush();
            let per2 = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
            expect(4.0).assertEqual(per2);
            done();
        })

        /**
         * @tc.name put int promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0300
         * @tc.desc put int promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutInt0141', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_INT_ELEMENT, 4);
            let per = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
            expect(4).assertEqual(per);
            await mPreferences.flush();
            let per2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
            expect(4).assertEqual(per2);
            done();
        })

        /**
         * @tc.name put long promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0400
         * @tc.desc put long promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutLong0151', 0, async function (done) {
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 4);
            let per = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
            expect(4).assertEqual(per);
            await mPreferences.flush();
            let per2 = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
            expect(4).assertEqual(per2);
            done();
        })

        /**
         * @tc.name put String promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_0500
         * @tc.desc put String promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutString0161', 0, async function (done) {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, '');
            let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
            expect('').assertEqual(per);
            await mPreferences.flush();
            let per2 = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
            expect('').assertEqual(per2);
            done();
        })

        /**
         * @tc.name get string promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_1200
         * @tc.desc get string promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetDefValue00162', 0, async function (done) {
            await mPreferences.clear();
            await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, true).then((ret) => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        })
    })
}