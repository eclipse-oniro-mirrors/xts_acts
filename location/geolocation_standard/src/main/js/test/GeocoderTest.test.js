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

import geolocation from '@ohos.geolocation';
import {LocationEventListener} from '@ohos.geolocation';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osaccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

let LocationRequestScenario = {
    UNSET: 0x300,
    NAVIGATION: 0x301,
    TRAJECTORY_TRACKING: 0x302,
    CAR_HAILING: 0x303,
    DAILY_LIFE_SERVICE: 0x304,
    NO_POWER: 0x305
}
let LocationRequestPriority = { UNSET: 0x200, ACCURACY: 0x201, LOW_POWER: 0x202, FIRST_FIX: 0x203 }

let LocationPrivacyType = {
    OTHERS: 0,
    STARTUP: 1,
    CORE_LOCATION: 2
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode(){
    await geolocation.isLocationEnabled().then(async(result) => {
        console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result));
        if(!result){
            await geolocation.requestEnableLocation().then(async(result) => {
                await sleep(3000);
                console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
            }).catch((error) => {
                console.info("[lbs_js] promise then error." + JSON.stringify(error));
                expect().assertFail();
            });
        }
    });
    await geolocation.isLocationEnabled().then(async(result) => {
        console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result));
    });
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


export default function geolocationTest_geo1() {

    describe('geolocationTest_geo1', function () {
    
        console.log('#start AccessTokenTests#');
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
     * @tc.number SUB_HSS_LocationSystem_Geo_0100
     * @tc.name testIsGeoServiceAvailable
     * @tc.desc Check whether address resolution and reverse address resolution are supported.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
     it('SUB_HSS_LocationSystem_Geo_0100', 0, async function (done) {
        try {
            geolocation.isGeoServiceAvailable(async (err, data) => {
                if (err) {
                    console.info('[lbs_js]  getGeoServiceState err is : ' + JSON.stringify(err));
                } else {
                    console.info('[lbs_js] isGeoServiceAvailable callback result: ' + JSON.stringify(data));
                    console.info('[lbs_js] not support now');
                    expect(true).assertEqual(JSON.stringify(data) != null);
                }
            })
        } catch (error) {
            console.info("[lbs_js] isGeoServiceAvailable callback err." + JSON.stringify(error));
            console.info('[lbs_js] The geocode interface is not connected to a third-party service.');
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        await sleep(500);
        done();
    });

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_0200
     * @tc.name TestisGeoServiceAvailable
     * @tc.desc Check whether address resolution and reverse address resolution are supported.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0200', 0, async function (done) {
        try {
            await geolocation.isGeoServiceAvailable().then((result) => {
                console.info('[lbs_js] isGeoServiceAvailable promise result: ' + JSON.stringify(result));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(result) != null);
            }).catch((error) => {
                console.info("[lbs_js] promise then error." + JSON.stringify(error));
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        } catch (error) {
            console.info("[lbs_js] isGeoServiceAvailable error." + JSON.stringify(error));
            console.info('[lbs_js] The geocode interface is not connected to a third-party service.');
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_0300
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Address Resolution Test.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0300', 0, async function (done) {
        let reverseGeocodeRequest = { "latitude": 31.265496, "longitude": 121.62771, "maxItems": 1, "locale": "zh" };
        try {
            geolocation.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                if (err) {
                    console.info('[lbs_js]  getAddressesFromLocation callback err is : ' + JSON.stringify(err));
                } else {
                    console.info("[lbs_js]  getAddressesFromLocation callback data is: " + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation callback try err:" + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        await sleep(1000);
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_Geo_0400
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Address Resolution Test.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0400', 0, async function (done) {
        let reverseGeocodeRequest = { "latitude": 31.265496, "longitude": 121.62771, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation04 promise: ' + JSON.stringify(data));
                console.info('addressUrl: ' + JSON.stringify(data)[0].addressUrl
                + JSON.stringify(data)[0].administrativeArea + JSON.stringify(data)[0].countryCode
                + JSON.stringify(data)[0].countryName + JSON.stringify(data)[0].descriptions
                + JSON.stringify(data)[0].descriptionsSize + data[0].latitude
                + JSON.stringify(data)[0].locale + JSON.stringify(data)[0].locality
                + JSON.stringify(data)[0].longitude + JSON.stringify(data)[0].phoneNumber
                + JSON.stringify(data)[0].placeName
                + JSON.stringify(data)[0].postalCode + JSON.stringify(data)[0].premises
                + JSON.stringify(data)[0].roadName + JSON.stringify(data)[0].subAdministrativeArea
                + JSON.stringify(data)[0].subLocality + JSON.stringify(data)[0].subRoadName
                + JSON.stringify(data)[0].isFromMock);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation04 promise try err:" + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_0500
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Obtaining Multiple Addresses Using the Address Resolution Function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0500', 0, async function (done) {
        let reverseGeocodeRequest = { "latitude": 31.265496, "longitude": 121.62771, "maxItems": 5 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation05 promise: ' + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocation promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation05 promise try err:" + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_Geo_0600
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Input parameter boundary test of the address resolution function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0600', 0, async function (done) {
        let reverseGeocodeRequest1 = { "latitude": 90, "longitude": 121.62771, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest1).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation0601 promise: ' + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) != null);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0601 promise then error." + JSON.stringify(error));
                expect(true).assertEqual(JSON.stringify(error) != null);
                console.info('[lbs_js] not support now');
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }

        let reverseGeocodeRequest2 = { "latitude": 90.1, "longitude": 121.62771, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest2).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation promise: ' + JSON.stringify(data));
                expect(data.length).assertEqual(0);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0602 promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }

        let reverseGeocodeRequest3 = { "latitude": -90, "longitude": 121.62771, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest3).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation0603 promise: ' + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) != null);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0603 promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }

        let reverseGeocodeRequest4 = { "latitude": -90.1, "longitude": 121.62771, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest4).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation0604 promise: ' + JSON.stringify(data));
                expect(data.length).assertEqual(0);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0604 promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_0700
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Input parameter boundary test of the address resolution function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0700', 0, async function (done) {
        let reverseGeocodeRequest = { "latitude": 31.265496, "longitude": 180, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation0701 promise: ' + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) != null);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0701 promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let reverseGeocodeRequest1 = { "latitude": 31.265496, "longitude": -180.1, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest1).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation0702 promise: ' + JSON.stringify(data));
                expect(data.length).assertEqual(0);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0702 promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let reverseGeocodeRequest2 = { "latitude": 31.265496, "longitude": 180, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest2).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation0703 promise: ' + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) != null);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0703 promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let reverseGeocodeRequest3 = { "latitude": 31.265496, "longitude": 180.1, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocation(reverseGeocodeRequest3).then((data) => {
                console.info('[lbs_js] getAddressesFromLocation0704 promise: ' + JSON.stringify(data));
                expect(data.length).assertEqual(0);
            }).catch(error => {
                console.info("[lbs_js] getAddressesFromLocation0704 promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_0800
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Reverse address resolution test.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0800', 0, async function (done) {
        let geocodeRequest = {
            "description": "上海市浦东新区金穗路1800号",
            "maxItems": 1,
            "locale": "zh",
            "minLatitude": "",
            "minLongitude": "",
            "maxLatitude": "",
            "maxLongitude": ""
        };
        try {
            geolocation.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                if (err) {
                    switch (err) {
                        case 100:
                            console.info("NOT_SUPPORTED: " + JSON.stringify(err));
                            break;
                        case 101:
                            console.info("INPUT_PARAMS_ERROR: " + JSON.stringify(err));
                            break;
                        case 102:
                            console.info("REVERSE_GEOCODE_ERROR: " + JSON.stringify(err));
                            break;
                        case 103:
                            console.info("GEOCODE_ERROR: " + JSON.stringify(err));
                            break;
                        case 104:
                            console.info("LOCATOR_ERROR: " + JSON.stringify(err));
                            break;
                        case 105:
                            console.info("LOCATION_SWITCH_ERROR: " + JSON.stringify(err));
                            break;
                        case 106:
                            console.info("LAST_KNOWN_LOCATION_ERROR: " + JSON.stringify(err));
                            break;
                        case 107:
                            console.info("LOCATION_REQUEST_TIMEOUT_ERROR: " + JSON.stringify(err));
                            break;
                        case 108:
                            console.info("QUERY_COUNTRY_CODE_ERROR: " + JSON.stringify(err));
                            break;
                        default:
                            console.info('getAddressesFromLocationName callback err: ' + JSON.stringify(err));
                    }
                } else {
                    console.info("[lbs_js] getAddressesFromLocationName08 callback data is: " + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }
                done();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_0900
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Reverse address resolution test.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_0900', 0, async function (done) {
        let geocodeRequest = { "description": "上海市浦东新区金穗路1800号", "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
                console.info("[lbs_js] getAddressesFromLocation09 promise data: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName09 promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation09 try err." + JSON.stringify(error));
            expect(true).assertEqual((JSON.stringify(error)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1000
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Obtaining Multiple Locations Using the Reverse Address Resolution Function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1000', 0, async function (done) {
        let geocodeRequest = { "description": "上海市浦东新区金穗路1800号", "maxItems": 5 };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
                console.info("[lbs_js]  getAddressesFromLocation10 promise data: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName10 promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        } catch (error) {
            console.info("[lbs_js] getAddressesFromLocation10 try err." + JSON.stringify(error));
            expect(true).assertEqual((JSON.stringify(error)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1100
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Invalid parameter input test for the reverse address resolution function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1100', 0, async function (done) {
        try {
            let geocodeRequest = { "description": "", "maxItems": 1 };
            await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
                console.info("[lbs_js]  getAddressesFromLocation111  promise data: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName111 promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest1 = { "description": null, "maxItems": 1 };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                console.info("[lbs_js]  getAddressesFromLocation112 promise data: " + JSON.stringify(result));
                expect(result.length == 0).assertTrue();
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName112 promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocation11 try err." + JSON.stringify(error));
            expect(true).assertEqual((JSON.stringify(error)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1200
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Test the reverse address resolution function in the specified range..
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1200', 0, async function (done) {
        let geocodeRequest = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": 31.3082812847,
            "minLongitude": 121.5782001832,
            "maxLatitude": 31.1537977881,
            "maxLongitude": 121.8026736943
        };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
                console.info("[lbs_js] getAddressesFromLocation   callback data is: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocation12 try err." + JSON.stringify(error));
            expect(true).assertEqual((JSON.stringify(error)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1300
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Invalid input parameter test for the reverse address resolution function in the specified range
     *          -Invalid location name.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1300', 0, async function (done) {
        let geocodeRequest = {
            "description": "",
            "maxItems": 1,
            "minLatitude": 331.3082812847,
            "minLongitude": 121.5782001832,
            "maxLatitude": 31.1537977881,
            "maxLongitude": 121.8026736943
        };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
                console.info("[lbs_js]  getAddressesFromLocation callback data is: " + JSON.stringify(result));
                expect(result.length == 0).assertTrue();
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest1 = {
            "description": null,
            "maxItems": 1,
            "minLatitude": 331.3082812847,
            "minLongitude": 121.5782001832,
            "maxLatitude": 31.1537977881,
            "maxLongitude": 121.8026736943
        };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                console.info("[lbs_js]  getAddressesFromLocation callback data is: " + JSON.stringify(result));
                expect(result.length == 0).assertTrue();
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1400
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Invalid input parameter test for the reverse address resolution function in the specified range
     *          - the address is not in the range.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1400', 0, async function (done) {
        let geocodeRequest = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 40.85,
            "minLongitude": 116.35,
            "maxLatitude": 40.95,
            "maxLongitude": 116.45
        };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
                console.info("[lbs_js]  getAddressesFromLocation14 promise data: " + JSON.stringify(result));
                expect(result.length >= 0).assertTrue();
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName14 promise then err." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocation14 try err." + JSON.stringify(error));
            expect(true).assertEqual((JSON.stringify(error)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1500
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Invalid longitude and latitude entered for the reverse address resolution
     *          function in the specified range. The longitude and latitude range boundary is inverted..
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1500', 0, async function (done) {
        let geocodeRequest = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.95,
            "minLongitude": 116.45,
            "maxLatitude": 39.85,
            "maxLongitude": 116.35
        };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
                console.info("[lbs_js]  getAddressesFromLocation15 promise data is: " + JSON.stringify(result));
                expect(result.length >= 0).assertTrue();
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName15 promise then err." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocation15 try err." + JSON.stringify(error));
            expect(true).assertEqual((JSON.stringify(error)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1600
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Input parameter boundary test for the reverse address resolution function in a specified range.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1600', 0, async function (done) {
        let geocodeRequest1 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": -90,
            "minLongitude": 121.5782001832,
            "maxLatitude": 31.1537977881,
            "maxLongitude": 121.8026736943
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise1: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest2 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": 90,
            "minLongitude": 121.5782001832,
            "maxLatitude": 31.1537977881,
            "maxLongitude": 121.8026736943
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest2).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise2: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest3 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": -90.1,
            "minLongitude": 121.5782001832,
            "maxLatitude": 31.1537977881,
            "maxLongitude": 121.8026736943
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest3).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise3: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) == null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest4 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": 90.1,
            "minLongitude": 121.5782001832,
            "maxLatitude": 31.1537977881,
            "maxLongitude": 121.8026736943
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest4).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise4: " + JSON.stringify(result));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest5 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": 31.3082812847,
            "minLongitude": 121.5782001832,
            "maxLatitude": -90,
            "maxLongitude": 121.8026736943
        };
        try {
            await geolocation.getAddressesFromLocationName(geocodeRequest5).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise5: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest6 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": 31.3082812847,
            "minLongitude": 121.5782001832,
            "maxLatitude": 90,
            "maxLongitude": 121.8026736943
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest6).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise6: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest7 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": 31.3082812847,
            "minLongitude": 121.5782001832,
            "maxLatitude": -90.1,
            "maxLongitude": 121.8026736943
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest7).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise7: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) == null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest8 = {
            "description": "上海金穗路1800号",
            "maxItems": 1,
            "minLatitude": 31.3082812847,
            "minLongitude": 121.5782001832,
            "maxLatitude": 90.1,
            "maxLongitude": 121.8026736943
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest8).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise8: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) == null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(true).assertEqual((JSON.stringify(error)) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Geo_1700
     * @tc.name TestgetAddressesFromLocation
     * @tc.desc Longitude input parameter boundary test for the reverse address resolution function in a specified range
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Geo_1700', 0, async function (done) {
        let geocodeRequest1 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": -180,
            "maxLatitude": 39.95,
            "maxLongitude": 116.45
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise1: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error) != null);
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest2 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": 180,
            "maxLatitude": 39.95,
            "maxLongitude": 116.45
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest2).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise2: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(error.length != 0).assertTrue();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest3 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": -180.1,
            "maxLatitude": 39.95,
            "maxLongitude": 116.45
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest3).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise3: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(error.length != 0).assertTrue();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest4 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": 180.1,
            "maxLatitude": 39.95,
            "maxLongitude": 116.45
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest4).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise4: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(error.length != 0).assertTrue();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest5 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": 116.35,
            "maxLatitude": 39.95,
            "maxLongitude": -180
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest5).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise5: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(error.length != 0).assertTrue();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest6 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": 116.35,
            "maxLatitude": 39.95,
            "maxLongitude": 180
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest6).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise6: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(error.length != 0).assertTrue();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest7 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": 116.35,
            "maxLatitude": 39.95,
            "maxLongitude": -180.1
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest7).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise7: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(error.length != 0).assertTrue();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        let geocodeRequest8 = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.85,
            "minLongitude": 116.35,
            "maxLatitude": 39.95,
            "maxLongitude": 180.1
        };
        try{
            await geolocation.getAddressesFromLocationName(geocodeRequest8).then((result) => {
                console.info("[lbs_js]getAddressesFromLocation promise8: " + JSON.stringify(result));
                expect(true).assertEqual((JSON.stringify(result)) != null);
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocationName  promise then error." + JSON.stringify(error));
                expect(error.length != 0).assertTrue();
            });
        }catch(error){
            console.info("[lbs_js] getAddressesFromLocationName message." + JSON.stringify(error.message));
            expect(true).assertEqual((JSON.stringify(error.message)) != null);
        }
        done();
    })

    })
}


