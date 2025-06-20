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
import storage from '@ohos.data.storage'

const NAME = 'test_preferences';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
var mPreferences;
var context;
export default function preferencesErrCodeHelperTest(){
    describe('preferencesErrCodeHelperTest', function () {
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
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3300
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetPreferencesPromiseinterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456"
            }
            try {
                await dataPreferences.getPreferences(context, options);
            } catch(err) {
                done();
                expect('15501001').assertEqual(err.code);
            }
        })


        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3400
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetPreferencesCallbackinterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456"
            }
            try {
                dataPreferences.getPreferences(context, options, (err, preferences) => {
                    console.info('getPreferences is success');
                    expect().assertFail();
                    done();
                })
                
            } catch (err) {
                console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
                expect('15501001').assertEqual(err.code);
                done();
            }
        })


        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3500
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesSyncInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                const options = {
                    name: 'test_preferences',
                    dataGroupId: "123456"
                }
                dataPreferences.getPreferencesSync(context, options);
                expect().assertFail();
                done();
            } catch (error) {
                console.info('getPreferencesSync is fail' + err.code);
                expect('15501001').assertEqual(err.code);
                done();
            }
        })



        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3600
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testDeletePreferencesPromiseHelper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456"
            }
            try {
                await dataPreferences.deletePreferences(context, options);
                expect().assertFail();
                done();
            } catch(err) {
                console.info('getPreferencesSync is fail' + err.code);
                expect('15501001').assertEqual(err.code);
                done();
            }
        })




        /**
         * @tc.name deletePreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3700
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testDeletePreferencesPromiseHelper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456"
            }
            try {
                dataPreferences.deletePreferences(context, options, (err) => {
                    console.error("Failed to delete preferences. code =" + err.code + ", message =" + err.message);
                    expect().assertFail();
                    done();
                  })
            } catch(err) {
                console.info('deletePreferences is fail' + err.code);
                expect('15501001').assertEqual(err.code);
                done();
            }
        })


        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3800
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testremovePreferencesFromCachePromiseHelper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456"
            }
            try {
                await dataPreferences.removePreferencesFromCache(context, options);
                expect().assertFail();
                done();
            } catch(err) {
                console.info('removePreferencesFromCache is fail' + err.code);
                expect('15501001').assertEqual(err.code);
                done();
            }
        })



        /**
         * @tc.name deletePreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_3900
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testremovePreferencesFromCacheCallbackHelper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456"
            }
            try {
                dataPreferences.removePreferencesFromCache(context, options, (err) => {
                    console.error("Failed to removePreferencesFromCache. code =" + err.code + ", message =" + err.message);
                    expect().assertFail();
                    done();
                  })
            } catch(err) {
                console.info('removePreferencesFromCache is fail' + err.code);
                expect('15501001').assertEqual(err.code);
                done();
            }
        })





        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4000
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesSyncInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                const options = {
                    name: 'test_preferences',
                    dataGroupId: "123456"
                }
                dataPreferences.removePreferencesFromCacheSync(context, options);
                expect().assertFail();
                done();
            } catch (error) {
                console.info('removePreferencesFromCacheSync is fail' + err.code);
                expect('15501001').assertEqual(err.code);
                done();
            }
        })


        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4100
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetPreferencesSyncinterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                mPreferences = dataPreferences.getPreferencesSync(context, { name: null });
                mPreferences.putSync("test", 2);
                mPreferences.flushSync();
                var value = mPreferences.getSync('test', 0);
                expect(value).assertEqual(2);
            } catch (err) {
                console.info('getPreferencesSync is fail' + err.code);
                expect().assertEqual(401);
                done();
            }
        })



        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4200
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesSyncInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                const options = {
                    name: null,
                }
                dataPreferences.removePreferencesFromCacheSync(context, options);
                expect().assertFail();
                done();
            } catch (error) {
                console.info('removePreferencesFromCacheSync is fail' + err.code);
                expect(401).assertEqual(err.code);
                done();
            }
        })




        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4300
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesSyncInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                dataPreferences.removePreferencesFromCacheSync(context, { name: null})
                expect().assertFail();
                done();
            } catch (error) {
                console.info('removePreferencesFromCacheSync is fail' + err.code);
                expect(401).assertEqual(err.code);
                done();
            }
        })
        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4400
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesflushInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            mPreferences = await dataPreferences.getPreferences(context, NAME);
            await mPreferences.put('test', 2);
            mPreferences.flush((err) => {
            if (err) {
              console.error("Failed to flush. code =" + err.code + ", message =" + err.message);
              expect(err.code).assertEqual(401);
            }
            console.info("Succeeded in flushing.");
          })
          done();
        })



        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4500
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesflushInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            let observer = (key) => {
                console.info("The key " + key + " changed.");
              }
              mPreferences.on('multiProcessChange', observer);
              mPreferences.putSync("test", 2);
              mPreferences.flush((err) => {
                if (err) {
                  console.error("Failed to flush. Cause: " + err);
                  expect(err.code).assertEqual(401);
                }
                console.info("Succeeded in flushing.");
              })
              done();
        })


        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4600
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testPreferencesOnObserver0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            var observer = function (key) {
                console.info('testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                done();
                expect('abcd').assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                mPreferences.off('multiProcessChange')
            };
            await mPreferences.on('multiProcessChange', observer);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
            await mPreferences.flush();
        })




        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4700
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testPreferencesOnObserver0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            var observer = function (key) {
                console.info('testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                done();
                expect('abcd').assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                mPreferences.off('dataChange')
            };
            await mPreferences.on('dataChange', observer);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
            await mPreferences.flush();
        })



        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4800
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testPreferencesOnObserver0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await mPreferences.clear();
            var observer = function (key) {
                console.info('testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                done();
                expect('abcd').assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                mPreferences.off('dataChange')
            };
            await mPreferences.on('dataChange', observer);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
            await mPreferences.flush();
        })



        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_4900
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testPreferencesOnObserver0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                await mPreferences.clear();
                await mPreferences.on('dataChange', function (undefine) {
                console.info('testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                done();
                expect('abcd').assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT,"aaa"));
                mPreferences.off('dataChange')
            });
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
            await mPreferences.flush();
            } catch (error) {
                console.error("Failed to flush. Cause: " + err);
                expect(err.code).assertEqual(401);
                done();
            }
        })




        /**
        * @tc.name getPreferencesSync on interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5000
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesOnErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            for(let i = 0;i<100;i++){
                mPreferences.on('multiProcessChange', (key: string) => {
                console.info(TAG + 'testSendablePreferencesOnErr0400 keyValue' +  key);
                done();
                })
            }
        } catch (err) {
            console.error( TAG + 'testSendablePreferencesOnErr0400' + err.message + err.code);
            expect(err.code).assertEqual(15500019);
            mPreferences.off('multiProcessChange');
            done();
            }
        })



        /**
        * @tc.name getPreferencesSync off interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5100
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesOffErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let observer = (key: string) => {
                console.info("====>testPreferencesOffErr0100 multiProcessChange key " + key + " changed.");
                }
            try {
                mPreferences.off("multiProcessChange", (undefine) => {
                    expect(err.code === '401').assertTrue();
                    console.info("====>testPreferencesOffErr0100 multiProcessChange key " + key + " changed.");
                    done();
                })
            } catch (err) {
                console.info("====>testSendablePreferencesOffErr0100 catch: " + JSON.stringify(err));
                expect().assertFail();
                done();
                }
        })



        /**
        * @tc.name getPreferencesSync off interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5200
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesOffErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let observer = (key: string) => {
                console.info("====>testSendablePreferencesOffErr0200 multiProcessChange key " + key + " changed.");
                }
            try {
                mPreferences.off("change", (null) => {
                    console.info("====>testSendablePreferencesOffErr0200 multiProcessChange key " + key + " changed.");
                    expect(err.code === '401').assertTrue();
                })
            } catch (err) {
                console.info("====>testSendablePreferencesOffErr0200 catch: " + JSON.stringify(err));
                expect().assertFail();
                done();
                }
        })




        /**
         * @tc.name getPreferences_deleteSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5300
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesDeleteSyncInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                mPreferences.deleteSync(undefine);
                expect().assertFail();
                done();
            } catch (error) {
                console.info('removePreferencesFromCacheSync is fail' + err.code);
                expect(401).assertEqual(err.code);
                done();
            }
        })



        /**
         * @tc.name getPreferences_deleteSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5400
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesDeleteSyncInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                mPreferences.hasSync(undefine);
                expect().assertFail();
                done();
            } catch (error) {
                console.info('removePreferencesFromCacheSync is fail' + err.code);
                expect(401).assertEqual(err.code);
                done();
            }
        })


        /**
         * @tc.name getPreferences_deleteSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5500
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */


        it('testGetPreferencesDeleteSyncInvalidInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            try {
                mPreferences.getAll((err, undefine) => {
                    if (err) {
                        console.error("Failed to get all key-values. code =" + err.code + ", message =" + err.message);
                        expect(401).assertEqual(err.code);
                        done();
                        }
                    })
            } catch (error) {
                console.info('removePreferencesFromCacheSync is fail' + err.code);
                expect().assertFail();
                done();
            }
        })


        /**
         * @tc.name getPreferencesSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5600
         * @tc.desc getPreferencesSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testPreferencesOnObserver0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                await mPreferences.clear();
                mPreferences.on('dataChange', (key: string) => {
                    expect(err.code).assertEqual(401);
                    console.info("The key " + key + " changed.");
                    done();
                });
            } catch (error) {
                console.error("Failed to flush. Cause: " + err);
                expect().assertFail();
                done();
            }
        })




        /**
        * @tc.name getPreferencesCallback interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5700
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesCallbackErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            mPreferences getPreferences(context, options, (err: BusinessError, val: preferences.Preferences) => {
                if (err) {
                    console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
                    }
            })
            mPreferences getPreferences(context, options1, (err: BusinessError, val: preferences.Preferences) => {
                if (err) {
                    console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
                    }
            })
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })



        /**
        * @tc.name getPreferencesCallback interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5700
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesPromiserr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences getPreferences(context, options);
            await mPreferences getPreferences(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })


        /**
        * @tc.name getPreferencesCallback interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5800
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesgetPreferencesSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences getPreferencesSync(context, options);
            await mPreferences getPreferencesSync(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })



        /**
        * @tc.name getPreferencesCallback interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5900
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesDeletePreferencesCallbackErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            mPreferences deletePreferences(context, options, (err: BusinessError, val: preferences.Preferences) => {
                if (err) {
                    console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
                    }
            })
            mPreferences deletePreferences(context, options1, (err: BusinessError, val: preferences.Preferences) => {
                if (err) {
                    console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
                    }
            })
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })




        /**
        * @tc.name getPreferencesCallback interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_6000
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesDeletePreferencesPromiserr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences deletePreferences(context, options);
            await mPreferences deletePreferences(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })



        /**
        * @tc.name getPreferencesCallback interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_6100
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesRemovePreferencesFromCacheCallbackErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            mPreferences removePreferencesFromCache(context, options, (err: BusinessError, val: preferences.Preferences) => {
                if (err) {
                    console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
                    }
            })
            mPreferences removePreferencesFromCache(context, options1, (err: BusinessError, val: preferences.Preferences) => {
                if (err) {
                    console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
                    }
            })
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })





        /**
        * @tc.name getPreferencesCallback interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_6200
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesRemovePreferencesFromCachePromiserr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences removePreferencesFromCache(context, options);
            await mPreferences removePreferencesFromCache(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('removePreferencesFromCache is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })




        /**
        * @tc.name removePreferencesFromCacheSync interface test
        * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_5800
        * @tc.desc put PutNumber promise interface test
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */

        it('testPreferencesremovePreferencesFromCacheSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences removePreferencesFromCacheSync(context, options);
            await mPreferences removePreferencesFromCacheSync(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }
        })





    })
}