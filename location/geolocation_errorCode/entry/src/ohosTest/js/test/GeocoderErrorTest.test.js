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
        it('SUB_HSS_LocationSystem_GeoErr_0400', 0, async function (done) {
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
        it('SUB_HSS_LocationSystem_GeoErr_0500', 0, async function (done) {
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
        it('SUB_HSS_LocationSystem_GeoErr_0600', 0, async function (done) {
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
        it('SUB_HSS_LocationSystem_GeoErr_0700', 0, async function (done) {
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
    
    
    })
}

