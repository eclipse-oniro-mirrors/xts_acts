/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import geolocation from '@ohos.geolocation';
import geolocationm from '@ohos.geoLocationManager';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osaccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode(){
    let result1 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result1));
    if(!result1){
        await geolocation.requestEnableLocation().then((result) => {
            console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + JSON.stringify(error));
            expect().assertFail();
        });
    }
    let result2 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result2));
}


async function applyPermission() {
    let osAccountManager = osaccount.getAccountManager();
    console.info("=== getAccountManager finish");
    let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
    console.info("LocalId is :" + localId);
    let appInfo = await bundle.getApplicationInfo('ohos.acts.location.geolocation.function', 0, localId);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName1 = 'ohos.permission.LOCATION';
        let permissionName2 = 'ohos.permission.LOCATION_IN_BACKGROUND';
        await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
        await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}

export default function geolocationTest_GeoErr(){
    describe('geolocationTest_GeoErr', function () {

        console.log('#start AccessTokenTests#');
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            await changedLocationMode();
            done();
        })
    
        beforeEach(async function (done) {
            console.info('beforeEach case');
            done();
        })
    
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0400
         * @tc.name testGetAddressesFromLocation
         * @tc.desc Incorrect input parameters are used to invoke the reverse geocoding service.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_GeoErr_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let reverseGeocodeRequest = "1";
                geolocationm.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                    if (err) {
                        console.info('[lbs_js] getAddressesFromLocation4 callback err is:' + JSON.stringify(err));
                        expect(err.code).assertEqual("401");
                        return;
                    } else {
                        console.info("[lbs_js] getAddressesFromLocation4 callback data is:" + JSON.stringify(data));
                        expect(true).assertFalse();
                    }
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation4 callback try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0500
         * @tc.name testGetAddressesFromLocation
         * @tc.desc Incorrect input parameters are used to invoke the reverse geocoding service.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_GeoErr_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let reverseGeocodeRequest = "1";
                    let result = await geolocationm.getAddressesFromLocation(reverseGeocodeRequest); 
                    console.info("[lbs_js] getAddressesFromLocation5 promise successful:" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] getAddressesFromLocation5 promise err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
              })();
              await sleep(1000);
              done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0600
         * @tc.name testGetAddressesFromLocationName
         * @tc.desc Invoke the geocoding service with incorrect input parameters.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_GeoErr_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let geocodeRequest = 1;
                geolocationm.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                    if (err) {
                        console.info('[lbs_js] getAddressesFromLocationName6 callback err is:' + JSON.stringify(err));
                        expect(err.code).assertEqual(401);
                        return;
                    } else {
                        console.info("[lbs_js] getAddressesFromLocationName6 callback data is: " + JSON.stringify(data));
                        expect(true).assertFalse();
                    }
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName6 try err." + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0700
         * @tc.name testGetAddressesFromLocationName
         * @tc.desc Invoke the geocoding service with incorrect input parameters.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_GeoErr_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let geocodeRequest = 1;
                    let result = await geolocationm.getAddressesFromLocationName(geocodeRequest); 
                    console.info("[lbs_js] getAddressesFromLocationName7 promise successful:" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] getAddressesFromLocationName7 promise err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
              })();
              await sleep(1000);
              done();
        })
		 /**
         * @tc.number SUB_HSS_Addbeaconfence_0100
         * @tc.name SUB_HSS_Addbeaconfence_0100
         * @tc.desc Invoke the geocoding service with incorrect input parameters.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_Addbeaconfence_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X00, 0X18, 0X12, 0X00, 0X00,
                    0X10, 0X00, 0X80, 0X00, 0X00, 0X80, 0X5F, 0X9B, 0X34, 0XFB]);

                let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                    0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);

                let manufactureData = {
                    manufactureId: 0X004C,
                    manufactureData: manufactureDataBuffer.buffer,
                    manufactureDataMask: manufactureDataMaskBuffer.buffer
                };

                let beacon = {
                    identifier: "11",
                    beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                    manufactureData: manufactureData
                };

                let fenceRequest = {
                    beacon: beacon,
                    transitionCallback: (transition) => {
                        if (transition) {
                            console.info("SUB_HSS_Addbeaconfence_0100" + JSON.stringify(transition));
                        }
                    },
                    fenceExtensionAbilityName: "MyFenceExtensionAbility",
                };
				await geolocationm.disableLocation();
                geolocationm.addBeaconFence(fenceRequest).then((id) => {
                    console.info("addBeaconFence0100 success, fence id:" + id);
					except().assertFail();
                }).catch((error) => {
                    console.error('promise, addBeaconFence0100: error=' + JSON.stringify(error));
                    expect(error.code).assertEqual(3501100);
                });
            } catch (error) {
                console.error("addBeaconFence0100: errCode" + error.code + ", errMessage" + error.message);
            };
        await sleep(1000);
        
        done();
        })

        /**
         * @tc.number SUB_HSS_Addbeaconfence_0200
         * @tc.name SUB_HSS_Addbeaconfence_0200
         * @tc.desc Invoke the geocoding service with incorrect input parameters.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_Addbeaconfence_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X00, 0X18, 0X12, 0X00, 0X00,
                    0X10, 0X00, 0X80, 0X00, 0X00, 0X80, 0X5F, 0X9B, 0X34, 0XFB]);

                let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                    0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);

                let manufactureData = {
                    manufactureId: 0X004C,
                    manufactureData: manufactureDataBuffer.buffer,
                    manufactureDataMask: manufactureDataMaskBuffer.buffer
                };

                let beacon = {
                    identifier: "11",
                    beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                    manufactureData: manufactureData
                };

                let fenceRequest = {
                    beacon: beacon,
                    transitionCallback: (transition) => {
                        if (transition) {
                            console.info("SUB_HSS_Addbeaconfence_0200: err" + JSON.stringify(transition));
                        }
                    },
                    fenceExtensionAbilityName: "MyFenceExtensionAbility",
                };
                await geolocationm.enableLocation();
                geolocationm.addBeaconFence(fenceRequest).then((id) => {
                    console.info("addBeaconFence0200 success, fence id:" + id);
                }).catch((error) => {
                    console.error('promise, addBeaconFence0200: error=' + JSON.stringify(error));
                });

                geolocationm.addBeaconFence(fenceRequest).then((id) => {
                    console.info("addBeaconFence0200 success, fence id:" + id);
                }).catch((error) => {
                    console.error('promise, addBeaconFence0200: error=' + JSON.stringify(error));
                    expect(error.code).assertEqual(3501603);
                });
            } catch (error) {
                console.error("addBeaconFence0200: errCode" + error.code + ", errMessage" + error.message);
            };
        await sleep(1000);
        await geolocationm.disableLocation();
        done();
        })

        /**
         * @tc.number SUB_HSS_Removebeaconfence_0100
         * @tc.name SUB_HSS_Removebeaconfence_0100
         * @tc.desc Invoke the geocoding service with incorrect input parameters.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_Removebeaconfence_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X01, 0X00, 0X18, 0X12, 0X00, 0X00,
                    0X10, 0X00, 0X80, 0X00, 0X00, 0X80, 0X5F, 0X9B, 0X34, 0XFB]);

                let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                    0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);

                let manufactureData = {
                    manufactureId: 0X004C,
                    manufactureData: manufactureDataBuffer.buffer,
                    manufactureDataMask: manufactureDataMaskBuffer.buffer
                };

                let beacon = {
                    identifier: "11",
                    beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                    manufactureData: manufactureData
                };
                await geolocationm.enableLocation();
                geolocationm.removeBeaconFence(beacon).then(()=>{
                    console.info("promise,removeBeaconFence success");
                }).catch((error)=>{
                    console.error("promise,removeBeaconFence:error="+JSON.stringify(error));
                    expect(error.code).assertEqual(3501602);
                });
            } catch (error) {
                console.error("removeBeaconFence: errCode" + error.code + ", errMessage" + error.message);
            };
            await sleep(1000);
            await geolocationm.disableLocation();
        done();
        })

        

        /**
         * @tc.number SUB_HSS_isBeaconFenceSupported_0100
         * @tc.name SUB_HSS_isBeaconFenceSupported_0100
         * @tc.desc Invoke the geocoding service with incorrect input parameters.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_isBeaconFenceSupported_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let isBeaconFenceSupported = geolocationm.isBeaconFenceSupported();
                expect(true).assertEqual(isBeaconFenceSupported != null);
            } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect().assertFail();
            }
            await sleep(1000);
            done();
        });
		
		
    
    
    })
}

