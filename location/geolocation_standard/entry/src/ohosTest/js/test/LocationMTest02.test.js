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



        /**
        * @tc.number    : SUB_HSS_LOCATIONSYSTEM_BLUE_TOOTH_SCAN_0001
        * @tc.name      : testBlueToothScan01
        * @tc.desc      : Test Report Fence Transition.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
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
        * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_4100
        * @tc.name      : testGetCurrentLocation40
        * @tc.desc      : Initiate a specified single location request and set the exception location timeout interval.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
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
        * @tc.number    : SUB_HSS_LOCATIONSYSTEM_GETWIFIBSSID_0001
        * @tc.name      : testGetCurrentWifiBssidForLocating01
        * @tc.desc      : Obtain the Actual Bssid of the Wifi Network.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
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
    })
}

