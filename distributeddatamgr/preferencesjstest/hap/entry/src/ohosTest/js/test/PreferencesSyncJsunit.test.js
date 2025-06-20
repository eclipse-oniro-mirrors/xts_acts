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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import data_preferences from '@ohos.data.preferences';
import featureAbility from '@ohos.ability.featureAbility';

const NAME = 'test_preferences_store';
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

export default function PreferencesSyncTest() {
    describe('PreferencesSyncTest', function () {
        beforeAll(async function () {
            console.info('beforeAll')
            context = featureAbility.getContext()
        })

        afterAll(async function () {
            console.info('afterAll')
        })

        beforeEach(async function () {
            console.info('beforeEach')
            mPreferences = await data_preferences.getPreferences(context, NAME);
        })
        
        afterEach(async function () {
            console.info('afterEach')
            await data_preferences.deletePreferences(context, NAME);
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1900
         * @tc.name putSync StringArray interface test
         * @tc.desc putSync StringArray interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0100', 0, function (done) {
            mPreferences.clearSync();
            const stringArr = ['1', '2', '3'];
            mPreferences.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            let rc = mPreferences.getSync(KEY_TEST_STRING_ARRAY_ELEMENT, []);
            for (let i = 0; i < stringArr.length; i++) {
                console.info('ttt  stringArr = ' + stringArr[i] + '   rc = ' + rc[i]);
                expect(stringArr[i]).assertEqual(rc[i]);
            }
            done();
        });

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1700
         * @tc.name putSync numberArr interface test
         * @tc.desc putSync numberArr interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0200', 0, async function (done) {
            mPreferences.clearSync();
            const numberArr = [1, 2, 3];
            mPreferences.putSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, numberArr);
            let rc = mPreferences.getSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, []);
            for (let i = 0; i < numberArr.length; i++) {
                console.info('ttt  stringArr = ' + numberArr[i] + '   rc = ' + rc[i]);
                expect(numberArr[i]).assertEqual(rc[i]);
            }
            done();
        });

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1300
         * @tc.name putSync boolArr interface test
         * @tc.desc putSync boolArr interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0300', 0, async function (done) {
            mPreferences.clearSync();
            const boolArr = [true, true, false];
            mPreferences.putSync(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
            let rc = mPreferences.getSync(KEY_TEST_BOOL_ARRAY_ELEMENT, [false, true]);
            for (let i = 0; i < boolArr.length; i++) {
                console.info('ttt  stringArr = ' + boolArr[i] + '   rc = ' + rc[i]);
                expect(boolArr[i]).assertEqual(rc[i]);
            }
            done();
        });

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0300
         * @tc.name getAllSync interface test
         * @tc.desc getAllSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetAllSync_0100', 0, async function (done) {
            mPreferences.clearSync();
            const doubleArr = [11, 22, 33];
            const stringArr = ['11', '22', '33'];
            const boolArr = [true, false, false, true];
            mPreferences.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            mPreferences.putSync(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
            mPreferences.putSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
            mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "123");
            mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 123.1);
            await mPreferences.flush();
            let obj = mPreferences.getAllSync();
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
            let nArr = obj.key_test_number_array;
            for (let i = 0; i < nArr.length; i++) {
                expect(nArr[i]).assertEqual(doubleArr[i]);
            }
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0100
         * @tc.name clearSync interface test
         * @tc.desc clearSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_ClearSync_0100', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            mPreferences.clearSync();
            let per = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect("defaultvalue").assertEqual(per);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2900
         * @tc.name hasSync interface test
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_HasSync_0100', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
            const ret = mPreferences.hasSync(KEY_TEST_STRING_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2700
         * @tc.name hasSync interface test
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_HasSync_0200', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_INT_ELEMENT, 1);
            const ret = mPreferences.hasSync(KEY_TEST_INT_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2600
         * @tc.name hasSync interface test
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_HasSync_0300', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 2.0);
            const ret = mPreferences.hasSync(KEY_TEST_FLOAT_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2500
         * @tc.name hasSync interface test
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_HasSync_0400', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            const ret = mPreferences.hasSync(KEY_TEST_BOOLEAN_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2800
         * @tc.name hasSync interface test
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_HasSync_0500', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_LONG_ELEMENT, 0);
            const ret = mPreferences.hasSync(KEY_TEST_LONG_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2400
         * @tc.name hasSync interface test
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_HasSync_0600', 0, async function (done) {
            mPreferences.clearSync();
            const ret = mPreferences.hasSync(KEY_TEST_LONG_ELEMENT);
            console.info('ret = ' + ret);
            expect(ret === false).assertTrue();
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0800
         * @tc.name getSync interface test
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetSync_0100', 0, async function (done) {
            mPreferences.clearSync();
            const ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue");
            expect('defaultValue').assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0400
         * @tc.name getSync interface test
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetSync_0200', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 3.0);
            const ret = mPreferences.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0);
            expect(3.0).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0500
         * @tc.name getSync interface test
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetSync_0300', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_INT_ELEMENT, 3);
            const ret = mPreferences.getSync(KEY_TEST_INT_ELEMENT, 0.0);
            expect(3).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0600
         * @tc.name getSync interface test
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetSync_0400', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_LONG_ELEMENT, 3);
            const ret = mPreferences.getSync(KEY_TEST_LONG_ELEMENT, 0);
            expect(3).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0700
         * @tc.name getSync interface test
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetSync_0500', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            const ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect('test').assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1200
         * @tc.name putSync interface test
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0400', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, true);
            let per = mPreferences.getSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            expect(true).assertEqual(per);
            await mPreferences.flush();
            let per2 = mPreferences.getSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            expect(true).assertEqual(per2);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1400
         * @tc.name putSync interface test
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0500', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 4.0);
            let per = mPreferences.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0);
            expect(4.0).assertEqual(per);
            await mPreferences.flush();
            let per2 = mPreferences.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0);
            expect(4.0).assertEqual(per2);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1500
         * @tc.name putSync interface test
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0600', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_INT_ELEMENT, 4);
            let per = mPreferences.getSync(KEY_TEST_INT_ELEMENT, 0);
            expect(4).assertEqual(per);
            await mPreferences.flush();
            let per2 = mPreferences.getSync(KEY_TEST_INT_ELEMENT, 0);
            expect(4).assertEqual(per2);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1600
         * @tc.name putSync interface test
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0700', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_LONG_ELEMENT, 4);
            let per = mPreferences.getSync(KEY_TEST_LONG_ELEMENT, 0);
            expect(4).assertEqual(per);
            await mPreferences.flush();
            let per2 = mPreferences.getSync(KEY_TEST_LONG_ELEMENT, 0);
            expect(4).assertEqual(per2);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1800
         * @tc.name putSync interface test
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_PutSync_0800', 0, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, '');
            let per = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect('').assertEqual(per);
            await mPreferences.flush();
            let per2 = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect('').assertEqual(per2);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0200
         * @tc.name deleteSync interface test
         * @tc.desc deleteSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_deleteSync_0100', 0, async function (done) {
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            expect("abc").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            mPreferences.deleteSync(KEY_TEST_STRING_ELEMENT);
            expect("default").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2000
         * @tc.name removePreferencesFromCacheSync interface test
         * @tc.desc removePreferencesFromCacheSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0100', 0, async function (done) {
            console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 begin.");
            mPreferences = await data_preferences.getPreferences(context, NAME);
            await mPreferences.clearSync();
            await mPreferences.putSync(KEY_TEST_STRING_ELEMENT, 'test')
            await mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
            mPreferences.flush(async function (err, val) {
                if (err) {
                    console.log("flush err.");
                    expect().assertFail();
                }
                console.log("flush done.");
                await data_preferences.removePreferencesFromCacheSync(context, NAME);
                let value = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
                console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end." + value);
                expect('test').assertEqual(value);
                done();
                console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end.");
            });
        })
    })
}