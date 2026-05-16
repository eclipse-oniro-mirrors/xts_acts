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
import geolocations from '@system.geolocation';
import geolocation from '@ohos.geolocation';
import geolocationm from '@ohos.geoLocationManager';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osaccount from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import wifiMg from '@ohos.wifiManager';
import notificationManager from '@ohos.notificationManager';

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode() {
    let result1 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result1));
    if (!result1) {
        await geolocation.requestEnableLocation().then((result) => {
            console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + JSON.stringify(error));
            expect().assertFail();
        });
    }
    let result2 = geolocationm.isLocationEnabled();
    console.info('====>[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result2));
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
        let permissionName3 = 'ohos.permission.APPROXIMATELY_LOCATION';
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
        await atManager.grantUserGrantedPermission(tokenID, permissionName3, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}

export default function geolocationTest_GeoErr() {
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
            if(!wifiMg.isWifiActive()){
                console.info("======> wifi_test/enable wifi:" + wifiMg.enableWifi());
                await sleep(5000);
              }
              
              try {
                let data = await wifiMg.getLinkedInfo();
                console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
                console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
                console.info("======> Internet chload : " + JSON.stringify(data.chload));
                console.info("======> Internet rssi : " + JSON.stringify(data.rssi));
                    
                if (data.connState == wifiMg.ConnState.CONNECTED) {
                  console.info("======> WLAN connection established ");
                } else {
                  expect().message("======> WLAN Network error").assertFail();
                  done();
                }
                if (data.chload >= 900 || data.rssi <= -80) {
                  expect().message("======> WLAN Network error").assertFail();
                  done();
                } else if (data.chload >= 500) {
                  console.info("======> The internet connection is poor. ");
                }
                    
              } catch (err) {
                console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
                done();
              }
            done();
        })


        /**
         * @tc.name   SUB_HSS_LocationSystem_GeoErr_0400
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0400
         * @tc.desc   Incorrect input parameters are used to invoke the reverse geocoding service.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
                console.info("[lbs_js] getAddressesFromLocation4 callback try error:" + JSON.stringify(error) + "code" + error.code + "mes" + error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })

        /**
         * @tc.name   SUB_HSS_LocationSystem_GeoErr_0500
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0500
         * @tc.desc   Incorrect input parameters are used to invoke the reverse geocoding service.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_LocationSystem_GeoErr_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let reverseGeocodeRequest = "1";
                    let result = await geolocationm.getAddressesFromLocation(reverseGeocodeRequest);
                    console.info("[lbs_js] getAddressesFromLocation5 promise successful:" + JSON.stringify(result));
                } catch (error) {
                    console.info('[lbs_js] getAddressesFromLocation5 promise err:' + JSON.stringify(error) + "code" + error.code + "mes" + error.message);
                    expect(error.code).assertEqual("401");
                }
            })();
            await sleep(1000);
            done();
        })

        /**
         * @tc.name   SUB_HSS_LocationSystem_GeoErr_0600
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0600
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocationName6 try err." + JSON.stringify(error) + "code" + error.code + "mes" + error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })

        /**
         * @tc.name   SUB_HSS_LocationSystem_GeoErr_0700
         * @tc.number SUB_HSS_LocationSystem_GeoErr_0700
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_LocationSystem_GeoErr_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let geocodeRequest = 1;
                    let result = await geolocationm.getAddressesFromLocationName(geocodeRequest);
                    console.info("[lbs_js] getAddressesFromLocationName7 promise successful:" + JSON.stringify(result));
                } catch (error) {
                    console.info('[lbs_js] getAddressesFromLocationName7 promise err:' + JSON.stringify(error) + "code" + error.code + "mes" + error.message);
                    expect(error.code).assertEqual("401");
                }
            })();
            await sleep(1000);
            done();
        })

        /**
         * @tc.name   SUB_HSS_Addbeaconfence_0100
         * @tc.number SUB_HSS_Addbeaconfence_0100
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
                    identifier: "1",
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
         * @tc.name   SUB_HSS_Addbeaconfence_0200
         * @tc.number SUB_HSS_Addbeaconfence_0200
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_Addbeaconfence_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    identifier: "2",
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
         * @tc.name   SUB_HSS_Removebeaconfence_0100
         * @tc.number SUB_HSS_Removebeaconfence_0100
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_HSS_isBeaconFenceSupported_0100
         * @tc.number SUB_HSS_isBeaconFenceSupported_0100
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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



        /**
         * @tc.name   SUB_HSS_getSupportedCoordTypes_0400
         * @tc.number SUB_HSS_getSupportedCoordTypes_0400
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_getSupportedCoordTypes_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let types = geolocations.isBeaconFenceSupported();
                console.info("getSupportedCoordTypes0400:" + JSON.stringify(types));
                expect(types.length>0).assertTrue();
            } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
            }
            await sleep(1000);
            done();
        });  
                 

        /**
         * @tc.name   SUB_HSS_isBeaconFenceSupported_0200
         * @tc.number SUB_HSS_isBeaconFenceSupported_0200
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isBeaconFenceSupported_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let isBeaconFenceSupported = geolocationm.isBeaconFenceSupported();
                console.info("isBeaconFenceSupported0200:" + JSON.stringify(isBeaconFenceSupported));
                expect(isBeaconFenceSupported).assertTrue();
            } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
            }
            await sleep(1000);
            done();
        });
        
        
        /**
         * @tc.name   SUB_HSS_removeBeaconFence_0200
         * @tc.number SUB_HSS_removeBeaconFence_0200
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_removeBeaconFence_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_removeBeaconFence_0200 : " + isAcessToken);
            await geolocationm.enableLocation()
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X55,
                        0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X55]);
                      let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                        0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);
                      let manufactureData = {
                        manufactureId: 0X004C,
                        manufactureData: manufactureDataBuffer.buffer,
                        manufactureDataMask: manufactureDataMaskBuffer.buffer
                      };
                      let beacon = {
                        identifier: "11",
                        beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                        manufactureData:manufactureData
                      };
                      geolocationm.removeBeaconFence(beacon).then(() => {
                        console.info("promise, removeBeaconFence0200 success");
                      })
                      .catch((err) => {
                        if(err.code==3301602){
                            console.info("[lbs_js] The device Capability not supported."+JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                            expect(err.code).assertEqual(3301602);
                        }
                        if(err.code==801){
                            console.info("[lbs_js] The device Capability not supported."+JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                            expect(err.code).assertEqual(801);
                        }
                      });
                } catch (error) {
                    console.error("[lbs_js] Promise removeBeaconFence0200 callback try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        }); 
        
        
        /**
         * @tc.name   SUB_HSS_removeBeaconFence_0300
         * @tc.number SUB_HSS_removeBeaconFence_0300
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_removeBeaconFence_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_removeBeaconFence_0300 : " + isAcessToken);
            await geolocationm.enableLocation()
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X55,
                        0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X55]);
                      let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                        0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);
                      let manufactureData = {
                        manufactureId: 0X004C,
                        manufactureData: manufactureDataBuffer.buffer,
                        manufactureDataMask: manufactureDataMaskBuffer.buffer
                      };
                      let beacon = {
                        identifier: "11",
                        beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                        manufactureData:manufactureData
                      };
                      geolocationm.removeBeaconFence(beacon).then(() => {
                        console.info("promise, removeBeaconFence0300 success");
                      }).catch((err) => {
                        if(err.code==3301602){
                            console.info("[lbs_js] The device Capability not supported."+JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                            expect(err.code).assertEqual(3301602);
                        }
                        if(err.code==201){
                            console.info("[lbs_js] The device Capability not supported."+JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                            expect(err.code).assertEqual(201);
                        }
                      });
                } catch (error) {
                    console.error("[lbs_js] Promise removeBeaconFence0300   try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        });


        /**
         * @tc.name   SUB_HSS_isWlanBssidMatched_0100
         * @tc.number SUB_HSS_isWlanBssidMatched_0100
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isWlanBssidMatched_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isWlanBssidMatched_0100: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let wlanBssidArray = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
                    let bssid = geolocationm.getCurrentWifiBssidForLocating();
                    console.info("getCurrentWifiBssidForLocating_0100" + bssid);
                    if(bssid) {
                        wlanBssidArray.push(bssid);
                    } else {
                        console.info("get bssid fail");
                    }
                    let rssiThreshold = -100;
                    let needStartScan = true;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("isWlanBssidMatched0100 Wlan Bssid Matched Result:" + res);
                          expect(res).assertTrue();
                    })
                } catch (error) {
                    console.error("[lbs_js] Promise isWlanBssidMatched0100:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        }); 
        

        /**
         * @tc.name   SUB_HSS_isWlanBssidMatched_0200
         * @tc.number SUB_HSS_isWlanBssidMatched_0200
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isWlanBssidMatched_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isWlanBssidMatched_0200: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let wlanBssidArray = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
                    let rssiThreshold = -1;
                    let needStartScan = true;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("isWlanBssidMatched0200 Wlan Bssid Matched Result:" + res);
                          expect(res).assertFalse();
                    })
                } catch (error) {
                    console.error("[lbs_js] Promise isWlanBssidMatched0200:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        });        


        /**
         * @tc.name   SUB_HSS_isWlanBssidMatched_0300
         * @tc.number SUB_HSS_isWlanBssidMatched_0300
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isWlanBssidMatched_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isWlanBssidMatched_0300: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let wlanBssidArray = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
                    let rssiThreshold = -100;
                    let needStartScan = true;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("isWlanBssidMatched0300 Wlan Bssid Matched Result:" + res);
                    }).catch((error) => {
                        console.error("[lbs_js] Promis then error" + JSON.stringify(error));
                        expect(error.code).assertEqual(201);
                    });
                } catch (error) {
                    console.error("[lbs_js] Promise isWlanBssidMatched0300:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        }); 
        
        /**
         * @tc.name   SUB_HSS_isWlanBssidMatched_0400
         * @tc.number SUB_HSS_isWlanBssidMatched_0400
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isWlanBssidMatched_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isWlanBssidMatched_0400: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let wlanBssidArray = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
                    let rssiThreshold = -100;
                    let needStartScan = true;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("isWlanBssidMatched0400 Wlan Bssid Matched Result:" + res);
                    }).catch((error) => {
                        console.error("[lbs_js] Promis then error" + JSON.stringify(error));
                        expect(error.code).assertEqual(801);
                    });
                } catch (error) {
                    console.error("[lbs_js] Promise isWlanBssidMatched0400:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        });   
        
        /**
         * @tc.name   SUB_HSS_isWlanBssidMatched_0500
         * @tc.number SUB_HSS_isWlanBssidMatched_0500
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isWlanBssidMatched_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isWlanBssidMatched_0400: " + isAcessToken);
            await geolocationm.disableLocation()
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let wlanBssidArray = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
                    let rssiThreshold = -100;
                    let needStartScan = true;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("isWlanBssidMatched0500 Wlan Bssid Matched Result:" + res);
                    }).catch((error) => {
                        console.error("[lbs_js] Promis then error" + JSON.stringify(error));
                        expect(error.code).assertEqual(3301100);
                    });
                } catch (error) {
                    console.error("[lbs_js] Promise isWlanBssidMatched0500:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await geolocationm.enableLocation()
                await sleep(1000);
                done();
            }            
        }); 

        /**
         * @tc.name   SUB_HSS_isWlanBssidMatched_0600
         * @tc.number SUB_HSS_isWlanBssidMatched_0600
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isWlanBssidMatched_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isWlanBssidMatched_0600: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let wlanBssidArray = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
                    let rssiThreshold = -100;
                    let needStartScan = true;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("isWlanBssidMatched0600 Wlan Bssid Matched Result:" + res);
                          expect(true).assertEqual(res!=null);
                    }).catch((error) => {
                        console.error("[lbs_js] Promis then error" + JSON.stringify(error));
                        expect(error.code).assertEqual(3301800);
                    });
                } catch (error) {
                    console.error("[lbs_js] Promise isWlanBssidMatched0600:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        }); 
        
        
        /**
         * @tc.name   SUB_HSS_isWlanBssidMatched_0700
         * @tc.number SUB_HSS_isWlanBssidMatched_0700
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_isWlanBssidMatched_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isWlanBssidMatched_0700: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let wlanBssidArray = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
                    let bssid = geolocationm.getCurrentWifiBssidForLocating();
                    console.info("getCurrentWifiBssidForLocating_0100" + bssid);
                    if(bssid) {
                        wlanBssidArray.push(bssid);
                    } else {
                        console.info("get bssid fail");
                    }
                    let rssiThreshold = -100;
                    let needStartScan = true;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("isWlanBssidMatched0700 Wlan Bssid Matched Result:" + res);
                          expect(res).assertTrue();
                    }).catch((err) => {
                        if(err.code == 801){
                            console.info("[lbs_js] The device Capability not supported API."+JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                            expect(err.code).assertEqual(801);
                        }else{
                            console.info("[lbs_js] Promise isWlanBssidMatched0700:"+ JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                            expect().assertTrue();
                        }
                    });
                } catch (err) {
                    console.info("[lbs_js] Promise isWlanBssidMatched0700:"+ JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                }
                await sleep(1000);
                done();
            }            
        });        

        
        /**
         * @tc.name   SUB_HSS_addBeaconFence_0400
         * @tc.number SUB_HSS_addBeaconFence_0400
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_addBeaconFence_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_addBeaconFence_0400: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X12, 0X33, 0X44, 0X55,
                        0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X55]);
                      let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                        0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);
                    
                      let manufactureData = {
                        manufactureId: 0X004C,
                        manufactureData: manufactureDataBuffer.buffer,
                        manufactureDataMask: manufactureDataMaskBuffer.buffer
                      };
                    
                      let beacon = {
                        identifier: "3",
                        beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                        manufactureData:manufactureData
                      };
                    
                      let fenceRequest = {
                        beacon: beacon,
                        transitionCallback: (transition) => {
                          if (transition) {
                            console.info("GeofenceTransition: err" + JSON.stringify(transition));
                          }
                        },
                        fenceExtensionAbilityName: "MyFenceExtensionAbility",
                      };
                      geolocationm.addBeaconFence(fenceRequest).then((id) => {
                        console.info("addBeaconFence0400 success, fence id:" + id);
                        expect(true).assertEqual(JSON.stringify(id)!=null);
                      }).catch((err) => {
                        console.error('promise, addBeaconFence0400: error=' + JSON.stringify(err));
                        expect(err.code).assertEqual(201);
                      });
                } catch (error) {
                    console.error("[lbs_js] Promise addBeaconFence0400:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        });  
        
        /**
         * @tc.name   SUB_HSS_addBeaconFence_0500
         * @tc.number SUB_HSS_addBeaconFence_0500
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_addBeaconFence_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_addBeaconFence_0500: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X55,
                        0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X12, 0X33, 0X44, 0X55]);
                      let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                        0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);
                    
                      let manufactureData = {
                        manufactureId: 0X004C,
                        manufactureData: manufactureDataBuffer.buffer,
                        manufactureDataMask: manufactureDataMaskBuffer.buffer
                      };
                    
                      let beacon = {
                        identifier: "4",
                        beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                        manufactureData:manufactureData
                      };
                    
                      let fenceRequest = {
                        beacon: beacon,
                        transitionCallback: (transition) => {
                          if (transition) {
                            console.info("SUB_HSS_addBeaconFence_0500: err" + JSON.stringify(transition));
                          }
                        },
                        fenceExtensionAbilityName: "MyFenceExtensionAbility",
                      };
                      geolocationm.addBeaconFence(fenceRequest).then((id) => {
                        console.info("addBeaconFence0500 success, fence id:" + id);
                        expect(true).assertEqual(id!=null);
                      }).catch((err) => {
                        console.error('promise, addBeaconFence0500: error=' + JSON.stringify(err));
                        if(err.code==3501101){
                            expect(err.code).assertEqual(3501101);
                        }
                        if(err.code==3501603){
                            expect(err.code).assertEqual(3501603);
                        }
                      });
                } catch (error) {
                    console.error("[lbs_js] Promise addBeaconFence0500:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        }); 
        
        /**
         * @tc.name   SUB_HSS_addBeaconFence_0600
         * @tc.number SUB_HSS_addBeaconFence_0600
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_addBeaconFence_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_addBeaconFence_0600: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X55,
                        0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X51]);
                      let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                        0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);
                    
                      let manufactureData = {
                        manufactureId: 0X004C,
                        manufactureData: manufactureDataBuffer.buffer,
                        manufactureDataMask: manufactureDataMaskBuffer.buffer
                      };

                      for (let identifier = 20; identifier < 1020; identifier++) {

                        let beacon = {
                            identifier:JSON.stringify(identifier),
                            beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                            manufactureData:manufactureData
                          };
                        
                          let fenceRequest = {
                            beacon: beacon,
                            transitionCallback: (transition) => {
                              if (transition) {
                                console.info("SUB_HSS_addBeaconFence_0600:" + JSON.stringify(transition));
                              }
                            },
                            fenceExtensionAbilityName: "MyFenceExtensionAbility",
                          };

                        try {
                           await geolocationm.addBeaconFence(fenceRequest)
                        } catch (error) {
                            console.info("SUB_HSS_addBeaconFence_0600:catch (error)" + JSON.stringify(error));
                        }
                      }

                      let beacon = {
                        identifier:1021,
                        beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                        manufactureData:manufactureData
                      };
                      let fenceRequest1 = {
                        beacon: beacon,
                        transitionCallback: (transition) => {
                          if (transition) {
                            console.info("SUB_HSS_addBeaconFence_0600:" + JSON.stringify(transition));
                          }
                        },
                        fenceExtensionAbilityName: "MyFenceExtensionAbility",
                      };                      

                      geolocationm.addBeaconFence(fenceRequest1).then((id) => {
                        console.info("addBeaconFence0600 success, fence id:" + id);
                        expect(true).assertEqual(id!=null);
                      }).catch((err) => {
                        console.error('promise, addBeaconFence0500: error=' + JSON.stringify(err));
                        expect(err.code).assertEqual(3501601);
                      });
                } catch (error) {
                    console.error("[lbs_js] Promise addBeaconFence0600:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        });  
        
        /**
         * @tc.name   SUB_HSS_addBeaconFence_0700
         * @tc.number SUB_HSS_addBeaconFence_0700
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_addBeaconFence_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_addBeaconFence_0700: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let manufactureDataBuffer = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X15,
                        0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X55]);
                      let manufactureDataMaskBuffer = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                        0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);
                    
                      let manufactureData = {
                        manufactureId: 0X004C,
                        manufactureData: manufactureDataBuffer.buffer,
                        manufactureDataMask: manufactureDataMaskBuffer.buffer
                      };
                    
                      let beacon = {
                        identifier: "5",
                        beaconFenceInfoType: geolocationm.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
                        manufactureData:manufactureData
                      };
                    
                      let fenceRequest = {
                        beacon: beacon,
                        transitionCallback: (transition) => {
                          if (transition) {
                            console.info("SUB_HSS_addBeaconFence_0700: err" + JSON.stringify(transition));
                          }
                        },
                        fenceExtensionAbilityName: "MyFenceExtensionAbility",
                      };
                      geolocationm.addBeaconFence(fenceRequest).then((id) => {
                        console.info("addBeaconFence0700 success, fence id:" + id);
                        expect(true).assertEqual(JSON.stringify(id)!=null);
                      }).catch((err) => {
                        if(err.code==3501603){
                            expect(err.code).assertEqual(3501603);
                        }                        
                        if(err.code==801){
                            console.info("[lbs_js] The device Capability not supported."+JSON.stringify(err) +"code"+ err.code +"mes"+ err.message);
                            expect(err.code).assertEqual(801);
                        }
                      });
                } catch (error) {
                    console.info("[lbs_js] Promise addBeaconFence0700:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        });         
                  
  
         /**
          * @tc.name   SUB_HSS_getGeofenceSupportedCoordTypes_0600
          * @tc.number SUB_HSS_getGeofenceSupportedCoordTypes_0600
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getGeofenceSupportedCoordTypes_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getGeofenceSupportedCoordTypes_0600: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let supportedCoordTypes = geolocationm.getGeofenceSupportedCoordTypes();
                    console.info("getGeofenceSupportedCoordTypes return:" + JSON.stringify(supportedCoordTypes));
                    if(supportedCoordTypes.length>0){
                        expect(supportedCoordTypes.length>0).assertTrue();
                    }else{
                        console.info("The device Capability not supported." + JSON.stringify(supportedCoordTypes));
                        expect(supportedCoordTypes.length==0).assertTrue();
                    }
                } catch (error) {
                    console.error("[lbs_js] Promise getGeofenceSupportedCoordTypes0600:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        });
        

         /**
          * @tc.name   SUB_HSS_isGeocoderAvailable_0001
          * @tc.number SUB_HSS_isGeocoderAvailable_0001
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_isGeocoderAvailable_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isGeocoderAvailable_0001: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    let isGeocoderAvailable = geolocationm.isGeocoderAvailable();
                    console.info("isGeocoderAvailable01 return:" + JSON.stringify(isGeocoderAvailable));
                    if (isGeocoderAvailable) {
                        let geocodeRequest = {"description": "上海市浦东新区金穗路1800号", "maxItems": 5};
                        try {
                            geolocationm.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                                console.info('SUB_HSS_isGeocoderAvailable_0001: data=' + JSON.stringify(data));
                                if(data){
                                    expect(data.length>0).assertTrue();
                                }else{
                                    console.info("The device Capability not supported." + JSON.stringify(data));
                                    expect(true).assertFalse();
                                }
                            });
                        } catch (err) {
                            console.error("errCode:" + err.code + ", message:"  + err.message);
                        }
                    } else {
                        let geocodeRequest = {"description": "上海市浦东新区金穗路1800号", "maxItems": 1};
                        try {
                            geolocationm.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                                console.info('SUB_HSS_isGeocoderAvailable_0001: data=' + JSON.stringify(data));
                                if(data){
                                    expect(true).assertFalse();
                                }else{
                                    console.info("The device Capability not supported." + JSON.stringify(data));
                                    expect(data === undefined || data === null).assertTrue();
                                }
                            });
                        } catch (err) {
                            console.error("errCode:" + err.code + ", message:"  + err.message);
                        }
                    }
                } catch (error) {
                    console.error("[lbs_js] Promise isGeocoderAvailable01:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                }
                await sleep(1000);
                done();
            }            
        }); 
        
 
        
         /**
          * @tc.name   SUB_HSS_getAddressesFromLocationName_0005
          * @tc.number SUB_HSS_getAddressesFromLocationName_0005
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getAddressesFromLocationName_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getAddressesFromLocationName_0005: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let geocodeRequest = {"description": "上海市浦东新区金穗路1800号", "maxItems": 5};
                
                try {
                    geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                        console.info('getAddressesFromLocationName: ' + JSON.stringify(result));
                        expect(result.length>0).assertTrue();
                    })
                    .catch((error) => {
                        console.error('promise, getAddressesFromLocationName: error=' + JSON.stringify(error));
                    });
                } catch (err) {
                    console.error("errCode:" + err.code + ", message:"  + err.message);
                }
                await sleep(1000);
                done();
            }            
        });        

        
         /**
          * @tc.name   SUB_HSS_getAddressesFromLocationName_0900
          * @tc.number SUB_HSS_getAddressesFromLocationName_0900
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getAddressesFromLocationName_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getAddressesFromLocationName_0900: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let geocodeRequest = {"description": "unfind00", "maxItems": 1};
                try {
                    geolocationm.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                        if(err){
                            console.error("getAddressesFromLocationName_0900: errCode:" + err + ", message:"  + err.message);
                            expect(err.code).assertEqual(3301400);
                        }if(data){
                            console.info('getAddressesFromLocationName_0900: data=' + JSON.stringify(data));
                        }
                    });
                } catch (err) {
                    console.error("errCode:" + err.code + ", message:"  + err.message);
                }
                await sleep(1000);
                done();
            }            
        });       

         /**
          * @tc.name   SUB_HSS_getAddressesFromLocationName_1100
          * @tc.number SUB_HSS_getAddressesFromLocationName_1100
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getAddressesFromLocationName_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getAddressesFromLocationName_1100: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let geocodeRequest = {"description": "上海市浦东新区金穗路1800号", "maxItems": 1};
                try {
                    geolocationm.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                        console.info('getAddressesFromLocationName0800: data=' + JSON.stringify(data));
                        if(data){
                            expect(data.length>0).assertTrue();
                        }else{
                            console.info("The device Capability not supported." + JSON.stringify(data));
                            expect(data === undefined || data === null).assertTrue();
                        }
                    });
                } catch (err) {
                    console.error("errCode:" + err.code + ", message:"  + err.message);
                }
                await sleep(1000);
                done();
            }            
        }); 

         /**
          * @tc.name   SUB_HSS_getAddressesFromLocation_0001
          * @tc.number SUB_HSS_getAddressesFromLocation_0001
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getAddressesFromLocation_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getAddressesFromLocation_0001: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let reverseGeocodeRequest = {"latitude": 31.12, "longitude": 121.11, "maxItems": 1};
                try {
                    geolocationm.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                        console.info('getAddressesFromLocation0001: ' + JSON.stringify(data));
                        expect(data.length>0).assertTrue();
                    })
                    .catch((error) => {
                        console.error('promise, getAddressesFromLocation0001: error=' + JSON.stringify(error));
                    });
                } catch (err) {
                    console.error("errCode:" + err.code + ", message:"  + err.message);
                }                
                await sleep(1000);
                done();
            }            
        });  
               
           
         /**
          * @tc.name   SUB_HSS_getAddressesFromLocation_0200
          * @tc.number SUB_HSS_getAddressesFromLocation_0200
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getAddressesFromLocation_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getAddressesFromLocation_0200: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let reverseGeocodeRequest = {"latitude": 31.12, "longitude": 121.11, "maxItems": 1};
                try {
                    geolocationm.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                        console.info('getAddressesFromLocation0200: data=' + JSON.stringify(data));
                        if(data){
                            console.info('getAddressesFromLocation0200: data=' + JSON.stringify(data));
                            expect(data.length>0).assertTrue();
                        }else{
                            expect(data === undefined || data === null).assertTrue();
                        }
                    });
                } catch (err) {
                    console.error("errCode:" + err.code + ", message:"  + err.message);
                }
                await sleep(1000);
                done();
            }            
        });   
        
         /**
          * @tc.name   SUB_HSS_getAddressesFromLocation_0300
          * @tc.number SUB_HSS_getAddressesFromLocation_0300
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getAddressesFromLocation_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getAddressesFromLocation_0300: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let isGeocoderAvailable = geolocationm.isGeocoderAvailable();
                let reverseGeocodeRequest = {"latitude": 31.12, "longitude": 121.11, "maxItems": 1};
                try {
                    geolocationm.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                        console.info('getAddressesFromLocation0300: data=' + JSON.stringify(data));
                        if (isGeocoderAvailable){
                            expect(data.length>0).assertTrue();
                        } else {
                            expect(data === undefined || data === null).assertTrue();
                        }
                        
                    });
                } catch (err) {
                    console.error("getAddressesFromLocation0300:errCode:" + err.code + ", message:"  + err.message);
                }
                await sleep(1000);
                done();
            }            
        });  
       
         /**
          * @tc.name   SUB_HSS_locationEnabledChange_0300
          * @tc.number SUB_HSS_locationEnabledChange_0300
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_locationEnabledChange_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_locationEnabledChange_0300: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let locationEnabledChange = (state) => {
                    console.info('locationEnabledChange: state:' + JSON.stringify(state));
                    expect(state).assertTrue()
                }
                try {
                    geolocationm.on('locationEnabledChange', locationEnabledChange);
                } catch (err) {
                    console.error("locationEnabledChange_0300errCode:" + err.code + ", message:"  + err.message);
                }
                await sleep(1000);
                done();
            }            
        });

         /**
         * @tc.name   SUB_HSS_isGeoServiceAvailable_0001
         * @tc.number SUB_HSS_isGeoServiceAvailable_0001
         * @tc.desc   Invoke the geocoding service with incorrect input parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_HSS_isGeoServiceAvailable_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isGeoServiceAvailable_0001: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try{
                    geolocation.isGeoServiceAvailable((err, data) => {
                        if (data) {
                            console.info('isGeoServiceAvailable_0001: data=' + JSON.stringify(data));
                            expect(data).assertTrue();
                        }
                    })
                }catch(err){
                    console.info("isGeoServiceAvailable_0001：errCode:" + err + ", message:"  + err.message);
                }
                await sleep(1000);
                done();
            }            
        });        
        
         /**
          * @tc.name   SUB_HSS_isGeoServiceAvailable_0002
          * @tc.number SUB_HSS_isGeoServiceAvailable_0002
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_isGeoServiceAvailable_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_isGeoServiceAvailable_0002: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                geolocation.isGeoServiceAvailable().then((result) => {
                    console.info('promise, isGeoServiceAvailable0002: ' + JSON.stringify(result));
                    if(result) {
                        expect(result).assertTrue();
                    }
                });
                await sleep(1000);
                done();
            }            
        });     
         
        
         /**
          * @tc.name   SUB_geolocation_getAddressesFromLocationName_0003
          * @tc.number SUB_geolocation_getAddressesFromLocationName_0003
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_geolocation_getAddressesFromLocationName_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_geolocation_getAddressesFromLocationName_0003: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let geocodeRequest = {"description": "上海市浦东新区金穗路1800号", "maxItems": 1};
                geolocation.getAddressesFromLocationName(geocodeRequest).then((data) => {
                    console.info('geolocationgetAddressesFromLocationName0003: ' + JSON.stringify(data));
                    expect(data.length>0).assertTrue();
                });
                await sleep(1000);
                done();
            }            
        });   
        
         /**
          * @tc.name   SUB_geolocation_getAddressesFromLocationName_0004
          * @tc.number SUB_geolocation_getAddressesFromLocationName_0004
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_geolocation_getAddressesFromLocationName_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getAddressesFromLocationName_0004: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let isGeocoderAvailable = geolocationm.isGeocoderAvailable();
                let geocodeRequest = {"description": "上海市浦东新区金穗路1800号", "maxItems": 1};
                geolocation.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                    console.info('geolocationgetAddressesFromLocationName0004: data=' + JSON.stringify(data));
                    if (isGeocoderAvailable){
                        expect(data.length>0).assertTrue();
                    } else {
                        expect(data === undefined || data === null).assertTrue();
                    }
                });
                await sleep(1000);
                done();
            }            
        });   


         /**
          * @tc.name   SUB_geolocation_getAddressesFromLocationName_0005
          * @tc.number SUB_geolocation_getAddressesFromLocationName_0005
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_geolocation_getAddressesFromLocationName_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_geolocation_getAddressesFromLocationName_0005: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let geocodeRequest = {"description": "111", "maxItems": 1,"minLatitude":0,"minLongitude":0};
                geolocation.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                    console.info('geolocationgetAddressesFromLocationName0005: data=' + JSON.stringify(data));
                    expect(data).assertEqual(undefined);
                });
                await sleep(1000);
                done();
            }            
        });   
        
        
         /**
          * @tc.name   SUB_geolocation_getAddressesFromLocation_0006
          * @tc.number SUB_geolocation_getAddressesFromLocation_0006
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_geolocation_getAddressesFromLocation_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_geolocation_getAddressesFromLocation_0006: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let isGeocoderAvailable = geolocationm.isGeocoderAvailable();
                let reverseGeocodeRequest = {"latitude": 31.12, "longitude": 121.11, "maxItems": 1};
                geolocation.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                    console.info('geolocationgetAddressesFromLocation0006: ' + JSON.stringify(data));
                    if (isGeocoderAvailable){
                        expect(data.length>0).assertTrue();
                    } else {
                        expect(data === undefined || data === null).assertTrue();
                    }
                });
                await sleep(1000);
                done();
            }            
        });         


         /**
          * @tc.name   SUB_geolocation_getAddressesFromLocation_0007
          * @tc.number SUB_geolocation_getAddressesFromLocation_0007
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_geolocation_getAddressesFromLocation_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_geolocation_getAddressesFromLocation_0007: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let isGeocoderAvailable = geolocationm.isGeocoderAvailable();
                let reverseGeocodeRequest = {"latitude": 31.12, "longitude": 121.11, "maxItems": 1};
                geolocation.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                    console.info('geolocationgetAddressesFromLocation0007: data=' + JSON.stringify(data));
                    if (isGeocoderAvailable){
                        expect(data.length>0).assertTrue();
                    } else {
                        expect(data === undefined || data === null).assertTrue();
                    }
                });
                await sleep(1000);
                done();
            }            
        }); 
        
         /**
          * @tc.name   SUB_geolocation_getAddressesFromLocation_0008
          * @tc.number SUB_geolocation_getAddressesFromLocation_0008
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_geolocation_getAddressesFromLocation_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_geolocation_getAddressesFromLocation_0008: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let reverseGeocodeRequest = {"latitude": -31.12, "longitude": -121.11, "maxItems": 0};
                geolocation.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                    console.info('geolocationgetAddressesFromLocation0008: data=' + JSON.stringify(data));
                    expect(data).assertEqual(undefined);
                });
                await sleep(1000);
                done();
            }            
        });   
        
         /**
          * @tc.name   SUB_HSS_requestEnableLocation_0002
          * @tc.number SUB_HSS_requestEnableLocation_0002
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_requestEnableLocation_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_requestEnableLocation_0002: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                geolocation.requestEnableLocation().then((result) => {
                    console.info('promise, requestEnableLocation0002: ' + JSON.stringify(result));
                    expect(result).assertTrue();
                });
                await sleep(1000);
                done();
            }            
        });   
        
         /**
          * @tc.name   SUB_HSS_locationServiceState_0001
          * @tc.number SUB_HSS_locationServiceState_0001
          * @tc.desc   Invoke the geocoding service with incorrect input parameters.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_locationServiceState_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_locationServiceState_0001: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                geolocation.on('locationServiceState', (state) => {
                    console.info('locationServiceState: ' + JSON.stringify(state));
                    expect(state).assertTrue();
                });
                await sleep(1000);
                done();
            }            
        });

         /**
          * @tc.name   SUB_HSS_addGnssGeofence_0001
          * @tc.number SUB_HSS_addGnssGeofence_0001
          * @tc.desc   GnssGeofence.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */        
         it('SUB_HSS_addGnssGeofence_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {        
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_addGnssGeofence_0001: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let geofence = {
                    "latitude": 34.12,
                    "longitude": 124.11,
                    "radius": 10000.0,
                    "expiration": 10000.0
                }
                let transitionStatusList = [
                    geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
                    geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
                ];
                let notificationRequest1 = {
                    id: 1,
                    content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: "围栏通知",
                            text: "围栏进入",
                            additionalText: ""
                        }
                    }
                };
                let notificationRequest2 = {
                    id: 2,
                    content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: "围栏通知",
                            text: "围栏进入",
                            additionalText: ""
                        }
                    }
                };
                let notificationRequestList = [notificationRequest1, notificationRequest2];
                let gnssGeofenceRequest = {
                    geofence: geofence,
                    monitorTransitionEvents: transitionStatusList,
                    notifications: notificationRequestList,
                    loiterTimeMs: 10000,
                    fenceExtensionAbilityName: "fenceExtensionAbility",
                    geofenceTransitionCallback: (err, transition) => {
                        if (err) {
                            console.error('SUB_HSS_addGnssGeofence_0001 geofenceTransitionCallback: err=' + JSON.stringify(err));
                        }
                        if (transition) {
                            console.info("SUB_HSS_addGnssGeofence_0001 GeofenceTransition: %{public}s", JSON.stringify(transition)); 
                        }
                }
                };
                try { 
                    console.info("SUB_HSS_addGnssGeofence_0001 ======>loiterTimeMs ", typeof gnssGeofenceRequest.loiterTimeMs);
                    expect(typeof gnssGeofenceRequest.loiterTimeMs).assertEqual("number");
                    console.info("SUB_HSS_addGnssGeofence_0001 ======>fenceExtensionAbilityName ", typeof gnssGeofenceRequest.fenceExtensionAbilityName);
                    expect(typeof gnssGeofenceRequest.fenceExtensionAbilityName).assertEqual("string");                    
                } catch (error) {
                    console.error("SUB_HSS_addGnssGeofence_0001:" + JSON.stringify(error));
                }
                await sleep(1000);
                done();
            }
        });

         /**
          * @tc.name   SUB_HSS_getActiveGeofences_0001
          * @tc.number SUB_HSS_getActiveGeofences_0001
          * @tc.desc   GnssGeofence.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL2
          */
         it('SUB_HSS_getActiveGeofences_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {        
            var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
            console.info("SUB_HSS_getActiveGeofences_0001: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Gnss");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                try {
                    geolocationm.getActiveGeoFences().then((res) => {
                        if (res) {
                            console.info("SUB_HSS_getActiveGeofences_0001, fence num: " + res.size);
                            expect(res != null).assertTrue();
                            done();
                        }
                    }).catch((error) => {
                        console.error("promise, SUB_HSS_getActiveGeofences_0001 error=" + error.code);
                        expect(error.code).assertEqual(801);
                    });
                } catch (error) {
                    console.error("SUB_HSS_getActiveGeofences_0001: errCode" + error.code + ", errMessage" + error.message);
                    expect().assertFalse();
                }
                await sleep(1000);
                done();
            }
        });        
        
        /**
         * @tc.number  SUB_HSS_testGeolocationManagerConfig001
         * @tc.name  SUB_HSS_testGeolocationManagerConfig001
         * @tc.desc  Test Location API functionality
         * @tc.level  Level 2
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('SUB_HSS_testGeolocationManagerConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            expect(true).assertEqual(geolocationm.LocationRequestScenario.UNSET == 0x300)
            expect(true).assertEqual(geolocationm.LocationRequestScenario.NAVIGATION == 0x301)
            expect(true).assertEqual(geolocationm.LocationRequestScenario.TRAJECTORY_TRACKING == 0x302)
            expect(true).assertEqual(geolocationm.LocationRequestScenario.CAR_HAILING == 0x303)
            expect(true).assertEqual(geolocationm.LocationRequestScenario.DAILY_LIFE_SERVICE == 0x304)
            expect(true).assertEqual(geolocationm.LocationRequestScenario.NO_POWER == 0x305)

            expect(true).assertEqual(geolocation.LocationRequestScenario.UNSET == 0x300)
            expect(true).assertEqual(geolocation.LocationRequestScenario.NAVIGATION == 0x301)
            expect(true).assertEqual(geolocation.LocationRequestScenario.TRAJECTORY_TRACKING == 0x302)
            expect(true).assertEqual(geolocation.LocationRequestScenario.CAR_HAILING == 0x303)
            expect(true).assertEqual(geolocation.LocationRequestScenario.DAILY_LIFE_SERVICE == 0x304)
            expect(true).assertEqual(geolocation.LocationRequestScenario.NO_POWER == 0x305)

            expect(true).assertEqual(geolocationm.CoordinateSystemType.WGS84 == 1)
            expect(true).assertEqual(geolocationm.CoordinateSystemType.GCJ02 == 2)

            expect(true).assertEqual(geolocationm.LocationRequestPriority.UNSET == 0x200)
            expect(true).assertEqual(geolocationm.LocationRequestPriority.ACCURACY == 0X201)
            expect(true).assertEqual(geolocationm.LocationRequestPriority.LOW_POWER == 0x202)
            expect(true).assertEqual(geolocationm.LocationRequestPriority.FIRST_FIX == 0x203)

            expect(true).assertEqual(geolocation.LocationRequestPriority.UNSET == 0x200)
            expect(true).assertEqual(geolocation.LocationRequestPriority.ACCURACY == 0X201)
            expect(true).assertEqual(geolocation.LocationRequestPriority.LOW_POWER == 0x202)
            expect(true).assertEqual(geolocation.LocationRequestPriority.FIRST_FIX == 0x203)

            expect(true).assertEqual(geolocationm.LocationSourceType.GNSS == 1)
            expect(true).assertEqual(geolocationm.LocationSourceType.NETWORK == 2)
            expect(true).assertEqual(geolocationm.LocationSourceType.INDOOR == 3)
            expect(true).assertEqual(geolocationm.LocationSourceType.RTK == 4)

            done();

        });

        /**
         * @tc.name   SUB_HSS_locationchange_0001
         * @tc.number SUB_HSS_locationchange_0001
         * @tc.desc   locationchange
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_locationchange_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Core");
            console.info("SUB_HSS_locationchange_0001: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Core");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let requestInfo = {
                    'priority': null,
                    'scenario': null,
                };
                let locationChange = geolocationm.Location
                console.info('locationChange: data: ' + JSON.stringify(geolocationm.Location));
                try {
                    geolocationm.on('locationChange', requestInfo, locationChange);
                    expect(location != null).assertTrue(location);
                    done();
                } catch (err) {
                    console.info("errCode:" + err.code + ", message:" + err.message);
                    expect(false).assertFalse();
                }
                done();
            }
        });

        /**
         * @tc.name   SUB_HSS_locationchange_0002
         * @tc.number SUB_HSS_locationchange_0002
         * @tc.desc   locationchange
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_HSS_locationchange_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            var isAcessToken = canIUse("SystemCapability.Location.Location.Core");
            console.info("SUB_HSS_locationchange_0002: " + isAcessToken);
            if (!isAcessToken) {
                console.info("The device does not support Core");
                expect(isAcessToken).assertFalse();
                done();
            } else {
                let requestInfo = {
                    'priority': undefined,
                    'scenario': undefined,
                };
                let locationChange = geolocationm.Location
                console.info('locationChange: data: ' + JSON.stringify(geolocationm.Location));
                done();
                try {
                    geolocationm.on('locationChange', requestInfo, locationChange);
                    expect(location != null).assertTrue(location);
                    done();
                } catch (err) {
                    console.info("errCode:" + err.code + ", message:" + err.message);
                    expect(false).assertFalse();
                }
                done();
            }
        });

    })
}

