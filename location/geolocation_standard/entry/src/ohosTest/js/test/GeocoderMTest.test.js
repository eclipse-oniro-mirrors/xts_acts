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
import wifiMg from '@ohos.wifiManager';

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

export default function geolocationTest_geo5() {

    describe('geolocationTest_geo5', function () {
    
        console.log('#start AccessTokenTests#');
        beforeAll(async function (done) {
            console.info('beforeAll case');
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
                if (data.chload >= 800 || data.rssi <= -80) {
                  expect().message("======> WLAN Network error").assertFail();
                  done();
                } else if (data.chload >= 500) {
                  console.info("======> The internet connection is poor. ");
                }
                    
              } catch (err) {
                console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
                done();
              }
            await applyPermission();
            done();
        })
    
        beforeEach(async function (done) {
            console.info('beforeEach case');
            await changedLocationMode();
            done();
        })


     /**
      * @tc.name   SUB_HSS_LocationSystem_Geo_1900
      * @tc.number SUB_HSS_LocationSystem_Geo_1900
      * @tc.desc   Check whether address resolution and reverse address resolution are supported.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_HSS_LocationSystem_Geo_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        try {
            let geocoder1 = geolocationm.isGeocoderAvailable();
            console.info('[lbs_js] isGeocoderAvailable result: ' + JSON.stringify(geocoder1));
            expect(true).assertEqual(JSON.stringify(geocoder1) != null);
        } catch (error) {
            console.info('[lbs_js] isGeocoderAvailable err:' + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(error.code).assertEqual("801");
        }
    });

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2000
     * @tc.number SUB_HSS_LocationSystem_Geo_2000
     * @tc.desc   Address Resolution Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let reverseGeocodeRequest = {
                "latitude": 31.265496, "longitude": 121.62771, "maxItems": 1 , "locale": "zh", "country": "CN"
            };
            try {
                geolocationm.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                    if (err) {
                        console.info('[lbs_js] getAddressesFromLocation4 callback err is:' + JSON.stringify(err));
                        expect(err.code).assertEqual(3301300);
                    } else {
                        console.info("[lbs_js] getAddressesFromLocation4 callback data is:" + JSON.stringify(data));
                        expect(true).assertEqual((JSON.stringify(data)) != null);
                    }
                 });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation4 callback try error:"+ error);
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(true).assertFalse();
                }
            }
            await sleep(2000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })


    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2100
     * @tc.number SUB_HSS_LocationSystem_Geo_2100
     * @tc.desc   Address Resolution Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            try {
                let reverseGeocodeRequest = { "latitude": 31.265496, "longitude": 121.62771, "maxItems": 5};
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation21 promise: ' + JSON.stringify(data));
                    if(data!="")
                    {
                        console.info('addressUrl: ' + JSON.stringify(data[0].addressUrl)
                        +',administrativeArea: '+ JSON.stringify(data[0].administrativeArea)
                        +',countryCode: '+ JSON.stringify(data[0].countryCode)
                        +'countryName: '+ JSON.stringify(data[0].countryName )
                        +',descriptions: '+ JSON.stringify(data[0].descriptions)
                        +',descriptionsSize: '+JSON.stringify(data[0].descriptionsSize)
                        +',latitude: '+ JSON.stringify(data[0].latitude)
                        +',locale: '+ JSON.stringify(data[0].locale)
                        +',locality:'+ JSON.stringify(data[0].locality)
                        +',longitude:'+ JSON.stringify(data[0].longitude)
                        +',phoneNumber: '+ JSON.stringify(data[0].phoneNumber)
                        +',placeName:'+ JSON.stringify(data[0].placeName)
                        + ',postalCode: '+JSON.stringify(data[0].postalCode)
                        + ',premises:'+JSON.stringify(data[0].premises)
                        + ',roadName:'+JSON.stringify(data[0].roadName)
                        + ',subAdministrativeArea:'+JSON.stringify(data[0].subAdministrativeArea)
                        + ',subLocality:'+JSON.stringify(data[0].subLocality )
                        +',subRoadName:'+ JSON.stringify(data[0].subRoadName)
                        + ',isFromMock:'+JSON.stringify(data[0].isFromMock));
                    }
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation21 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    if (error.code == "801") {
                        expect(error.code).assertEqual("801")
                    } else {
                        expect(error.code).assertEqual(3301300);
                    }
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation21 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2200
     * @tc.number SUB_HSS_LocationSystem_Geo_2200
     * @tc.desc   Obtaining Multiple Addresses Using the Address Resolution Function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            try {
                let reverseGeocodeRequest = { "latitude": 31.265496, "longitude": 121.62771, "maxItems": 5 };
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation22 promise:' + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocation22 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301300);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation22 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2300
     * @tc.number SUB_HSS_LocationSystem_Geo_2300
     * @tc.desc   Input parameter boundary test of the address resolution function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let reverseGeocodeRequest1 = { "latitude": 90, "longitude": 121.62771, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest1).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation2301 promise: ' + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2301 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301300);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            let reverseGeocodeRequest2 = { "latitude": 90.1, "longitude": 121.62771, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest2).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation promise: ' + JSON.stringify(data));
                    expect(data.length).assertEqual(0);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2302 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error));
                expect(error.code).assertEqual("401");
            }
            let reverseGeocodeRequest3 = { "latitude": -90, "longitude": 121.62771, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest3).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation2303 promise: ' + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2303 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301300);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            let reverseGeocodeRequest4 = { "latitude": -90.1, "longitude": 121.62771, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest4).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation2304 promise: ' + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2304 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message." + JSON.stringify(error));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2400
     * @tc.number SUB_HSS_LocationSystem_Geo_2400
     * @tc.desc   Input parameter boundary test of the address resolution function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let reverseGeocodeRequest = { "latitude": 31.265496, "longitude": 180, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation2401 promise: ' + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2401 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301300);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message1." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let reverseGeocodeRequest1 = { "latitude": 31.265496, "longitude": -180.1, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest1).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation2402 promise: ' + JSON.stringify(data));
                    expect(data.length).assertEqual(0);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2402 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message2." + JSON.stringify(error));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let reverseGeocodeRequest2 = { "latitude": 31.265496, "longitude": 180, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest2).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation2403 promise: ' + JSON.stringify(data));
                    expect(true).assertEqual((JSON.stringify(data)) != null);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2403 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301300);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message3." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let reverseGeocodeRequest3 = { "latitude": 31.265496, "longitude": 180.1, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocation(reverseGeocodeRequest3).then((data) => {
                    console.info('[lbs_js] getAddressesFromLocation2404 promise: ' + JSON.stringify(data));
                    expect(data.length).assertEqual(0);
                }).catch(error => {
                    console.info("[lbs_js] getAddressesFromLocation2404 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocation message4." + JSON.stringify(error));
                expect(error.code).assertEqual("401");
            } 
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })


    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2500
     * @tc.number SUB_HSS_LocationSystem_Geo_2500
     * @tc.desc   Reverse address resolution test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            try {
                let geocodeRequest = {
                    "description": "上海市浦东新区金穗路1800号",
                    "maxItems": 1,
                    "locale": "zh",
                };
                geolocationm.getAddressesFromLocationName(geocodeRequest, (err, data) => {
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
                    }
                    else {
                            console.info("[lbs_js] getAddressesFromLocationName08 callback data is: " + JSON.stringify(data));
                    }
                    done();
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocationName08 message." + JSON.stringify(error.message));
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(true).assertFalse();
                }
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable."); 
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2600
     * @tc.number SUB_HSS_LocationSystem_Geo_2600
     * @tc.desc   Reverse address resolution test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest = { "description": "上海市浦东新区金穗路1800号", "maxItems": 3 };
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocation09 callback data is:" + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName09 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocationName26 try err." + JSON.stringify(error));
                if (error.code == "801") {
                    expect(error.code).assertEqual("801")
                } else {
                    expect(true).assertFalse();
                }
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2700
     * @tc.number SUB_HSS_LocationSystem_Geo_2700
     * @tc.desc   Obtaining Multiple Locations Using the Reverse Address Resolution Function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            try {
                let geocodeRequest = { "description": "上海市浦东新区金穗路1800号", "maxItems": 5 };
                await geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                    console.info("[lbs_js]  getAddressesFromLocation10 promise data is:" + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName10 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocationName27 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2800
     * @tc.number SUB_HSS_LocationSystem_Geo_2800
     * @tc.desc   Invalid parameter input test for the reverse address resolution function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            try {
                let geocodeRequest = { "description": "", "maxItems": 1 };
                await geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                    console.info("[lbs_js]  getAddressesFromLocation111  promise data is:" + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName111 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName111 message." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let geocodeRequest1 = { "description": null, "maxItems": 1 };
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                    console.info("[lbs_js]  getAddressesFromLocationName112 promise data is:" + JSON.stringify(result));
                    expect(result.length == 0).assertTrue();
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName112 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName112 message." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_2900
     * @tc.number SUB_HSS_LocationSystem_Geo_2900
     * @tc.desc   Test the reverse address resolution function in the specified range..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": 31.3082812847,
                "minLongitude": 121.5782001832,
                "maxLatitude": 31.1537977881,
                "maxLongitude": 121.8026736943
            };
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocation29 promise data is:" + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName29 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocationName29 try err." + JSON.stringify(error));
                expect(true).assertFalse();
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_3000
     * @tc.number SUB_HSS_LocationSystem_Geo_3000
     * @tc.desc   Invalid input parameter test for the reverse address resolution function in the specified range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest = {
                "description": "",
                "maxItems": 1,
                "minLatitude": 331.3082812847,
                "minLongitude": 121.5782001832,
                "maxLatitude": 31.1537977881,
                "maxLongitude": 121.8026736943
            };
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName301 promise data is:" + JSON.stringify(result));
                    expect(result.length == 0).assertTrue();
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName301 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName301 message." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let geocodeRequest1 = {
                "description": null,
                "maxItems": 1,
                "minLatitude": 331.3082812847,
                "minLongitude": 121.5782001832,
                "maxLatitude": 31.1537977881,
                "maxLongitude": 121.8026736943
            };
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName302 promise data is:" + JSON.stringify(result));
                    expect(result.length == 0).assertTrue();
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName302 promise then error." + JSON.stringify(error));
                    expect(true).assertFalse();
    
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName302 message." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_3100
     * @tc.number SUB_HSS_LocationSystem_Geo_3100
     * @tc.desc   Invalid input parameter test for the reverse address resolution function in the specified range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 40.85,
                "minLongitude": 116.35,
                "maxLatitude": 40.95,
                "maxLongitude": 116.45
            };
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName31 promise data is:" + JSON.stringify(result));
                    expect(result.length >= 0).assertTrue();
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName31 promise then error." + JSON.stringify(error));
                    expect(error.code).assertEqual(3301400);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocationName31 message." + JSON.stringify(error));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_3200
     * @tc.number SUB_HSS_LocationSystem_Geo_3200
     * @tc.desc   Invalid longitude and latitude entered for the reverse address resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocodeRequest = {
            "description": "北京天安门",
            "maxItems": 1,
            "minLatitude": 39.95,
            "minLongitude": 116.45,
            "maxLatitude": 39.85,
            "maxLongitude": 116.35
        };
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest).then((result) => {
                    console.info("[lbs_js]  getAddressesFromLocationName32 promise data is:" + JSON.stringify(result));
                    expect(result.length >= 0).assertTrue();
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName32 promise then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            } catch (error) {
                console.info("[lbs_js] getAddressesFromLocationName32 message." + JSON.stringify(error));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_3300
     * @tc.number SUB_HSS_LocationSystem_Geo_3300
     * @tc.desc   Input parameter boundary test for the reverse address resolution function in a specified range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest1 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": -90,
                "minLongitude": 121.5782001832,
                "maxLatitude": 31.1537977881,
                "maxLongitude": 121.8026736943
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise1:" + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise1 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message1." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let geocodeRequest2 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": 90,
                "minLongitude": 121.5782001832,
                "maxLatitude": 31.1537977881,
                "maxLongitude": 121.8026736943
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest2).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise2: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise2 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message2." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let geocodeRequest3 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": -90.1,
                "minLongitude": 121.5782001832,
                "maxLatitude": 31.1537977881,
                "maxLongitude": 121.8026736943
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest3).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise3: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) == null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise3 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message3." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let geocodeRequest4 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": 90.1,
                "minLongitude": 121.5782001832,
                "maxLatitude": 31.1537977881,
                "maxLongitude": 121.8026736943
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest4).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise4: " + JSON.stringify(result));
                    console.info('[lbs_js] not support now');
                    expect(true).assertEqual(JSON.stringify(error) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise4 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message4." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let geocodeRequest5 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": 31.3082812847,
                "minLongitude": 121.5782001832,
                "maxLatitude": -90,
                "maxLongitude": 121.8026736943
            };
            try {
                await geolocationm.getAddressesFromLocationName(geocodeRequest5).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise5: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise5 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message5." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let geocodeRequest6 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": 31.3082812847,
                "minLongitude": 121.5782001832,
                "maxLatitude": 90,
                "maxLongitude": 121.8026736943
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest6).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise6: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise6 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message6." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let geocodeRequest7 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": 31.3082812847,
                "minLongitude": 121.5782001832,
                "maxLatitude": -90.1,
                "maxLongitude": 121.8026736943
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest7).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise7: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) == null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise7 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message7." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let geocodeRequest8 = {
                "description": "上海金穗路1800号",
                "maxItems": 1,
                "minLatitude": 31.3082812847,
                "minLongitude": 121.5782001832,
                "maxLatitude": 90.1,
                "maxLongitude": 121.8026736943
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest8).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise8: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) == null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName33 promise8 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName33 message8." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_3400
     * @tc.number SUB_HSS_LocationSystem_Geo_3400
     * @tc.desc   Longitude input parameter boundary test for the reverse address resolution function in a specified range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest1 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": -180,
                "maxLatitude": 39.95,
                "maxLongitude": 116.45
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise1: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise1 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message1." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let geocodeRequest2 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": 180,
                "maxLatitude": 39.95,
                "maxLongitude": 116.45
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest2).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise2: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise2 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message2." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let geocodeRequest3 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": -180.1,
                "maxLatitude": 39.95,
                "maxLongitude": 116.45
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest3).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise3: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise3 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message3." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let geocodeRequest4 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": 180.1,
                "maxLatitude": 39.95,
                "maxLongitude": 116.45
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest4).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise4: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise4 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message4." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            let geocodeRequest5 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": 116.35,
                "maxLatitude": 39.95,
                "maxLongitude": -180
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest5).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise5: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise5 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message5." + JSON.stringify(error.message));
                expect(true).assertFalse();
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
                await geolocationm.getAddressesFromLocationName(geocodeRequest6).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise6: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise6 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message6." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
            let geocodeRequest7 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": 116.35,
                "maxLatitude": 39.95,
                "maxLongitude": -180.1
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest7).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise7: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise7 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message7." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
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
                await geolocationm.getAddressesFromLocationName(geocodeRequest8).then((result) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise8: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] getAddressesFromLocationName34 promise8 then error." + JSON.stringify(error));
                    expect(true).assertFalse();
                });
            }catch(error){
                console.info("[lbs_js] getAddressesFromLocationName34 message8." + JSON.stringify(error.message));
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_3500
     * @tc.number SUB_HSS_LocationSystem_Geo_3500
     * @tc.desc   Longitude input parameter boundary test for the reverse address resolution function in a specified range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest1 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": -180,
                "maxLatitude": 39.95,
                "maxLongitude": 116.45,
                "country": "cn"
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                    console.info("[lbs_js] SUB_HSS_LocationSystem_Geo_3500 promise1: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] SUB_HSS_LocationSystem_Geo_3500 promise1 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] SUB_HSS_LocationSystem_Geo_3500 message1." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    /**
     * @tc.name   SUB_HSS_LocationSystem_Geo_3600
     * @tc.number SUB_HSS_LocationSystem_Geo_3600
     * @tc.desc   Longitude input parameter boundary test for the reverse address resolution function in a specified range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HSS_LocationSystem_Geo_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let geocoder1 = geolocationm.isGeocoderAvailable();
        if (geocoder1) {
            let geocodeRequest1 = {
                "description": "北京天安门",
                "maxItems": 1,
                "minLatitude": 39.85,
                "minLongitude": -180,
                "maxLatitude": 39.95,
                "maxLongitude": 116.45,
                "country": "us"
            };
            try{
                await geolocationm.getAddressesFromLocationName(geocodeRequest1).then((result) => {
                    console.info("[lbs_js] SUB_HSS_LocationSystem_Geo_3600 promise1: " + JSON.stringify(result));
                    expect(true).assertEqual((JSON.stringify(result)) != null);
                }).catch((error) => {
                    console.info("[lbs_js] SUB_HSS_LocationSystem_Geo_3600 promise1 then error." + JSON.stringify(error));
                    console.info('[lbs_js] not support now');
                    expect(error.code).assertEqual(3301400);
                });
            }catch(error){
                console.info("[lbs_js] SUB_HSS_LocationSystem_Geo_3600 message1." + JSON.stringify(error.message));
                expect(true).assertFalse();
            }
            await sleep(1000);
        } else {
            console.info("[lbs_js] The geocoding service is unavailable.");
        }
        done();
    })

    })
}