/**
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

export async function changedLocationMode() {
  let locationEnabled: boolean = geoLocationManager.isLocationEnabled()
  console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(locationEnabled));
  if (!locationEnabled) {
    try {
      geoLocationManager.enableLocation((err) => {
        if (err) {
          console.error("[lbs_js] enableLocation error." + JSON.stringify(err));
        }
      });
    } catch (err) {
      console.error("[lbs_js] enableLocation catch error." + JSON.stringify(err));
    }
  }
};

export default function actslocationTest() {

    describe("actslocationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async() => {
          await changedLocationMode()
          hilog.info(domain, tag, 'beforeAll start');
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          hilog.info(domain, tag, 'beforeAll AbilityDelegator');
          abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.location.geolocation.geocoder")
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

        beforeEach(async (): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'beforeEach start');
          let  isWifiActive : boolean = wifiMg.isWifiActive() as boolean
          if(!isWifiActive){
            console.info("======> wifi_test/enable wifi: false" );
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
            if (data.chload >= 900 || data.rssi <= -80) {
              expect().message("======> WLAN Network error").assertFail();
            } else if (data.chload >= 500) {
              console.info("======> The internet connection is poor. ");
            }
          } catch (err) {
            console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
            throw (err as Error);
          }
          hilog.info(domain, tag, '%{public}s', 'beforeEach end');
        })

        /**
        * @tc.number  SUB_HSS_LocationSystem_Geocoder_0100
        * @tc.name  SUB_HSS_LocationSystem_Geocoder_0100
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it ('SUB_HSS_LocationSystem_Geocoder_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
                      console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0100 try data is:' + JSON.stringify(data));
                      if (data.length == 0) {
                        expect(data.length == 0).assertFalse();
                      } else {
                        expect(data.length > 0).assertTrue();
                      }
                      
                    }).catch((error) => {
                        console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0100 try err is:' + error.code);
                        expect(error.code).assertEqual(801);
                    })
                    done();
                } catch(error){
                    console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0100 try err is:' + JSON.stringify(error));
                    expect(error.code).assertEqual(801);
                }
              done();
            }
        )

        /**
            * @tc.number  SUB_HSS_LocationSystem_Geocoder_0200
            * @tc.name  SUB_HSS_LocationSystem_Geocoder_0200
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it ('SUB_HSS_LocationSystem_Geocoder_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let geoCodeRequest: geoLocationManager.GeoCodeRequest = {
                        "description": "上海金穗路1800号",
                        "maxItems": 1,
                        "minLatitude": 31.3082812847,
                        "minLongitude": 121.5782001832,
                        "maxLatitude": 31.1537977881,
                        "maxLongitude": 121.8026736943,
                        "country": "CN",
                        "locale": ""
                    };
                    try{
                        geoLocationManager.getAddressesFromLocationName(geoCodeRequest).then((result:Array<geoLocationManager.GeoAddress>) => {
                          console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0200 try result is:' + JSON.stringify(result));
                          if (result.length == 0) {
                            expect(result.length == 0).assertFalse();
                          } else {
                            expect(result.length > 0).assertTrue();
                          }
                          done();
                        }).catch((error) => {
                          console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0200 try errcode is:' + error.code);
                          if (error.code == 801) {
                            expect(error.code).assertEqual(801);
                          } else {
                            expect(error.code).assertEqual(3301400);
                          }
                          done();
                        });
                    }catch(error){
                      console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0200 try errend is:' + JSON.stringify(error));
                      expect(error.code).assertEqual(801);
                    }
                  done();
                }
            )


            /**
            * @tc.number  SUB_HSS_LocationSystem_Geocoder_0300
            * @tc.name  SUB_HSS_LocationSystem_Geocoder_0300
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it ('SUB_HSS_LocationSystem_Geocoder_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
              async (done: () => void): Promise<void> => {
                let geoCodeRequest: geoLocationManager.GeoCodeRequest = {
                    "description": "上海金穗路1800号",
                    "maxItems": 1,
                    "minLatitude": 31.3082812847,
                    "minLongitude": 121.5782001832,
                    "maxLatitude": 31.1537977881,
                    "maxLongitude": 121.8026736943,
                    "country": "CN",
                    "locale": ""
                };
                try{
                    expect(typeof geoCodeRequest.locale).assertEqual("string");
                    geoLocationManager.getAddressesFromLocationName(geoCodeRequest,(err, data) => {
                        if(err){
                            console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0300 try err is:' + JSON.stringify(err));
                            if (err.code == 801) {
                              expect(err.code).assertEqual(801);
                            } else {
                              expect(err.code).assertEqual(3301400);
                            }
                            done();
                        }else{
                          console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0300 try data is:' + JSON.stringify(data));
                          if (data !== null && data !== undefined){
                            if (data.length == 0) {
                              expect(data.length == 0).assertFalse();
                            } else {
                              expect(data.length > 0).assertTrue();
                            let result:geoLocationManager.GeoAddress = data[0]
                            if (result && result.latitude !== null && result.latitude !== undefined) {
                              expect(typeof result.latitude).assertEqual("double");
                            }
                            if (result && result.longitude !== null && result.longitude !== undefined) {
                              expect(typeof result.longitude).assertEqual("double");
                            }
                            if (result && result.locale !== null && result.locale !== undefined) {
                              expect(typeof result.locale).assertEqual("string");
                            }
                            if (result && result.placeName !== null && result.placeName !== undefined) {
                              expect(typeof result.placeName).assertEqual("string");
                            }
                            if (result && result.countryCode !== null && result.countryCode !== undefined) {
                              expect(typeof result.countryCode).assertEqual("string");
                            }
                            if (result && result.countryName !== null && result.countryName !== undefined) {
                              expect(typeof result.countryName).assertEqual("string");
                            }
                            if (result && result.administrativeArea !== null && result.administrativeArea !== undefined) {
                              expect(typeof result.administrativeArea).assertEqual("string");
                            }
                            if (result && result.subAdministrativeArea !== null && result.subAdministrativeArea !== undefined) {
                              expect(typeof result.subAdministrativeArea).assertEqual("string");
                            }
                            if (result && result.locality !== null && result.locality !== undefined) {
                              expect(typeof result.locality).assertEqual("string");
                            }
                            if (result && result.subLocality !== null && result.subLocality !== undefined) {
                              expect(typeof result.subLocality).assertEqual("string");
                            }
                            if (result && result.roadName !== null && result.roadName !== undefined) {
                              expect(typeof result.roadName).assertEqual("string");
                            }
                            if (result && result.subRoadName !== null && result.subRoadName !== undefined) {
                              expect(typeof result.subRoadName).assertEqual("string");
                            }
                            if (result && result.premises !== null && result.premises !== undefined) {
                              expect(typeof result.premises).assertEqual("string");
                            }
                            if (result && result.postalCode !== null && result.postalCode !== undefined) {
                              expect(typeof result.postalCode).assertEqual("string");
                            }
                            if (result && result.phoneNumber !== null && result.phoneNumber !== undefined) {
                              expect(typeof result.phoneNumber).assertEqual("string");
                            }
                            if (result && result.addressUrl !== null && result.addressUrl !== undefined) {
                              expect(typeof result.addressUrl).assertEqual("string");
                            }
                            if (result && result.descriptions !== null && result.descriptions !== undefined) {
                              expect(typeof result.descriptions).assertEqual("string");
                            }
                            if (result && result.descriptionsSize !== null && result.descriptionsSize !== undefined) {
                              expect(typeof result.descriptionsSize).assertEqual("string");
                            }
                          }
                          }
                          
                        }
                        done();
                    })
                }catch(error){
                  console.info('[lbs_js] SUB_HSS_LocationSystem_Geocoder_0300 try errend is:' + JSON.stringify(error));
                  expect(error.code).assertEqual(801);
                }
                done();
              }
            )

            /**
            * @tc.number  SUB_HSS_LocationSystem_Geocoder_0400
            * @tc.name  SUB_HSS_LocationSystem_Geocoder_0400
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it ('SUB_HSS_LocationSystem_Geocoder_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
                                expect(err.code).assertEqual(801);
                            } else{
                                hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation callback data is:' + JSON.stringify(data));
                                expect((JSON.stringify(data)) != null).assertTrue();
                                if (data !== null && data !== undefined){
                                  if (data.length == 0) {
                                    expect(data.length == 0).assertFalse();
                                  } else {
                                    expect(data.length > 0).assertTrue();
                                  }
                                }
                            }
                        })

                    }catch(error){
                        hilog.error(domain, tag, '[lbs_js] getAddressesFromLocation callback try err is:' + error);
                        expect(error.code).assertEqual(801);
                    }
                    await Utils.msSleep(1000)
                    done()
                }
            )

            /**
            * @tc.number  SUB_Geocoder_isGeocoderAvailabel_0100
            * @tc.name  SUB_Geocoder_isGeocoderAvailabel_0100
            * @tc.desc  Test Location API functionality
            * @tc.level  Level 2
            * @tc.type  Function
            * @tc.size  MEDIUMTEST
            */
            it('SUB_Geocoder_isGeocoderAvailabel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                try{
                    let geocoderAvailable = geoLocationManager.isGeocoderAvailable();
                    if (geocoderAvailable){
                      expect(geocoderAvailable).assertTrue();
                    } else {
                      expect().assertFalse();
                    }
                    
                } catch (error){
                  console.info('[lbs_js] SUB_Geocoder_isGeocoderAvailabel_0100 try err is:' + error.code);
                  expect(error.code).assertEqual(801);
                }
                done();
            })

    })
}