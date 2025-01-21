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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

let LocationRequestScenario = {UNSET : 0x300 ,NAVIGATION : 0x301 ,
    TRAJECTORY_TRACKING : 0x302 ,CAR_HAILING : 0x303,
    DAILY_LIFE_SERVICE : 0x304 ,NO_POWER : 0x305}
let LocationRequestPriority = {UNSET : 0x200 ,ACCURACY : 0x201 ,LOW_POWER : 0x202 ,FIRST_FIX :0x203}
let LocationPrivacyType = {
    OTHERS : 0,
    STARTUP: 1,
    CORE_LOCATION : 2
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode(){
    let result1 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result1));
    if(!result1){
        await geolocation.requestEnableLocation().then(async(result) => {
            await sleep(3000);
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
export default function geolocationTest_LocErr(){
    describe('geolocationTest_LocErr', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            await changedLocationMode();
            done();
        })
    
        beforeEach(function () {
            console.info('beforeEach case');
        })
        afterEach(function () {
        })
    
    
    
        /**
         * @tc.number SUB_HSS_LocationSystem_SingleLocErr_0100
         * @tc.name Test getCurrentLocation
         * @tc.desc Initiate a single location request in a specified scenario and set the navigation scenario.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_HSS_LocationSystem_SingleLocErr_0100', 0, async function (done) {
            try {
                let currentLocationRequest = 1;
                geolocationm.getCurrentLocation(currentLocationRequest, (err, result) => {
                    if (err) {
                        console.info("[lbs_js] getCurrentLocation1 callback err:  " + JSON.stringify(err));
                        expect(err.code).assertEqual(401);
                        return;
                    } else {
                        console.info("[lbs_js] getCurrentLocation1 callback result:" + JSON.stringify(result));
                        expect(true).assertFalse();
                    }
                });
            } catch (error) {
                console.error('[lbs_js] getCurrentLocation1 callback try err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_SingleLocErr_0200
         * @tc.name Test getCurrentLocation
         * @tc.desc Initiate a single location request in a specified scenario and set the navigation scenario.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_SingleLocErr_0200', 0, async function (done) {
            (async () => {
                try {
                    let currentLocationRequest = 1;
                    let result = await geolocationm.getCurrentLocation(currentLocationRequest); 
                    console.info("[wifi_test] getCurrentLocation2 promise:" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] getCurrentLocation2 promise try err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual(3301200);
                }
            })();
            await sleep(4000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_SendCommandErr_0100
         * @tc.name Test sendCommand
         * @tc.desc An incorrect extended command is sent to each component of the location service subsystem.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_SendCommandErr_0100', 0, async function (done) {
            let requestInfo = "lbstest";
            try {
                geolocationm.sendCommand(requestInfo,(err, result) => {
                    if (err) {
                        console.info('sendcommand callback err:' + JSON.stringify(err));
                        expect(err.code).assertEqual("401");
                        return;
                    }
                    console.info('sendcommand callback result:' + JSON.stringify(result));
                });
            } catch (error) {
                console.info('sendcommand callback try err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_SendCommandErr_0200
         * @tc.name Test sendCommand
         * @tc.desc An incorrect extended command is sent to each component of the location service subsystem.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_SendCommandErr_0200', 0, async function (done) {
            let requestInfo = "test";
            (async () => {
                try {
                    let result = await geolocationm.sendCommand(requestInfo); 
                    console.info("[lbs_js] sendCommand promise:" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] sendCommand promise err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
            })();
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0100
         * @tc.name Test getCachedGnssLocationsSize
         * @tc.desc An incorrect parameter is used to obtain the number of GNSS cache locations reported at a time.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0100', 0, async function (done) {
            try {
                geolocationm.getCachedGnssLocationsSize("test",(err, data) => {
                    if (err) {
                        console.info('[lbs_js] getCachedSiz1 callback err is:' + JSON.stringify(err));
                        expect(err.code).assertEqual("401");
                        return;
                    }
                    console.info("[lbs_js] getCachedSiz1 callback data is:" + JSON.stringify(data));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] getCachedSiz1 callback try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(2000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0400
         * @tc.name Test flushCachedGnssLocations
         * @tc.desc All prepared GNSS locations are returned to the application and the underlying buffers are cleared.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0400', 0, async function (done) {
            try {
                geolocationm.flushCachedGnssLocations("test",(err, data) => {
                    if (err) {
                        console.info('[lbs_js] flushCachedGnssLocations4 callback err is : ' + JSON.stringify(err));
                        expect(err.code).assertEqual("401");
                        return;
                    }
                    console.info("[lbs_js] flushCachedGnssLocations4 callback data is: " + JSON.stringify(data));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] flushCachedGnssLocations4 callback try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(2000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0500
         * @tc.name Test flushCachedGnssLocations
         * @tc.desc All prepared GNSS locations are returned to the application and the underlying buffers are cleared.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0500', 0, async function (done) {
            (async () => {
                try {
                    let result = await geolocationm.flushCachedGnssLocations(1); 
                    console.info("[lbs_js] flushCachedGnssLocations5 promise successful :" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] flushCachedGnssLocations5 promise err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
              })();
            await sleep(2000);
            done();
        })
    
    })
}

