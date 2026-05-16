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
import notificationManager from '@ohos.notificationManager';
import wantAgent from '@ohos.wantAgent'
import FenceExtensionAbility from '@ohos.app.ability.FenceExtensionAbility'

let request_scenario_UNSET = geolocationm.LocationRequestScenario.UNSET
let request_scenario_NAVIGATION = geolocationm.LocationRequestScenario.NAVIGATION
let request_scenario_TRAJECTORY_TRACKING = geolocationm.LocationRequestScenario.TRAJECTORY_TRACKING
let request_scenario_CAR_HAILING = geolocationm.LocationRequestScenario.CAR_HAILING
let request_scenario_DAILY_LIFE_SERVICE = geolocationm.LocationRequestScenario.DAILY_LIFE_SERVICE
let request_scenario_NO_POWER = geolocationm.LocationRequestScenario.NO_POWER

let request_priority_UNSET = geolocationm.LocationRequestPriority.UNSET
let request_priority_ACCURACY = geolocationm.LocationRequestPriority.ACCURACY
let request_priority_LOW_POWER = geolocationm.LocationRequestPriority.LOW_POWER
let request_priority_FIRST_FIX = geolocationm.LocationRequestPriority.FIRST_FIX
let coordinate_WGS84 = geolocationm.CoordinateSystemType.WGS84

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode(){
    let result1 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result1));
    if(!result1){
        await geolocation.requestEnableLocation().then(async(result) => {
            ;
            console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + JSON.stringify(error));
            expect().assertFail();
        });
    }
    let result2 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result2));
}

