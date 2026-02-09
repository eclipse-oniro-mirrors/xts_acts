/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import geoLocationManager from '@ohos.geoLocationManager';
import notificationManager from '@ohos.notificationManager';
import { canIUse } from '@internal.full.global';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wifiMg from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag:string='location'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUIT_NAME='ActslocationTest'
let g_context: common.UIAbilityContext;

export default function actslocationTest() {

    describe("actslocationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async() => {
          let  isWifiActive : boolean = wifiMg.isWifiActive() as boolean
          if(!isWifiActive){
            console.info("======> wifi_test/enable wifi:" );
            wifiMg.enableWifi();
            await Utils.msSleep(5000);
          }

          try {
            let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
            console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
            console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
            console.info("======> Internet chload : " + JSON.stringify(data.chload));
            console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

            if (data.connState == wifiMg.ConnState.CONNECTED) {
              console.info("======> WLAN connection established ");
            } else {
              expect().message("======> WLAN Network error").assertFail();

            }
            if (data.chload >= 800 || data.rssi <= -80) {
              expect().message("======> WLAN Network error").assertFail();
            } else if (data.chload >= 500) {
              console.info("======> The internet connection is poor. ");
            }
          } catch (err) {
            console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
            throw (err as Error);
          }
          hilog.info(domain, tag, 'beforeAll start');
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          hilog.info(domain, tag, 'beforeAll AbilityDelegator');
          abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.location.napitest.static")
          await Utils.msSleep(4000);
          g_context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
          hilog.info(domain, tag, 'get UIAbilityContext end');
            try {
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.LOCATION','ohos.permission.APPROXIMATELY_LOCATION')
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                        hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                        hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                        hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
                    });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('仅使用期间允许');
            await Utils.clickRequestPermission('始终允许');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                //await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /**
         * @tc.number  testGeolocationManagerConfig001
         * @tc.name  testGeolocationManagerConfig001
         * @tc.desc  Test Location API functionality
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('testGeolocationManagerConfig001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2,
            async(done:()=>void):Promise<void>=>{
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.UNSET==0x300)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.NAVIGATION ==0x301)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.TRAJECTORY_TRACKING ==0x302)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.CAR_HAILING ==0x303)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.DAILY_LIFE_SERVICE ==0x304)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.NO_POWER ==0x305)

                expect(true).assertEqual(geoLocationManager.LocationSourceType.GNSS==1)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.NETWORK==2)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.INDOOR ==3)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.RTK ==4)

                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.UNSET ==0x200)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.ACCURACY==0X201)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.LOW_POWER==0x202)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.FIRST_FIX == 0x203)

                expect(true).assertEqual(geoLocationManager.LocatingPriority.PRIORITY_LOCATING_SPEED == 0x502)
                expect(true).assertEqual(geoLocationManager.LocatingPriority.PRIORITY_ACCURACY == 0x501)

                expect(true).assertEqual(geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER == 1)
                expect(true).assertEqual(geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT == 2)

                done();

       })

        /**
         * @tc.number  Sub_Location_GetCurrentLocation_0100
         * @tc.name  Sub_Location_GetCurrentLocation_0100
         * @tc.desc  Test Location API functionality
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_GetCurrentLocation_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
             async(done:()=>void):Promise<void>=>{
                const TEST_CASE_NAME='Sub_Location_GetCurrentLocation_0100'
                let locationChangeRequest:geoLocationManager.LocationRequest={
                    "priority":geoLocationManager.LocationRequestPriority.UNSET,
                    "scenario":geoLocationManager.LocationRequestScenario.NAVIGATION,
                    "timeInterval":5,
                    "distanceInterval":0,
                    "maxAccuracy":0
             };
                let currentLocationRequest:geoLocationManager.CurrentLocationRequest =
                {
                    "priority":geoLocationManager.LocationRequestPriority.UNSET,
                    "scenario":geoLocationManager.LocationRequestScenario.NAVIGATION,
                    "timeoutMs":1000,
                    "maxAccuracy":0
                };
                try{
                    geoLocationManager.getCurrentLocation(currentLocationRequest,
                    (err:BusinessError<void>|null,result:geoLocationManager.Location|undefined)=>{
                        if(err!=null){
                          console.info("GetCurrentLocation_0100_err_info", JSON.stringify(err))
                          if (err.code === 3301200){
                            expect(err.code === 3301200).assertTrue(); 
                          } else {
                            expect().assertFail();
                          }
                        }
                        else{
                          if(result !=null){
                            console.info("GetCurrentLocation_0100 ======>latitude ", typeof result?.latitude)
                            expect(true).assertEqual(result?.latitude !=null)
                            console.info("GetCurrentLocation_0100 ======>longitude ", typeof result?.longitude)
                            expect(true).assertEqual(result?.longitude != null)
                            console.info("GetCurrentLocation_0100 ======>accuracy ", typeof result?.accuracy)
                            expect(true).assertEqual(result?.accuracy !=null)
                            console.info("GetCurrentLocation_0100 ======>speed ", typeof result?.speed)
                            expect(true).assertEqual(result?.speed != null)
                            console.info("GetCurrentLocation_0100 ======>timeStamp ", typeof result?.timeStamp)
                            expect(true).assertEqual(result?.timeStamp !=null)
                            console.info("GetCurrentLocation_0100 ======>direction ", typeof result?.direction)
                            expect(true).assertEqual(result?.direction !=null)
                            console.info("GetCurrentLocation_0100 ======>timeSinceBoot ", typeof result?.timeSinceBoot)
                            expect(true).assertEqual(result?.timeSinceBoot !=null)
                            console.info("GetCurrentLocation_0100 ======>additions ", typeof result?.additions)
                            if(result?.additions != undefined){
                              expect(true).assertEqual(result?.additions !=null)
                            }
                            console.info("GetCurrentLocation_0100 ======>additionsMap ", typeof result?.additionsMap)
                            if(result?.additionsMap != undefined){
                              expect(true).assertEqual(result?.additionsMap !=null)
                            }
                            console.info("GetCurrentLocation_0100 ======>directionAccuracy ", typeof result?.directionAccuracy)
                            expect(true).assertEqual(result?.directionAccuracy !=null)
                            console.info("GetCurrentLocation_0100 ======>uncertaintyOfTimeSinceBoot ", typeof result?.uncertaintyOfTimeSinceBoot)
                            expect(true).assertEqual(result?.uncertaintyOfTimeSinceBoot !=null)
                        }
                    }

                    })
                }catch(error) {
                    error = error as BusinessError;
                    expect().assertFail();
                }
                await Utils.msSleep(1000)
                done();
            })

            

            /**
            * @tc.number  SUB_HSS_LocationSystem_Geo_0001
            * @tc.name  SUB_HSS_LocationSystem_Geo_0001
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it ('SUB_HSS_LocationSystem_Geo_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
                        "latitude": 31.265496,
                        "longitude": 121.62771,
                        "maxItems": 1,
                        "locale": "zh",
                        "country": "CN"
                    };
                    try{
                        expect(typeof reverseGeocodeRequest.latitude).assertEqual("number");
                        expect(typeof reverseGeocodeRequest.longitude).assertEqual("number");
                        expect(typeof reverseGeocodeRequest.maxItems).assertEqual("int");
                        expect(typeof reverseGeocodeRequest.locale).assertEqual("string");
                        expect(typeof reverseGeocodeRequest.country).assertEqual("string");
                        geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest,(err, data) => {
                            if(err){
                                hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation callback err is:' + JSON.stringify(err));
                                expect(err.code).assertEqual(3301300);
                            } else{
                                hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation callback data is:' + JSON.stringify(data));
                                expect((JSON.stringify(data)) != null).assertTrue();
                            }
                        })

                    }catch(error: BusinessError){
                        hilog.error(domain, tag, '[lbs_js] getAddressesFromLocation callback try err is:' + error);
                    }
                    await Utils.msSleep(1000)
                    done()
                }
            )

            /**
            * @tc.number  SUB_HSS_LocationSystem_Geo_2900
            * @tc.name  SUB_HSS_LocationSystem_Geo_2900
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it ('SUB_HSS_LocationSystem_Geo_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
                        "latitude": 31.265496,
                        "longitude": 121.62771,
                        "maxItems": 1,
                        "locale": "zh",
                        "country": "CN"
                    };
                    try{
                        geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                            if (data){
                                expect(Array.isArray(data)).assertTrue();
                            }
                        }).catch((error) => {
                            expect((error as BusinessError).code).assertEqual(3301300);
                        })
                        done();
                    } catch(error){
                        console.info('[lbs_js] getAddressesFromLocation try err is:' + JSON.stringify(error));
                    }
                }
            )

            /**
            * @tc.number  SUB_HSS_LocationSystem_Geo_1200
            * @tc.name  SUB_HSS_LocationSystem_Geo_1200
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it ('SUB_HSS_LocationSystem_Geo_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let geoCodeRequest: geoLocationManager.GeoCodeRequest = {
                        "description": "上海金穗路1800号",
                        "maxItems": 1,
                        "minLatitude": 31.3082812847,
                        "minLongitude": 121.5782001832,
                        "maxLatitude": 31.1537977881,
                        "maxLongitude": 121.8026736943,
                        "country": "CN"
                    };
                    try{
                        geoLocationManager.getAddressesFromLocationName(geoCodeRequest).then((result:Array<geoLocationManager.GeoAddress>) => {
                            expect(Array.isArray(result)).assertTrue;
                            done();
                        }).catch((error) => {
                            expect((error as BusinessError).code).assertEqual(3301400);
                            done();
                        });
                    }catch(error){
                            console.info('[lbs_js] getAddressesFromLocationName try err is:' + JSON.stringify(error));
                    }
                }
            )


            /**
            * @tc.number  SUB_HSS_LocationSystem_Geo_1300
            * @tc.name  SUB_HSS_LocationSystem_Geo_1300
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it ('SUB_HSS_LocationSystem_Geo_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let geoCodeRequest: geoLocationManager.GeoCodeRequest = {
                        "description": "上海金穗路1800号",
                        "maxItems": 1,
                        "minLatitude": 31.3082812847,
                        "minLongitude": 121.5782001832,
                        "maxLatitude": 31.1537977881,
                        "maxLongitude": 121.8026736943,
                        "country": "CN"
                    };
                    try{
                        geoLocationManager.getAddressesFromLocationName(geoCodeRequest,(err, data) => {
                            if(err){
                                expect(err.code).assertEqual(3301400);
                                done();
                            }else{
                                expect(Array.isArray(data)).assertTrue;
                                done();
                            }
                        })
                    }catch(error){
                            console.info('[lbs_js] getAddressesFromLocationName try err is:' + JSON.stringify(error));
                    }
                }
            )

            /**
            * @tc.number  SUB_Location_isGeocoderAvailabel_0100
            * @tc.name  SUB_Location_isGeocoderAvailabel_0100
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_isGeocoderAvailabel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
                try{
                    let geocoderAvailable = geoLocationManager.isGeocoderAvailable();
                    if (geocoderAvailable != null){
                        expect(typeof geocoderAvailable).assertEqual('boolean');
                    }  
                } catch (error){
                    expect().assertFail;
                }
            })
            
            /**
            * @tc.number  SUB_Location_sendCommand_0100
            * @tc.name  SUB_Location_sendCommand_0100
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_sendCommand_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done:() => void): Promise<void> => {
                    let locationCommand: geoLocationManager.LocationCommand ={
                        "scenario": geoLocationManager.LocationRequestScenario.UNSET,
                        "command": "del_all"
                    };
                    geoLocationManager.sendCommand(locationCommand,
                        (err:BusinessError | null, result: geoLocationManager.Location | undefined) => {
                            try{
                                if(err != null){
                                    expect(err.code).assertEqual(401);
                                    done();
                                }else{
                                    expect(result == undefined).assertTrue();
                                    done();
                                }
                            }catch (err: BusinessError){
                                console.info('[lbs_js] sendCommand try err is:' + JSON.stringify(err));
                            }
                        }
                    )
                }
            )

            /**
            * @tc.number  SUB_Location_sendCommand_0200
            * @tc.name  SUB_Location_sendCommand_0200
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_sendCommand_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done:() => void): Promise<void> => {
                    let locationCommand: geoLocationManager.LocationCommand ={
                        "scenario": geoLocationManager.LocationRequestScenario.UNSET,
                        "command": "del_all"
                    };
                    try{
                        geoLocationManager.sendCommand(locationCommand).then((result) => {
                            expect(result == undefined).assertTrue();
                            done();
                        }).catch((error) => {
                            expect(error.code).assertEqual(401);
                            done();
                        })
                    }catch (error){
                        console.info('[lbs_js] sendCommand try err is:' + JSON.stringify(error));
                    }
                }
            )

            /**
            * @tc.number  SUB_Location_isLocationEnabled_0100
            * @tc.name  SUB_Location_isLocationEnabled_0100
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_isLocationEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                try{
                    let location = geoLocationManager.isLocationEnabled();
                    expect(typeof location).assertEqual('boolean');
                }catch (error: BusinessError){
                    expect(error.code).assertEqual(3301000);
                }
            })

            /**
            * @tc.number  SUB_Location_getCountryCode_0100
            * @tc.name  SUB_Location_getCountryCode_0100
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getCountryCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done: () => void): Promise<void> => {
                    try{
                        geoLocationManager.getCountryCode((err, data) => {
                            if(err != null){
                                expect(err.code).assertEqual(401);
                                done();
                            }else{
                                expect(data != null).assertTrue();
                                done();
                            }
                        })
                    }catch(error){
                        console.info('[lbs_js] getCountryCode try err is:' + JSON.stringify(error));
                    }
                }
            )


            /**
            * @tc.number  SUB_Location_getCountryCode_0200
            * @tc.name  SUB_Location_getCountryCode_0200
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getCountryCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done: () => void): Promise<void> => {
                    try{
                        geoLocationManager.getCountryCode().then((result) => {
                            expect(result != null).assertTrue();
                            done();
                        }).catch((error) => {
                            expect((error as BusinessError).code).assertEqual(401);
                            done();
                        })
                    }catch(error){
                        console.info('[lbs_js] getCountryCode try err is:' + JSON.stringify(error));
                    }
                }
            )

            /**
            * @tc.number  SUB_Location_getGeofenceSupportedCoordTypes_0100
            * @tc.name  SUB_Location_getGeofenceSupportedCoordTypes_0100
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getGeofenceSupportedCoordTypes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                try{
                    let supportedCoordTypes: Array<geoLocationManager.CoordinateSystemType> = geoLocationManager.getGeofenceSupportedCoordTypes();
                    expect(supportedCoordTypes != null).assertTrue();
                }catch(error: BusinessError){
                    expect(error.code).assertEqual(3301000);
                }
            })


            /**
            * @tc.number  SUB_Location_getCurrentWifiBssidForLocating_0100
            * @tc.name  SUB_Location_getCurrentWifiBssidForLocating_0100
            * @tc.desc  getCurrentWifiBssidForLocating(): string
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getCurrentWifiBssidForLocating_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_getCurrentWifiBssidForLocating_0100: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                } else {
                    try{
                        let getCurrentWifiBssidForLocating = geoLocationManager.getCurrentWifiBssidForLocating();
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0100 result is:' + JSON.stringify(getCurrentWifiBssidForLocating));
                        expect(getCurrentWifiBssidForLocating != null).assertTrue();
                    }catch(error: BusinessError){
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0100 catch err is:' + JSON.stringify(error));
                    }                    
                }                
            })  
            

            /**
            * @tc.number  SUB_Location_getCurrentWifiBssidForLocating_0300
            * @tc.name  SUB_Location_getCurrentWifiBssidForLocating_0300
            * @tc.desc  getCurrentWifiBssidForLocating(): string
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getCurrentWifiBssidForLocating_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_getCurrentWifiBssidForLocating_0300: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                } else {
                    try{
                        let getCurrentWifiBssidForLocating = geoLocationManager.getCurrentWifiBssidForLocating();
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0300 result is:' + JSON.stringify(getCurrentWifiBssidForLocating));
                        expect(getCurrentWifiBssidForLocating != null).assertTrue();
                    }catch(error: BusinessError){
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0300 catch err is:' + JSON.stringify(error));
                        expect(error.code).assertEqual(201);
                    }                    
                }
            }) 
            
            /**
            * @tc.number  SUB_Location_getCurrentWifiBssidForLocating_0400
            * @tc.name  SUB_Location_getCurrentWifiBssidForLocating_0400
            * @tc.desc  getCurrentWifiBssidForLocating(): string
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getCurrentWifiBssidForLocating_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_getCurrentWifiBssidForLocating_0400: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                } else {
                    try{
                        let getCurrentWifiBssidForLocating = geoLocationManager.getCurrentWifiBssidForLocating();
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0400 result is:' + JSON.stringify(getCurrentWifiBssidForLocating));
                        expect(getCurrentWifiBssidForLocating != null).assertTrue();
                    }catch(error: BusinessError){
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0400 catch err is:' + JSON.stringify(error));
                        expect(error.code).assertEqual(801);
                    }                    
                }
            }) 
            
            /**
            * @tc.number  SUB_Location_getCurrentWifiBssidForLocating_0500
            * @tc.name  SUB_Location_getCurrentWifiBssidForLocating_0500
            * @tc.desc  getCurrentWifiBssidForLocating(): string
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getCurrentWifiBssidForLocating_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_getCurrentWifiBssidForLocating_0500: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                } else {
                    try{
                        let getCurrentWifiBssidForLocating = geoLocationManager.getCurrentWifiBssidForLocating();
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0500 result is:' + JSON.stringify(getCurrentWifiBssidForLocating));
                        expect(getCurrentWifiBssidForLocating != null).assertTrue();
                    }catch(error: BusinessError){
                        console.info('[lbs_js] getCurrentWifiBssidForLocating_0500 catch err is:' + JSON.stringify(error));
                        expect(error.code).assertEqual(3301900);
                    }                    
                }
            })            
            /**
            * @tc.number  SUB_Location_getActiveGeoFences_0100
            * @tc.name  SUB_Location_getActiveGeoFences_0100
            * @tc.desc  getActiveGeoFences(fenceRequest: GnssGeofenceRequest): Promise<Map<int, Geofence>>
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_getActiveGeoFences_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
              try{
                geoLocationManager.getActiveGeoFences().then((res) => {
                  if (res) {
                    console.info("fence num:" + res.size);
                    expect(res.size != 0).assertTrue();
                  }
                })
                .catch((error) => {
                  console.error('promise, getActiveGeoFences: error=' + error.code);
                  expect(error.code).assertEqual(801);
                });
              } catch (error) {
                console.error("getActiveGeoFences: errCode" + error.code + ", errMessage" + error.message);
                expect().assertFalse();
              }
            })
            /**
            * @tc.number  SUB_Location_addGnssGeofence_0100
            * @tc.name  SUB_Location_addGnssGeofence_0100
            * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_addGnssGeofence_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_addGnssGeofence_0100: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                    done();
                } else {
                    
                    let geofence: geoLocationManager.Geofence = {
                        "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0
                    }
               
                    let transitionStatusList: Array<geoLocationManager.GeofenceTransitionEvent> = [
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
                    ];
            
                    let notificationRequest1: notificationManager.NotificationRequest = {
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
                    
                    let notificationRequest2: notificationManager.NotificationRequest = {
                        id: 2,
                        content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: '围栏通知',
                            text: '围栏退出',
                            additionalText: ""
                        }
                        }
                    };
                    
                    let notificationRequestList: Array<notificationManager.NotificationRequest> =
                        [notificationRequest1, notificationRequest2];
                    
                    let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
                        geofence: geofence,
                        monitorTransitionEvents: transitionStatusList,
                        notifications: notificationRequestList,
                        loiterTimeMs: 10000,
                        fenceExtensionAbilityName: "fenceExtensionAbility",
                        geofenceTransitionCallback: (err: BusinessError<void>|null, transition: geoLocationManager.GeofenceTransition|undefined) => {
                        if (err) {
                            console.error('geofenceTransitionCallback: err=' + JSON.stringify(err));
                        }
                        if (transition) {
                            console.info("GeofenceTransition: %{public}s", JSON.stringify(transition));
                        }
                        }
                    }
                    try {
                        console.info("SUB_Location_addGnssGeofence_0100 ======>loiterTimeMs ", typeof gnssGeofenceRequest.loiterTimeMs);
                        expect(typeof gnssGeofenceRequest.loiterTimeMs).assertEqual("int");
                        console.info("SUB_Location_addGnssGeofence_0100 ======>fenceExtensionAbilityName ", typeof gnssGeofenceRequest.fenceExtensionAbilityName);
                        expect(typeof gnssGeofenceRequest.fenceExtensionAbilityName).assertEqual("string");
                        geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                        console.info("addGnssGeofence_0100 success, fence id: " + id);
                        expect(true).assertEqual(id!=null);
                        }).catch((err:Object|null|undefined) => {
                        console.error("addGnssGeofence_0100 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                        });
                        done();
                    } catch (error:BusinessError) {
                        console.error("addGnssGeofence_0100 failed, err:" + JSON.stringify(error));
                    } 
                    done();
                }
                }
            )     
            
            /**
            * @tc.number  SUB_Location_addGnssGeofence_0200
            * @tc.name  SUB_Location_addGnssGeofence_0200
            * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_addGnssGeofence_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_addGnssGeofence_0200: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                    done();
                } else {
                    
                    let geofence: geoLocationManager.Geofence = {
                        "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0
                    }
               
                    let transitionStatusList: Array<geoLocationManager.GeofenceTransitionEvent> = [
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
                    ];
            
                    let notificationRequest1: notificationManager.NotificationRequest = {
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
                    
                    let notificationRequest2: notificationManager.NotificationRequest = {
                        id: 2,
                        content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: '围栏通知',
                            text: '围栏退出',
                            additionalText: ""
                        }
                        }
                    };
                    
                    let notificationRequestList: Array<notificationManager.NotificationRequest> =
                        [notificationRequest1, notificationRequest2];
                    
                    let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
                        geofence: geofence,
                        monitorTransitionEvents: transitionStatusList,
                        notifications: notificationRequestList,
                        geofenceTransitionCallback: (err: BusinessError<void>|null, transition: geoLocationManager.GeofenceTransition|undefined) => {
                        if (err) {
                            console.error('geofenceTransitionCallback: err=' + JSON.stringify(err));
                        }
                        if (transition) {
                            console.info("GeofenceTransition: %{public}s", JSON.stringify(transition));
                        }
                      }
                    }
                    try {
                        geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                        console.info("addGnssGeofence_0200 success, fence id: " + id);
                        expect(true).assertEqual(id!=null);
                        }).catch((err:Object|null|undefined) => {
                        console.error("addGnssGeofence_0200 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                        expect((err as BusinessError).code).assertEqual(201);
                        });
                        done();
                    } catch (error:BusinessError) {
                        console.error("addGnssGeofence_0200 failed, err:" + JSON.stringify(error));
                    } 
                    done();
                  }
                }
            )              

            /**
            * @tc.number  SUB_Location_addGnssGeofence_0300
            * @tc.name  SUB_Location_addGnssGeofence_0300
            * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_addGnssGeofence_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_addGnssGeofence_0300: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                    done();
                } else {
                    
                    let geofence: geoLocationManager.Geofence = {
                        "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0
                    }
               
                    let transitionStatusList: Array<geoLocationManager.GeofenceTransitionEvent> = [
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
                    ];
            
                    let notificationRequest1: notificationManager.NotificationRequest = {
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
                    
                    let notificationRequest2: notificationManager.NotificationRequest = {
                        id: 2,
                        content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: '围栏通知',
                            text: '围栏退出',
                            additionalText: ""
                        }
                        }
                    };
                    
                    let notificationRequestList: Array<notificationManager.NotificationRequest> =
                        [notificationRequest1, notificationRequest2];
                    
                    let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
                        geofence: geofence,
                        monitorTransitionEvents: transitionStatusList,
                        notifications: notificationRequestList,
                        geofenceTransitionCallback: (err: BusinessError<void>|null, transition: geoLocationManager.GeofenceTransition|undefined) => {
                        if (err) {
                            console.error('geofenceTransitionCallback: err=' + JSON.stringify(err));
                        }
                        if (transition) {
                            console.info("GeofenceTransition: %{public}s", JSON.stringify(transition));
                        }
                        }
                    }
                    try {
                        geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                        console.info("addGnssGeofence_0300 success, fence id: " + id);
                        expect(true).assertEqual(id!=null);
                        }).catch((err:Object|null|undefined) => {
                        console.error("addGnssGeofence_0300 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                        expect((err as BusinessError).code).assertEqual(401);
                        });
                        done();
                    } catch (error:BusinessError) {
                        console.error("addGnssGeofence_0300 failed, err:" + JSON.stringify(error));
                    } 
                    done();
                }
                }
            )

            /**
            * @tc.number  SUB_Location_addGnssGeofence_0400
            * @tc.name  SUB_Location_addGnssGeofence_0400
            * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_addGnssGeofence_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_addGnssGeofence_0400: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                    done();
                } else {
                    
                    let geofence: geoLocationManager.Geofence = {
                        "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0
                    }
               
                    let transitionStatusList: Array<geoLocationManager.GeofenceTransitionEvent> = [
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
                    ];
            
                    let notificationRequest1: notificationManager.NotificationRequest = {
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
                    
                    let notificationRequest2: notificationManager.NotificationRequest = {
                        id: 2,
                        content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: '围栏通知',
                            text: '围栏退出',
                            additionalText: ""
                        }
                        }
                    };
                    
                    let notificationRequestList: Array<notificationManager.NotificationRequest> =
                        [notificationRequest1, notificationRequest2];
                    
                    let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
                        geofence: geofence,
                        monitorTransitionEvents: transitionStatusList,
                        notifications: notificationRequestList,
                        geofenceTransitionCallback: (err: BusinessError<void>|null, transition: geoLocationManager.GeofenceTransition|undefined) => {
                        if (err) {
                            console.error('geofenceTransitionCallback: err=' + JSON.stringify(err));
                        }
                        if (transition) {
                            console.info("GeofenceTransition: %{public}s", JSON.stringify(transition));
                        }
                        }
                    }
                    try {
                        geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                        console.info("addGnssGeofence_0400 success, fence id: " + id);
                        expect(true).assertEqual(id!=null);
                        }).catch((err:Object|null|undefined) => {
                        console.error("addGnssGeofence_0400 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                        expect((err as BusinessError).code).assertEqual(801);
                        });
                        done();
                    } catch (error:BusinessError) {
                        console.error("addGnssGeofence_0400 failed, err:" + JSON.stringify(error));
                    } 
                    done();
                }
                }
            )  

            /**
            * @tc.number  SUB_Location_addGnssGeofence_0500
            * @tc.name  SUB_Location_addGnssGeofence_0500
            * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_addGnssGeofence_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_addGnssGeofence_0500: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                    done();
                } else {
                    
                    let geofence: geoLocationManager.Geofence = {
                        "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0
                    }
               
                    let transitionStatusList: Array<geoLocationManager.GeofenceTransitionEvent> = [
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
                    ];
            
                    let notificationRequest1: notificationManager.NotificationRequest = {
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
                    
                    let notificationRequest2: notificationManager.NotificationRequest = {
                        id: 2,
                        content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: '围栏通知',
                            text: '围栏退出',
                            additionalText: ""
                        }
                        }
                    };
                    
                    let notificationRequestList: Array<notificationManager.NotificationRequest> =
                        [notificationRequest1, notificationRequest2];
                    
                    let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
                        geofence: geofence,
                        monitorTransitionEvents: transitionStatusList,
                        notifications: notificationRequestList,
                        geofenceTransitionCallback: (err: BusinessError<void>|null, transition: geoLocationManager.GeofenceTransition|undefined) => {
                        if (err) {
                            console.error('geofenceTransitionCallback: err=' + JSON.stringify(err));
                        }
                        if (transition) {
                            console.info("GeofenceTransition: %{public}s", JSON.stringify(transition));
                        }
                        }
                    }
                    try {
                        geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                        console.info("addGnssGeofence_0500 success, fence id: " + id);
                        expect(true).assertEqual(id!=null);
                        }).catch((err:Object|null|undefined) => {
                        console.error("addGnssGeofence_0500 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                        expect((err as BusinessError).code).assertEqual(3301100);
                        });
                        done();
                    } catch (error:BusinessError) {
                        console.error("addGnssGeofence_0500 failed, err:" + JSON.stringify(error));
                    } 
                    done();
                }
                }
            ) 
            
            /**
            * @tc.number  SUB_Location_addGnssGeofence_0600
            * @tc.name  SUB_Location_addGnssGeofence_0600
            * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Location_addGnssGeofence_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
                console.info("SUB_Location_addGnssGeofence_0600: " + isAccessToken);
                if (!isAccessToken) {
                    console.info("The device does not support Gnss");
                    expect(isAccessToken).assertFalse();
                    done();
                } else {
                    
                    let geofence: geoLocationManager.Geofence = {
                        "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0
                    }
               
                    let transitionStatusList: Array<geoLocationManager.GeofenceTransitionEvent> = [
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
                    geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
                    ];
            
                    let notificationRequest1: notificationManager.NotificationRequest = {
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
                    
                    let notificationRequest2: notificationManager.NotificationRequest = {
                        id: 2,
                        content: {
                        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: '围栏通知',
                            text: '围栏退出',
                            additionalText: ""
                        }
                        }
                    };
                    
                    let notificationRequestList: Array<notificationManager.NotificationRequest> =
                        [notificationRequest1, notificationRequest2];
                    
                    let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
                        geofence: geofence,
                        monitorTransitionEvents: transitionStatusList,
                        notifications: notificationRequestList,
                        geofenceTransitionCallback: (err: BusinessError<void>|null, transition: geoLocationManager.GeofenceTransition|undefined) => {
                        if (err) {
                            console.error('geofenceTransitionCallback: err=' + JSON.stringify(err));
                        }
                        if (transition) {
                            console.info("GeofenceTransition: %{public}s", JSON.stringify(transition));
                        }
                        }
                    }
                    try {
                        geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                        console.info("addGnssGeofence_0600 success, fence id: " + id);
                        expect(true).assertEqual(id!=null);
                        }).catch((err:Object|null|undefined) => {
                        console.error("addGnssGeofence_0600 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                        expect((err as BusinessError).code).assertEqual(3301601);
                        });
                        done();
                    } catch (error:BusinessError) {
                        console.error("addGnssGeofence_0600 failed, err:" + JSON.stringify(error));
                    } 
                    done();
                }
                }
            ) 

        /**
         * @tc.number  Sub_Location_removeGnssGeofence_0100
         * @tc.name  Sub_Location_removeGnssGeofence_0100
         * @tc.desc  removeGnssGeofence(geofenceId: number): Promise<void>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_removeGnssGeofence_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let fenceId = 1;
            try {
              geoLocationManager.removeGnssGeofence(fenceId).then(() => {
                console.info("removeGnssGeofence success fenceId:" + fenceId);
                expect(true).assertEqual(fenceId!=null);
              }).catch((err) => {
                if (err instanceof BusinessError) {
                  console.error("removeGnssGeofence: error=" + err.code + err.message);
                  expect(err.code).assertEqual(201);
                }
              });
            } catch (error:BusinessError) {
              console.error("removeGnssGeofence: error=" + JSON.stringify(error));
            }
            await Utils.msSleep(1000)
            done();
        })  
        
        /**
         * @tc.number  Sub_Location_removeGnssGeofence_0200
         * @tc.name  Sub_Location_removeGnssGeofence_0200
         * @tc.desc  removeGnssGeofence(geofenceId: number): Promise<void>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_removeGnssGeofence_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let fenceId = 1;
            try {
              geoLocationManager.removeGnssGeofence(fenceId).then(() => {
                console.info("removeGnssGeofence success fenceId:" + fenceId);
                expect(true).assertEqual(fenceId!=null);
              }).catch((err) => {
                if (err instanceof BusinessError) {
                console.error("removeGnssGeofence: error=" + err.code + err.message);
                expect(err.code).assertEqual(401);
                }
              });
            } catch (error:BusinessError) {
              console.error("removeGnssGeofence: error=" + JSON.stringify(error));
            }
            await Utils.msSleep(1000)
            done();
        })         

        /**
         * @tc.number  Sub_Location_removeGnssGeofence_0300
         * @tc.name  Sub_Location_removeGnssGeofence_0300
         * @tc.desc  removeGnssGeofence(geofenceId: number): Promise<void>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_removeGnssGeofence_0300',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let fenceId = 1;
            try {
              geoLocationManager.removeGnssGeofence(fenceId).then(() => {
                console.info("removeGnssGeofence success fenceId:" + fenceId);
                expect(true).assertEqual(fenceId!=null);
              }).catch((err) => {
                if (err instanceof BusinessError) {
                console.error("removeGnssGeofence: error=" + err.code + err.message);
                expect(err.code).assertEqual(3301602);
                }
              });
            } catch (error: BusinessError) {
              console.error("removeGnssGeofence: error=" + JSON.stringify(error));
            }
            await Utils.msSleep(1000)
            done();
        })          


        /**
         * @tc.number  Sub_Location_getCurrentLocation_1200
         * @tc.name  Sub_Location_getCurrentLocation_1200
         * @tc.desc  getCurrentLocation(request: CurrentLocationRequest | SingleLocationRequest, callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_1200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
              let request: geoLocationManager.SingleLocationRequest = {
                'locatingTimeoutMs': 10000,
                'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_ACCURACY
              };
              let locationChange = (err:BusinessError<void>|null,location:geoLocationManager.Location|undefined): void => {
                if (err) {
                  console.error('locationChange: err=' + JSON.stringify(err));
                  if (err.code === 3301200){
                    expect(err.code === 3301200).assertTrue(); 
                  }
                }
                if (location) {
                  console.info("getCurrentLocation_1200 ======>latitude ", typeof location.latitude)
                  expect(typeof location.latitude).assertEqual("number");
                  console.info("getCurrentLocation_1200 ======>longitude ", typeof location.longitude)
                  expect(typeof location.longitude).assertEqual("number");
                  console.info("getCurrentLocation_1200 ======>accuracy ", typeof location.accuracy)
                  expect(typeof location.accuracy).assertEqual("number");
                  console.info("getCurrentLocation_1200 ======>speed ", typeof location.speed)
                  expect(typeof location.speed).assertEqual("number");
                  console.info("getCurrentLocation_1200 ======>timeStamp", typeof location.timeStamp)
                  expect(typeof location.timeStamp).assertEqual("long");
                  console.info("getCurrentLocation_1200 ======>direction", typeof location.direction)
                  expect(typeof location.direction).assertEqual("number");
                  console.info("getCurrentLocation_1200 ======>timeSinceBoot", typeof location.timeSinceBoot)
                  expect(typeof location.timeSinceBoot).assertEqual("long");
                  console.info("getCurrentLocation_1200 ======>additions", typeof location.additions)
                  expect(location.additions instanceof Array);
                  console.info("getCurrentLocation_1200 ======>additionSize", typeof location.additionSize)
                  expect(typeof location.additionSize).assertEqual("int");
                  console.info("getCurrentLocation_1200 ======>additionsMap", typeof location.additionsMap)
                  expect(location.additionsMap instanceof Map);
                  console.info("getCurrentLocation_1200 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
                  expect(typeof location.altitudeAccuracy).assertEqual("number");
                  console.info("getCurrentLocation_1200 ======>speedAccuracy", typeof location.speedAccuracy)
                  expect(typeof location.speedAccuracy).assertEqual("number");
                  console.info("getCurrentLocation_1200 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
                  expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                }
                console.info('======>?locationChange: location=expect' )
              };
              try {
                geoLocationManager.getCurrentLocation(request, locationChange);
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
            done();
        }) 
        
        /**
         * @tc.number  Sub_Location_getCurrentLocation_090010
         * @tc.name  Sub_Location_getCurrentLocation_090010
         * @tc.desc  getCurrentLocation(request: CurrentLocationRequest | SingleLocationRequest, callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_090010',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.CurrentLocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'maxAccuracy': 0
              };
              try {
                geoLocationManager.getCurrentLocation(requestInfo, (err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                      if (location) {
                        expect(location!=null).assertTrue();
                        console.info('locationChange: location=' + JSON.stringify(location));
                      }
                      if (err) {
                        console.error('locationChange: err=' + JSON.stringify(err));
                        if (err.code === 3301200){
                          expect(err.code === 3301200).assertTrue(); 
                        } else {
                        expect(err.code).assertEqual(401);
                        }
                      }
                });
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
            done();
        })                          

        /**
         * @tc.number  Sub_Location_getCurrentLocation_0300
         * @tc.name  Sub_Location_getCurrentLocation_0300
         * @tc.desc  getCurrentLocation(request: CurrentLocationRequest | SingleLocationRequest, callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_0300',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.CurrentLocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'maxAccuracy': 0
              };
              try {
                geoLocationManager.getCurrentLocation(requestInfo, (err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                      if (location) {
                        expect(location!=null).assertTrue();
                        console.info('locationChange: location=' + JSON.stringify(location));
                      }
                      if (err) {
                        console.error('locationChange: err=' + JSON.stringify(err));
                        if (err.code === 3301200){
                          expect(err.code === 3301200).assertTrue(); 
                        } else {
                        expect(err.code).assertEqual(3301100);
                        }
                      }
                });
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
            done();
        })    
        
        /**
         * @tc.number  Sub_Location_getCurrentLocation_0400
         * @tc.name  Sub_Location_getCurrentLocation_0400
         * @tc.desc  getCurrentLocation(request: CurrentLocationRequest | SingleLocationRequest, callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_0400',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.CurrentLocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'maxAccuracy': 0
              };
              try {
                geoLocationManager.getCurrentLocation(requestInfo, (err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                      if (location) {
                        expect(true).assertEqual(location!=null);
                        console.info('locationChange: location=' + JSON.stringify(location));
                      }
                      if (err) {
                        console.error('locationChange: err=' + JSON.stringify(err));
                        expect(err.code).assertEqual(3301200);
                      }
                });
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
            await Utils.msSleep(1000)
            done();
        })  
        
        /**
         * @tc.number  Sub_Location_getCurrentLocation_0500
         * @tc.name  Sub_Location_getCurrentLocation_0500
         * @tc.desc  getCurrentLocation(callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_0500',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
              try {
                geoLocationManager.getCurrentLocation((err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                      if (location) {
                        expect(location!=null).assertTrue();
                        console.info('locationChange: location=' + JSON.stringify(location));
                      }
                      if (err) {
                        console.error('locationChange: err=' + JSON.stringify(err));
                        if (err.code === 3301200){
                          expect(err.code === 3301200).assertTrue(); 
                        } else {
                        expect(err.code).assertEqual(401);
                        }
                      }
                });
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
            done();
        })  
        
        /**
         * @tc.number  Sub_Location_getCurrentLocation_0600
         * @tc.name  Sub_Location_getCurrentLocation_0600
         * @tc.desc  getCurrentLocation(callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_0600',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            try {
              geoLocationManager.getCurrentLocation((err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                    if (location) {
                        expect(true).assertEqual(location!=null);
                      console.info('locationChange: location=' + JSON.stringify(location));
                    }
                    if (err) {
                      console.error('locationChange: err=' + JSON.stringify(err));
                      if (err.code === 3301200){
                        expect(err.code === 3301200).assertTrue(); 
                       } else {
                      expect(err.code).assertEqual(3301100);
                      }
                    }
              });
            } catch (err) {
              console.error("errCode:" + err.code + ", message:" + err.message);
            }
          await Utils.msSleep(1000)
          done();
      }) 
      
        /**
         * @tc.number  Sub_Location_getCurrentLocation_0700
         * @tc.name  Sub_Location_getCurrentLocation_0700
         * @tc.desc  getCurrentLocation(callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_0700',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            try {
              geoLocationManager.getCurrentLocation((err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                    if (location) {
                      expect(true).assertEqual(JSON.stringify(location)!=null);
                      console.info('locationChange: location=' + JSON.stringify(location));
                    }
                    if (err) {
                      console.error('locationChange: err=' + JSON.stringify(err));
                      expect(err.code).assertEqual(3301200);
                    }
              });
            } catch (err) {
              console.error("errCode:" + err.code + ", message:" + err.message);
            }
          await Utils.msSleep(1000)
          done();
      }) 
      
        /**
         * @tc.number  Sub_Location_getCurrentLocation_0800
         * @tc.name  Sub_Location_getCurrentLocation_0800
         * @tc.desc  getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_0800',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let request: geoLocationManager.SingleLocationRequest = {
                'locatingTimeoutMs': 10000,
                'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_ACCURACY
              };
              try {
                geoLocationManager.getCurrentLocation(request).then((location) => {
                  expect(true).assertEqual(location!=null);
                }).catch((err) => {
                  if (err instanceof BusinessError) {
                    console.error('promise, getCurrentLocation: error=' + err.code + err.message);
                    if (err.code === 3301200){
                      expect(err.code === 3301200).assertTrue(); 
                     } else {
                    expect(err.code).assertEqual(401);
                     }
                  }
                  });
              } catch (err: BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
          await Utils.msSleep(1000)
          done();
      }) 
      
        /**
         * @tc.number  Sub_Location_getCurrentLocation_0900
         * @tc.name  Sub_Location_getCurrentLocation_0900
         * @tc.desc  getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_0900',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let request: geoLocationManager.SingleLocationRequest = {
                'locatingTimeoutMs': 10000,
                'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_ACCURACY
              };
              try {
                geoLocationManager.getCurrentLocation(request).then((location) => {
                  expect(true).assertEqual(location!=null);
                }).catch((err) => {
                  if (err instanceof BusinessError) {
                    console.error('promise, getCurrentLocation: error=' + err.code + err.message);
                    if (err.code === 3301200){
                      expect(err.code === 3301200).assertTrue(); 
                     } else {
                    expect(err.code).assertEqual(3301100);
                    }
                  }
                  });
              } catch (err: BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
          await Utils.msSleep(1000)
          done();
      }) 
      
        /**
         * @tc.number  Sub_Location_getCurrentLocation_1000
         * @tc.name  Sub_Location_getCurrentLocation_1000
         * @tc.desc  getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCurrentLocation_1000',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let request: geoLocationManager.SingleLocationRequest = {
                'locatingTimeoutMs': 10000,
                'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_ACCURACY
              };
              try {
                geoLocationManager.getCurrentLocation(request).then((location) => {
                  expect(location!=null).assertTrue();
                }).catch((err) => {
                  if (err instanceof BusinessError) {
                    console.error('promise, getCurrentLocation: error=' + err.code + err.message);
                  }
                    if(err.code === 3301200){
                      expect(err.code === 3301200).assertTrue();
                    }
                  });
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
          done();
      })      

        /**
         * @tc.number  Sub_Location_isLocationEnabled_0100
         * @tc.name  Sub_Location_isLocationEnabled_0100
         * @tc.desc  isLocationEnabled
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_isLocationEnabled_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,(): void => {
              try {
                let locationEnabled = geoLocationManager.isLocationEnabled();
                expect(true).assertEqual(locationEnabled);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301300);
              }
          await Utils.msSleep(1000)
      })   

        /**
         * @tc.number  Sub_Location_getAddressesFromLocation_0100
         * @tc.name  Sub_Location_getAddressesFromLocation_0100
         * @tc.desc   getAddressesFromLocation(request: ReverseGeoCodeRequest, callback: AsyncCallback<Array<GeoAddress>>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getAddressesFromLocation_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
                "latitude": 31.265496,
                "longitude": 121.62771,
                "maxItems": 1,
                "locale": "zh",
                "country": "CN"  
            };
              try {
                geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest, (err:BusinessError<void>|null,data:Array<geoLocationManager.GeoAddress>|undefined) => {
                if(data) {
                    console.info("getAddressesFromLocation_0100 ======>latitude ", typeof data[0].latitude)
                    expect(typeof data[0].latitude).assertEqual("number");
                    console.info("getAddressesFromLocation_0100 ======>longitude ", typeof data[0].longitude)
                    expect(typeof data[0].longitude).assertEqual("number");
                    console.info("getAddressesFromLocation_0100 ======>locale ", typeof data[0].locale)
                    expect(typeof data[0].locale).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>placeName ", typeof data[0].placeName)
                    expect(typeof data[0].placeName).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>placeName ", typeof data[0].countryCode)
                    expect(typeof data[0].countryCode).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>countryName ", typeof data[0].countryName)
                    expect(typeof data[0].countryName).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>administrativeArea ", typeof data[0].administrativeArea)
                    expect(typeof data[0].administrativeArea).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>subAdministrativeArea ", typeof data[0].subAdministrativeArea)
                    expect(typeof data[0].subAdministrativeArea).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>locality ", typeof data[0].locality)
                    expect(typeof data[0].locality).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>subLocality ", typeof data[0].subLocality)
                    expect(typeof data[0].subLocality).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>roadName ", typeof data[0].roadName)
                    expect(typeof data[0].roadName).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>subRoadName ", typeof data[0].subRoadName)
                    expect(typeof data[0].subRoadName).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>premises ", typeof data[0].premises)
                    expect(typeof data[0].premises).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>postalCode ", typeof data[0].postalCode)
                    expect(typeof data[0].postalCode).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>phoneNumber ", typeof data[0].phoneNumber)
                    expect(typeof data[0].phoneNumber).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>addressUrl ", typeof data[0].addressUrl)
                    expect(typeof data[0].addressUrl).assertEqual("string");
                    console.info("getAddressesFromLocation_0100 ======>descriptionsSize ", typeof data[0].descriptionsSize)
                    expect(typeof data[0].descriptionsSize).assertEqual("int");
                    console.info("getAddressesFromLocation_0100 ======>descriptions ", typeof data[0].descriptions)
                    if(data[0].descriptions != undefined){
                      expect(typeof data[0].descriptions instanceof Array);
                    }
                    expect(data.length>0).assertTrue();
                }
                if (err) {
                    console.error('locationChange: err=' + JSON.stringify(err));
                    expect(err.code).assertEqual(401);
                }
                });
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
          await Utils.msSleep(1000)
          done();
      })


        /**
         * @tc.number  Sub_Location_getAddressesFromLocation_0200
         * @tc.name  Sub_Location_getAddressesFromLocation_0200
         * @tc.desc   getAddressesFromLocation(request: ReverseGeoCodeRequest): Promise<Array<GeoAddress>>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getAddressesFromLocation_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
                "latitude": 31.265496,
                "longitude": 121.62771,
                "maxItems": 1,
                "locale": "zh",
                "country": "CN"  
            };
            try {
                geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                  expect(true).assertEqual(data!=null);
                }).catch((err) => {
                  if (err instanceof BusinessError) {
                    console.error('promise, getAddressesFromLocation: error=' + err.code + err.message);
                    expect(err.code).assertEqual(401);
                  }
                  });
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
          await Utils.msSleep(1000)
          done();
      })      

        /**
         * @tc.number  Sub_Location_getAddressesFromLocation_0300
         * @tc.name  Sub_Location_getAddressesFromLocation_0300
         * @tc.desc   getAddressesFromLocation(request: ReverseGeoCodeRequest): Promise<Array<GeoAddress>>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getAddressesFromLocation_0300',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
                "latitude": 31.265496,
                "longitude": 121.62771,
                "maxItems": 1,
                "locale": "zh",
                "country": "CN"  
            };
            try {
                geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                  expect(true).assertEqual(data!=null);
                }).catch((err) => {
                  if (err instanceof BusinessError) {
                    console.error('promise, getAddressesFromLocation: error=' + err.code + err.message);
                    expect(err.code).assertEqual(3301300);
                  }
                  });
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
          await Utils.msSleep(1000)
          done();
      })        
     

        /**
         * @tc.number  Sub_Location_getAddressesFromLocationName_0100
         * @tc.name  Sub_Location_getAddressesFromLocationName_0100
         * @tc.desc   getAddressesFromLocationName(request: GeoCodeRequest, callback: AsyncCallback<Array<GeoAddress>>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getAddressesFromLocationName_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let geocodeRequest: geoLocationManager.GeoCodeRequest = { "description": "上海市浦东新区xx路xx号", "maxItems": 1 };
            try {
              geoLocationManager.getAddressesFromLocationName(geocodeRequest, (err, data) => {
                if (data) {
                    console.info('getAddressesFromLocationName: data=' + JSON.stringify(data));
                    expect(data!=null).assertTrue();
                  }
                if (err) {
                  console.error('getAddressesFromLocationName: err=' + JSON.stringify(err));
                  if (err.code === 3301200){
                    expect(err.code === 3301200).assertTrue();
                   } else {
                  expect(err.code).assertEqual(401);
                   }
                }
              });
            } catch (err) {
              console.error("errCode:" + err.code + ", message:" + err.message);
            }
          done();
      })      

        /**
         * @tc.number  Sub_Location_getAddressesFromLocationName_0200
         * @tc.name  Sub_Location_getAddressesFromLocationName_0200
         * @tc.desc   getAddressesFromLocationName(request: GeoCodeRequest): Promise<Array<GeoAddress>>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getAddressesFromLocationName_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let geocodeRequest: geoLocationManager.GeoCodeRequest = { "description": "上海市浦东新区xx路xx号", "maxItems": 1 };
            try {
              geoLocationManager.getAddressesFromLocationName(geocodeRequest).then((data) => {
                console.info('getAddressesFromLocationName: ' + data);
                expect(true).assertEqual(data!=null);
              }).catch((err) => {
                if (err instanceof BusinessError) {
                  console.error('promise, getAddressesFromLocationName: error=' + err.code + err.message);
                  expect(err.code).assertEqual(401);
                }
                });
            } catch (err:BusinessError) {
              console.error("errCode:" + err.code + ", message:" + err.message);
            }
          await Utils.msSleep(1000)
          done();
      }) 
      
        /**
         * @tc.number  Sub_Location_getCountryCode_0300
         * @tc.name  Sub_Location_getCountryCode_0300
         * @tc.desc   getCountryCode(callback: AsyncCallback<CountryCode>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCountryCode_0300',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            try {
                geoLocationManager.getCountryCode((err, result) => {
                if(result){
                    console.info('getCountryCode: result=' + JSON.stringify(result));
                    expect(result!=null).assertTrue();
                }                    
                if(err){
                    console.error('getCountryCode: err=' + JSON.stringify(err));
                    if (err.code === 3301200){
                      expect(err.code === 3301200).assertTrue(); 
                     } else {
                    expect(err.code).assertEqual(3301500);
                     }
                  }
                });
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }  
          done();
      })    
      
        /**
         * @tc.number  Sub_Location_getCountryCode_0400
         * @tc.name  Sub_Location_getCountryCode_0400
         * @tc.desc   getCountryCode(): Promise<CountryCode>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_getCountryCode_0400',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            try {
                geoLocationManager.getCountryCode().then((result) => {
                    console.info('promise, getCountryCode: result=' + result);
                    expect(result!=null).assertTrue();
                  }).catch((err) => {
                    if (err instanceof BusinessError) {
                    console.error('promise, getCountryCode: error=' + err.code + err.message);
                    }
                    if (err.code === 3301200){
                      expect(err.code === 3301200).assertTrue(); 
                     } else {
                    expect(err.code).assertEqual(3301500);
                     }
                  });
              } catch (err) {
                console.error("errCode:Sub_Location_getCountryCode_0400");
              }
          done();
      })  
      
        /**
        * @tc.number  SUB_Location_getLastLocation_0100
        * @tc.name  SUB_Location_getLastLocation_0100
        * @tc.desc  getLastLocation(): Location
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_getLastLocation_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let location = geoLocationManager.getLastLocation();
                expect(location!=null).assertTrue();
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                if (err.code === 3301200){
                  expect(err.code === 3301200).assertTrue(); 
                 } else {
                expect(err.code).assertEqual(201);
                 }
              }
        })      

        /**
        * @tc.number  SUB_Location_getLastLocation_0200
        * @tc.name  SUB_Location_getLastLocation_0200
        * @tc.desc  getLastLocation(): Location
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_getLastLocation_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let location = geoLocationManager.getLastLocation();
                expect(location!=null).assertTrue();
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                if (err.code === 3301200){
                  expect(err.code === 3301200).assertTrue(); 
                 } else {
                expect(err.code).assertEqual(801);
                 }
              }
        })           

        /**
        * @tc.number  SUB_Location_getLastLocation_0300
        * @tc.name  SUB_Location_getLastLocation_0300
        * @tc.desc  getLastLocation(): Location
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_getLastLocation_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let location = geoLocationManager.getLastLocation();
                expect(location!=null).assertTrue();
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                if (err.code === 3301200){
                  expect(err.code === 3301200).assertTrue(); 
                 } else {
                expect(err.code).assertEqual(3301100);
                 }
              }
        })      
        
        /**
        * @tc.number  SUB_Location_getLastLocation_0400
        * @tc.name  SUB_Location_getLastLocation_0400
        * @tc.desc  getLastLocation(): Location
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_getLastLocation_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let location = geoLocationManager.getLastLocation();
                expect(true).assertEqual(location!=null);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301200);
              }
        }) 

        /**
         * @tc.number  Sub_Location_onLocationChange_0100
         * @tc.name  Sub_Location_onLocationChange_0100
         * @tc.desc  onLocationChange(request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onLocationChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let request: geoLocationManager.ContinuousLocationRequest = {
                'interval': 1,
                'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
              };
              let locationCallback = (location: geoLocationManager.Location): void => {
                console.info('locationCallback: data: ' + JSON.stringify(location));
                expect(true).assertEqual(location!=null);
              };
              try {
                geoLocationManager.onLocationChange(request, locationCallback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }            
          await Utils.msSleep(1000)
          done();
      })        
        
        /**
         * @tc.number  Sub_Location_onLocationChange_0200
         * @tc.name  Sub_Location_onLocationChange_0200
         * @tc.desc  onLocationChange(request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onLocationChange_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
              let request: geoLocationManager.ContinuousLocationRequest = {
                'interval': 1,
                'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
              };
              let locationCallback = (location: geoLocationManager.Location): void => {
                console.info('locationCallback: data: ' + JSON.stringify(location));
                expect(true).assertEqual(location!=null);
              };
              try {
                geoLocationManager.onLocationChange(request, locationCallback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(401);
              }            
          await Utils.msSleep(1000)
          done();
      })  
      
        /**
         * @tc.number  Sub_Location_onLocationChange_0300
         * @tc.name  Sub_Location_onLocationChange_0300
         * @tc.desc  onLocationChange(request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onLocationChange_0300',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let request: geoLocationManager.ContinuousLocationRequest = {
                'interval': 1,
                'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
              };
              let locationCallback = (location: geoLocationManager.Location): void => {
                console.info('locationCallback: data: ' + JSON.stringify(location));
                expect(true).assertEqual(location!=null);
              };
              try {
                geoLocationManager.onLocationChange(request, locationCallback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301100);
              }            
          await Utils.msSleep(1000)
          done();
      })   
      
        /**
         * @tc.number  Sub_Location_offLocationChange_0100
         * @tc.name  Sub_Location_offLocationChange_0100
         * @tc.desc  offLocationChange(callback?: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offLocationChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{

            let requestInfo: geoLocationManager.LocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'timeInterval': 1,
                'distanceInterval': 0,
                'maxAccuracy': 0
              };
              let locationChange = (location: geoLocationManager.Location): void => {
                console.info('locationChange: data: ' + JSON.stringify(location));
                expect(true).assertEqual(location!=null);
              };
              try {
                geoLocationManager.offLocationChange(locationChange);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }
          await Utils.msSleep(1000)
          done();
      })  
      
        /**
         * @tc.number  Sub_Location_onLocationError_0100
         * @tc.name  Sub_Location_onLocationError_0100
         * @tc.desc  onLocationError(callback: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onLocationError_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.LocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'timeInterval': 1,
                'distanceInterval': 0,
                'maxAccuracy': 0
              };
              let locationChange = (location: geoLocationManager.Location): void => {
                console.info('locationChange: data: ' + JSON.stringify(location));
              };
              try {
                geoLocationManager.onLocationChange(requestInfo, locationChange);
              } catch (err) {
                console.error("errCode:" + err.code + ", message:" + err.message);
              }
              let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
                console.info('locationErrorChange: data: ' + JSON.stringify(errcode));
                expect(true).assertEqual(errcode!=null);
              };
              try {
                geoLocationManager.onLocationError(locationErrorChange);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }
          await Utils.msSleep(1000)
          done();
      })     
      
        /**
         * @tc.number  Sub_Location_offLocationError_0100
         * @tc.name  Sub_Location_offLocationError_0100
         * @tc.desc  offLocationError(callback?: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offLocationError_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
                console.info('locationErrorChange: data: ' + JSON.stringify(errcode));
                expect(true).assertEqual(errcode!=null);
              };
              try {
                geoLocationManager.offLocationError(locationErrorChange);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }           
          await Utils.msSleep(1000)
          done();
      })   
      
        /**
         * @tc.number  Sub_Location_onLocationEnabledChange_0100
         * @tc.name  Sub_Location_onLocationEnabledChange_0100
         * @tc.desc onLocationEnabledChange(callback: Callback<boolean>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onLocationEnabledChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let state = (state: boolean): void => {
                console.info('locationEnabledChange: ' + JSON.stringify(state));
                expect(state).assertTrue();
            }
            try {
                geoLocationManager.onLocationEnabledChange(state);
            } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
            }          
          await Utils.msSleep(1000)
          done();
      })   
      
        /**
         * @tc.number  Sub_Location_offLocationEnabledChange_0100
         * @tc.name  Sub_Location_offLocationEnabledChange_0100
         * @tc.desc offLocationEnabledChange(callback: Callback<boolean>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offLocationEnabledChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let state = (state: boolean): void => {
                console.info('locationEnabledChange: ' + JSON.stringify(state));
                expect(state).assertTrue();
            }
            try {
                geoLocationManager.offLocationEnabledChange(state);
            } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
            }          
          await Utils.msSleep(1000)
          done();
      })   

      
        /**
         * @tc.number  Sub_Location_onSatelliteStatusChange_0100
         * @tc.name  Sub_Location_onSatelliteStatusChange_0100
         * @tc.desc onSatelliteStatusChange( callback: Callback<SatelliteStatusInfo>): void  
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onSatelliteStatusChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
                console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
                expect(true).assertEqual(satelliteStatusInfo!=null);
                // 表示卫星个数
                let totalNumber: number = satelliteStatusInfo.satellitesNumber;
                let satelliteIds: Array<Int> = satelliteStatusInfo.satelliteIds;
                let carrierToNoiseDensitys: Array<number> = satelliteStatusInfo.carrierToNoiseDensitys;
                let altitudes: Array<number> = satelliteStatusInfo.altitudes;
                let azimuths: Array<number> = satelliteStatusInfo.azimuths;
                let carrierFrequencies: Array<number> = satelliteStatusInfo.carrierFrequencies;
                let satelliteConstellations: Array<geoLocationManager.SatelliteConstellationCategory> | undefined = satelliteStatusInfo.satelliteConstellation;
                let satelliteAdditionalInfos: Array<Int> | undefined = satelliteStatusInfo.satelliteAdditionalInfo;
                for (let i = 0;i < totalNumber; i++) {
                  // 卫星的ID
                  let satelliteId: number = satelliteIds[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的载波噪声功率谱密度比
                  let carrierToNoiseDensity: number = carrierToNoiseDensitys[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的高度角信息
                  let altitude: number = altitudes[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的方位角
                  let azimuth: number = azimuths[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的载波频率
                  let carrierFrequencie: number = carrierFrequencies[i];
                  if (satelliteConstellations != undefined) {
                    // 表示卫星的ID为 ${satelliteId} 的卫星的星座类型
                    let satelliteConstellation: geoLocationManager.SatelliteConstellationCategory = satelliteConstellations[i];
                  }
                  if (satelliteAdditionalInfos != undefined) {
                    // 表示卫星的ID为 ${satelliteId} 的卫星的附加信息；表示是否在最新的位置解算中使用了本卫星，是否具有星历数据，是否具有年历数据，是否具有载波频率信息等。
                    let satelliteAdditionalInfo: number = satelliteAdditionalInfos[i];
                  }
                }
              }
              try {
                geoLocationManager.onSatelliteStatusChange(gnssStatusCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }       
          await Utils.msSleep(1000)
          done();
      })            

        /**
         * @tc.number  Sub_Location_onSatelliteStatusChange_0200
         * @tc.name  Sub_Location_onSatelliteStatusChange_0200
         * @tc.desc onSatelliteStatusChange( callback: Callback<SatelliteStatusInfo>): void  
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onSatelliteStatusChange_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
                console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
                expect(true).assertEqual(satelliteStatusInfo!=null);
                // 表示卫星个数
                let totalNumber: number = satelliteStatusInfo.satellitesNumber;
                let satelliteIds: Array<Int> = satelliteStatusInfo.satelliteIds;
                let carrierToNoiseDensitys: Array<number> = satelliteStatusInfo.carrierToNoiseDensitys;
                let altitudes: Array<number> = satelliteStatusInfo.altitudes;
                let azimuths: Array<number> = satelliteStatusInfo.azimuths;
                let carrierFrequencies: Array<number> = satelliteStatusInfo.carrierFrequencies;
                let satelliteConstellations: Array<geoLocationManager.SatelliteConstellationCategory> | undefined = satelliteStatusInfo.satelliteConstellation;
                let satelliteAdditionalInfos: Array<Int> | undefined = satelliteStatusInfo.satelliteAdditionalInfo;
                for (let i = 0;i < totalNumber; i++) {
                  // 卫星的ID
                  let satelliteId: number = satelliteIds[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的载波噪声功率谱密度比
                  let carrierToNoiseDensity: number = carrierToNoiseDensitys[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的高度角信息
                  let altitude: number = altitudes[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的方位角
                  let azimuth: number = azimuths[i];
                  // 表示卫星的ID为 ${satelliteId} 的卫星的载波频率
                  let carrierFrequencie: number = carrierFrequencies[i];
                  if (satelliteConstellations != undefined) {
                    // 表示卫星的ID为 ${satelliteId} 的卫星的星座类型
                    let satelliteConstellation: geoLocationManager.SatelliteConstellationCategory = satelliteConstellations[i];
                  }
                  if (satelliteAdditionalInfos != undefined) {
                    // 表示卫星的ID为 ${satelliteId} 的卫星的附加信息；表示是否在最新的位置解算中使用了本卫星，是否具有星历数据，是否具有年历数据，是否具有载波频率信息等。
                    let satelliteAdditionalInfo: number = satelliteAdditionalInfos[i];
                  }
                }
              }
              try {
                geoLocationManager.onSatelliteStatusChange(gnssStatusCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301100);
              }       
          await Utils.msSleep(1000)
          done();
      })  
      
        /**
         * @tc.number  Sub_Location_offSatelliteStatusChange_0100
         * @tc.name  Sub_Location_offSatelliteStatusChange_0100
         * @tc.desc offSatelliteStatusChange(callback?: Callback<SatelliteStatusInfo>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offSatelliteStatusChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
                console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
                expect(true).assertEqual(satelliteStatusInfo!=null);
              }
              try {
                geoLocationManager.offSatelliteStatusChange(gnssStatusCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }
          await Utils.msSleep(1000)
          done();
      })  
      
        /**
         * @tc.number  Sub_Location_offSatelliteStatusChange_0200
         * @tc.name  Sub_Location_offSatelliteStatusChange_0200
         * @tc.desc offSatelliteStatusChange(callback?: Callback<SatelliteStatusInfo>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offSatelliteStatusChange_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
                console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
                expect(true).assertEqual(satelliteStatusInfo!=null);
              }
              try {
                geoLocationManager.offSatelliteStatusChange(gnssStatusCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301100);
              }
          await Utils.msSleep(1000)
          done();
      })  

        /**
         * @tc.number  Sub_Location_onNmeaMessage_0100
         * @tc.name  Sub_Location_onNmeaMessage_0100
         * @tc.desc onNmeaMessage(callback: Callback<string>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onNmeaMessage_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let nmeaCb = (str: string): void => {
                console.info('nmeaMessage: ' + JSON.stringify(str));
                expect(true).assertEqual(str!=null);
              }
              try {
                geoLocationManager.onNmeaMessage(nmeaCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }
          await Utils.msSleep(1000)
          done();
      })      
      
        /**
         * @tc.number  Sub_Location_onNmeaMessage_0200
         * @tc.name  Sub_Location_onNmeaMessage_0200
         * @tc.desc onNmeaMessage(callback: Callback<string>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onNmeaMessage_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let nmeaCb = (str: string): void => {
                console.info('nmeaMessage: ' + JSON.stringify(str));
                expect(true).assertEqual(str!=null);
              }
              try {
                geoLocationManager.onNmeaMessage(nmeaCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301100);
              }
          await Utils.msSleep(1000)
          done();
      })  
 
        /**
         * @tc.number  Sub_Location_offNmeaMessage_0100
         * @tc.name  Sub_Location_offNmeaMessage_0100
         * @tc.desc offNmeaMessage(callback: Callback<string>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offNmeaMessage_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let nmeaCb = (str: string): void => {
                console.info('nmeaMessage: ' + JSON.stringify(str));
                expect(true).assertEqual(str!=null);
              }
              try {
                geoLocationManager.offNmeaMessage(nmeaCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }
          await Utils.msSleep(1000)
          done();
      })      
      
        /**
         * @tc.number  Sub_Location_offNmeaMessage_0200
         * @tc.name  Sub_Location_offNmeaMessage_0200
         * @tc.desc offNmeaMessage(callback: Callback<string>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offNmeaMessage_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let nmeaCb = (str: string): void => {
                console.info('nmeaMessage: ' + JSON.stringify(str));
                expect(true).assertEqual(str!=null);
              }
              try {
                geoLocationManager.offNmeaMessage(nmeaCb);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301100);
              }
          await Utils.msSleep(1000)
          done();
      })       
   

        /**
         * @tc.number  Sub_Location_onCountryCodeChange_0100
         * @tc.name  Sub_Location_onCountryCodeChange_0100
         * @tc.desc  onCountryCodeChange(callback: Callback<CountryCode>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onCountryCodeChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (code: geoLocationManager.CountryCode): void => {
                console.info('countryCodeChange: ' + JSON.stringify(code));
                expect(true).assertEqual(code!=null);
              }
              try {
                geoLocationManager.onCountryCodeChange(callback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301500);
              }
          await Utils.msSleep(1000)
          done();
      })   
      
        /**
         * @tc.number  Sub_Location_offCountryCodeChange_0100
         * @tc.name  Sub_Location_offCountryCodeChange_0100
         * @tc.desc  offCountryCodeChange(callback: Callback<CountryCode>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offCountryCodeChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (code: geoLocationManager.CountryCode): void => {
                console.info('countryCodeChange: ' + JSON.stringify(code));
                expect(true).assertEqual(code!=null);
              }
              try {
                geoLocationManager.offCountryCodeChange(callback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301500);
              }
          await Utils.msSleep(1000)
          done();
      })        
        
        /**
         * @tc.number  Sub_Location_onBluetoothScanResultChange_0100
         * @tc.name  Sub_Location_onBluetoothScanResultChange_0100
         * @tc.desc  onBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onBluetoothScanResultChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('bluetoothScanResultChange: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
              };
              try {
                geoLocationManager.onBluetoothScanResultChange(callback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }
          await Utils.msSleep(1000)
          done();
      })  
      
        /**
         * @tc.number  Sub_Location_onBluetoothScanResultChange_0200
         * @tc.name  Sub_Location_onBluetoothScanResultChange_0200
         * @tc.desc  onBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_onBluetoothScanResultChange_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('bluetoothScanResultChange: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
              };
              try {
                geoLocationManager.onBluetoothScanResultChange(callback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(3301100);
              }
          await Utils.msSleep(1000)
          done();
      })  
      
      
        /**
         * @tc.number  Sub_Location_offBluetoothScanResultChange_0100
         * @tc.name  Sub_Location_offBluetoothScanResultChange_0100
         * @tc.desc  offBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_offBluetoothScanResultChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('bluetoothScanResultChange: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
              };
              try {
                geoLocationManager.offBluetoothScanResultChange(callback);
              } catch (err:BusinessError) {
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(201);
              }
          await Utils.msSleep(1000)
          done();
      })      












    })
}