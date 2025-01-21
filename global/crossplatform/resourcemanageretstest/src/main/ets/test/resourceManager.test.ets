/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import resourceManager from '@ohos.resourceManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function resourceManagerTest() {
describe('resourceManagerTest', function () {
    console.log('*************start resourceManagerTest*************');

    /* *
    * @tc.number  TEST_DIRECTION_VERTICAL_001
    * @tc.name    test DIRECTION_VERTICAL
    * @tc.desc    get the value of DIRECTION_VERTICAL
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 0
    */
    it('testDirectionVertical001', 0, async function (done) {
        console.log('testDirectionVertical001 0');
        expect(resourceManager.Direction.DIRECTION_VERTICAL).assertEqual(0);
        console.log('testDirectionVertical001 1');
        done();
    })

    /* *
   * @tc.number  TEST_DIRECTION_HORIZONTAL_001
   * @tc.name    test DIRECTION_HORIZONTAL
   * @tc.desc   get the value of DIRECTION_HORIZONTAL
   * @tc.size:    MediumTest
   * @tc.type     method
   * @tc.level    level 0
   */
    it('testDirectionHorizontal001', 0, async function (done) {
        console.log('testDirectionHorizontal001 0');
        expect(resourceManager.Direction.DIRECTION_HORIZONTAL).assertEqual(1);
        console.log('testDirectionHorizontal001 1');
        done();
    })

    /* *
        * @tc.number  TEST_DEVICE_TYPE_PHONE_001
        * @tc.name    test DEVICE_TYPE_PHONE
        * @tc.desc    get  the value of DEVICE_TYPE_PHONE
        * @tc.size:    MediumTest
        * @tc.type     method
        * @tc.level    level 0
        */
    it('testDeviceTypePhone001', 0, async function (done) {
        console.log('testDeviceTypePhone001 0');
        expect(resourceManager.DeviceType.DEVICE_TYPE_PHONE).assertEqual(0);
        console.log('testDeviceTypePhone001 1');
        done();
    })

    /* *
    * @tc.number  TEST_DEVICE_TYPE_TABLET_001
    * @tc.name    test DEVICE_TYPE_TABLET
    * @tc.desc    get the value of DEVICE_TYPE_TABLET
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 0
    */
    it('testDeviceTypeTable001', 0, async function (done) {
        console.log('testDeviceTypeTable001 0');
        expect(resourceManager.DeviceType.DEVICE_TYPE_TABLET).assertEqual(1);
        console.log('testDeviceTypeTable001 1');
        done();
    })

    /* *
    * @tc.number  TEST_DEVICE_TYPE_CAR_001
    * @tc.name    test DEVICE_TYPE_CAR
    * @tc.desc    get the value of DEVICE_TYPE_CAR
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 0
    */
    it('testDeviceTypeCar001', 0, async function (done) {
        console.log('testDeviceTypeCar001 0');
        expect(resourceManager.DeviceType.DEVICE_TYPE_CAR).assertEqual(2);
        console.log('testDeviceTypeCar001 1');
        done();
    })

    /* *
    * @tc.number  TEST_DEVICE_TYPE_PC_001
    * @tc.name    test DEVICE_TYPE_PC
    * @tc.desc    get the value of DEVICE_TYPE_PC
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 0
    */
    it('testDeviceTypePC001', 0, async function (done) {
        console.log('testDeviceTypePC001 0');
        expect(resourceManager.DeviceType.DEVICE_TYPE_PC).assertEqual(3);
        console.log('testDeviceTypePC001 1');
        done();
    })

    /* *
    * @tc.number  TEST_DEVICE_TYPE_TV_001
    * @tc.name    test DEVICE_TYPE_TV
    * @tc.desc    get the value of DEVICE_TYPE_TV
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 0
    */
    it('testDeviceTypeTV001', 0, async function (done) {
        console.log('testDeviceTypeTV001 0');
        expect(resourceManager.DeviceType.DEVICE_TYPE_TV).assertEqual(4);
        console.log('testDeviceTypeTV001 1');
        done();
    })

    /* *
    * @tc.number  TEST_DEVICE_TYPE_WEARABLE_001
    * @tc.name    test DEVICE_TYPE_WEARABLE
    * @tc.desc    get the 
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 0
    */
    it('testDeviceTypeWearable001', 0, async function (done) {
        console.log('testDeviceTypeWearable001 0');
        expect(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE).assertEqual(6);
        console.log('testDeviceTypeWearable001 1');
        done();
    })


     /* *
    * @tc.number:  TEST_SCREEN_SDIP_001
    * @tc.name:    test SCREEN_SDPI
    * @tc.desc:    get the value of SCREEN_SDPI
    * @tc.size:    MediumTest
    * @tc.type     enum
    * @tc.level    level 0
    */
    it('testScreenSdip001', 0, async function (done) {
        console.log('testScreenSdip001 0');
        expect(resourceManager.ScreenDensity.SCREEN_SDPI).assertEqual(120);
        console.log('testScreenSdip001 1');
        done();
    })

     /* *
    * @tc.number  TEST_SCREEN_MDPI_001
    * @tc.name    test SCREEN_MDPI
    * @tc.desc    get the value of SCREEN_MDPI
    * @tc.size:    MediumTest
    * @tc.type     enum
    * @tc.level    level 0
    */
    it('testScreenMdpi001', 0, async function (done) {
        console.log('testScreenMdpi001 0');
        expect(resourceManager.ScreenDensity.SCREEN_MDPI).assertEqual(160);
        console.log('testScreenMdpi001 1');
        done();
    })

     /* *
    * @tc.number  TEST_SCREEN_LDPI-001
    * @tc.name    test SCREEN_LDPI
    * @tc.desc    get the value of SCREEN_LDPI
    * @tc.size:    MediumTest
    * @tc.type     enum
    * @tc.level    level 0
    */
    it('testScreenLdpi001', 0, async function (done) {
        console.log('testScreenLdpi001 0');
        expect(resourceManager.ScreenDensity.SCREEN_LDPI).assertEqual(240);
        console.log('testScreenLdpi001 1');
        done();
    })

    /* *
    * @tc.number  TEST_SCREEN_XLDPI_001
    * @tc.name    test SCREEN_XLDPI
    * @tc.desc    get the value of SCREEN_XLDPI
    * @tc.size:    MediumTest
    * @tc.type     enum
    * @tc.level    level 0
    */
    it('testScreenXldpi001', 0, async function (done) {
        console.log('testScreenXldpi001 0');
        expect(resourceManager.ScreenDensity.SCREEN_XLDPI).assertEqual(320);
        console.log('testScreenXldpi001 1');
        done();
    })

    /* *
    * @tc.number  TEST_SCREEN_XXLDPI_001
    * @tc.name    test SCREEN_XXLDPI
    * @tc.desc    get the value of SCREEN_XXLDPI
    * @tc.size:    MediumTest
    * @tc.type     enum
    * @tc.level    level 0
    */
    it('testScreenXxldpi001', 0, async function (done) {
        console.log('testScreenXxldpi001 0');
        expect(resourceManager.ScreenDensity.SCREEN_XXLDPI).assertEqual(480);
        console.log('testScreenXxldpi001 1');
        done();
    })

    /* *
    * @tc.number  TEST_SCREEN_XXXLDPI_001
    * @tc.name    test SCREEN_XXXLDPI
    * @tc.desc    get the value of SCREEN_XXXLDPI
    * @tc.size:    MediumTest
    * @tc.type     enum
    * @tc.level    level 0
    */
    it('testScreenXxxldpi001', 0, async function (done) {
        console.log('testScreenXxxldpi001 0');
        expect(resourceManager.ScreenDensity.SCREEN_XXXLDPI).assertEqual(640);
        console.log('testScreenXxxldpi001 1');
        done();
    })

    /* *
    * @tc.number  TEST_GETSTRINGVALUERERESOURCECALLBACK_001
    * @tc.name    test getString method in callback mode
    * @tc.desc    get the string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResourceCallback001', 0, async function (done) {
        globalThis.abilityContext.resourceManager.getStringValue({ bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
            moduleName:"entry_test",
            id:$r('app.string.test_1').id}, (err, value) => {
            expect(value !== null).assertTrue();
            console.log('testGetStringValueResourceCallback001 ' + value);
            done();
        })
    })

    /* *
    * @tc.number  TEST_GETSTRINGVALUERESOURCEPROMISE_001
    * @tc.name    test getString method in promise mode
    * @tc.desc    get the string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResourcePromise001', 0, async function (done) {
        globalThis.abilityContext.resourceManager.getStringValue({ bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
            moduleName:"entry_test",
            id:$r('app.string.test_1').id}).then(value => {
            console.info(`testGetStringValueResourcePromise001 ${JSON.stringify(Error)}`)
            expect(value !== null).assertTrue();
            console.log('testGetStringValueResourcePromise001 ' + value);
        })
        done();
    })

    /* *
    * @tc.number  TEST_GETSTRINGVALUERESIDCALLBACK_001
    * @tc.name    test getString method in callback mode
    * @tc.desc    get the string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdCallback001', 0, async function (done) {
        globalThis.abilityContext.resourceManager.getStringValue($r('app.string.test_1').id, (err, value) => {
            expect(value !==null).assertTrue();
            console.log('testGetStringValueResIdCallback001 ' + value);
            expect(value).assertEqual('Test1');
            done();
        })
    })

    /* *
    * @tc.number  TEST_GETSTRINGVALUERESIDCallback_002
    * @tc.name    test getString method in callback mode
    * @tc.desc    get the string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdCallback002', 0, async function (done) {
        try{
            // 0x1001 id not exist,throw 9001001 error code
            globalThis.abilityContext.resourceManager.getStringValue(0x1001, (err, value) => {
                if(err){
                    console.log('testGetStringValueResIdCallback002 err.code' + err.code);
                    console.log('testGetStringValueResIdCallback002 err.message' + err.message);
                    expect(err.code == 9001001).assertTrue();
                    done();
                }else{
                    console.log('testGetStringValueResIdCallback002 2');
                    expect(value !== null).assertTrue();
                    console.log('testGetStringValueResIdCallback002 ' + value);
                    done();
                }
            })
        }catch(e){
            console.log('testGetStringValueResIdCallback002 e.code' + e.code);
            console.log('testGetStringValueResIdCallback002 e.message' + e.message);
        }
    })

    /* *
    * @tc.number   TEST_GETSTRINGVALUERESIDCALLBACK_003
    * @tc.name     test getString method in callback mode
    * @tc.desc     get the string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdCallback003', 0, async function (done) {
            try{
                // 0x01000000 id is integer resource,throw 9001002 error code
                globalThis.abilityContext.resourceManager.getStringValue($r('app.integer.integer_1').id, (err, value) => {
                    if(err){
                        console.log('testGetStringValueResIdCallback003 err.code' + err.code);
                        console.log('testGetStringValueResIdCallback003 err.message' + err.message);
                        expect(err.code == 9001002).assertTrue();
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('testGetStringValueResIdCallback003 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('testGetStringValueResIdCallback003 e.code' + e.code);
                console.log('testGetStringValueResIdCallback003 e.message' + e.message);
            }

    })

    /* *
    * @tc.number   TEST_GETSTRINGVALUERESIDCALLBACK_004
    * @tc.name     test getString method in callback mode
    * @tc.desc     get the string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdCallback004', 0, async function (done) {
            try{
                // 0x01000006 id re-ref,throw 9001006 error code
                globalThis.abilityContext.resourceManager.getStringValue($r('app.string.Test_name1').id, (err, value) => {
                    if(err){
                        console.log('testGetStringValueResIdCallback004 err.code' + err.code);
                        console.log('testGetStringValueResIdCallback004 err.message' + err.message);
                        expect(err.code == 9001006).assertTrue();
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('testGetStringValueResIdCallback004 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('testGetStringValueResIdCallback004 e.code' + e.code);
                console.log('testGetStringValueResIdCallback004 e.message' + e.message);
            }
    })

    /* *
    * @tc.number   TEST_GETSTRINGVALUERESIDCALLBACK_005
    * @tc.name     test getString method in callback mode
    * @tc.desc     get the string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdCallback005', 0, async function (done) {
            try{
                // param type not correct,throw 401 error code
                globalThis.abilityContext.resourceManager.getStringValue('name', (err, value) => {
                    if(err){
                        console.log('testGetStringValueResIdCallback005 err.code:' + err.code);
                        console.log('testGetStringValueResIdCallback005 err.message:' + err.message);
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('testGetStringValueResIdCallback005 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('testGetStringValueResIdCallback005 e.code:' + e.code);
                console.log('testGetStringValueResIdCallback005 e.message' + e.message);
                expect(e.code == 401).assertTrue();
                done();
            }
    })

    /* *
        * @tc.number  TEST_GETSTRINGVALUERESIDPROMISE_001
        * @tc.name    test getString method in promise mode
        * @tc.desc    get the string in promise mode
        * @tc.size:    MediumTest
        * @tc.type     method
        * @tc.level    level 2
        */

    it('testGetStringValueResIdPromise001', 0, async function (done) {
        globalThis.abilityContext.resourceManager.getStringValue($r('app.string.test_1').id).then(value => {
            expect(value !== null).assertTrue();
            console.log('testGetStringValueResIdPromise001 ' + value);
            expect(value).assertEqual('Test1');
            done();
        })
    })

    /* *
    * @tc.number TEST_GETSTRINGVALUERESIDPROMISE_002
    * @tc.name   test getString method in promise mode
    * @tc.desc   get the string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdPromise002', 0, async function (done) {
            try{
                // 0x1001 id not exist,throw 9001001 error code
                globalThis.abilityContext.resourceManager.getStringValue(0x1001).then(value => {
                    expect(value !== null).assertTrue();
                    console.log('testGetStringValueResIdPromise002 ' + value);
                    expect(value).assertEqual('Test1');
                    done();
                }).catch(error => {
                    console.log('testGetStringValueResIdPromise002 error.code' + error.code);
                    console.log('testGetStringValueResIdPromise002 error.message' + error.message);
                    expect(error.code == 9001001).assertTrue();
                    done();
                })
            } catch (err){
                console.log('testGetStringValueResIdPromise002 err.code' + err.code);
                console.log('testGetStringValueResIdPromise002 err.message' + err.message);
                done();
            }
    })

    /* *
    * @tc.number TEST_GETSTRINGVALUERESIDPROMISE_003
    * @tc.name   test getString method in promise mode
    * @tc.desc   get the string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdPromise003', 0, async function (done) {
            try{
                // 0x01000000 id is integer resource,throw 9001002 error code
                console.log('testGetStringValueResIdPromise003 promise start');
                globalThis.abilityContext.resourceManager.getStringValue($r('app.integer.integer_1').id).then(value => {
                    console.log('testGetStringValueResIdPromise003 promise try' + value);
                    expect(value !== null).assertTrue();
                    console.log('testGetStringValueResIdPromise003 ' + value);
                    expect(value).assertEqual('Test1');
                    done();
                }).catch(error => {
                    console.log('testGetStringValueResIdPromise003 promise catch');
                    console.log('testGetStringValueResIdPromise003 error.code' + error.code);
                    console.log('testGetStringValueResIdPromise003 error.message' + error.message);
                    expect(error.code == 9001002).assertTrue();
                    done();
                })
            } catch (err){
                console.log('testGetStringValueResIdPromise003 err.code' + err.code);
                console.log('testGetStringValueResIdPromise003 err.message' + err.message);
                done();
            }
            console.log('testGetStringValueResIdPromise003 promise end');
    })

    /* *
    * @tc.number TEST_GETSTRINGVALUERESIDPROMISE_004
    * @tc.name   test getString method in promise mode
    * @tc.desc   get the string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringValueResIdPromise004', 0, async function (done) {
            try{
                // 0x01000006 id re-ref,throw 9001006 error code
                globalThis.abilityContext.resourceManager.getStringValue($r('app.string.Test_name1').id).then(value => {
                    expect(value !== null).assertTrue();
                    console.log('testGetStringValueResId009 ' + value);
                    expect(value).assertEqual('Test1');
                    done();
                }).catch(error => {
                    console.log('testGetStringValueResIdPromise004 error.code' + error.code);
                    console.log('testGetStringValueResIdPromise004 error.message' + error.message);
                    expect(error.code == 9001006).assertTrue();
                    done();
                })
            } catch (err){
                console.log('testGetStringValueResIdPromise004 err.code' + err.code);
                console.log('testGetStringValueResIdPromise004 err.message' + err.message);
                done();
            }
    })

    /* *
    * @tc.number TEST_GETSTRINGVALUERESIDPROMISE_005
    * @tc.name   test getStringValue method in promise mode
    * @tc.desc   get the string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
     it('testGetStringValueResIdPromise005', 0, async function (done) {
            try{
                // param type not correct,throw 401 error code
                globalThis.abilityContext.resourceManager.getStringValue('name').then(value => {
                    expect(value !== null).assertTrue();
                    console.log('testGetStringValueResIdPromise005 ' + value);
                    expect(value).assertEqual('Test1');
                    done();
                }).catch(error => {
                    console.log('testGetStringValueResIdPromise005 error.code' + error.code);
                    console.log('testGetStringValueResIdPromise005 error.message' + error.message);
                    expect(error.code == 401).assertTrue();
                    done();
                })
            } catch (err){
                console.log('testGetStringValueResIdPromise005 err.code' + err.code);
                console.log('testGetStringValueResIdPromise005 err.message' + err.message);
                done();
            }
    })

    /* *
    * @tc.number  TEST_GETSTRINGARRAYVALUERESOURCECALLBACK_001
    * @tc.name    test getStringValue method in callback mode
    * @tc.desc    get the string array in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStartArrayValueResourceCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getStringArrayValue({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.strarray.sizeList').id}, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetStartArrayValueResourceCallback001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETSTRINGARRAYVALUERESOURCEPROMISE_001
    * @tc.name    test getStringArrayValue method in promise mode
    * @tc.desc    get the string array in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStartArrayValueResourcePromise001', 0, async function (done) {
             globalThis.abilityContext.resourceManager.getStringArrayValue({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.strarray.sizeList').id}).then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetStartArrayValueResourcePromise001 ' + value);
            })
        done();
    })

    /* *
    * @tc.number  TEST_GETSTARTARRAYVALUERESIDCALLBACK_001
    * @tc.name    test getStringArrayValue method in callback mode
    * @tc.desc    get the string array in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStartArrayValueResIdCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getStringArrayValue($r('app.strarray.sizeList').id, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetStartArrayValueResIdCallback001 ' + value);
                console.log('testGetStartArrayValueResIdCallback001 ' + value.length);
                console.log('testGetStartArrayValueResIdCallback001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETSTARTARRAYVALUERESIDPROMISE_001
    * @tc.name    test getStringArrayValue method in promise mode
    * @tc.desc    get the string array in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStartArrayValueResIdPromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getStringArrayValue($r('app.strarray.sizeList').id).then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetStartArrayValueResIdPromise001 ' + value);
                console.log('testGetStartArrayValueResIdPromise001 ' + value.length);
                console.log('testGetStartArrayValueResIdPromise001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
    })


    /* *
    * @tc.number  TEST_GETMEDIACONTENTRESOURCECALLBACK_001
    * @tc.name    test getMediaContent method in callback mode
    * @tc.desc    get the media in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentResourceCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContent({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.media.icon').id}, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetMediaContentResourceCallback001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETMEDIACONTENTRESOURCEPROMISE_001
    * @tc.name    test getMediaContent method in promise mode
    * @tc.desc    get the media in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentResourcePromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContent({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.media.icon').id}).then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetMediaContentResourcePromise001 ' + value);
            })
        done();
    })

    /* *
    * @tc.number  TEST_GETMEDIACONTENTRESIDCALLBACK_001
    * @tc.name    test getMediaContent method in callback mode
    * @tc.desc    get the media in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentResIdCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContent($r('app.media.icon').id, (err, value) => {
                console.log('testGetMediaContentResIdCallback001 ' + value.length);
                expect(value.length > 0).assertTrue();
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETMEDIACONTENTRESIDPROMISE_001
    * @tc.name    test getMediaContent method in callback mode
    * @tc.desc    get the media in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentResIdPromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContent($r('app.media.icon').id).then(value => {
                console.log('testGetMediaContentResIdPromise001 ' + value.length);
                expect(value.length > 0).assertTrue();
                done();
            })
    })


     /* *
    * @tc.number  TEST_GETMEDIACONTENTBASE64RESOURCECALLBACK_001
    * @tc.name    test getMediaContentBase64 method in callback mode
    * @tc.desc    get the media base64 in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentBase64ResourceCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContentBase64({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.media.icon').id}, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetMediaContentBase64ResourceCallback001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETMEDIACONTENTBASE64RESOURCEPROMISE_001
    * @tc.name    test getMediaContentBase64 method in promise mode
    * @tc.desc    get the media base64 in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentBase64ResourcePromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContentBase64({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.media.icon').id}).then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetMediaContentBase64ResourcePromise001 ' + value);
            })
        done();
    })

    /* *
    * @tc.number  TEST_GETMEDIACONTENTBASE64RESIDCALLBACK_001
    * @tc.name    test getMediaContentBase64 method in callback mode
    * @tc.desc    get the media base64 in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentBase64ResIdCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContentBase64($r('app.media.icon').id, (err, value) => {
                expect(value.length > 0).assertTrue();
                console.log('testGetMediaContentBase64ResIdCallback001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETMEDIACONTENTBASE64RESIDPROMISE_001
    * @tc.name    test getMediaContentBase64 method in promise mode
    * @tc.desc    get the media base64 in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaContentBase64ResIdPromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaContentBase64($r('app.media.icon').id).then(value => {
                expect(value.length > 0).assertTrue();
                console.log('testGetMediaContentBase64ResIdPromise001 ' + value);
                done();
            })
    })

     /* *
    * @tc.number  TEST_GETDEVICECAPABILITYCALLBACK_001
    * @tc.name    test getDeviceCapability method in callback mode
    * @tc.desc    get the device capability in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetDeviceCapabilityCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getDeviceCapability((error, dc) => {
                if(dc.deviceType == resourceManager.DeviceType.DEVICE_TYPE_PHONE){
                    console.log('testGetDeviceCapabilityCallback001 DEVICE_TYPE_PHONE');
                }else if(dc.deviceType == resourceManager.DeviceType.DEVICE_TYPE_TABLET){
                    console.log('testGetDeviceCapabilityCallback001 DEVICE_TYPE_TABLET');
                }else if(dc.deviceType == resourceManager.DeviceType.DEVICE_TYPE_CAR){
                    console.log('testGetDeviceCapabilityCallback001 DEVICE_TYPE_CAR');
                }else if(dc.deviceType == resourceManager.DeviceType.DEVICE_TYPE_PC){
                    console.log('testGetDeviceCapabilityCallback001 DEVICE_TYPE_PC');
                }else if(dc.deviceType == resourceManager.DeviceType.DEVICE_TYPE_TV){
                    console.log('testGetDeviceCapabilityCallback001 DEVICE_TYPE_TV');
                }else if(dc.deviceType == resourceManager.DeviceType.DEVICE_TYPE_WEARABLE){
                    console.log('testGetDeviceCapabilityCallback001 DEVICE_TYPE_WEARABLE');
                }
                expect(dc !== null).assertTrue();
                console.log('testGetDeviceCapabilityCallback001 ' + JSON.stringify(dc));
                done();
            })
    })

      /* *
        * @tc.number  TEST_GETDEVICECAPABILITYPROMISE_001
        * @tc.name    test getDeviceCapability method in promise mode
        * @tc.desc    get the device capability in promise mode
        * @tc.size:    MediumTest
        * @tc.type     method
        * @tc.level    level 2
        */
    it('testGetDeviceCapabilityPromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getDeviceCapability().then(dc => {
                if(dc.deviceType == resourceManager.DeviceType.DEVICE_TYPE_PHONE){
                    console.log('testGetDeviceCapabilityPromise001 DEVICE_TYPE_PHONE');
                }
                if(dc.screenDensity == resourceManager.ScreenDensity.SCREEN_LDPI){
                    console.log('testGetDeviceCapabilityPromise001 SCREEN_LDPI');
                }
                expect(dc !== null).assertTrue();
                console.log('testGetDeviceCapabilityPromise001 ' + JSON.stringify(dc));
                done();
            })
    })

     /* *
    * @tc.number  TEST-GETCONFIGURATIONCALLBACK_001
    * @tc.name    test getConfiguration method in callback mode
    * @tc.desc    get the configuration in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetConfigurationCallback001', 0, async function (done) {
            console.log('testGetConfigurationCallback001 0');
            globalThis.abilityContext.resourceManager.getConfiguration((error, cfg) => {
                console.log('testGetConfigurationCallback001 1');
                expect(cfg.direction !== null).assertTrue();
                console.log('testGetConfigurationCallback001 1' + cfg.direction);
                expect(cfg.locale !== null).assertTrue();
                console.log('testGetConfigurationCallback001 1' + cfg.locale);
                console.log('testGetConfigurationCallback001 1' + resourceManager.Direction.DIRECTION_HORIZONTAL);
                console.log('testGetConfigurationCallback001 11');
                if(cfg.direction == resourceManager.Direction.DIRECTION_VERTICAL){
                    console.log('testGetConfigurationCallback001 DIRECTION_VERTICAL');
                }else if(cfg.direction == resourceManager.Direction.DIRECTION_HORIZONTAL){
                    console.log('testGetConfigurationCallback001 DIRECTION_HORIZONTAL');
                }
                expect(cfg !== null).assertTrue();
                console.log('testGetConfigurationCallback001 ' + JSON.stringify(cfg));
                done();
            })
    })

    /* *
        * @tc.number  TEST_GETCONFIGURATIONPROMISE_001
        * @tc.name    test getConfiguration method in promise mode
        * @tc.desc    get the configuration in promise mode
        * @tc.size:    MediumTest
        * @tc.type     method
        * @tc.level    level 2
        */
    it('testGetConfigurationPromise001', 0, async function (done) {
        globalThis.abilityContext.resourceManager.getConfiguration().then(cfg => {
            console.log('testGetConfigurationPromise001 ' + resourceManager.Direction.DIRECTION_HORIZONTAL);
            if(cfg.direction == resourceManager.Direction.DIRECTION_VERTICAL){
                console.log('testGetConfigurationPromise001 DIRECTION_VERTICAL');
            }else if(cfg.direction == resourceManager.Direction.DIRECTION_HORIZONTAL){
                console.log('testGetConfigurationPromise001 DIRECTION_HORIZONTAL');
            }
            expect(cfg !== null).assertTrue();
            console.log('testGetConfigurationPromise001 ' + JSON.stringify(cfg));
            done();
        })
    })


     /* *
    * @tc.number  TEST_GETPLURALSTRINGVALUERESOURCECALLBACK_001
    * @tc.name    test getPluralStringValue method in callback mode
    * @tc.desc    get the plural string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetPluralStringValueResourceCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getPluralStringValue({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.plural.plural_name').id}, 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetPluralStringValueResourceCallback001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETPLURALSTRINGVALUERESOURCEPROMISE_001
    * @tc.name    test getPluralStringValue method in promise mode
    * @tc.desc    get the plural string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetPluralStringValueResourcePromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getPluralStringValue({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.plural.plural_name').id}, 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetPluralStringValueResourcePromise001 ' + value);
            })
        done();
    })

    /* *
    * @tc.number  TEST_GETPLURALSTRINGVALUERESIDCALLBACK_001
    * @tc.name    test getPluralStringValue method in callback mode
    * @tc.desc    get the plural string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetPluralStringValueResIdCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getPluralStringValue($r('app.plural.plural_name').id, 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetPluralStringValueResIdCallback001 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETPLURALSTRINGVALUERESIDPROMISE_001
    * @tc.name    test getPluralStringValue method in promise mode
    * @tc.desc    get the plural string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetPluralStringValueResIdPromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getPluralStringValue($r('app.plural.plural_name').id, 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetPluralStringValueResIdPromise001 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETSTRINGBYNAMECALLBACK_001
    * @tc.name    test getStringByName method in callback mode
    * @tc.desc    get the string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringByNameCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getStringByName('test_1', (err, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetStringByNameCallback001 ' + value);
                expect(value).assertEqual('Test1');
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETSTRINGBYNAMEPromise_001
    * @tc.name    test getStringByName method in promise mode
    * @tc.desc    get the string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringByNamePromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getStringByName('test_1').then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetStringByNamePromise001 ' + value);
                expect(value).assertEqual('Test1');
                done();
            })
    })


     /* *
    * @tc.number  TEST_GETSTRINGARRAYBYNAMECALLBACK_001
    * @tc.name    test getStringArrayByName method in callback mode
    * @tc.desc    get the string array in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringArrayByNameCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getStringArrayByName('sizeList', (err, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetStringArrayByNameCallback001 ' + value);
                console.log('testGetStringArrayByNameCallback001 ' + value.length);
                console.log('testGetStringArrayByNameCallback001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETSTRINGARRAYBYNAMEPROMISE_001
    * @tc.name    test getStringArrayByName method in promise mode
    * @tc.desc    get the string array in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringArrayByNamePromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getStringArrayByName('sizeList').then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetStringArrayByNamePromise001 ' + value);
                console.log('testGetStringArrayByNamePromise001 ' + value.length);
                console.log('testGetStringArrayByNamePromise001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
    })


    /* *
    * @tc.number  TEST_GETMEDIABYNAMECALLBACK_001
    * @tc.name    test getMediaByName method in callback mode
    * @tc.desc    get the media in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaByNameCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaByName('icon', (err, value) => {
                expect(value.length > 0).assertTrue();
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETMEDIABYNAMEPROMISE_001
    * @tc.name    test getMediaByName method in promise mode
    * @tc.desc    get the media in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaByNamePromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaByName('icon').then(value => {
                expect(value.length > 0).assertTrue();
                done();
            })
    })

     /* *
    * @tc.number  TEST_GETMEDIABASE64BYNAMECALLBACK_001
    * @tc.name    test getMediaBase64ByName method in callback mode
    * @tc.desc    get the media base64 in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaBase64ByNameCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaBase64ByName('icon', (err, value) => {
                expect(value.length > 0).assertTrue();
                console.log('testGetMediaBase64ByNameCallback001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETMEDIABASE64BYNAMEPROMISE_001
    * @tc.name    test getMediaBase64ByName method in promise mode
    * @tc.desc    get the media base64 in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetMediaBase64ByNamePromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getMediaBase64ByName('icon').then(value => {
                expect(value.length > 0).assertTrue();
                console.log('testGetMediaBase64ByNamePromise001 ' + value);
                done();
            })
    })

     /* *
    * @tc.number  TEST_GETPLURALSTRINGBYNAMECALLBACK_001
    * @tc.name    test getPluralStringByName method in callback mode
    * @tc.desc    get the plural string in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetPluralStringByNameCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getPluralStringByName('plural_name', 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetPluralStringByNameCallback001 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETPLURALSTRINGBYNAMEPROMISE_001
    * @tc.name    test getPluralStringByName method in promise mode
    * @tc.desc    get the plural string in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetPluralStringByName002', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getPluralStringByName('plural_name', 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetPluralStringByName002 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
    })

     /* *
    * @tc.number  TEST_GETSTRINGSYNCRESID_001
    * @tc.name    test getStringSync method in sync mode
    * @tc.desc    get the string in sync mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringSyncResId001', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getStringSync($r('app.string.test_1').id);
            expect(value !== null).assertTrue();
            console.log('testGetStringSyncResId001 ' + value);
            expect(value).assertEqual('Test1');
            done();
    })

    /* *
   * @tc.number  TEST_GETSTRINGSYNCRESIDARGS_001
   * @tc.name    test getStringSync method in sync mode
   * @tc.desc    get the string in sync mode
   * @tc.size:    MediumTest
   * @tc.type     method
   * @tc.level    level 2
   */
    it('testGetStringSyncResIdArgs001', 0, async function (done) {
        let value = globalThis.abilityContext.resourceManager.getStringSync($r('app.string.test_2').id,2);
        expect(value !== null).assertTrue();
        console.log('testGetStringSyncResIdArgs001 ' + value);
        expect(value).assertEqual('Test2');
        done();
    })

    /* *
    * @tc.number TEST_GETSTRINGSYNCRESOURCE_001
    * @tc.name    test getStringSync method in sync mode
    * @tc.desc    get the string in sync mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringSyncResource001', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getStringSync({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.string.test_1').id});
            expect(value !== null).assertTrue();
            console.log('testGetStringSyncResource001 ' + value);
        done();
    })


    /* *
    * @tc.number  TEST_GETSTRINGSYNCRESOURCEARGS_001
    * @tc.name    test getStringSync method in sync mode
    * @tc.desc    get the string in sync mode
    * @tc.size:   MediumTest
    * @tc.type    method
    * @tc.level   level 2
    */
    it('testGetStringSyncResourceArgs001', 0, async function (done) {
        let value = globalThis.abilityContext.resourceManager.getStringSync({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
            moduleName:"entry_test",
            id:$r('app.string.test_2').id},
            2);
        expect(value !== null).assertTrue();
        console.log('testGetStringSyncResourceArgs001 ' + value);
        done();
    })


    /* *
    * @tc.number  TEST-GETSTRINGBYNAMESYNC_001
    * @tc.name    test getStringByNameSync method in sync mode
    * @tc.desc    get the string in sync mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringByNameSync001', 0, async function (done) {
            try{
                let value = globalThis.abilityContext.resourceManager.getStringByNameSync('notexist');
                console.log('testGetStringByNameSync001 value');
                expect(value !== null).assertTrue();
                console.log('testGetStringByNameSync001 ' + value);
                done();
            }catch(e){
                console.log('testGetStringByNameSync001 err.code' + e.code);
                console.log('testGetStringByNameSync001 err.message' + e.message);
                expect(e.code == 9001003).assertTrue();
                done();
            }
    })

    /* *
    * @tc.number  TEST-GETSTRINGBYNAMESYNC_002
    * @tc.name    test getStringByNameSync method in sync mode
    * @tc.desc    get the string in sync mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringByNameSync002', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getStringByNameSync('test_1');
            expect(value !== null).assertTrue();
            expect(value).assertEqual('Test1');
            console.log('testGetStringByNameSync002 ' + value);
            done();
    })

    /* *
    * @tc.number  TEST-GETSTRINGBYNAMESYNCARGS_001
    * @tc.name    test getStringByNameSync method in sync mode
    * @tc.desc    get the string in sync mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetStringByNameSyncArgs001', 0, async function (done) {
        let value = globalThis.abilityContext.resourceManager.getStringByNameSync('test_2',2);
        expect(value !== null).assertTrue();
        expect(value).assertEqual('Test2');
        console.log('testGetStringByNameSyncArgs001 ' + value);
        done();
    })


     /* *
    * @tc.number  TEST-GETBOOLEANRESID_001
    * @tc.name    test getBoolean method
    * @tc.desc    get the boolean value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetBooleanResId001', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getBoolean($r('app.boolean.boolean_1').id);
            console.log('testGetBooleanResId001 ' + value);
            expect(value!==null).assertTrue();
            done();
    })

    /* *
    * @tc.number  TEST_GETBOOLEANRESOURCE_001
    * @tc.name    test getBoolean method
    * @tc.desc    get the boolean value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetBooleanResource001', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getBoolean({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.boolean.boolean_1').id});
            console.log('testGetBooleanResource001 ' + value);
            expect(value !== null).assertTrue();
            done();
    })

    /* *
    * @tc.number  TEST_GETBOOLEANBYNAME_001
    * @tc.name    test getBooleanByName method
    * @tc.desc    get the boolean value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetBooleanByName001', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getBooleanByName('boolean_1');
            console.log('testGetBooleanByName001 ' + value);
            expect(value).assertTrue();
            done();
    })

    /* *
    * @tc.number  TEST_GETNUMBERRESID_001
    * @tc.name    test getNumber method with interger id
    * @tc.desc    get the interger value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetNumberResId001', 0, async function (done) {
            console.log('testGetNumberResId001 0');
            let value = globalThis.abilityContext.resourceManager.getNumber($r('app.integer.integer_1').id);
            console.log('testGetNumberResId001 1');
            console.log('testGetNumberResId001 ' + value);
            expect(value).assertEqual(100);
            done();
    })


    /* *
    * @tc.number  TEST_GETNUMBERRESID_002
    * @tc.name    test getNumber with float id
    * @tc.desc    get the float value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetNumberResId002', 0, async function (done) {
        let value = globalThis.abilityContext.resourceManager.getNumber($r('app.float.float_1').id);
        console.log('testGetNumberResId002 ' + value);
        expect(value > 0).assertTrue();
        done();
    })


    /* *
    * @tc.number  TEST_GETNUMBERRESOURCE_001
    * @tc.name    test getNumber method with interger id
    * @tc.desc    get the interger value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetNumberResource001', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getNumber({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.integer.integer_1').id});
            console.log('testGetNumberResource001 ' + value);
            expect(value !== null).assertTrue();
            done();
    })

    
    /* *
    * @tc.number  TEST_GETNUMBERRESOURCE_002
    * @tc.name    test getNumber with float id
    * @tc.desc    get the float value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetNumberResource002', 0, async function (done) {

            let value = globalThis.abilityContext.resourceManager.getNumber({bundleName:"ohos.acts.global.crossplatform.resourceManager.normal",
                moduleName:"entry_test",
                id:$r('app.float.float_1').id});
            console.log('testGetNumberResource002 ' + value);
            expect(value !== null).assertTrue();
            done();

    })

    /* *
    * @tc.number  TEST_GETNUMBERBYNAME_001
    * @tc.name    test getNumberByName with interger
    * @tc.desc    get the interger value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetNumberByName001', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getNumberByName('integer_1');
            console.log('testGetNumberByName001 ' + value);
            expect(value).assertEqual(100);
            done();
    })

    /* *
    * @tc.number  TEST_GETNUMBERBYNAME_002
    * @tc.name    test getNumberByName with float
    * @tc.desc    get the float value
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetNumberByName002', 0, async function (done) {
            let value = globalThis.abilityContext.resourceManager.getNumberByName('float_1');
            console.log('testGetNumberByName002 ' + value);
            expect(value > 0).assertTrue();
            done();
    })

    /* *
    * @tc.number  TEST_RELEASE_001
    * @tc.name    test release method
    * @tc.desc    get the release function
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testRelease001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getString($r('app.string.test_1').id, (err, value) => {
                expect(value !== null).assertTrue();
                done();
            })
            globalThis.abilityContext.resourceManager.release();
    })

    /* *
    * @tc.number  TEST_GETRAWFILECONTENTCALLBACK_001
    * @tc.name    test getRawFile method in callback mode
    * @tc.desc    get the getRawFile in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetRawFileContentCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getRawFileContent('rawfile/rawfiletest.xml', (error, value) => {
                expect(value !== null).assertTrue();
                console.log('testGetRawFileContentCallback001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST_GETRAWFILECONTENTPROMISE_001
    * @tc.name    test getRawFile method in promise mode
    * @tc.desc    get the getRawFile in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetRawFileContentPromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getRawFileContent('rawfile/rawfiletest.xml').then(value => {
                expect(value !== null).assertTrue();
                console.log('testGetRawFileContentPromise001 ' + value);
                done();
            })
    })

    /* *
    * @tc.number  TEST-GETRAWFDCALLBACK_001
    * @tc.name    test getRawFileDescriptor method in callback mode
    * @tc.desc    get the RawFileDescriptor in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetRawFdCallback001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getRawFd('rawfiletest.xml', (error, rawfile) => {
                let fdValue = rawfile.fd;
                let offsetValue = rawfile.offset;
                let lengthValue = rawfile.length;
                expect(rawfile !== null).assertTrue();
                console.log('testGetRawFdCallback001--'
                +'fd:' + fdValue
                + ' offset:' + offsetValue
                + ' length:' + lengthValue);
                done();
            })
    })

    /* *
    * @tc.number  TEST-GETRAWFDPROMISE_001
    * @tc.name    test getRawFileDescriptor method in promise mode
    * @tc.desc    get the RawFileDescriptor in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testGetRawFdPromise001', 0, async function (done) {
            globalThis.abilityContext.resourceManager.getRawFd('rawfiletest.xml').then(rawfile => {
                rawfile.fd = 2000;
                rawfile.offset = 20;
                rawfile.length = 200;
                expect(rawfile !== null).assertTrue();
                console.log('testGetRawFdPromise001--' + JSON.stringify(rawfile));
                console.log('testGetRawFdPromise001--'
                +'fd:' + rawfile.fd
                + ' offset:' + rawfile.offset
                + ' length:' + rawfile.length);
                done();
            })
    })

     /* *
    * @tc.number  TEST_CLOSERAWFDCALLBACK_001
    * @tc.name    test closeRawFileDescriptor method in callback mode
    * @tc.desc    get the closeRawFileDescriptor in callback mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testCloseRawFdCallback001', 0, async function (done) {
            try{
                globalThis.abilityContext.resourceManager.closeRawFd('notexist.xml', (error, value) => {
                    if(error){
                        console.log('testCloseRawFdCallback001 err.code:' + error.code);
                        console.log('testCloseRawFdCallback001 err.message:' + error.message);
                        expect(error.code == 9001005).assertTrue();
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('testCloseRawFdCallback001 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('testCloseRawFdCallback001 e.code' + e.code);
                console.log('testCloseRawFdCallback001 e.message' + e.message);
            }
    })

    /* *
    * @tc.number  TEST_CLOSERAWFDPROMISE_001
    * @tc.name    test closeRawFd method in promise mode throw 9001005 error code
    * @tc.desc    get the closeRawFd in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testCloseRawFdPromise001', 0, async function (done) {
            try {
                // param not exist throw 9001005 error code
                globalThis.abilityContext.resourceManager.closeRawFd('notexist.xml').then(value => {
                    console.log('testCloseRawFdPromise001 ' + value);
                    done();
                }).catch(error => {
                    console.log('testCloseRawFdPromise001 error.code' + error.code);
                    console.log('testCloseRawFdPromise001 error.message' + error.message);
                    expect(error.code == 9001005).assertTrue();
                    done();
                })
            } catch (err) {
                console.log('testCloseRawFdPromise001 err.code' + err.code);
                console.log('testCloseRawFdPromise001 err.message' + err.message);
                done();
            }
    })

    /*
    * @tc.number  TEST_CLOSERAWFDPROMISE_002
    * @tc.name    test closeRawFd method in promise mode throw 401 error code
    * @tc.desc    get the closeRawFd in promise mode
    * @tc.size:    MediumTest
    * @tc.type     method
    * @tc.level    level 2
    */
    it('testCloseRawFdPromise002', 0, async function (done) {
            try {
                // param type not correct,throw 401 error code
                globalThis.abilityContext.resourceManager.closeRawFd($r('app.integer.integer_1').id).then(value => {
                    console.log('testCloseRawFdPromise002 ' + value);
                    done();
                }).catch(error => {
                    console.log('testCloseRawFdPromise002 error.code' + error.code);
                    console.log('testCloseRawFdPromise002 error.message' + error.message);
                    expect(error.code == 401).assertTrue();
                    done();
                })
            } catch (err) {
                console.log('testCloseRawFdPromise002 err.code' + err.code);
                console.log('testCloseRawFdPromise002 err.message' + err.message);
                done();
            }
    })

    
     console.log('*************end ResmgrTest*************');
})}


