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
import data_preferences from '@ohos.data.preferences';
import common from "@ohos.app.ability.common";


const TAG = ["preserence_test"];

let context: common.UIAbilityContext;
const NAME = 'test_preferences_store';
let options: data_preferences.Options = { name: 'test_preferences_store' };
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';
const KEY_TEST_BIGINT = 'key_test_bigint';
let mPreferences;

export default function PreferencesSyncTest() {
    describe('PreferencesSyncTest', function () {
        beforeAll(async function () {
            console.info('beforeAll')
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1900
         * @tc.name PreferencesPutSync0100
         * @tc.desc putSync StringArray interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1700
         * @tc.name PreferencesPutSync0200
         * @tc.desc putSync numberArr interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1300
         * @tc.name PreferencesPutSync0300
         * @tc.desc putSync boolArr interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0300
         * @tc.name PreferencesGetAllSync0100
         * @tc.desc getAllSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesGetAllSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0100
         * @tc.name PreferencesClearSync0100
         * @tc.desc clearSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesClearSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            mPreferences.clearSync();
            let per = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect("defaultvalue").assertEqual(per);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_2900
         * @tc.name PreferencesHasSync0100
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesHasSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
            const ret = mPreferences.hasSync(KEY_TEST_STRING_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_2700
         * @tc.name PreferencesHasSync0200
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesHasSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_INT_ELEMENT, 1);
            const ret = mPreferences.hasSync(KEY_TEST_INT_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_2600
         * @tc.name PreferencesHasSync0300
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesHasSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 2.0);
            const ret = mPreferences.hasSync(KEY_TEST_FLOAT_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_2500
         * @tc.name PreferencesHasSync0400
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesHasSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            const ret = mPreferences.hasSync(KEY_TEST_BOOLEAN_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_2800
         * @tc.name PreferencesHasSync0500
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesHasSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_LONG_ELEMENT, 0);
            const ret = mPreferences.hasSync(KEY_TEST_LONG_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_2400
         * @tc.name PreferencesHasSync0600
         * @tc.desc hasSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesHasSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            const ret = mPreferences.hasSync(KEY_TEST_LONG_ELEMENT);
            console.info('ret = ' + ret);
            expect(ret === false).assertTrue();
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0800
         * @tc.name PreferencesGetSync0100
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesGetSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            const ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue");
            expect('defaultValue').assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0400
         * @tc.name PreferencesGetSync0200
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesGetSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 3.0);
            const ret = mPreferences.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0);
            expect(3.0).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0500
         * @tc.name PreferencesGetSync0300
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesGetSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_INT_ELEMENT, 3);
            const ret = mPreferences.getSync(KEY_TEST_INT_ELEMENT, 0.0);
            expect(3).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0600
         * @tc.name PreferencesGetSync0400
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesGetSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_LONG_ELEMENT, 3);
            const ret = mPreferences.getSync(KEY_TEST_LONG_ELEMENT, 0);
            expect(3).assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0700
         * @tc.name PreferencesGetSync0500
         * @tc.desc getSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesGetSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            const ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect('test').assertEqual(ret);
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1200
         * @tc.name PreferencesPutSync0400
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1400
         * @tc.name PreferencesPutSync0500
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1500
         * @tc.name PreferencesPutSync0600
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1600
         * @tc.name PreferencesPutSync0700
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_1800
         * @tc.name PreferencesPutSync0800
         * @tc.desc putSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_0200
         * @tc.name PreferencesDeleteSync0100
         * @tc.desc deleteSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesDeleteSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            expect("abc").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            mPreferences.deleteSync(KEY_TEST_STRING_ELEMENT);
            expect("default").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            done();
        })

        /**
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_2000
         * @tc.name PreferencesRemovePreferencesFromCacheSync0100
         * @tc.desc removePreferencesFromCacheSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesRemovePreferencesFromCacheSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("PreferencesRemovePreferencesFromCacheSync0100 begin.");
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
                console.log("PreferencesRemovePreferencesFromCacheSync0100 end." + value);
                expect('test').assertEqual(value);
                done();
                console.log("PreferencesRemovePreferencesFromCacheSync0100 end.");
            });
        })


        /**
         * @tc.name testPreferencesPutBigIntSync0100
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_3100
         * @tc.desc put BigInt sync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutBigIntSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            let bigint = BigInt(Number.MIN_SAFE_INTEGER);
            mPreferences.putSync(KEY_TEST_BIGINT, bigint);
            let pre = mPreferences.getSync(KEY_TEST_BIGINT, BigInt(0));
            expect(bigint === pre).assertTrue();
            await mPreferences.flush();
            await data_preferences.removePreferencesFromCacheSync(context, NAME);
            mPreferences = null;
            mPreferences = await data_preferences.getPreferencesSync(context, options);
            let pre2 = await mPreferences.getSync(KEY_TEST_BIGINT, BigInt(0));
            expect(bigint === pre2).assertTrue();
        })



        /**
         * @tc.name testPreferencesPutBigIntSync0100
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperEtsTest_3200
         * @tc.desc flushsync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testPreferenceFlushSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            try {
                mPreferences.clearSync();
                mPreferences.putSync(KEY_TEST_STRING_ELEMENT,'TEST');
                let pre = mPreferences.getSync(KEY_TEST_STRING_ELEMENT,'default');
                expect('TEST').assertEqual(pre)
                mPreferences.flushSync();
                data_preferences.removePreferencesFromCacheSync(context,options)
                mPreferences = data_preferences.getPreferencesSync(context,options)
                let pre2 = mPreferences.getSync(KEY_TEST_STRING_ELEMENT,'default')
                expect('TEST').assertEqual(pre2)
                done();
            } catch (e) {
                console.info(TAG + "testPreferenceFlushSync0100" +e.code);
                expect().assertFail();
                done();
            }

        })

    })
}