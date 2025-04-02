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
import wantAgent from '@ohos.wantAgent';
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

export default function geolocationTest_6(){
    describe('geolocationTest_6', function () {
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
         * @tc.number SUB_HSS_LocationSystem_CountryCodeErr_0200
         * @tc.name getCountryCode_on_off
         * @tc.desc The interception country code is changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_CountryCodeErr_0200', 0, function () {
            try {
                console.info("[lbs_js] SUB_HSS_LocationSystem_CountryCodeErr_0200");
                geolocationm.on('countryCodeChange', 1);
            } catch (error) {
                console.info("[lbs_js] countryCodeOn2 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_CountryCodeErr_0300
         * @tc.name getCountryCode_on_off
         * @tc.desc The interception country code is changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_CountryCodeErr_0300', 0, function () {
            try {
                console.info("[lbs_js] SUB_HSS_LocationSystem_CountryCodeErr_0300");
                geolocationm.off('countryCodeChange',1);
            } catch (error) {
                console.info("[lbs_js] countryCodeOff3 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(true).assertFalse();
            }
        })
    
    
            it('SUB_HSS_LocationSystem_CountryCodeErr_0201', 0, async function (done) {
                var callback = (code) => {
                    console.log('countryCodeChange: ' + JSON.stringify(code));
                }
                try {
                    console.info("[lbs_js] SUB_HSS_LocationSystem_CountryCodeErr_0200");
                    geolocationm.on('countryCodeChange', 1,callback);
                    console.info('[lbs_js] countryCodeOn2' +JSON.stringify(callback));
                } catch (error) {
                    console.info("[lbs_js] countryCodeOn2 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
                await sleep(1000);
                done();
            })
        
            it('SUB_HSS_LocationSystem_CountryCodeErr_0301', 0, async function (done) {
                var callback = (code) => {
                    console.log('countryCodeChange: ' + JSON.stringify(code));
                }
                try {
                    console.info("[lbs_js] SUB_HSS_LocationSystem_CountryCodeErr_0300");
                    geolocationm.off('countryCodeChange',1,"test", callback);
                    console.info('[lbs_js] countryCodeOff3' +JSON.stringify(callback));
                } catch (error) {
                    console.info("[lbs_js] countryCodeOff3 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
                await sleep(1500);
                done();
            })
    
    
            it('SUB_HSS_LocationSystem_BatchingErr_0801', 0, function () {
                try {
                    geolocationm.on('cachedGnssLocationsChange',1);
                } catch (error) {
                    console.info("[lbs_js] cacheOn8 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
            })
        
            it('SUB_HSS_LocationSystem_BatchingErr_0901', 0, function () {
                try {
                    geolocationm.off('cachedGnssLocationsChange',1);
                } catch (error) {
                    console.info("[lbs_js] cacheOff9 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("801");
                }
            })
    
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0800
         * @tc.name cachedGnssLocationsChange_on_off
         * @tc.desc Subscribe to cache GNSS locations update messages.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0800', 0, async function (done) {
            var cachedLocationsCb = (locations) => {
                console.log('[lbs_js] cachedGnssLocationsReporting8:locations:' + JSON.stringify(locations));
                expect(true).assertEqual(locations !=null);
            }
            var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
            try {
                geolocationm.on(1,'cachedGnssLocationsChange', CachedGnssLoactionsRequest,cachedLocationsCb);
                console.info('[lbs_js] cacheOn8' +JSON.stringify(cachedLocationsCb));
            } catch (error) {
                console.info("[lbs_js] cacheOn8 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0900
         * @tc.name cachedGnssLocationsChange_on_off
         * @tc.desc Unsubscribe to cache GNSS locations update messages.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0900', 0, async function (done) {
            var cachedLocationsCb = (locations) => {
                console.log('[lbs_js] cachedGnssLocationsReporting9:locations:' + JSON.stringify(locations));
                expect(true).assertEqual(locations !=null);
            }
            try {
                geolocationm.off(1,'cachedGnssLocationsChange',"test",cachedLocationsCb);
                console.info('[lbs_js] cacheOff9' +JSON.stringify(cachedLocationsCb));
            } catch (error) {
                console.info("[lbs_js] cacheOff9 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GnssErr_0100
         * @tc.name satelliteStatusChange_on_off
         * @tc.desc Subscribe satellite status changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GnssErr_0100', 0, async function (done) {
            var gnssStatusCb = (satelliteStatusInfo) => {
                console.info('[lbs_js] gnssStatusChange1: ' + satelliteStatusInfo);
                expect(true).assertEqual(satelliteStatusInfo != null);
            }
            try {
                geolocationm.on(1,'satelliteStatusChange',gnssStatusCb);
                console.info('[lbs_js] satelliteOn1' +JSON.stringify(gnssStatusCb));
            } catch (error) {
                console.info("[lbs_js] satelliteOn1 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GnssErr_0400
         * @tc.name satelliteStatusChange_on_off
         * @tc.desc Unsubscribe satellite status changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GnssErr_0400', 0, async function (done) {
            var gnssStatusCb = (satelliteStatusInfo) => {
                console.info('[lbs_js] gnssStatusChange4: ' + satelliteStatusInfo);
                expect(true).assertEqual(satelliteStatusInfo != null);
            }
            try {
                geolocationm.off(1,'satelliteStatusChange', "test",gnssStatusCb);
                console.info('[lbs_js] satelliteOff4' +JSON.stringify(gnssStatusCb));
            } catch (error) {
                console.info("[lbs_js] satelliteOff4 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GnssErr_0200
         * @tc.name locationChange_on_off
         * @tc.desc Subscribe location changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GnssErr_0200', 0, async function (done) {
            let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
                "distanceInterval": 0, "maxAccuracy": 0};
            var locationChange = (location) => {
                console.log('[lbs_js] gnsslocationChanger2: data: ' + JSON.stringify(location));
                expect(true).assertEqual(locationChange !=null);
            };
            try {
                geolocationm.on(1,'locationChange', requestInfo,locationChange);
                console.info('[lbs_js] locationChangeOn2' +JSON.stringify(locationChange));
            } catch (error) {
                console.info("[lbs_js] locationChangeOn2 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GnssErr_0500
         * @tc.name locationChange_on_off
         * @tc.desc Unsubscribe location changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GnssErr_0500', 0, async function (done) {
            var locationChange = (location) => {
                console.log('[lbs_js] gnsslocationChanger5: data: ' + JSON.stringify(location));
                expect(true).assertEqual(locationChange !=null);
            };
            try {
                geolocationm.off(1,'locationChange',"test",locationChange);
                console.info('[lbs_js] locationChangeOff5' +JSON.stringify(locationChange));
            } catch (error) {
                console.info("[lbs_js] locationChangeOff5 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GnssErr_0300
         * @tc.name nmeaMessage_on_off
         * @tc.desc Subscribe nmea message changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GnssErr_0300', 0, async function (done) {
            var nmeaCb = (str) => {
                console.log('[lbs_js] nmeaMessage: ' + str);
            }
            try {
                geolocationm.on(1,'nmeaMessage',nmeaCb);
                console.info('[lbs_js] nmeaMessageOn2' +JSON.stringify(nmeaCb));
            } catch (error) {
                console.info("[lbs_js] nmeaMessageOn2 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GnssErr_0600
         * @tc.name nmeaMessage_on_off
         * @tc.desc Unsubscribe nmea message changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GnssErr_0600', 0, async function (done) {
            var nmeaCb = (str) => {
                console.log('[lbs_js] nmeaMessage: ' + str);
            }
            try {
                geolocationm.off(1,'nmeaMessage',nmeaCb);
                console.info('[lbs_js] nmeaMessageOff6' +JSON.stringify(nmeaCb));
            } catch (error) {
                console.info("[lbs_js] nmeaMessageOff6 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GeoFenceErr_0100
         * @tc.name gnssFenceStatusChange_on_off
         * @tc.desc Add a geofence and subscribe geo fence status changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GeoFenceErr_0100', 0, async function (done) {
            let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
            let geofenceRequest = {"priority":0x200, "scenario":0x301, "geofence": geofence};
            let want = (wantAgent) => {
                console.log('[lbs_js] wantAgent: ' + JSON.stringify(wantAgent));
            };
            try {
                geolocationm.on(1,'gnssFenceStatusChange', geofenceRequest,
                    (want) => {
                        if(err){
                            console.info('[lbs_js] FenceStatusOn1 callback err:' + JSON.stringify(err));
                            expect(err.code).assertEqual("401");
                            return;
                        }
                        console.info("[lbs_js] FenceStatusOn1 callback result:" + JSON.stringify(want));
                        expect(true).assertEqual(want !=null);
                        done();
                    });
            } catch (error) {
                console.info("[lbs_js] FenceStatusOn1 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_GeoFenceErr_0200
         * @tc.name gnssFenceStatusChange_on_off
         * @tc.desc Remove a geofence and unsubscribe geo fence status changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_GeoFenceErr_0200', 0, async function (done) {
            let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
            let geofenceRequest = {"priority":0x200, "scenario":0x301, "geofence": geofence};
            let want = (wantAgent) => {
                console.log('[lbs_js] wantAgent: ' + JSON.stringify(wantAgent));
            };
            try {
                geolocationm.off(1,"test",'gnssFenceStatusChange',geofenceRequest,
                    (want) => {
                        if(err){
                            console.info('[lbs_js] FenceStatusOff2 callback err:' + JSON.stringify(err));
                            expect(err.code).assertEqual("401");
                            return;
                        }
                        console.info("[lbs_js] FenceStatusOff2 callback result:" + JSON.stringify(want));
                        expect(true).assertEqual(want !=null);
                    });
            } catch (error) {
                console.info("[lbs_js] FenceStatusOff2 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_LocSwitchErr_0100
         * @tc.name locationEnabledChange_on_off
         * @tc.desc Subscribe location switch changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_LocSwitchErr_0100', 0, async function (done) {
            var locationServiceState = (state) => {
                console.log('[lbs_js] locationServiceState: state: ' + JSON.stringify(state));
            }
            try {
                geolocationm.on(1,'locationEnabledChange', locationServiceState);
                console.info('[lbs_js] nEnabledChangeOn1' +JSON.stringify(locationServiceState));
            } catch (error) {
                console.info("[lbs_js] nEnabledChangeOn1 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_LocSwitchErr_0100
         * @tc.name locationEnabledChange_on_off
         * @tc.desc Unsubscribe location switch changed.
         * @tc.type Function
         * @tc.level since 9
         */
        it('SUB_HSS_LocationSystem_LocSwitchErr_0200', 0, async function (done) {
            var locationServiceState = (state) => {
                console.log('[lbs_js] locationServiceState: state: ' + JSON.stringify(state));
            }
            try {
                geolocationm.off(1,'locationEnabledChange',locationServiceState);
                console.info('[lbs_js] EnabledChangeOff2' +JSON.stringify(locationServiceState));
            } catch (error) {
                console.info("[lbs_js] EnabledChangeOff2 try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
    })    
}
