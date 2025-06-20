/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import cloudData from '@ohos.data.cloudData';
import deviceInfo from '@ohos.deviceInfo';


const TAG = "[CloudData_SetStrategy_Ets_Test]"
export default function cloudDataSetStrategyEtsTest() {
    describe('cloudDataSetStrategyEtsTest', function () {
        let currentDeviceIsWatch = false;
        beforeAll(() => {
            console.info('window_layout_test beforeAll begin');
            let deviceTypeInfo = deviceInfo.deviceType
            currentDeviceIsWatch = deviceTypeInfo === 'wearable' ? true : false;
            console.info('the value of the deviceType is :' + deviceInfo.deviceType);
            console.info('window_layout_test beforeAll end');
          })


        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0100
         * @tc.name setCloudStrategyTest001
         * @tc.desc Test Js Api setCloudStrategy with null args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest001', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest001 start *************");
            try {
                cloudData.setCloudStrategy(null).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setCloudStrategyTest001, errcode:${JSON.stringify(err)}.`);
                    expect().assertFail();
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest001, errcode:${JSON.stringify(err)}.`);
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest001 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0200
         * @tc.name setCloudStrategyTest002
         * @tc.desc Test Js Api setCloudStrategy with undefined args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest002', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest002 start *************");
            try {
                cloudData.setCloudStrategy(undefined).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setCloudStrategyTest002, errcode:${JSON.stringify(err)}.`);
                    expect().assertFail();
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest002, errcode:${JSON.stringify(err)}.`);
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest002 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0300
         * @tc.name setCloudStrategyTest003
         * @tc.desc Test Js Api setCloudStrategy with undefined args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest003', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest003 start *************");
            try {
                cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [undefined, "test"]).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setCloudStrategyTest003, errcode:${JSON.stringify(err)}.`);
                    expect().assertFail();
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest003, errcode:${JSON.stringify(err)}.`);
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest003 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0400
         * @tc.name setCloudStrategyTest004
         * @tc.desc Test Js Api setCloudStrategy with error param args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest004', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest004 start *************");
            try {
                cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.WIFI, "test"]).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setCloudStrategyTest004, errcode:${JSON.stringify(err)}.`);
                    expect().assertFail();
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest004, errcode:${JSON.stringify(err)}.`);
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest004 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0500
         * @tc.name setCloudStrategyTest005
         * @tc.desc Test Js Api setCloudStrategy with WIFI args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest005', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest005 start *************");
            try {
                await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.WIFI]).then(() => {
                    console.log(TAG + `setCloudStrategyTest005,setCloudStrategy success.`);
                }).catch(err => {
                    if(currentDeviceIsWatch && err.code == 801){
                        expect(err.code == 801).assertTrue();
                    }else{
                        console.error(TAG + `setCloudStrategyTest005, errcode:${JSON.stringify(err)}.`);
                        expect().assertFail();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest005, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest005 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0600
         * @tc.name setCloudStrategyTest006
         * @tc.desc Test Js Api setCloudStrategy with CELLULAR args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest006', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest006 start *************");
            try {
                await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.CELLULAR, cloudData.NetWorkStrategy.WIFI]).then(() => {
                    console.log(TAG + `setCloudStrategyTest006,setCloudStrategy success.`);
                }).catch(err => {
                    if(currentDeviceIsWatch && err.code == 801){
                        expect(err.code == 801).assertTrue();
                    }else{
                        console.error(TAG + `setCloudStrategyTest006, errcode:${JSON.stringify(err)}.`);
                        expect().assertFail();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest006, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest006 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0700
         * @tc.name setCloudStrategyTest007
         * @tc.desc Test Js Api setCloudStrategy with args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest007', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest007 start *************");
            try {
                await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK).then(() => {
                    console.log(TAG + `setCloudStrategyTest007,setCloudStrategy success.`);
                }).catch(err => {
                    if(currentDeviceIsWatch && err.code == 801){
                        expect(err.code == 801).assertTrue();
                    }else{
                        console.error(TAG + `setCloudStrategyTest007, errcode:${JSON.stringify(err)}.`);
                        expect().assertFail();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest007, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest007 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0800
         * @tc.name setCloudStrategyTest008
         * @tc.desc Test Js Api setCloudStrategy with undefined param args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest008', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest008 start *************");
            try {
                await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, undefined).then(() => {
                    console.log(TAG + `setCloudStrategyTest008,setCloudStrategy success.`);
                }).catch(err => {
                    if(currentDeviceIsWatch && err.code == 801){
                        expect(err.code == 801).assertTrue();
                    }else{
                        console.error(TAG + `setCloudStrategyTest008, errcode:${JSON.stringify(err)}.`);
                        expect().assertFail();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest008, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest008 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0900
         * @tc.name setCloudStrategyTest009
         * @tc.desc Test Js Api setCloudStrategy with null param args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setCloudStrategyTest009', 0, async function (done) {
            console.log(TAG + "************* setCloudStrategyTest009 start *************");
            try {
                await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, null).then(() => {
                    console.log(TAG + `setCloudStrategyTest009,setCloudStrategy success.`);
                }).catch(err => {
                    if(currentDeviceIsWatch && err.code == 801){
                        expect(err.code == 801).assertTrue();
                    }else{
                        console.error(TAG + `setCloudStrategyTest009, errcode:${JSON.stringify(err)}.`);
                        expect().assertFail();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setCloudStrategyTest009, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setCloudStrategyTest009 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0100
         * @tc.name setGlobalCloudStrategyTest001
         * @tc.desc Test Js Api setGlobalCloudStrategy with null StrategyType.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest001', 0, async function (done) {
        console.log(TAG + "************* setGlobalCloudStrategyTest001 start *************");
        try {
            cloudData.Config.setGlobalCloudStrategy(null).then(() => {
                expect().assertFail();
            }).catch(err => {
                expect().assertFail();
            });
            } catch (err) {
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest001 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0200
         * @tc.name setGlobalCloudStrategyTest002
         * @tc.desc Test Js Api setGlobalCloudStrategy with undefined StrategyType.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest002', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest002 start *************");
            try {
                cloudData.Config.setGlobalCloudStrategy(undefined).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    expect().assertFail();
                });
            } catch (err) {
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest002 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0300
         * @tc.name setGlobalCloudStrategyTest003
         * @tc.desc Test Js Api setGlobalCloudStrategy with error param.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest003', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest003 start *************");
            try {
                cloudData.Config.setGlobalCloudStrategy(cloudData.StrategyType.NETWORK, [undefined, "test"]).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    expect().assertFail();
                });
            } catch (err) {
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest003 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0400
         * @tc.name setGlobalCloudStrategyTest004
         * @tc.desc Test Js Api setGlobalCloudStrategy with error param args.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest004', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest004 start *************");
            try {
                cloudData.Config.setGlobalCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.WIFI, "test"]).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    expect().assertFail();
                });
            } catch (err) {
                expect(err.code == 401).assertTrue();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest004 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0500
         * @tc.name setGlobalCloudStrategyTest005
         * @tc.desc Test Js Api setGlobalCloudStrategy with WIFI StrategyType.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest005', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest005 start *************");
            try {
                await cloudData.Config.setGlobalCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.WIFI]).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setGlobalCloudStrategyTest005, setGlobalCloudStrategy errcode:${JSON.stringify(err)}.`);
                    if(currentDeviceIsWatch){
                        expect(err.code == 801).assertTrue();
                    }else{
                        expect(err.code == 201).assertTrue();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setGlobalCloudStrategyTest005, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest005 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0600
         * @tc.name setGlobalCloudStrategyTest006
         * @tc.desc Test Js Api setGlobalCloudStrategy with CELLULAR StrategyType.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest006', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest006 start *************");
            try {
                await cloudData.Config.setGlobalCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.CELLULAR, cloudData.NetWorkStrategy.WIFI]).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setGlobalCloudStrategyTest006, errcode:${JSON.stringify(err)}.`);
                    if(currentDeviceIsWatch){
                        expect(err.code == 801).assertTrue();
                    }else{
                        console.error(TAG + `setGlobalCloudStrategyTest006, errcode:${JSON.stringify(err)}.`);
                        expect(err.code == 201).assertTrue();
                    } 
                });
            } catch (err) {
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest006 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0700
         * @tc.name setGlobalCloudStrategyTest007
         * @tc.desc Test Js Api setGlobalCloudStrategy with null param.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest007', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest007 start *************");
            try {
                await cloudData.Config.setGlobalCloudStrategy(cloudData.StrategyType.NETWORK).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setGlobalCloudStrategyTest007, errcode:${JSON.stringify(err)}.`);
                    if(currentDeviceIsWatch){
                        expect(err.code == 801).assertTrue();
                    }else{
                        expect(err.code == 201).assertTrue();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setGlobalCloudStrategyTest007, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest007 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0800
         * @tc.name setGlobalCloudStrategyTest008
         * @tc.desc Test Js Api setGlobalCloudStrategy with undefined param.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest008', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest008 start *************");
            try {
                await cloudData.Config.setGlobalCloudStrategy(cloudData.StrategyType.NETWORK, undefined).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setGlobalCloudStrategyTest008, errcode:${JSON.stringify(err)}.`);
                    if(currentDeviceIsWatch){
                        expect(err.code == 801).assertTrue();
                    }else{
                        expect(err.code == 201).assertTrue();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setGlobalCloudStrategyTest008, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest008 end *************");
        })
    
        /**
         * @tc.number SUB_DistributedData_CloudData_SDK_SetGlobalCloudStrategy_0900
         * @tc.name setGlobalCloudStrategyTest009
         * @tc.desc Test Js Api setGlobalCloudStrategy with undefined StrategyType.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
        */
        it('setGlobalCloudStrategyTest009', 0, async function (done) {
            console.log(TAG + "************* setGlobalCloudStrategyTest009 start *************");
            try {
                await cloudData.Config.setGlobalCloudStrategy(cloudData.StrategyType.NETWORK, null).then(() => {
                    expect().assertFail();
                }).catch(err => {
                    console.error(TAG + `setGlobalCloudStrategyTest009, errcode:${JSON.stringify(err)}.`);
                    if(currentDeviceIsWatch){
                        expect(err.code == 801).assertTrue();
                    }else{
                        expect(err.code == 201).assertTrue();
                    } 
                });
            } catch (err) {
                console.error(TAG + `setGlobalCloudStrategyTest009, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
            }
            done()
            console.log(TAG + "************* setGlobalCloudStrategyTest009 end *************");
        })
            
    })
}