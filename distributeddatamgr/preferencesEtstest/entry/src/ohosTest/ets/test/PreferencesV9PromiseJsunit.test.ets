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
import data_preferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const NAME = 'v9_test_preferences_promise'
const KEY_TEST_INT_ELEMENT = 'key_test_int'
const KEY_TEST_STRING_ELEMENT = 'key_test_string'
var mPreference
export default function preferencesV9PromiseTest(){
    describe('preferencesV9PromiseTest', async function () {
        beforeAll(async function () {
            console.info('beforeAll')
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
        })

        afterAll(async function () {
            console.info('afterAll')
        })

        beforeEach(async function () {
            console.info('beforeEach')
            mPreference = await data_preferences.getPreferences(context, NAME)
            await mPreference.clear();
            await mPreference.flush();
            await mPreference.put(KEY_TEST_STRING_ELEMENT, '123');
        })

        afterEach(async function () {
            console.info('afterEach')
            await data_preferences.deletePreferences(context, NAME)
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0100
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0200
         * @tc.desc   flush String callback interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0100 begin.")
            try{
                if(mPreference== undefined) {
                    console.log("mPreference undefined")
                    expect(false).assertTrue()
                }
                mPreference.clear().then(()=>{
                    mPreference.put(KEY_TEST_STRING_ELEMENT, '123').then((ret)=>{
                        mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue").then((pre)=>{
                            expect('123').assertEqual(pre)
                            mPreference.flush().then(()=>{
                                data_preferences.removePreferencesFromCache(context, NAME).then(()=>{
                                    mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue").then((pre2)=>{
                                        expect('123').assertEqual(pre2)
                                        done()
                                        console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0100 end.")
                                    }).catch((err) => {
                                        console.log("get err =" + err + ", code =" + err.code +", message =" + err.message)
                                        expect(false).assertTrue()
                                    })
                                }).catch((err) => {
                                    console.log("removePreferencesFromCache err =" + err + ", code =" + err.code +", message =" + err.message)
                                    expect(false).assertTrue()
                                })
                            }).catch((err) => {
                                console.log("flush err =" + err + ", code =" + err.code +", message =" + err.message)
                                expect(false).assertTrue()
                            })
                        }).catch((err) => {
                            console.log("get err =" + err + ", code =" + err.code +", message =" + err.message)
                            expect(false).assertTrue()
                        })
                    }).catch((err) => {
                        console.log("put err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    })
                }).catch((err) => {
                    console.log("clear err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0200
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0900
         * @tc.desc   mPreference.get()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0200 begin.")
            try{
                mPreference.get(1233).then((ret)=>{
                    console.log("get err")
                    expect(false).assertTrue()
                }).catch((err) => {
                    console.log("get err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                done()
                console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0200 end.")
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0300
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0800
         * @tc.desc   mPreference.get()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0300 begin.")
            try{
                mPreference.get(KEY_TEST_STRING_ELEMENT, KEY_TEST_INT_ELEMENT).then((ret) => {
                    done()
                    expect('123').assertEqual(ret)
                    console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0300 end.")
                }).catch((err) => {
                    console.log("get err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0400
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0700
         * @tc.desc   mPreference.getAll()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0400 begin.")
            try {
                mPreference.getAll().then((ret) => {
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0400 end.")
                }).catch((err) => {
                    console.log("getAll err =" + err + ", code =" + err.code + ", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0500
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1100
         * @tc.desc   mPreference.has()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0500 begin.")
            try{
                mPreference.has(123).then((val)=>{
                    console.log("has err")
                    expect(false).assertTrue()
                }).catch((err) => {
                    console.log("has err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                done()
                console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0500 end.")
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0600
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1000
         * @tc.desc   mPreference.has()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0600 begin.")
            try{
                mPreference.has(KEY_TEST_STRING_ELEMENT).then((val)=>{
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0600 end.")
                }).catch((err) => {
                    console.log("has err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0700
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1700
         * @tc.desc   mPreference.put()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0700 begin.")
            try{
                mPreference.put(1233).then(()=>{
                    console.log("put err")
                    expect(false).assertTrue()
                }).catch((err) => {
                    console.log("put err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                done()
                console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0700 end.")
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0800
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1500
         * @tc.desc   mPreference.put()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0800 begin.")
            try{
                mPreference.put(KEY_TEST_STRING_ELEMENT, KEY_TEST_INT_ELEMENT).then(()=>{
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0800 end.")
                }).catch((err) => {
                    console.log("put err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_0900
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0500
         * @tc.desc   fmPreference.delete()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0900 begin.")
            try{
                mPreference.delete(1233).then(()=>{
                    console.log("delete err")
                    expect(false).assertTrue()
                }).catch((err) => {
                    console.log("delete err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                done()
                console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0900 end.")
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1000
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0400
         * @tc.desc   mPreference.delete()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1000 begin.")
            try{
                mPreference.delete(KEY_TEST_STRING_ELEMENT).then(()=>{
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_0500 end.")
                }).catch((err) => {
                    console.log("delete err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1100
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0300
         * @tc.desc   mPreference.flush()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1100 begin.")
            try{
                mPreference.clear().then(()=>{
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1100 end.")
                }).catch((err) => {
                    console.log("clear err =" + err + ", code =" + err.code +", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1200
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0600
         * @tc.desc   mPreference.flush()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1200 begin.")
            try {
                mPreference.flush().then(() => {
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1200 end.")
                }).catch((err) => {
                    console.log("flush err =" + err + ", code =" + err.code + ", message =" + err.message)
                    expect(false).assertTrue()
                })
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1300
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_0100
         * @tc.desc   mPreference.on()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1300 begin.")
            try {
                mPreference.clear();
                var observer = function (key) {
                    if (key) {
                        console.info('SUB_DDM_JSPREFERENCEV9_PROMISE_1300 key' + key);
                        expect(false).assertTrue()
                    }
                    expect("abcd").assertEqual(key);
                };
                await mPreference.on('change', observer);
                await mPreference.put(KEY_TEST_STRING_ELEMENT, "abcd");
                mPreference.off('change', observer);
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1400
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1600
         * @tc.desc   mPreference.on()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1400 begin.")
            let mPreference1 = await data_preferences.getPreferences(context, NAME)
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_PROMISE_1400 key' + key);
                    done();
                    expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
                };
                mPreference1.on('change', observer);
                await mPreference1.put(KEY_TEST_STRING_ELEMENT, "abc");
                await mPreference1.flush();
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1500
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1400
         * @tc.desc   mPreference.off()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1500 begin.")
            await mPreference.clear();
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_PROMISE_1500 key' + key);
                    expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
                };
                mPreference.on('sschange', observer);
                expect(false).assertTrue()
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                done();
            }
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1600
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1200
         * @tc.desc   mPreference.off()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1600 begin.")
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_PROMISE_1600 key' + key);
                };
                mPreference.on('change', observer);
                mPreference.off('sschange', observer);
                expect(false).assertTrue()
                await mPreference.put(KEY_TEST_STRING_ELEMENT, "abb");
                await mPreference.flush();
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                mPreference.off('change', observer);
            }
            done();
        })

        /**
         * @tc.name   SUB_DDM_JSPREFERENCEV9_PROMISE_1700
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiPromiseTest_1300
         * @tc.desc   mPreference.off()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DDM_JSPREFERENCEV9_PROMISE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_PROMISE_1700 begin.")
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_PROMISE_1700 key' + key);
                };
                mPreference.on('change', observer);
                mPreference.off('change', "observer");
                expect(false).assertTrue()
                await mPreference.put(KEY_TEST_STRING_ELEMENT, "abb");
                await mPreference.flush();
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                mPreference.off('change', observer);
            }
            done();
        })
    })
}