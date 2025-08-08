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
    console.info('[lbs_js]sleep function');
}

async function changedLocationMode(){
    let result1 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result1));
    if(!result1){
        await geolocation.requestEnableLocation().then(async(result) => {
            await sleep(1000);
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
    console.info("====>testgetuserid get AccountManager finish====");
    let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
    console.info("====>testgetuserid localId obtained by process:" + localId);
    let appInfo = await bundle.getApplicationInfo('ohos.acts.location.geolocation.function', 0, localId);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName1 = 'ohos.permission.LOCATION';
        let permissionName2 = 'ohos.permission.LOCATION_IN_BACKGROUND';
        await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + result);
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + err);
        });
        await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + result);
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + err);
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}

let CountryCodeType = {
        COUNTRY_CODE_FROM_LOCALE : 1,
        COUNTRY_CODE_FROM_SIM:2,
        COUNTRY_CODE_FROM_LOCATION:3,
        COUNTRY_CODE_FROM_NETWORK:4,
    }

export default function geolocationTest_6() {


    describe('geolocationTest_6', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            done();
        })
    
        beforeEach(async function (done) {
            console.info('beforeEach case');
            await changedLocationMode();
            done();
        })
    
    /**
     * @tc.number SUB_HSS_LocationSystem_CountryCode_0400
     * @tc.name Test getCountryCode
     * @tc.desc Obtaining Country Code Information
     * @tc.type Function
     * @tc.level Level 2
     */
     it('SUB_HSS_LocationSystem_CountryCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            await geolocationm.getCountryCode().then((result) => {
                console.info("[lbs_js] getCountryCode promise result: " + JSON.stringify(result));
                console.info("[lbs_js] country :" + result.country);
                console.info("[lbs_js] type: " + result.type);
                expect(true).assertEqual(result!=null);
                expect(true).assertEqual(JSON.stringify(result.country)!=null);
                expect(true).assertEqual(JSON.stringify(result.type)!=null);
            }).catch((error) => {
                console.info("[lbs_js] getCountryCode promise then error."  + JSON.stringify(error));
                expect().assertFail();
            });
        } catch (error) {
            console.info("[lbs_js] getCountryCode promise try err." + JSON.stringify(error));
            if (error.code == "801") {
                expect(error.code).assertEqual("801")
            } else {
                expect().assertFail();
            }
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_CountryCode_0500
     * @tc.name Test getCountryCode
     * @tc.desc Obtaining Country Code Information
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_CountryCode_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            geolocationm.getCountryCode((err,data) => {
                if (err) {
                    return console.info("[lbs_js] getCountryCode callback err:  " + JSON.stringify(err));
                    expect().assertFail();
                } else {
                    console.info("[lbs_js] getCountryCode callback success"+ JSON.stringify(data));
                    expect(true).assertEqual(data != null);
                }
            })
        } catch (error) {
            console.info("[lbs_js] getCountryCode callback try err." + JSON.stringify(error));
            if (error.code == "801") {
                expect(error.code).assertEqual("801")
            } else {
                expect().assertFail();
            }
        }
        await sleep(1500);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_CountryCode_0600
     * @tc.name getCountryCode_on_off
     * @tc.desc The interception country code is changed.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_CountryCode_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info("[lbs_js] countryCodeChange");
        try {
            geolocationm.on('countryCodeChange', function (data) {
                console.info('[lbs_js] countryCodeChange' +JSON.stringify(data) );
            });
        } catch (error) {
            console.info("[lbs_js] countryCodeChangeOn try err." + JSON.stringify(error));
            if (error.code == "801") {
                expect(error.code).assertEqual("801")
            } else {
                expect().assertFail();
            }
        }
        try {
            await geolocationm.getCountryCode().then((result) => {
                console.info("[lbs_js] getCountryCode promise result: " + JSON.stringify(result));
                expect(true).assertEqual(JSON.stringify(result)!=null);
            }).catch((error) => {
                console.info("[lbs_js] getCountryCode promise then error."  + JSON.stringify(error));
                expect().assertFail();
            });
        } catch (error) {
            console.info("[lbs_js] getCountryCode promise try err." + JSON.stringify(error));
            if (error.code == "801") {
                expect(error.code).assertEqual("801")
            } else {
                expect().assertFail();
            }
        }
        try {
            geolocationm.off('countryCodeChange', function (data) {
                console.info('[lbs_js] countryCodeChange' + JSON.stringify(data));
            })
        } catch (error) {
            console.info("[lbs_js] countryCodeChangeOn try err." + JSON.stringify(error));
            if (error.code == "801") {
                expect(error.code).assertEqual("801")
            } else {
                expect().assertFail();
            }
        }
        done();
    })

    })
}

