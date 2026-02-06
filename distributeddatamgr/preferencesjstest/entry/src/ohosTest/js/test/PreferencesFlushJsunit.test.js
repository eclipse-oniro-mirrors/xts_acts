/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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
import dataPreferences from '@ohos.data.preferences';
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
const NAME = "test_preferences";
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';
var mPreferences;
var context;

const TAG = '[TEST_PREFERENCES_FLUSH]'

export default function preferencesFlushTest(){
    describe('preferencesFlushTest', function (){
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
         * @tc.name testPreferences_put_flush_remove_get_0100
         * @tc.number SUB_DistributedData_Preference_SDK_PutGetFlushRemoveJsApiTest_0100
         * @tc.desc put get flush removePreferencesFromCache get promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferences_put_flush_remove_get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "start_test_0100");
            await mPreferences.clear();

            await mPreferences.put(KEY_TEST_INT_ELEMENT, 1).then(() => {
                console.log(TAG + "put succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.get(KEY_TEST_INT_ELEMENT, 1).then((res1) => {
                expect(1).assertEqual(res1);
                console.log(TAG + "res1 = " + res1 + "get res1 succeed");
            }).catch((err) => {
                console.log(TAG + "get res1 failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.flush().then(() => {
                console.log(TAG + "flush succeed");
            }).catch((err) => {
                console.log(TAG + "flush failed error message = " + err + "error code = " + err.code);
            })

            await dataPreferences.removePreferencesFromCache(context, NAME).then(() => {
                console.log(TAG + "remove succeed");
            }).catch((err) => {
                console.log(TAG + "remove failed error message = " + err + "error code = " + err.code);
            })

            mPreferences = null;
            mPreferences = await dataPreferences.getPreferences(context, NAME);

            await mPreferences.get(KEY_TEST_INT_ELEMENT, 1).then((res2) => {
                expect(1).assertEqual(res2);
                console.log(TAG + "res2 = " + res2 + "get res2 succeed. test0100end");
                done();
            }).catch((err) => {
                console.log(TAG + "get res2 failed error message = " + err + "error code = " + err.code);
            })
        })
        /**
         * @tc.name testPreferences_put_flush_remove_get_0200
         * @tc.number SUB_DistributedData_Preference_SDK_PutGetFlushRemoveJsApiTest_0200
         * @tc.desc put get flush removePreferencesFromCache get promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferences_put_flush_remove_get_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done){
            console.log(TAG + "start_test_0200");
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_LONG_ELEMENT, 111).then(() => {
                console.log(TAG + "put succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.get(KEY_TEST_LONG_ELEMENT, 111).then((res1) => {
                expect(111).assertEqual(res1);
                console.log(TAG + "res1 = " + res1 + "get res1 succeed");
            }).catch((err) => {
                console.log(TAG + "get res1 failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.flush().then(() => {
                console.log(TAG + "flush succeed");
            }).catch((err) => {
                console.log(TAG + "flush failed error message = " + err + "error code = " + err.code);
            })

            await dataPreferences.removePreferencesFromCache(context, NAME).then(() => {
                console.log(TAG + "remove succeed");
            }).catch((err) => {
                console.log(TAG + "remove failed error message = " + err + "error code = " + err.code);
            })

            mPreferences = null;
            mPreferences = await dataPreferences.getPreferences(context, NAME);

            await mPreferences.get(KEY_TEST_LONG_ELEMENT, 111).then((res2) => {
                expect(111).assertEqual(res2);
                console.log(TAG + "res2 = " + res2 + "get res2 succeed. test0200end");
                done();
            }).catch((err) => {
                console.log(TAG + "get res2 failed error message = " + err + "error code = " + err.code);
            })
        })
        /**
         * @tc.name testPreferences_put_flush_remove_get_0300
         * @tc.number SUB_DistributedData_Preference_SDK_PutGetFlushRemoveJsApiTest_0300
         * @tc.desc put get flush removePreferencesFromCache get promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferences_put_flush_remove_get_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done){
            console.log(TAG + "start_test_0300");
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 111.2).then(() => {
                console.log(TAG + "put succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then((res1) => {
                expect(111.2).assertEqual(res1);
                console.log(TAG + "res1 = " + res1 + "get res1 succeed");
            }).catch((err) => {
                console.log(TAG + "get res1 failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.flush().then(() => {
                console.log(TAG + "flush succeed");
            }).catch((err) => {
                console.log(TAG + "flush failed error message = " + err + "error code = " + err.code);
            })

            await dataPreferences.removePreferencesFromCache(context, NAME).then(() => {
                console.log(TAG + "remove succeed");
            }).catch((err) => {
                console.log(TAG + "remove failed error message = " + err + "error code = " + err.code);
            })

            mPreferences = null;
            mPreferences = await dataPreferences.getPreferences(context, NAME);

            await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then((res2) => {
                expect(111.2).assertEqual(res2);
                console.log(TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
                done();
            }).catch((err) => {
                console.log(TAG + "get res2 failed error message = " + err + "error code = " + err.code);
            })
        })
        /**
         * @tc.name testPreferences_put_flush_remove_get_0400
         * @tc.number SUB_DistributedData_Preference_SDK_PutGetFlushRemoveJsApiTest_0400
         * @tc.desc put get flush removePreferencesFromCache get promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferences_put_flush_remove_get_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done){
            console.log(TAG + "start_test_0400");
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, true).then(() => {
                console.log(TAG + "put succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, true).then((res1) => {
                expect(true).assertEqual(res1);
                console.log(TAG + "res1 = " + res1 + "get res1 succeed");
            }).catch((err) => {
                console.log(TAG + "get res1 failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.flush().then(() => {
                console.log(TAG + "flush succeed");
            }).catch((err) => {
                console.log(TAG + "flush failed error message = " + err + "error code = " + err.code);
            })

            await dataPreferences.removePreferencesFromCache(context, NAME).then(() => {
                console.log(TAG + "remove succeed");
            }).catch((err) => {
                console.log(TAG + "remove failed error message = " + err + "error code = " + err.code);
            })

            mPreferences = null;
            mPreferences = await dataPreferences.getPreferences(context, NAME);

            await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, true).then((res2) => {
                expect(true).assertEqual(res2);
                console.log(TAG + "res2 = " + res2 + "get res2 succeed. test0400end");
                done();
            }).catch((err) => {
                console.log(TAG + "get res2 failed error message = " + err + "error code = " + err.code);
            })
        })
        /**
         * @tc.name testPreferences_put_flush_remove_get_0500
         * @tc.number SUB_DistributedData_Preference_SDK_PutGetFlushRemoveJsApiTest_0500
         * @tc.desc put get flush removePreferencesFromCacheget get promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferences_put_flush_remove_get_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done){
            console.log(TAG + "start_test_0500");
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, 'abc').then(() => {
                console.log(TAG + "put succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.get(KEY_TEST_STRING_ELEMENT, 'abc').then((res1) => {
                expect("abc").assertEqual(res1);
                console.log(TAG + "res1 = " + res1 + "get res1 succeed");
            }).catch((err) => {
                console.log(TAG + "get res1 failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.flush().then(() => {
                console.log(TAG + "flush succeed");
            }).catch((err) => {
                console.log(TAG + "flush failed error message = " + err + "error code = " + err.code);
            })

            await dataPreferences.removePreferencesFromCache(context, NAME).then(() => {
                console.log(TAG + "remove succeed");
            }).catch((err) => {
                console.log(TAG + "remove failed error message = " + err + "error code = " + err.code);
            })

            mPreferences = null;
            mPreferences = await dataPreferences.getPreferences(context, NAME);

            await mPreferences.get(KEY_TEST_STRING_ELEMENT, "abc").then((res2) => {
                expect("abc").assertEqual(res2);
                console.log(TAG + "res2 = " + res2 + "get res2 succeed. test0500end");
                done();
            }).catch((err) => {
                console.log(TAG + "get res2 failed error message = " + err + "error code = " + err.code);
            })
        })

        /**
         * @tc.name testPreferences_put_flush_remove_get_0600
         * @tc.number SUB_DistributedData_Preference_SDK_PutGetFlushRemoveJsApiTest_0600
         * @tc.desc put getAll flush removePreferencesFromCache getAll promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testPreferences_put_flush_remove_get_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done){
            console.log(TAG + "start_test_0600");
            await mPreferences.clear();
            let numberArr = [11, 22, 33];
            let stringArr = ['11', '22', '33'];
            let boolArr = [true, false, false, true];
            await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, numberArr).then(() => {
                console.log(TAG + "put numberArr succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })
            await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr).then(() => {
                console.log(TAG + "put stringArr numberArr succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })
            await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr).then(() => {
                console.log(TAG + "put boolArr numberArr succeed");
            }).catch((err) => {
                console.log(TAG + "put failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.getAll().then((obj1) => {
                for (let i = 0; i < obj1.key_test_number_array.length; i++) {
                    expect(numberArr[i]).assertEqual(obj1.key_test_number_array[i]);
                }
                for (let i = 0; i < obj1.key_test_string_array.length; i++) {
                    expect(stringArr[i]).assertEqual(obj1.key_test_string_array[i]);
                }
                for (let i = 0; i < obj1.key_test_bool_array.length; i++) {
                    expect(boolArr[i]).assertEqual(obj1.key_test_bool_array[i]);
                }
                console.log(TAG + "obj1 = " + obj1 + "get res1 succeed");
            }).catch((err) => {
                console.log(TAG + "get obj1 failed error message = " + err + "error code = " + err.code);
            })

            await mPreferences.flush().then(() => {
                console.log(TAG + "flush succeed");
            }).catch((err) => {
                console.log(TAG + "flush failed error message = " + err + "error code = " + err.code);
            })

            await dataPreferences.removePreferencesFromCache(context, NAME).then(() => {
                console.log(TAG + "remove succeed");
            }).catch((err) => {
                console.log(TAG + "remove failed error message = " + err + "error code = " + err.code);
            })

            mPreferences = null;
            mPreferences = await dataPreferences.getPreferences(context, NAME);

            await mPreferences.getAll().then((obj2) => {
                for (let i = 0; i < numberArr.length; i++) {
                    expect(numberArr[i]).assertEqual(obj2.key_test_number_array[i]);
                }
                for (let i = 0; i < stringArr.length; i++) {
                    expect(stringArr[i]).assertEqual(obj2.key_test_string_array[i]);
                }
                for (let i = 0; i < boolArr.length; i++) {
                    expect(boolArr[i]).assertEqual(obj2.key_test_bool_array[i]);
                }
                console.log(TAG + "obj2 = " + obj2 + "get res1 succeed");
                done();
            }).catch((err) => {
                console.log(TAG + "get obj2 failed error message = " + err + "error code = " + err.code);
            })
        })

    })
}