/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility';

const NAME = 'test_preferences';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
var mPreferences;
var context;
export default function preferencesHelperTest(){
    describe('preferencesHelperTest', function () {
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
         * @tc.name   testGetPreferencesHelper001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3000
         * @tc.desc   getPreferencesSync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetPreferencesHelper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            mPreferences = await dataPreferences.getPreferences(context, NAME);
            await mPreferences.put('test', 2);
            await mPreferences.flush();
            var value = await mPreferences.get('test', 0);
            expect(value).assertEqual(2);
        })

        /**
         * @tc.name   testGetPreferencesHelper002
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2300
         * @tc.desc   getPreferences interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetPreferencesHelper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const promise = dataPreferences.getPreferences(context, NAME);
            await promise.then(async (pref) => {
                await pref.put('test', 2);
                await pref.flush();
                var value = await mPreferences.get('test', 0);
                expect(value).assertEqual(2);
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        })

        /**
         * @tc.name   testRemovePreferencesFromCache001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2100
         * @tc.desc   removePreferencesFromCache interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRemovePreferencesFromCache001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let perf = await dataPreferences.getPreferences(context, NAME);
            perf = null;
            const promise = dataPreferences.removePreferencesFromCache(context, NAME);
            await promise.then((pref) => {
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        })

        /**
         * @tc.name   testDeletePreferencesHelper002
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2200
         * @tc.desc   deletePreferences interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeletePreferencesHelper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let perf = await dataPreferences.getPreferences(context, NAME);
            perf = null;
            const promise = dataPreferences.deletePreferences(context, NAME);
            await promise.then((pref) => {
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        })

        /**
         * @tc.name   testPreferencesRegisterObserver001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1000
         * @tc.desc   put interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPreferencesRegisterObserver001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            var observer = function (key) {
                console.info('testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                done();
                expect('abcd').assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                mPreferences.off('change')
            };
            await mPreferences.on('change', observer);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
            await mPreferences.flush();
        })

        /**
         * @tc.name   testPreferencesRegisterObserver002
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_1100
         * @tc.desc   repeat on interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPreferencesRegisterObserver002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            var observer = function (key) {
                console.info('testPreferencesRegisterObserver002 keyValue' + mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                done();
                expect('abc').assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                mPreferences.off('change')
            };
            await mPreferences.on('change', observer);
            await mPreferences.on('change', observer);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
            await mPreferences.flush();
        })

        /**
         * @tc.name   testPreferencesUnRegisterObserver001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_0900
         * @tc.desc   off interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPreferencesUnRegisterObserver001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var observer = function (key) {
                console.info('testPreferencesUnRegisterObserver001 keyValue' + mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                done();
                expect('').assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                mPreferences.off('change');
            };
            await mPreferences.on('change', observer);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "");
            await mPreferences.flush();
        })

        /**
         * @tc.name   testGetPreferencesSyncinterface001
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3100
         * @tc.desc   getPreferencesSync interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetPreferencesSyncinterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            mPreferences = dataPreferences.getPreferencesSync(context, { name: 'test_preferences' });
            mPreferences.putSync("test", 2);
            mPreferences.flushSync();
            var value = mPreferences.getSync('test', 0);
            expect(value).assertEqual(2);
        })

    })
}