async function enableLocationSwitch(){
    function enableLocationSwitchCallback(){
        return new Promise((resolve, reject)=>{
            geolocation.requestEnableLocation((err, data) => {
                if (err) {
                    console.info('[lbs_js]  requestEnableLocation callback err is : ' + err );
                }else {
                    console.info("[lbs_js] requestEnableLocation callback data: " + data);
                    expect(data).assertTrue();
                }
            });
        })
    }
    await enableLocationSwitchCallback();
    done();
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

export default function geolocationTest_geo8() {
    describe('geolocationTest_geo8', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            done();
        })
    
        beforeEach(function () {
            console.info('beforeEach case');
        })
        afterEach(function () {
        })

        afterAll(async function (done) {
            console.info('afterAll case');
            await changedLocationMode();
            done();
        });



        /**
         * @tc.name   testBlueToothScan01
         * @tc.number SUB_HSS_LOCATIONSYSTEM_BLUE_TOOTH_SCAN_0001
         * @tc.desc   Test Report Fence Transition.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testBlueToothScan01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let bluetoothScanResult = (result) => {
                console.info("[lbs_js] testBlueToothScan01 bluetoothScanResult" + JSON.stringify(result));
                expect(true).assertEqual(result.deviceId != 'NA')
                expect(true).assertEqual(result.rssi != -1)
                expect(true).assertEqual(result.data != undefined)
                expect(true).assertEqual(result.deviceName != 'NA')
                expect(true).assertEqual(result.connectable == true || result.connectable == false)
            }
            try {
                geolocationm.on('bluetoothScanResultChange', bluetoothScanResult)
            } catch(error) {
                console.info("[lbs_js] testBlueToothScan01 on err" + JSON.stringify(error));
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(true).assertFalse();
                }
            }
            try {
                geolocationm.off('bluetoothScanResultChange')
            } catch(error) {
                console.info("[lbs_js] testBlueToothScan01 off err" + JSON.stringify(error));
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(true).assertFalse();
                }
            }
            try {
                geolocationm.off('bluetoothScanResultChange', bluetoothScanResult)
            } catch(error) {
                console.info("[lbs_js] testBlueToothScan01 off err" + JSON.stringify(error));
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(true).assertFalse();
                }
            }
            done();
        })

        /**
         * @tc.name   testGetCurrentLocation41
         * @tc.number SUB_HSS_LOCATIONSYSTEM_SINGLELOC_4100
         * @tc.desc   Initiate a specified single location request and set the exception location timeout interval.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetCurrentLocation41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                await geolocationm.getCurrentLocation().then((result) => {
                    console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3900 promise result271 ' + JSON.stringify(result));
                }).catch(error => {
                    console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3900 promise err271:' + JSON.stringify(error));
                    expect(error.code).assertEqual(3301200);
                });
            } catch (error) {
                console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3900 promise try err." + JSON.stringify(error));
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(true).assertFail();
                }
            }
            await sleep(1000);
            done();
        })

        /**
         * @tc.name   testGetCurrentWifiBssidForLocating01
         * @tc.number SUB_HSS_LOCATIONSYSTEM_GETWIFIBSSID_0001
         * @tc.desc   Obtain the Actual Bssid of the Wifi Network.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetCurrentWifiBssidForLocating01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let mac = geolocationm.getCurrentWifiBssidForLocating();
                expect(true).assertEqual(mac != '');
            } catch(error) {
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(error.code).assertEqual("3301900")
                }
            }
            done();
        })

        /**
         * @tc.name   testGetDistanceBetweenLocations01
         * @tc.number SUB_HSS_LOCATIONSYSTEM_GET_DISTANCE_BETWEEN_LOCATIONS_0001
         * @tc.desc   Obtain the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetDistanceBetweenLocations01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let location1 = {"latitude": 30.12, "longitude": 120.11, "altitude": 0, "accuracy": 0,
                    "speed": 0, "timeStamp": 0, "direction": 0, "timeSinceBoot": 0, "additionSize": 0}
                let location2 = {"latitude": 30.12, "longitude": 120.11, "altitude": 0, "accuracy": 0,
                    "speed": 0, "timeStamp": 0, "direction": 0, "timeSinceBoot": 0, "additionSize": 0}
                let distance1 = geolocationm.getDistanceBetweenLocations(location1, location2);
                expect(distance1).assertEqual(0)
            } catch(error) {
                console.error("getDistanceBetweenLocations: errCode" + error.code + ", errMessage" + error.message);
                expect(true).assertFail();
            }
            done();
        })

        /**
         * @tc.name   testIsPoiServiceSupported001
         * @tc.number SUB_HSS_LOCATIONSYSTEM_IS_POI_SERVICE_SUPPORTED_0001
         * @tc.desc   Obtain the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testIsPoiServiceSupported001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let poiServiceState = geolocationm.isPoiServiceSupported()
                if (poiServiceState) {
                    expect(poiServiceState).assertEqual(true)
                    let poiInfo = await geolocationm.getPoiInfo()
                    if (poiInfo) {
                        let poiArray = poiInfo.poiArray
                        expect(true).assertEqual(poiArray != null)
                        if (poiArray && poiArray.length > 0) {
                            expect(true).assertEqual(poiArray[0].id != 'NA')
                            expect(true).assertEqual(poiArray[0].confidence != -1)
                            expect(true).assertEqual(poiArray[0].name != 'NA')
                            expect(true).assertEqual(poiArray[0].latitude != -1)
                            expect(true).assertEqual(poiArray[0].lontitude != -1)
                            expect(true).assertEqual(poiArray[0].administrativeArea != 'NA')
                            expect(true).assertEqual(poiArray[0].locatity != 'NA')
                            expect(true).assertEqual(poiArray[0].subLocality != 'NA')
                            expect(true).assertEqual(poiArray[0].address != 'NA')
                            expect(true).assertEqual(poiArray[0].additionalInfo != 'NA')
                        }
                        expect(true).assertEqual(poiInfo.timestamp != -1)
                    }
                } else {
                    expect(poiServiceState).assertEqual(false)
                }
            } catch(error) {
                console.error("testIsPoiServiceSupported001: errCode" + error.code + ", errMessage" + error.message);
                expect(true).assertFail();
            }
            done()
        })

        /**
         * @tc.name   test_GetDistanceBetweenLocations_0100
         * @tc.number test_GetDistanceBetweenLocations_0100
         * @tc.desc   Obtain the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('test_GetDistanceBetweenLocations_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let location1 = null
                let location2 = null
                let distance1 = geolocationm.getDistanceBetweenLocations(location1, location2);
                expect(distance1).assertEqual(0)
            } catch(error) {
                console.error("null getDistanceBetweenLocations: errCode" + error.code + ", errMessage" + error.message);
                expect(Number(error.code)).assertEqual(401);
            }
            try {
                let location1 = undefined
                let location2 = undefined
                let distance1 = geolocationm.getDistanceBetweenLocations(location1, location2);
                expect(distance1).assertEqual(0)
            } catch(error) {
                console.error("undefined getDistanceBetweenLocations: errCode" + error.code + ", errMessage" + error.message);
                expect(Number(error.code)).assertEqual(401);
            }
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
                let fenceRequest = null;
                geolocationm.addBeaconFence(fenceRequest).then((id) => {
                    console.info("null addBeaconFence0100 success, fence id:" + id);
                }).catch((error) => {
                    console.error('null promise, addBeaconFence0100: error=' + JSON.stringify(error));
                    expect(true).assertEqual(JSON.stringify(error) != null);
                });
            } catch (error) {
                console.error("null addBeaconFence0100: errCode" + error.code + ", errMessage" + error.message);
                expect(Number(error.code)).assertEqual(401);
            };
            try {
                geolocationm.addBeaconFence(undefined).then((id) => {
                    console.info("undefined addBeaconFence0100 success, fence id:" + id);
                }).catch((error) => {
                    console.error('undefined promise, addBeaconFence0100: error=' + JSON.stringify(error));
                    expect(true).assertEqual(JSON.stringify(error) != null);
                });
            } catch (error) {
                console.error("undefined addBeaconFence0100: errCode" + error.code + ", errMessage" + error.message);
                expect(Number(error.code)).assertEqual(401);
            };
        await sleep(1000);
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
                let beacon = null;
                geolocationm.removeBeaconFence(beacon).then(()=>{
                    console.info("null promise,removeBeaconFence success");
                }).catch((error)=>{
                    console.error("null promise,removeBeaconFence:error="+JSON.stringify(error));
                    expect(true).assertEqual(JSON.stringify(error) != null);
                });
            } catch (error) {
                console.error("null removeBeaconFence: errCode" + error.code + ", errMessage" + error.message);
                expect(true).assertEqual(JSON.stringify(error) != null);
            };
            try {
                geolocationm.removeBeaconFence(undefined).then(()=>{
                    console.info("undefined promise,removeBeaconFence success");
                }).catch((error)=>{
                    console.error("undefined promise,removeBeaconFence:error="+JSON.stringify(error));
                    expect(true).assertEqual(JSON.stringify(error) != null);
                });
            } catch (error) {
                console.error("undefined removeBeaconFence: errCode" + error.code + ", errMessage" + error.message);
                expect(true).assertEqual(JSON.stringify(error) != null);
            };
            await sleep(1000);
        done();
        })

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
                    let wlanBssidArray = null;
                    let rssiThreshold = null;
                    let needStartScan = false;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("null isWlanBssidMatched0100 Wlan Bssid Matched Result:" + res);
                          expect(res).assertTrue();
                    })
                } catch (error) {
                    console.error("[lbs_js] null Promise isWlanBssidMatched0100:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(Number(error.code)).assertEqual(401);
                }
                try {
                    let wlanBssidArray = undefined;
                    let rssiThreshold = undefined;
                    let needStartScan = false;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("undefined isWlanBssidMatched0100 Wlan Bssid Matched Result:" + res);
                          expect(res).assertTrue();
                    })
                } catch (error) {
                    console.error("[lbs_js] undefined Promise isWlanBssidMatched0100:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(Number(error.code)).assertEqual(401);
                }
                await sleep(1000);
                done();
            }            
        });

        /**
         * @tc.name   test_GetDistanceBetweenLocations_0200
         * @tc.number test_GetDistanceBetweenLocations_0200
         * @tc.desc   Obtain the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('test_GetDistanceBetweenLocations_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let location1 = {"latitude": 30.12, "longitude": 120.11, "altitude": 0, "accuracy": 0,
                    "speed": 0, "timeStamp": 0, "direction": 0, "timeSinceBoot": 0, "additionSize": 0, "additions": []}
                let location2 = {"latitude": 30.12, "longitude": 120.11, "altitude": 0, "accuracy": 0,
                    "speed": 0, "timeStamp": 0, "direction": 0, "timeSinceBoot": 0, "additionSize": 0, "additions": []}
                let distance1 = geolocationm.getDistanceBetweenLocations(location1, location2);
                expect(distance1).assertEqual(0)
            } catch(error) {
                console.error("test_GetDistanceBetweenLocations_0200_01: errCode" + error.code + ", errMessage" + error.message);
                expect(true).assertFail();
            }
            done();
        })

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
                    let wlanBssidArray = [];
                    let rssiThreshold = -100;
                    let needStartScan = false;
                    geolocationm.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
                          console.info("SUB_HSS_isWlanBssidMatched_0200 Wlan Bssid Matched Result:" + res);
                          expect(res != true).assertTrue();
                    })
                } catch (error) {
                    console.error("[lbs_js] Promise SUB_HSS_isWlanBssidMatched_0200:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(true).assertEqual(JSON.stringify(error) != null);
                }
                await sleep(1000);
                done();
            }            
        });

        /**
         * @tc.name   SUB_Location_findMatchingWlan_promiss_0100
         * @tc.number SUB_Location_findMatchingWlan_promiss_0100
         * @tc.desc   Test findMatchingWlan with real BSSID from getCurrentWifiBssidForLocating
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Location_findMatchingWlan_promiss_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            try {
                let bssid = geolocationm.getCurrentWifiBssidForLocating();
                console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0100: ' + bssid);
                
                if (bssid === '' || bssid === undefined || bssid === null) {
                    console.info('[lbs_js] No BSSID available, skip test');
                    done();
                    return;
                }
                
                let wlanBssidArray = [bssid];
                let rssiThreshold = -100;
                let needStartScan = true;
                
                geolocationm.findMatchingWlan(wlanBssidArray, rssiThreshold, needStartScan).then((result) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0100 result: ' + JSON.stringify(result));
                    expect(result instanceof Array).assertTrue();
                    if (result.length > 0) {
                        console.info('[lbs_js] result[0].index: ' + result[0].index);
                        console.info('[lbs_js] result[0].ssid: ' + result[0].ssid);
                        console.info('[lbs_js] typeof result[0].index: ' + typeof result[0].index);
                        console.info('[lbs_js] typeof result[0].ssid: ' + typeof result[0].ssid);
                        expect(typeof result[0].index).assertEqual('number');
                        expect(typeof result[0].ssid).assertEqual('string');
                        expect(result[0].index >= 0).assertTrue();
                        expect(result[0].index < wlanBssidArray.length).assertTrue();
                    }
                    done();
                }).catch((err) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0100 err: ' + JSON.stringify(err));
                    expect(err.code === 801).assertTrue();
                    done();
                });
            } catch (error) {
                console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0100 try error: ' + JSON.stringify(error));
                expect(error.code === 801).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Location_findMatchingWlan_promiss_0200
         * @tc.number SUB_Location_findMatchingWlan_promiss_0200
         * @tc.desc   Test findMatchingWlan with empty BSSID array
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Location_findMatchingWlan_promiss_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            try {
                let wlanBssidArray = [];
                let rssiThreshold = -70;
                let needStartScan = true;
                
                geolocationm.findMatchingWlan(wlanBssidArray, rssiThreshold, needStartScan).then((result) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0200 result: ' + JSON.stringify(result));
                    expect(result instanceof Array).assertTrue();
                    expect(result.length === 0).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0200 error: ' + JSON.stringify(err));
                    expect(err.code === 801).assertTrue();
                    done();
                });
            } catch (error) {
                console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0200 try err: ' + JSON.stringify(error));
                expect(error.code === 801).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Location_findMatchingWlan_promiss_0300
         * @tc.number SUB_Location_findMatchingWlan_promiss_0300
         * @tc.desc   Test findMatchingWlan with multiple BSSIDs
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Location_findMatchingWlan_promiss_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            try {
                let wlanBssidArray = ['AA:BB:CC:DD:EE:FF', '11:22:33:44:55:66', 'FE:DC:BA:98:76:54'];
                let rssiThreshold = -80;
                let needStartScan = true;
                
                geolocationm.findMatchingWlan(wlanBssidArray, rssiThreshold, needStartScan).then((result) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0300 result: ' + JSON.stringify(result));
                    expect(result instanceof Array).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0300 error: ' + JSON.stringify(err));
                    expect(err.code === 801).assertTrue();
                    done();
                });
            } catch (error) {
                console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0300 try err: ' + JSON.stringify(error));
                expect(error.code === 801).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Location_findMatchingWlan_promiss_0400
         * @tc.number SUB_Location_findMatchingWlan_promiss_0400
         * @tc.desc   Test findMatchingWlan with different rssiThreshold values
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Location_findMatchingWlan_promiss_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            try {
                let wlanBssidArray = ['AA:BB:CC:DD:EE:FF'];
                let rssiThreshold = -1000;
                let needStartScan = false;
                
                geolocationm.findMatchingWlan(wlanBssidArray, rssiThreshold, needStartScan).then((result) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0400 result: ' + JSON.stringify(result));
                    expect(result instanceof Array).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0400 error: ' + JSON.stringify(err));
                    expect(err.code === 801).assertTrue();
                    done();
                });
            } catch (error) {
                console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0400 try err: ' + JSON.stringify(error));
                expect(error.code === 801).assertTrue();
                done();
            }
        });

        /**
     * @tc.name   SUB_Location_findMatchingWlan_promiss_0500
     * @tc.number SUB_Location_findMatchingWlan_promiss_0500
     * @tc.desc   Test findMatchingWlan error code 3301100 (location switch off)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Location_findMatchingWlan_promiss_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            await geolocationm.disableLocation();
            await sleep(1000);
            let locationEnabled = geolocationm.isLocationEnabled();
            if (locationEnabled) {
                console.info('[lbs_js] Location is enabled, skip error code test');
                done();
                return;
            }
            
            let wlanBssidArray = ['AA:BB:CC:DD:EE:FF'];
            let rssiThreshold = -70;
            let needStartScan = true;
            
            geolocationm.findMatchingWlan(wlanBssidArray, rssiThreshold, needStartScan).then((result) => {
                console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0500 result: ' + JSON.stringify(result));
                done();
            }).catch((err) => {
                console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0500 error: ' + JSON.stringify(err));
                if (err.code === 801) {
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 3301100).assertTrue();
                }
                done();
            });
        } catch (error) {
            console.info('[lbs_js] SUB_Location_findMatchingWlan_promiss_0500 try err: ' + JSON.stringify(error));
            expect().assertFail()
            done();
        }
    });

    });
}

