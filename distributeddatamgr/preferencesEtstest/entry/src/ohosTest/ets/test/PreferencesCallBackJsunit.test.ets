/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import dataPreferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";

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
let context: common.UIAbilityContext;

const TAG = '[PREFERENCES_CALLBACK_JSUNIT_TEST]'
export default function preferencesCallBackTest(){
    describe('preferencesCallBackTest', function () {
        beforeAll(async function () {
            console.info('beforeAll')
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
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
         * @tc.name testPreferencesClear0012
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_2200
         * @tc.desc clear callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         *
         */
        it('testPreferencesClear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            await mPreferences.clear(async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
                expect("defaultvalue").assertEqual(pre);
                done();
            });
        })

        /**
         * @tc.name testPreferencesHasKey0032
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1200
         * @tc.desc has string callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.has(KEY_TEST_STRING_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesHasKey0033
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1600
         * @tc.desc has int callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.put(KEY_TEST_INT_ELEMENT, 1);
            await mPreferences.has(KEY_TEST_INT_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesHasKey0034
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1500
         * @tc.desc has float callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 1.1);
            await mPreferences.has(KEY_TEST_FLOAT_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesHasKey0035
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1700
         * @tc.desc has long callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 0);
            await mPreferences.has(KEY_TEST_LONG_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesHasKey0036
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1400
         * @tc.desc has boolean callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
            await mPreferences.has(KEY_TEST_BOOLEAN_ELEMENT, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesGetDefValue0062
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_2100
         * @tc.desc get defaultValue callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetDefValue0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultValue", function (err, ret) {
                expect('defaultValue').assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesGetFloat0072
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1800
         * @tc.desc get float callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetFloat0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
            await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0, function (err, ret) {
                expect(3.0).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesGetInt0082
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1900
         * @tc.desc get int callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetInt0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_INT_ELEMENT, 3);
            await mPreferences.get(KEY_TEST_INT_ELEMENT, 0.0, function (err, ret) {
                expect(3).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesGetLong0092
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1100
         * @tc.desc get long callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetLong0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 3);
            let pref = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0)
            expect(3).assertEqual(pref);
            await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0, function (err, ret) {
                expect(3).assertEqual(ret);
                done();
            });
        })

        /**
         * @tc.name testPreferencesGetString102
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_2000
         * @tc.desc get String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetString102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, ret) {
                expect('test').assertEqual(ret);
                done();
            });
        })

        /**
         * @tc.name testPreferencesPutBoolean0122
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0300
         * @tc.desc put boolean callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutBoolean0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, true, async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
                expect(true).assertEqual(pre);
                await mPreferences.flush();
                let pre2 = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false)
                expect(true).assertEqual(pre2);
                done();
            });
        })

        /**
         * @tc.name testPreferencesPutFloat0132
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0400
         * @tc.desc put float callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutFloat0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 4.0, async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
                expect(4.0).assertEqual(pre);
                await mPreferences.flush();
                let pre2 = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
                expect(4.0).assertEqual(pre2);
                done();
            });
        })

        /**
         * @tc.name testPreferencesPutInt0142
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0500
         * @tc.desc put int callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutInt0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_INT_ELEMENT, 4, async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
                expect(4).assertEqual(pre);
                await mPreferences.flush();
                let pre2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
                expect(4).assertEqual(pre2);
                done();
            });
        })

        /**
         * @tc.name testPreferencesPutLong0152
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1000
         * @tc.desc put long callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutLong0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 4);
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 4, async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
                expect(4).assertEqual(pre);
                await mPreferences.flush();
                let pre2 = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
                expect(4).assertEqual(pre2);
                done();
            });
        })

        /**
         * @tc.name testPreferencesPutString0162
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0900
         * @tc.desc put String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutString0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, '', async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
                expect('').assertEqual(pre);
                await mPreferences.flush();
                let pre2 = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
                expect('').assertEqual(pre2);
                done();
            });
        })

        /**
         * @tc.name testPreferencesCallback0172
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_2500
         * @tc.desc flush String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesCallback0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log(TAG + "testPreferencesCallback0172 begin.");
            mPreferences.clear(function (err, val) {
                if(err){
                    expect().assertFalse()
                }
                mPreferences.put(KEY_TEST_STRING_ELEMENT, '', function (err, ret) {
                    if(err){
                        expect().assertFalse()
                    }
                    mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
                        if(err){
                            expect().assertFalse()
                        }
                        expect('').assertEqual(pre);
                        mPreferences.flush(function (err, val) {
                            if(err){
                                expect().assertFalse()
                            }
                            mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre2) {
                                if(err){
                                    expect().assertFalse()
                                }
                                expect('').assertEqual(pre2);
                                done();
                                console.log(TAG + "testPreferencesCallback0172 end.");
                            })
                        });
                    })
                });
            });
        })

        /**
         * @tc.name testPreferencesPutStringArray0001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0800
         * @tc.desc put String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutStringArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            var stringArr = ['11', '22', '33']
            await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr, async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ['123', '321'])
                for (let i = 0; i < stringArr.length; i++) {
                    expect(stringArr[i]).assertEqual(pre[i]);
                }

                done();
            });
        })

        /**
         * @tc.name testPreferencesPutNumArray0001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0700
         * @tc.desc put String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutNumArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            var doubleArr = [11, 22, 33]
            await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr, async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321])
                for (let i = 0; i < doubleArr.length; i++) {
                    expect(doubleArr[i]).assertEqual(pre[i]);
                }

                done();
            });
        })

        /**
         * @tc.name testPreferencesPutBoolArray0001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0600
         * @tc.desc put String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutBoolArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            let boolArr = [true, false, false, true]
            await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr, async function (err, ret) {
                let pre = await mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [true, false])
                for (let i = 0; i < boolArr.length; i++) {
                    expect(boolArr[i]).assertEqual(pre[i]);
                }

                done();
            });
        })

        /**
         * @tc.name testPreferencesGetAll0001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_2400
         * @tc.desc getAll callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            let doubleArr = [11, 22, 33]
            let stringArr = ['11', '22', '33']
            let boolArr = [true, false, false, true]
            await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr)
            await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr)
            await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr)
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false)
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123")
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1)

            await mPreferences.flush()

            await mPreferences.getAll(function (err, obj) {
                expect(false).assertEqual(obj.key_test_boolean)
                expect("123").assertEqual(obj.key_test_string)
                expect(123.1).assertEqual(obj.key_test_float)
                let sArr = obj.key_test_string_array
                for (let i = 0; i < sArr.length; i++) {
                    expect(sArr[i]).assertEqual(stringArr[i]);
                }

                let bArr = obj.key_test_bool_array
                for (let i = 0; i < bArr.length; i++) {
                    expect(bArr[i]).assertEqual(boolArr[i]);
                }

                let nArr = obj.key_test_number_array
                for (let i = 0; i < nArr.length; i++) {
                    expect(nArr[i]).assertEqual(doubleArr[i]);
                }

                done()
            })
        })

        /**
         * @tc.name testPreferencesGetPreferences0001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_2300
         * @tc.desc getPreferences callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetPreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const NAME = 'getPreferencesTest'
            await dataPreferences.getPreferences(context, NAME, (err, preferences) => {
                if(err != null){
                    console.info(TAG + "Get preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    console.info(TAG + "Get preferences success")
                    expect(preferences != null).assertTrue();
                }
            })
            done()
        })

        /**
         * @tc.name testPreferencesDeletePreferences0001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0200
         * @tc.desc deletePreferences callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesDeletePreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const NAME = 'getPreferencesTest'
            await dataPreferences.getPreferences(context, NAME, (err, preferences) => {
                if(err != null){
                    console.info(TAG + "Get preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    console.info(TAG + "Get preferences success")
                    expect(preferences != null).assertTrue();
                }
            })
            await dataPreferences.deletePreferences(context, NAME, (err, data) => {
                if(err != null){
                    console.info(TAG + "Delete preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    console.info(TAG + "Delete preferences success")
                    expect(data == null).assertTrue();
                }
            })
            done()
        })

        /**
         * @tc.name testRemovePreferencesFromCache0001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_0100
         * @tc.desc removePreferencesFromCache interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRemovePreferencesFromCache0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await dataPreferences.getPreferences(context, NAME, (err, preferences) => {
                if(err != null){
                    console.info(TAG + "Get preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    console.info(TAG + "Get preferences success")
                    expect(preferences != null).assertTrue();
                }
            })
            await dataPreferences.removePreferencesFromCache(context, NAME, (err ,data) => {
                if(err != null){
                    console.info(TAG + "Remove preferences from cache error: " + err)
                    expect(false).assertTrue();
                }else{
                    console.info(TAG + "Remove preferences from cache success")
                    expect(data==null).assertTrue();
                }
            })
            done();
        })

        /**
         * @tc.name testPreferencesGetDefValue0173
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsApiCallbackTest_1300
         * @tc.desc get defaultValue callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetDefValue0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, true, function (err, ret) {
                expect(true).assertEqual(ret);
                done();
            })
        })

    })
}