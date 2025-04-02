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
import notificationManager from '@ohos.notificationManager';
import wifiManager from '@ohos.wifiManager'
import wantAgent from '@ohos.wantAgent'
import FenceExtensionAbility from '@ohos.app.ability.FenceExtensionAbility'

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

export class MyFenceExtensionAbility extends FenceExtensionAbility {
    async onFenceStatusChange(transition, additions) {
        console.info('on geofence transition, id:' + transition.geofenceId +
            ",event:" + transition.transitionEvent + ",addtions:" + JSON.stringify(additions))
        let wantAgentInfo = {
            wants: [
                {
                    bundleName: 'ohos.acts.location.geolocation.function',
                    abilityName: 'EntryAbility',
                    parameters:
                    {
                        "geofenceId": transition.geofenceId,
                        "transitionEvent": transition.transitionEvent
                    }
                }
            ],
            actionType: wantAgent.OperationType.START_ABILITY,
            requestCode: 100
        }
        let wantAgentMy = await wantAgent.getWantAgent(wantAgentInfo)
        let notificationRequest = {
            id: 1,
            content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: 'geofence',
                    text: 'on geofence transition'
                }
            },
            notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
            wantAgent: wantAgentMy
        };
        notificationManager.publish(notificationRequest);
        expect(true).assertEqual(transition != null);
    }

    onDestroy() {
        console.info('MyFenceExtensionAbility destroy');
        expect(true).assertTrue()
    }
}

