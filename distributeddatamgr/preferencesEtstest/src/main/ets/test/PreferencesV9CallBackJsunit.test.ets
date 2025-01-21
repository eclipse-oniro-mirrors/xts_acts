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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import data_preferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const NAME = 'v9_test_preferences_callback'
const KEY_TEST_INT_ELEMENT = 'key_test_int'
const KEY_TEST_STRING_ELEMENT = 'key_test_string'
var mPreference = undefined
export default function preferencesV9CallbackTest(){
    describe('preferencesV9CallbackTest', async function () {
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
            mPreference.put(KEY_TEST_STRING_ELEMENT, 'abc', function (err, ret) {
                if (err) {
                  console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message)
                  expect(false).assertTrue()
                }
              })
        })

        afterEach(async function () {
            console.info('afterEach')
            await data_preferences.deletePreferences(context, NAME)
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0100
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0200
         * @tc.desc flush String callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0100', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0100 begin.")
            try{
                mPreference.clear(function (err, val) {
                    if(err){
                        console.log("clear err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    mPreference.put(KEY_TEST_STRING_ELEMENT, 'abc', function (err, ret) {
                        if(err){
                            console.log("put err =" + err + ", code =" + err.code +", message =" + err.message)
                            expect(false).assertTrue()
                        }
                        mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
                            if(err){
                                console.log("get err =" + err + ", code =" + err.code +", message =" + err.message)
                                expect(false).assertTrue()
                            }
                            expect('abc').assertEqual(pre)
                            mPreference.flush(function (err, val) {
                                if(err){
                                    console.log("flush err =" + err + ", code =" + err.code +", message =" + err.message)
                                    expect(false).assertTrue()
                                }
                                data_preferences.removePreferencesFromCache(context, NAME,(err)=>{
                                    if(err){
                                        console.log("removePreferencesFromCache err =" + err + ", code =" + err.code +", message =" + err.message)
                                        expect(false).assertTrue()
                                    }
                                    mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre2) {
                                        if(err){
                                            console.log("get err =" + err + ", code =" + err.code +", message =" + err.message)
                                            expect(false).assertTrue()
                                        }
                                        expect('abc').assertEqual(pre2)
                                        done()
                                        console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0100 end.")
                                    })
                                })
                            })
                        })
                    })
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0200
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0900
         * @tc.desc mPreference.get()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0200', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0200 begin.")
            try {
                mPreference.get(123, function (err, val) {
                    if (err) {
                        console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message)
                        expect().assertFail()
                    }
                    expect().assertFail()
                })
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                done()
                expect(error.code == 401).assertTrue();
                console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0200 end.")
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0300
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0800
         * @tc.desc mPreference.get()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0300', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0300 begin.")
            try {
                mPreference.get(KEY_TEST_STRING_ELEMENT, KEY_TEST_INT_ELEMENT, function (err, val) {
                    if (err) {
                        console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    expect('abc').assertEqual(val)
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0300 end.")
                })
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0400
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0700
         * @tc.desc mPreference.getAll()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0400', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0400 begin.")
            try {
                mPreference.getAll(function (err, val) {
                    if (err) {
                        console.log("getAll err =" + err + ", code =" + err.code + ", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    console.log("getAll val = " + JSON.stringify(val))
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0400 end.")
                })
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                expect(false).assertTrue()
            }
            done()
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0500
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1100
         * @tc.desc mPreference.has()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0500', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0500 begin.")
            try{
                mPreference.has(123,function (err, val) {
                    console.log("has err")
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                done()
                console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0500 end.")
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0600
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1000
         * @tc.desc mPreference.has()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0600', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0600 begin.")
            try{
                mPreference.has(KEY_TEST_STRING_ELEMENT, function (err, val) {
                    if (err) {
                        console.log("has err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    expect(true).assertEqual(val)
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0600 end.")
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0700
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1700
         * @tc.desc mPreference.put()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0700', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0700 begin.")
            try{
                mPreference.put(123, function (err) {
                    console.log("put err")
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                done()
                console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0700 end.")
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0800
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1500
         * @tc.desc mPreference.put()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0800', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0800 begin.")
            try{
                mPreference.put(KEY_TEST_STRING_ELEMENT, KEY_TEST_INT_ELEMENT, function (err) {
                    if (err) {
                        console.log("put err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0800 end.")
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_0900
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0500
         * @tc.desc mPreference.delete()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_0900', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0900 begin.")
            try{
                mPreference.delete(1233, function(err) {
                    if (err) {
                        console.log("delete err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    console.log("delete err")
                    expect(false).assertTrue()
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                done()
                console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_0900 end.")
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_1000
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0400
         * @tc.desc mPreference.delete()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1000', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1000 begin.")
            try{
                mPreference.delete(KEY_TEST_STRING_ELEMENT, function(err) {
                    if (err) {
                        console.log("delete err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1000 end.")
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_1100
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0300
         * @tc.desc mPreference.clear()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1100', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1100 begin.")
            try{
                mPreference.clear(function (err) {
                    if (err) {
                        console.log("clear err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1100 end.")
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_1200
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0600
         * @tc.desc mPreference.flush()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1200', 0, function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1200 begin.")
            try{
                mPreference.flush(function (err) {
                    if (err) {
                        console.log("flush err =" + err + ", code =" + err.code +", message =" + err.message)
                        expect(false).assertTrue()
                    }
                    done()
                    console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1200 end.")
                })
            } catch(err) {
                console.log("trycatch err =" + err + ", code =" + err.code +", message =" + err.message)
                expect(false).assertTrue()
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_1300
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_0100
         * @tc.desc mPreference.on()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1300', 0, async function () {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1300 begin.")
            try {
                mPreference.clear();
                var observer = function (key) {
                    if (key) {
                        console.info('SUB_DDM_JSPREFERENCEV9_CALLBACK_1300 key' + key);
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
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_1400
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1600
         * @tc.desc mPreference.on()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1400', 0, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1400 begin.")
            await mPreference.clear();
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_CALLBACK_1400 key' + key);
                    done();
                    expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
                };
                mPreference.on('change', observer);
                await mPreference.put(KEY_TEST_STRING_ELEMENT, "abc");
                await mPreference.flush();
            } catch (err) {
                console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message)
                expect(false).assertTrue()
            } finally {
                mPreference.off('change', observer);
            }
        })

        /**
         * @tc.name SUB_DDM_JSPREFERENCEV9_CALLBACK_1500
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1400
         * @tc.desc mPreference.off()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1500', 0, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1500 begin.")
            await mPreference.clear();
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_CALLBACK_1500 key' + key);
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
         * @tc.name  SUB_DDM_JSPREFERENCEV9_CALLBACK_1600
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1200
         * @tc.desc  mPreference.off()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1600', 0, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1600 begin.")
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_CALLBACK_1600 key' + key);
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
         * @tc.name  SUB_DDM_JSPREFERENCEV9_CALLBACK_1700
         * @tc.number SUB_DistributedData_Preference_SDK_PreferenceV9EtsApiCallbackTest_1300
         * @tc.desc  mPreference.off()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_JSPREFERENCEV9_CALLBACK_1700', 0, async function (done) {
            console.log("SUB_DDM_JSPREFERENCEV9_CALLBACK_1700 begin.")
            try {
                var observer = function (key) {
                    console.info('SUB_DDM_JSPREFERENCEV9_CALLBACK_1700 key' + key);
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