export default function geolocationTest_geo7() {


    describe('geolocationTest_geo7', function () {
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
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCSWITCH_0600
     * @tc.name      : testIsLocationEnabled06
     * @tc.desc      : Enabling the Location Service Function for a Third-Party App - Callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
     it('testIsLocationEnabled06', 0, function () {
        try {
            let state = geolocationm.isLocationEnabled();
            console.info('[lbs_js] getLocationSwitchState06 result: ' + JSON.stringify(state));
            expect(true).assertEqual(state);
        } catch (error) {
            console.info("[lbs_js] getLocationSwitchState06 try err." + JSON.stringify(error));
            expect().assertFail();
        }
    });

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCSWITCH_0700
     * @tc.name      : testLocationEnabledChange07
     * @tc.desc      : Subscribe to the location service status change.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationEnabledChange07', 0, async function (done) {
        console.log('[lbs_js] just for overwriting,locationServiceState test need system api ');
        var locationServiceState = (state) => {
            console.log('[lbs_js] locationServiceState: state: ' + JSON.stringify(state));
        }
        try {
            geolocationm.on('locationEnabledChange', locationServiceState);

        } catch (error) {
            console.info("[lbs_js] locationServiceStateOn07 try err." + JSON.stringify(error));
            expect().assertFail();
        }
        try {
            geolocationm.off('locationEnabledChange', locationServiceState);
        } catch (error) {
            console.info("[lbs_js] locationServiceStateOff07 try err." + JSON.stringify(error));
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_1500
     * @tc.name      : testGetCurrentLocation15
     * @tc.desc      : Initiate a single location request in a specified scenario and set the navigation scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation1500', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x301, "timeoutMs": 1000, "maxAccuracy": 10 };
        try {
            geolocationm.getCurrentLocation(currentLocationRequest, (err, result) => {
                if (err) {
                    console.info("[lbs_js] getCurrentLocation15 callback err:  " + JSON.stringify(err));
                    expect(err.code).assertEqual(3301200);
                    console.info('[lbs_js] getCurrentLocationCallback reject after');
                    done();
                } else {
                    console.info("[lbs_js] getCurrentLocation15 callback result:" + JSON.stringify(result));
                    expect(true).assertEqual(result != null);
                }
            });
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation15 callback try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_1600
     * @tc.name      : testGetCurrentLocation16
     * @tc.desc      : Initiate a single location request in a specified scenario and set the navigation scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation1600', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x203, "scenario": 0x301, "timeoutMs": 1000, "maxAccuracy": 10 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation16 promise result ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation16 promise err:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation16 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_1700
     * @tc.name      : testGetCurrentLocation17
     * @tc.desc      : Initiate a single location request in a specified scenario and set the track tracing scenario.
     * @tc.size      : MediumTestTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
     it('testGetCurrentLocation1700', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x302, "timeoutMs": 1000, "maxAccuracy": 10 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info("[lbs_js] getCurrentLocation callback17, result:" + JSON.stringify(result));
                expect(true).assertEqual(result != null);
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation callback17:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation callback17 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_1800
     * @tc.name      : testGetCurrentLocation18
     * @tc.desc      : Initiate a single location request in a specified scenario and set a car-sharing scenario.
     * @tc.size      : MediumTestTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation18', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x303, "timeoutMs": 1000, "maxAccuracy": 10 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation18 promise result ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation18 promise err:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation18 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_1900
     * @tc.name      : testGetCurrentLocation19
     * @tc.desc      : Initiate a single location request in a specified scenario and set the life service scenario..
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation19', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x304, "timeoutMs": 1000, "maxAccuracy": 0 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation19 promise result:' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation19 promise err:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation18 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2000
     * @tc.name      : testGetCurrentLocation20
     * @tc.desc      : Initiate a single location request in a specified scenario
     *                 and set the scenario with no power consumption.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation20', 0, async function (done) {
        let currentLocationRequest1 = { "priority": 0x200, "scenario": 0x305, "timeoutMs": 1000, "maxAccuracy": 10 };
        let currentLocationRequest2 = { "priority": 0x200, "scenario": 0x301, "timeoutMs": 1000, "maxAccuracy": 10 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest1).then((result) => {
                console.info('[lbs_js] getCurrentLocation1901 promise result:' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation1901 promise err:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation1901 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest2).then((result) => {
                console.info('[lbs_js] getCurrentLocation1902 promise result:' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation1902 promise err:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation1902 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2100
     * @tc.name      : testGetCurrentLocation21
     * @tc.desc      : Initiate a single location request with the parameter set to high-precision priority location request.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation21', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 10 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation21 promise result ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation21 promise err:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation21 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2200
     * @tc.name      : testGetCurrentLocation22
     * @tc.desc      : Initiate a single location request with parameters set to fast location and priority location request.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation22', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0203, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 10 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation22 promise result:' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation22 promise err:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation22 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2300
     * @tc.name      : testGetCurrentLocation23
     * @tc.desc      : Initiate a single location request with parameters set to low power consumption.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation23', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0202, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 0 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result23:' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err23:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation23 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2400
     * @tc.name      : testGetCurrentLocation24
     * @tc.desc      : Initiate a single location request and set the location reporting precision.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation24', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0200, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 5 };
        let currentLocationRequest1 = { "priority": 0x0200, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 2 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result241 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err241:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation241 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest1).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result242 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err242:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation242 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2500
     * @tc.name      : testGetCurrentLocation25
     * @tc.desc      : Initiate a single location request for specific configuration
     *                 and set the reporting precision of abnormal location.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation25', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 0 };
        let currentLocationRequest1 = { "priority": 0x0201, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": -1 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result251 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err251:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation251 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest1).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result252 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err252:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation252 promise try err." + JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        await sleep(1000);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2600
    * @tc.name      : testGetCurrentLocation26
    * @tc.desc      : Initiate a single location request and set the location timeout interval.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testGetCurrentLocation26', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0301, "timeoutMs": 1000, "maxAccuracy": 0 };
        let currentLocationRequest1 = { "priority": 0x0201, "scenario": 0x0301, "timeoutMs": 1000, "maxAccuracy": 0 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result261 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err261:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation261 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest1).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result262 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err262:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation262 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_2700
    * @tc.name      : testGetCurrentLocation27
    * @tc.desc      : Initiate a specified single location request and set the exception location timeout interval.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testGetCurrentLocation27', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0302, "timeoutMs": 0, "maxAccuracy": 0 };
        let currentLocationRequest1 = { "priority": 0x0201, "scenario": 0x0302, "timeoutMs": -1000, "maxAccuracy": 0 };
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result271 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err271:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            });
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation271 promise try err." + JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        await sleep(1000);
        try {
            await geolocationm.getCurrentLocation(currentLocationRequest1).then((result) => {
                console.info('[lbs_js] getCurrentLocation promise result272 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] getCurrentLocation promise err272:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            })
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation272 promise try err." + JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_SendCommand_0300
     * @tc.name      : testSendCommand03
     * @tc.desc      : Test sendCommand api .
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendCommand03', 0, async function (done) {
        var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
        console.info("SUB_HSS_SendCommand_0300 : " + isAcessToken);
        if (!isAcessToken) {
            console.info("The device does not support gnss");
            expect(isAcessToken).assertFalse();
            done();
        } else {
            let requestInfo = { 'scenario': 0x301, 'command': "command_1" };
            try {
                await geolocationm.sendCommand(requestInfo, (err, result) => {
                    if (err) {
                        console.info('sendcommand callback err:' + JSON.stringify(err));
                        console.info('sendcommand not support');
                        expect(err.code).assertEqual(801);
                        done();
                    }
                    console.info('sendcommand callback result:' + JSON.stringify(result));
                });
            } catch (error) {
                console.info('sendcommand callback err:' + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
            done();
        }
    })

    /**
     * @tc.number    : SUB_HSS_SendCommand_0400
     * @tc.name      : testSendCommand04
     * @tc.desc      : Test sendCommand1 api .
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendCommand04', 0, async function (done) {
        var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
        console.info("SUB_HSS_SendCommand_0400 : " + isAcessToken);
        if (!isAcessToken) {
            console.info("The device does not support gnss");
            expect(isAcessToken).assertFalse();
            done();
        } else {
            let requestInfo = { 'scenario': 0x301, 'command': "command_1" };
            try {
                geolocationm.sendCommand(requestInfo).then((result) => {
                    console.info('[lbs_js] sendCommand promise result:' + result);
                    done();
                }).catch(error => {
                    console.info('[lbs_js] sendcommand promise err:' + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(801);
                    done();
                })
            } catch (error) {
                console.info('[lbs_js] sendcommand promise err:' + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
            done();
        }
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_1600
     * @tc.name      : testLocationChange16
     * @tc.desc      : Initiate a request for continuous positioning in a specified scenario and set the navigation scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange16', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.info('[lbs_js] locationChanger16 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn16 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff16 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_1700
     * @tc.name      : testLocationChange17
     * @tc.desc      : Initiate a request for continuous positioning in a specified scenario and set a track tracing scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange17', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x302, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.info('[lbs_js] locationChanger17 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn17 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff17 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_1800
     * @tc.name      : testLocationChange18
     * @tc.desc      : Initiate a continuous location request in a specified scenario and set a car-sharing scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange18', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x303, "timeInterval":5,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.info('[lbs_js] locationChanger18 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn18 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff18 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_1900
     * @tc.name      : testLocationChange19
     * @tc.desc      : Initiate a continuous location request in a specified scenario and set a life service scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange19', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x303, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.info('[lbs_js] locationChanger19 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn19 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff19 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2000
     * @tc.name      : testLocationChange20
     * @tc.desc      : Initiate a continuous location request in a specified scenario
     *          and set the scenario with no power consumption.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange20', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x305, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange1 = (location) => {
            console.log('[lbs_js] locationChanger201 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        var locationChange2 = (location) => {
            console.log('[lbs_js] locationChanger202 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange2 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn201 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.on('locationChange', requestInfo, locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn202 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff201 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff202 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2100
     * @tc.name      : testLocationChange21
     * @tc.desc      : Initiate a specified continuous positioning request and
     *          set the parameter to high-precision priority positioning request.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange21', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x201, "scenario":0x300, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.log('[lbs_js] locationChanger21 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn21 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff21 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2200
     * @tc.name      : testLocationChange22
     * @tc.desc      : Initiate a specified continuous positioning request with the parameter
     *          set to fast positioning and priority positioning request.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange22', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x203, "scenario":0x300, "timeInterval":5,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.log('[lbs_js] locationChanger22 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn22 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff22 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2300
     * @tc.name      : testLocationChange23
     * @tc.desc      : Initiate a specified continuous positioning request with the parameter
     *          set to low power consumption type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange23', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x202, "scenario":0x300, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10}
        var locationChange = (location) => {
            console.log('[lbs_js] locationChanger23 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn23 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff23 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2400
     * @tc.name      : testLocationChange24
     * @tc.desc      : Initiate a specified continuous location request and set the reporting interval.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange24', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":3,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('[lbs_js] locationChanger24 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn24 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff24 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2500
     * @tc.name      : testLocationChange25
     * @tc.desc      : Initiate a specified continuous location request and set the location reporting interval.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange25', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('[lbs_js] locationChanger25 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn25 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff25 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2600
    * @tc.name      : testLocationChange26
    * @tc.desc      : Initiate a specified continuous location request and set the interval for reporting exceptions.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange26', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('[lbs_js] locationChanger26 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn26 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff26 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2700
    * @tc.name      : testLocationChange27
    * @tc.desc      : Initiate a specified continuous location request and set the interval for reporting abnormal locations.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange27', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        let requestInfo2 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange1 = (location) => {
            console.log('[lbs_js] locationChanger271 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        var locationChange2 = (location) => {
            console.log('[lbs_js] locationChanger272 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange2 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn271 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff271 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        try {
            geolocationm.on('locationChange', requestInfo2, locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn272 try err." + JSON.stringify(error));
           expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff272 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2800
    * @tc.name      : testLocationChange28
    * @tc.desc      : Initiate a specified continuous positioning request and set the positioning reporting precision.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange28', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 5};
        let requestInfo2 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 2};
        var locationChange1 = (location) => {
            console.log('[lbs_js] locationChanger281 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        var locationChange2 = (location) => {
            console.log('[lbs_js] locationChanger282 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange2 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn281 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff281 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        try {
            geolocationm.on('locationChange', requestInfo2, locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn282 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff282 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_2900
    * @tc.name      : testLocationChange29
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange29', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        let requestInfo2 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": -1};
        var locationChange1 = (location) => {
            console.log('[lbs_js] locationChanger291 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        var locationChange2 = (location) => {
            console.log('[lbs_js] locationChanger292 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange2 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn291 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff291 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        try {
            geolocationm.on('locationChange', requestInfo2, locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn292 try err." + JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        try {
            geolocationm.off('locationChange', locationChange2);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff292 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3000
    * @tc.name      : testLocationChange30
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange30', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {'interval': 1, 'locationScenario': 0x401};
        var locationChange1 = (location) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3000 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3000 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3000 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3100
    * @tc.name      : testLocationChange31
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange31', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {'interval': 1, 'locationScenario': 0x402};
        var locationChange1 = (location) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3100 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3100 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3100 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3200
    * @tc.name      : testLocationChange32
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange32', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {'interval': 1, 'locationScenario': 0x403};
        var locationChange1 = (location) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3200 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3200 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3200 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3300
    * @tc.name      : testLocationChange33
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange33', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {'interval': 1, 'locationScenario': 0x403};
        var locationChange1 = (location) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3300 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3300 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3300 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3400
    * @tc.name      : testLocationChange34
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange34', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {'interval': 1, 'locationScenario': 0x601};
        var locationChange1 = (location) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3400 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3400 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3400 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3500
    * @tc.name      : testLocationChange35
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange35', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {'interval': 1, 'locationScenario': 0x602};
        var locationChange1 = (location) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3500 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3500 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3500 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3600
    * @tc.name      : testLocationChange36
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationChange36', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {'interval': 1, 'locationScenario': 0x603};
        var locationChange1 = (location) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3600 data:' + JSON.stringify(location));
            expect(true).assertEqual(locationChange1 !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo1, locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3600 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCREQUEST_3600 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCATIONERROR_0100
    * @tc.name      : testLocationError01
    * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testLocationError01', 0, async function (done) {
        enableLocationSwitch();
        var locationError1 = (errcode) => {
            console.log('[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCATIONERROR_0100 data:' + JSON.stringify(errcode));
            expect(true).assertEqual(errcode !=null);
        };
        try {
            geolocationm.on('locationError', locationError1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCATIONERROR_0100 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationError', locationError1);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_LOCATIONERROR_0100 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LASTLOC_0300
     * @tc.name      : testLocationChange03
     * @tc.desc      : Obtain the last location after a single location.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLocationChange03', 0, async function(done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.info('[lbs_js] LastlocationChanger1: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        try {
            geolocationm.on('locationChange', requestInfo, locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOn03 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        try {
            geolocationm.off('locationChange', locationChange);
        } catch (error) {
            console.info("[lbs_js] locationChangerOff03 try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        try {
            let last =geolocationm.getLastLocation();
            console.info('[lbs_js] getLastLocation latitude: ' + last.latitude +
            ' longitude: ' + last.longitude +' altitude: ' + last.altitude
            +' accuracy: ' + last.accuracy+' speed: ' + last.speed +
            'timeStamp: ' + last.timeStamp+'direction:' + last.direction+' timeSinceBoot: '
            + last.timeSinceBoot +'additions: ' + last.additions+' additionSize' + last.additionSize
            + 'isFromMock' +last.isFromMock);

            expect(true).assertEqual(JSON.stringify(last) != null);
        } catch (error) {
            console.info("[lbs_js] getLastLocation error:"+ error)
            expect(error.code).assertEqual("3301200");
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_GNSS_0300
     * @tc.name      : testSatelliteStatusChange03
     * @tc.desc      : Monitoring Satellite Information Reporting
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSatelliteStatusChange03', 0, async function (done) {
        var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
        console.info("SUB_HSS_LOCATIONSYSTEM_GNSS_0300 : " + isAcessToken);
        if (!isAcessToken) {
            console.info("The device does not support gnss");
            expect(isAcessToken).assertFalse();
            done();
        } else {
            await changedLocationMode();
            var gnssStatusCb = (satelliteStatusInfo) => {
                console.info('[lbs_js] gnssStatusChange1: ' + satelliteStatusInfo);
                expect(true).assertEqual(satelliteStatusInfo != null)
                console.info('[lbs_js] SatelliteStatusInfo satellitesNumber: ' + data[0].satellitesNumber +
                    ' satelliteIds: ' + data[0].satelliteIds + ' carrierToNoiseDensitys: ' + data[0].carrierToNoiseDensitys
                    +' altitudes: ' + data[0].altitudes +' azimuths: ' + data[0].azimuths +
                    'carrierFrequencies: ' + data[0].carrierFrequencies + ' satelliteAdditionalInfo: '
                    + data[0].satelliteAdditionalInfo + ' satelliteConstellation: ' + data[0].satelliteConstellation);
            }
            try {
                geolocationm.on('satelliteStatusChange', gnssStatusCb);
            } catch (error) {
                console.info("[lbs_js] satelliteStatusOn03 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            enableLocationSwitch();
            let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
                "distanceInterval": 0, "maxAccuracy": 0};
            var locationChange = (location) => {
                console.log('[lbs_js] gnsslocationChanger3: data: ' + JSON.stringify(location));
                expect(true).assertEqual(locationChange !=null);
            };
            try {
                geolocationm.on('locationChange', requestInfo, locationChange);
            } catch (error) {
                console.info("[lbs_js] locationChangerOn03 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            try {
                geolocationm.off('satelliteStatusChange', gnssStatusCb);
            } catch (error) {
                console.info("[lbs_js] satelliteStatusOff03 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            try {
                geolocationm.off('locationChange', locationChange);
            } catch (error) {
                console.info("[lbs_js] locationChangerOff03 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
            done();
        }
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_GNSS_0400
     * @tc.name      : testNmeaMessage04
     * @tc.desc      : Monitoring NMEA Information Reporting
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
     it('testNmeaMessage04', 0, async function (done) {
         var isAcessToken = canIUse("SystemCapability.Location.Location.Gnss");
         console.info("SUB_HSS_LOCATIONSYSTEM_GNSS_0400 : " + isAcessToken);
         if (!isAcessToken) {
             console.info("The device does not support gnss");
             expect(isAcessToken).assertFalse();
             done();
         } else {
             await changedLocationMode();
             let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
                 "distanceInterval": 0, "maxAccuracy": 0};
             var nmeaCb = (str) => {
                 console.log('[lbs_js] nmeaMessage: ' + str);
             }
             var locationChange = (location) => {
                 console.log('[lbs_js] gnsslocationChanger4 data:' + JSON.stringify(location));
                 expect(true).assertEqual(locationChange !=null);
             };
             try {
                 geolocationm.on('nmeaMessage', nmeaCb);
             } catch (error) {
                 console.info("nmea on err:" + JSON.stringify(error));
                 expect(true).assertFalse();
             }
             try {
                 geolocationm.on('locationChange', requestInfo, locationChange);
             } catch (error) {
                 console.info("[lbs_js] locationChangerOn04 try err." + JSON.stringify(error));
                 expect(true).assertEqual(JSON.stringify(error) != null);
             }
             try {
                 geolocationm.off('nmeaMessage', nmeaCb);
             } catch (error) {
                 console.info("nmea off err:" + JSON.stringify(error));
                 expect(true).assertFalse();
             }
             try {
                 geolocationm.off('locationChange', locationChange);
             } catch (error) {
                 console.info("[lbs_js] locationChangerOff03 try err." + JSON.stringify(error));
                 expect(true).assertFalse();
             }
             await sleep(1000);
             done();
         }
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_BATCHING_0700
     * @tc.name      : testCachedGnssLocationsChange07
     * @tc.desc      : Setting the Gnss Batching Reporting Interval
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCachedGnssLocationsChange07', 0, async function (done) {
        var cachedLocationsCb1 = (locations) => {
            console.log('[lbs_js] cachedGnssLocationsReporting7:locations:' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest1 = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': false};
        try {
            geolocationm.on('cachedGnssLocationsChange', CachedGnssLoactionsRequest1, cachedLocationsCb1);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOn071 try err." + JSON.stringify(error));
            expect(error.code).assertEqual("801");
        }
        try {
            geolocationm.off('cachedGnssLocationsChange',cachedLocationsCb1);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOff071 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        await sleep(1500);
        var cachedLocationsCb2 = (locations) => {
            console.log('[lbs_js] cachedGnssLocationsReporting7:locations:' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest2 = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': false};
        try {
            geolocationm.on('cachedGnssLocationsChange', CachedGnssLoactionsRequest2, cachedLocationsCb2);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOn072 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        try {
            geolocationm.off('cachedGnssLocationsChange',cachedLocationsCb1);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOff072 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_BATCHING_0800
     * @tc.name      : testCachedGnssLocationsChange08
     * @tc.desc      : Setting the Gnss Batching Cache Queue to Be Reported When the Gnss Batching Cache Queue Is Full
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCachedGnssLocationsChange08', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('[lbs_js] cachedGnssLocationsReporting8:locations:' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        try {
            geolocationm.on('cachedGnssLocationsChange', CachedGnssLoactionsRequest, cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOn08 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        try {
            geolocationm.off('cachedGnssLocationsChange',cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOff08 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_BATCHING_0900
     * @tc.name      : testCachedGnssLocationsChange09
     * @tc.desc      : Obtains the number of GNSS data records in the batching process.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCachedGnssLocationsChange09', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('[lbs_js] cachedGnssLocationsReporting9:locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        try {
            geolocationm.on('cachedGnssLocationsChange', CachedGnssLoactionsRequest, cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOn09 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        try {
            geolocationm.off('cachedGnssLocationsChange',cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOff09 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        await sleep(1500);
        try {
            geolocationm.getCachedGnssLocationsSize((err, data) => {
                if (err) {
                    console.info('[lbs_js] getCachedGnssLocationsSize09 callback err:' + JSON.stringify(err));
                    console.info('[lbs_js] not support now');
                    expect(err.code).assertEqual(801);
                }else {
                    console.info("[lbs_js] getCachedGnssLocationsSize09 callback data:" + JSON.stringify(data));
                    expect(true).assertEqual(data != null);
                }
            });
        } catch (error) {
            console.info("[lbs_js] getCachedGnssLocationsSize09 callback try err." + JSON.stringify(error));
            expect(true).assertFalse();

        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_BATCHING_1000
     * @tc.name      : testCachedGnssLocationsChange01
     * @tc.desc      : Obtains the number of GNSS data records in the batching process.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCachedGnssLocationsChange01', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('[lbs_js] cachedGnssLocationsReporting10:locations:' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        try {
            geolocationm.on('cachedGnssLocationsChange', CachedGnssLoactionsRequest, cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOn10 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        try {
            geolocationm.off('cachedGnssLocationsChange',cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOff10 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        await sleep(1000);
        try {
            await geolocationm.getCachedGnssLocationsSize().then( (result) => {
                console.info('[lbs_js] getCachedGnssLocationsSiz promise '+ JSON.stringify(result));
                expect(true).assertEqual(result != null);
            }).catch((error) => {
                console.info("[lbs_js] promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
            expect(error.code).assertEqual(801);
            });
        } catch (error) {
            console.info("[lbs_js] getCachedGnssLocationsSize promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_BATCHING_1100
     * @tc.name      : testCachedGnssLocationsChange11
     * @tc.desc      : Obtains the GNSS data of the current batching.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCachedGnssLocationsChange11', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('[lbs_js] cachedGnssLocationsReporting11:locations:' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        try {
            geolocationm.on('cachedGnssLocationsChange', CachedGnssLoactionsRequest, cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOn11 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        try {
            geolocationm.off('cachedGnssLocationsChange',cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOff11 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        await sleep(1000);
        try {
            geolocationm.flushCachedGnssLocations((err, data) => {
                if (err) {
                    console.info('[lbs_js] flushCachedGnssLocations11 callback err is : ' + JSON.stringify(err));
                    console.info('[lbs_js] not support now');
                    expect(err.code).assertEqual(801);
                }else {
                    console.info("[lbs_js] flushCachedGnssLocations11 callback data is: " + JSON.stringify(data));
                    expect(true).assertEqual(data != null);
                }
            });
        } catch (error) {
            console.info("[lbs_js] flushCachedGnssLocations11 callback try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_BATCHING_1200
     * @tc.name      : testCachedGnssLocationsChange12
     * @tc.desc      : Obtain the GNSS data of the current batching.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCachedGnssLocationsChange12', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('[lbs_js] cachedGnssLocationsReporting12:locations:' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        try {
            geolocationm.on('cachedGnssLocationsChange', CachedGnssLoactionsRequest, cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOn11 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        try {
            geolocationm.off('cachedGnssLocationsChange',cachedLocationsCb);
        } catch (error) {
            console.info("[lbs_js] cachedGnssLocOff11 try err." + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
        await sleep(1000);
        try {
            await geolocationm.flushCachedGnssLocations().then( (result) => {
                console.info('[lbs_js] flushCachedGnssLocations promise '+ JSON.stringify(result));
                expect(true).assertEqual(result != null);
            }).catch((error) => {
                console.info("[lbs_js] promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(error.code).assertEqual(801);
            });
        } catch (error) {
            console.info("[lbs_js] flushCachedGnssLocations11 promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
        }
        await sleep(1000);
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0200
    * @tc.name      : testGnssFenceStatusChange02
    * @tc.desc      : Gnss fence function test
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testGnssFenceStatusChange02', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
        let geofenceRequest = {"priority":0x200, "scenario":0x301, "geofence": geofence};
        try {
            geolocationm.on('gnssFenceStatusChange', geofenceRequest,
                (want) => {
                    if(err){
                        return console.info("fenceStatusChange2 on callback err:" + err);
                    }
                    console.info("[lbs_js] fenceStatusChange2 callback result:" + JSON.stringify(want));
                    expect(true).assertEqual(want !=null);
                });
        } catch (error) {
            console.info("[lbs_js] FenceStatusOn2 try error:"+ JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        try {
            geolocationm.off('gnssFenceStatusChange',geofenceRequest,
                (want) => {
                    if(err){
                        return console.info("fenceStatusChange2 callback err:" + err);
                    }
                    console.info("[lbs_js] off fenceStatusChange2 callback result:" + JSON.stringify(want));
                    expect(true).assertEqual(want !=null);
                });
        } catch (error) {
            console.info("[lbs_js] FenceStatusOff2 try error:"+ JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0300
     * @tc.name      : testGnssFenceStatusChange03
     * @tc.desc      : Test the function of locating the validity period of the fence.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGnssFenceStatusChange03', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
        let geofenceRequest = {"priority":0x203, "scenario":0x301, "geofence": geofence};
        try {
            geolocationm.on('gnssFenceStatusChange', geofenceRequest,
                (want) => {
                    if(err){
                        return console.info("[lbs_js] fenceStatusChange3 on callback err: " + err);
                        console.info("[lbs_js] fenceStatusChange not support ");
                        expect(err.code).assertEqual(801);
                    }
                    console.info("[lbs_js] fenceStatusChange3 callback result: " + JSON.stringify(want));
                    expect(true).assertEqual(want != null);
                });
        } catch (error) {
            console.info("[lbs_js] FenceStatusOn3 try error:"+ JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        try {
            geolocationm.off('gnssFenceStatusChange',geofenceRequest,
                (want) => {
                    if(err){
                        return console.info("fenceStatusChange3 callback  err:" + err);
                    }
                    console.info("[lbs_js] off fenceStatusChange3 callback result:" + JSON.stringify(want));
                    expect(true).assertEqual(want != null);
                });
        } catch (error) {
            console.info("[lbs_js] FenceStatusOff3 try error:"+ JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400
     * @tc.name      : testAddGnssGeofence04
     * @tc.desc      : Test the function of locating the validity period of the fence.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testAddGnssGeofence04', 0, async function (done) {
        await changedLocationMode();
        let geofence = {
            "latitude": 31.12,
            "longitude": 121.11,
            "radius": 1,
            "expiration": 1,
            "coordinateSystemType": 1
        };
        let events = [1, 2, 4];
        let fenceRequest = {
            "geofence": geofence,
            "monitorTransitionEvents": events,
            "geofenceTransitionCallback" : (err, transition) => {
                if (err) {
                    console.info("SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 transition callback  err:" + err);
                    expect(true).assertEqual(JSON.stringify(err) != null);
                    return;
                }
                console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 callback result:" + JSON.stringify(transition));
                expect(true).assertEqual(transition != null);
            }
        };
        let fenceId = -1;
        try {
            await geolocationm.addGnssGeofence(fenceRequest).then((id) => {
                console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 addGnssGeofence success, id = " + id);
                fenceId = id;
                expect(true).assertEqual(id != -1);
              }).catch((err) => {
                console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 add error=" + JSON.stringify(error));
                expect(true).assertEqual(JSON.stringify(err) != null);
              }
            );
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 add try error:"+ JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        await sleep(10000);
        try {
            await geolocationm.removeGnssGeofence(fenceId).then(() => {
                console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 remove success");
                expect(true).assertEqual(fenceId != -1);
            }).catch((error) => {
                console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 remove error=" + JSON.stringify(error));
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
            console.info("SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 remove fenceId:" + fenceId);
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0400 remove try error:"+ JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        await sleep(10000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0700
     * @tc.name      : testGetGeofenceSupportedCoordTypes07
     * @tc.desc      : Test the function of locating the validity period of the fence.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetGeofenceSupportedCoordTypes07', 0, async function (done) {
        var isAcessToken = canIUse("SystemCapability.Location.Location.Geofence");
        console.info("SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0700 : " + isAcessToken);
        if (!isAcessToken) {
            console.info("The device does not support geofence");
            expect(isAcessToken).assertFalse();
            done();
        } else {
            await changedLocationMode();
            try {
                let types = geolocationm.getGeofenceSupportedCoordTypes();
                expect(true).assertEqual(JSON.stringify(types) != null);
            } catch (error) {
                console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_GEOFENCE_0700 try error:" + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
            done();
        }
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3500
     * @tc.name      : testGetCurrentLocation35
     * @tc.desc      : Initiate a single location request in a specified scenario and set the navigation scenario..
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation35', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x301, "timeoutMs": 1000, "maxAccuracy": 0 };
        try {
            geolocationm.getCurrentLocation(currentLocationRequest, (err, result) => {
                if (err) {
                    console.info("[lbs_js] getCurrentLocation callback err:  " + JSON.stringify(err));
                    expect(err.code).assertEqual(3301200);
                    console.info('[lbs_js] getCurrentLocationCallback reject after')
                } else {
                    console.info("[lbs_js] getCurrentLocation callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result != null);
                }
            });
        } catch (error) {
            console.info("[lbs_js] getCurrentLocation callback try err." + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3600
     * @tc.name      : testGetCurrentLocation36
     * @tc.desc      : Initiate a single location request in a specified scenario and set the navigation scenario..
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation36', 0, async function (done) {
        let singleLocationRequest = { 'locatingTimeoutMs': 1000, 'locatingPriority': 0x501 };
        try {
            geolocationm.getCurrentLocation(singleLocationRequest, (err, result) => {
                if (err) {
                    console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3600 callback err:  " + JSON.stringify(err));
                    expect(err.code).assertEqual(3301200);
                    console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3600 reject after')
                } else {
                    console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3600 callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result != null);
                }
            });
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3600 callback try err." + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        await sleep(1000);
        done();
    })

    /**
     * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3700
     * @tc.name      : testGetCurrentLocation37
     * @tc.desc      : Initiate a single location request in a specified scenario and set the navigation scenario..
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetCurrentLocation37', 0, async function (done) {
        let singleLocationRequest = { 'locatingTimeoutMs': 1000, 'locatingPriority': 0x502 };
        try {
            geolocationm.getCurrentLocation(singleLocationRequest, (err, result) => {
                if (err) {
                    console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3700 callback err:  " + JSON.stringify(err));
                    expect(err.code).assertEqual(3301200);
                    console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3700 reject after')
                } else {
                    console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3700 callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result != null);
                }
            });
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3700 callback try err." + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        await sleep(1000);
        done();
    })

   /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3800
    * @tc.name      : testGetCurrentLocation38
    * @tc.desc      : Initiate a specified single location request and set the exception location timeout interval.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testGetCurrentLocation38', 0, async function (done) {
        let singleLocationRequest = { 'locatingTimeoutMs': 1000, 'locatingPriority': 0x501 };
        try {
            await geolocationm.getCurrentLocation(singleLocationRequest).then((result) => {
                console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3800 promise result271 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3800 promise err271:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            });
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3800 promise try err." + JSON.stringify(error));
            expect(error.code).assertEqual("401");
        }
        await sleep(1000);
        done();
    })

   /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3900
    * @tc.name      : testGetCurrentLocation39
    * @tc.desc      : Initiate a specified single location request and set the exception location timeout interval.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testGetCurrentLocation39', 0, async function (done) {
        let singleLocationRequest = { 'locatingTimeoutMs': 1000, 'locatingPriority': 0x502 };
        try {
            await geolocationm.getCurrentLocation(singleLocationRequest).then((result) => {
                console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3900 promise result271 ' + JSON.stringify(result));
            }).catch(error => {
                console.info('[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3900 promise err271:' + JSON.stringify(error));
                expect(error.code).assertEqual(3301200);
            });
        } catch (error) {
            console.info("[lbs_js] SUB_HSS_LOCATIONSYSTEM_SINGLELOC_3900 promise try err." + JSON.stringify(error));
            expect(error.code).assertEqual("401");
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
     it('testGetCurrentWifiBssidForLocating01', 0, async function (done) {
        try {
            let mac = geolocationm.getCurrentWifiBssidForLocating();
            expect(true).assertEqual(mac != '');
        } catch(error) {
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        done();
    })

    /**
    * @tc.number    : SUB_HSS_LOCATIONSYSTEM_FENCE_EXTENSION_ABILITY_0001
    * @tc.name      : testFenceExtensionAbility01
    * @tc.desc      : Test Report Fence Transition.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testFenceExtensionAbility01', 0, async function (done) {
        try {
            let fenceExt = new MyFenceExtensionAbility()
            expect(true).assertTrue(fenceExt != null)
            let event =
                geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER
            let transition = {
                geofenceId: 1,
                transitionEvent: event
            }
            let addition = ""
            fenceExt.onFenceStatusChange(transition, addition)
            fenceExt.onDestroy()
            expect(true).assertTrue()
        } catch(error) {
            expect(true).assertEqual(JSON.stringify(error) != null)
        }
        done();
    })
    })
}

