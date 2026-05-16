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
          abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.location.geolocation.core")
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
            await Utils.msSleep(1000);
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
         * @tc.number  Sub_Location_core_onLocationChange_0100
         * @tc.name  Sub_Location_core_onLocationChange_0100
         * @tc.desc  onLocationChange(request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onLocationChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
          let request: geoLocationManager.ContinuousLocationRequest = {
                'interval': 1,
                'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION,
                'needPoi': false
              };
          let locationCallback = (location: geoLocationManager.Location): void => {
            console.info('Sub_Location_core_onLocationChange_0100 data: ' + JSON.stringify(location));
            expect(true).assertEqual(location!=null);
            console.info("Sub_Location_core_onLocationChange_0100 ======>latitude ", typeof location.latitude)
            expect(typeof location.latitude).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>longitude ", typeof location.longitude)
            expect(typeof location.longitude).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>altitude ", typeof location.altitude)
            expect(typeof location.altitude).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>accuracy ", typeof location.accuracy)
            expect(typeof location.accuracy).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>speed ", typeof location.speed)
            expect(typeof location.speed).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>timeStamp", typeof location.timeStamp)
            expect(typeof location.timeStamp).assertEqual("long");
            console.info("Sub_Location_core_onLocationChange_0100 ======>direction", typeof location.direction)
            expect(typeof location.direction).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>timeSinceBoot", typeof location.timeSinceBoot)
            expect(typeof location.timeSinceBoot).assertEqual("long");
            if (location.additions) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>additions", typeof location.additions)
            expect(location.additions instanceof Array);
            }
            if (location.additionSize) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>additionSize", typeof location.additionSize)
            expect(typeof location.additionSize).assertEqual("int");
            }
            if (location.additionsMap) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>additionsMap", typeof location.additionsMap)
            expect(location.additionsMap instanceof Map);
            }
            if (location.altitudeAccuracy) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
            expect(typeof location.altitudeAccuracy).assertEqual("number");
            }
            if (location.speedAccuracy) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>speedAccuracy", typeof location.speedAccuracy)
            expect(typeof location.speedAccuracy).assertEqual("number");
            }
            
            if (location.directionAccuracy) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>directionAccuracy", typeof location.directionAccuracy)
            expect(typeof location.directionAccuracy).assertEqual("number");
            }
            
            if (location.uncertaintyOfTimeSinceBoot) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
            expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
            }
            
            if (location.sourceType) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>uncertaintyOfTimeSinceBoot", typeof location.sourceType)
            expect(typeof location.sourceType).assertEqual("int");
            }

            if (location.poi) {
              expect(location.poi != null).assertTrue();
            }
          };
          try {
              geoLocationManager.onLocationChange(request, locationCallback);
              } catch (err) {
              console.error("Sub_Location_core_onLocationChange_0100 null errCode:" + err.code + ", message:" + err.message);
              expect(err.code).assertEqual(801);
          }
          await Utils.msSleep(1000)
          done();
        });

        /**
         * @tc.number  Sub_Location_core_offLocationChange_0100
         * @tc.name  Sub_Location_core_offLocationChange_0100
         * @tc.desc  offLocationChange(callback?: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_offLocationChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.LocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'timeInterval': 1,
                'distanceInterval': 0,
                'maxAccuracy': 0
              };
              let locationChange = (location: geoLocationManager.Location): void => {
                console.info('Sub_Location_core_offLocationChange_0100: data: ' + JSON.stringify(location));
                expect(true).assertEqual(location!=null);
              };
              try {
                geoLocationManager.offLocationChange(locationChange);
              } catch (err) {
                console.error("Sub_Location_core_offLocationChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        });

        /**
         * @tc.number  Sub_Location_core_onLocationError_0100
         * @tc.name  Sub_Location_core_onLocationError_0100
         * @tc.desc  onLocationError(callback: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onLocationError_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.LocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'timeInterval': 1,
                'distanceInterval': 0,
                'maxAccuracy': 0
              };
              let locationChange = (location: geoLocationManager.Location): void => {
                console.info('Sub_Location_core_onLocationError_0100: data: ' + JSON.stringify(location));
              };
              try {
                geoLocationManager.onLocationChange(requestInfo, locationChange);
              } catch (err) {
                console.error("Sub_Location_core_onLocationError_0100 errCode:" + err.code + ", message:" + err.message);
              }
              let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
                console.info('Sub_Location_core_onLocationError_0100 locationErrorChange: data: ' + JSON.stringify(errcode));
                expect(true).assertEqual(errcode!=null);
              };
              try {
                geoLocationManager.onLocationError(locationErrorChange);
              } catch (err) {
                console.error("Sub_Location_core_onLocationError_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_offLocationError_0100
         * @tc.name  Sub_Location_core_offLocationError_0100
         * @tc.desc  offLocationError(callback?: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_offLocationError_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
                console.info('Sub_Location_core_offLocationError_0100: data: ' + JSON.stringify(errcode));
                expect(true).assertEqual(errcode!=null);
              };
            try {
            geoLocationManager.offLocationError(locationErrorChange);
            } catch (err) {
            console.error("Sub_Location_core_offLocationError_0100 errCode:" + err.code + ", message:" + err.message);
            expect(err.code).assertEqual(801);
            }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_onCountryCodeChange_0100
         * @tc.name  Sub_Location_core_onCountryCodeChange_0100
         * @tc.desc  onCountryCodeChange(callback: Callback<CountryCode>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onCountryCodeChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (code: geoLocationManager.CountryCode): void => {
                console.info('Sub_Location_core_onCountryCodeChange_0100: ' + JSON.stringify(code));
                expect(true).assertEqual(code!=null);
                expect(typeof code.country).assertEqual("string");
                expect(code.country.length > 0).assertTrue();
                expect(typeof code.type).assertEqual("int");
              }
              try {
                geoLocationManager.onCountryCodeChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_onCountryCodeChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_offCountryCodeChange_0100
         * @tc.name  Sub_Location_core_offCountryCodeChange_0100
         * @tc.desc  offCountryCodeChange(callback: Callback<CountryCode>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_offCountryCodeChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (code: geoLocationManager.CountryCode): void => {
                console.info('Sub_Location_core_offCountryCodeChange_0100: ' + JSON.stringify(code));
                expect(true).assertEqual(code!=null);
              }
              try {
                geoLocationManager.offCountryCodeChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_offCountryCodeChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_onBluetoothScanResultChange_0100
         * @tc.name  Sub_Location_core_onBluetoothScanResultChange_0100
         * @tc.desc  onBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onBluetoothScanResultChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('Sub_Location_core_onBluetoothScanResultChange_0100: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
                expect(typeof result.deviceId).assertEqual("string");
                expect(result.deviceId.length > 0).assertTrue();
                expect(typeof result.rssi).assertEqual("int");
                expect(result.rssi <= 0).assertTrue();
                expect(result.rssi >= -100).assertTrue();
                expect(typeof result.deviceName).assertEqual("string");
                expect(result.deviceName.length > 0).assertTrue();
                expect(typeof result.connectable).assertEqual("boolean");
                if (result.data !== null && result.data !== undefined) {
                  expect(true).assertEqual(result.data!=null);
                }
              };
              try {
                geoLocationManager.onBluetoothScanResultChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_onBluetoothScanResultChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })
        
         /**
         * @tc.number  Sub_Location_core_offBluetoothScanResultChange_0100
         * @tc.name  Sub_Location_core_offBluetoothScanResultChange_0100
         * @tc.desc  offBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
         it('Sub_Location_core_offBluetoothScanResultChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('Sub_Location_core_offBluetoothScanResultChange_0100: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
              };
              try {
                geoLocationManager.offBluetoothScanResultChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_offBluetoothScanResultChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

         /**
         * @tc.number  Sub_Location_core_getCurrentLocation_0100
         * @tc.name  Sub_Location_core_getCurrentLocation_0100
         * @tc.desc  onLocationError(callback: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_getCurrentLocation_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.LocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'timeInterval': 1,
                'distanceInterval': 0,
                'maxAccuracy': 0
              };
              let locationChange = (location: geoLocationManager.Location): void => {
                console.info('Sub_Location_core_getCurrentLocation_0100: data: ' + JSON.stringify(location));
                expect(true).assertEqual(location!=null);
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>latitude ", typeof location.latitude)
                expect(typeof location.latitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>longitude ", typeof location.longitude)
                expect(typeof location.longitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>altitude ", typeof location.altitude)
                expect(typeof location.altitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>accuracy ", typeof location.accuracy)
                expect(typeof location.accuracy).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>speed ", typeof location.speed)
                expect(typeof location.speed).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>timeStamp", typeof location.timeStamp)
                expect(typeof location.timeStamp).assertEqual("long");
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>direction", typeof location.direction)
                expect(typeof location.direction).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>timeSinceBoot", typeof location.timeSinceBoot)
                expect(typeof location.timeSinceBoot).assertEqual("long");
                if (location.additions) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>additions", typeof location.additions)
                expect(location.additions instanceof Array);
                }
                if (location.additionSize) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>additionSize", typeof location.additionSize)
                expect(typeof location.additionSize).assertEqual("int");
                }
                if (location.additionsMap) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>additionsMap", typeof location.additionsMap)
                expect(location.additionsMap instanceof Map);
                }
                if (location.altitudeAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
                expect(typeof location.altitudeAccuracy).assertEqual("number");
                }
                if (location.speedAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>speedAccuracy", typeof location.speedAccuracy)
                expect(typeof location.speedAccuracy).assertEqual("number");
                }
                
                if (location.directionAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>directionAccuracy", typeof location.directionAccuracy)
                expect(typeof location.directionAccuracy).assertEqual("number");
                }
                
                if (location.uncertaintyOfTimeSinceBoot) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
                expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                }
                
                if (location.sourceType) {
                console.info("Sub_Location_core_getCurrentLocation_0100 ======>sourceType", typeof location.sourceType)
                expect(typeof location.sourceType).assertEqual("int");
                }

                if (location.poi) {
                  expect(location.poi != null).assertTrue();
                }
              };
              try {
                geoLocationManager.onLocationChange(requestInfo, locationChange);
              } catch (err) {
                console.error("Sub_Location_core_getCurrentLocation_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_getCurrentLocation_0200
         * @tc.name  Sub_Location_core_getCurrentLocation_0200
         * @tc.desc  getCurrentLocation(callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_getCurrentLocation_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            try {
              geoLocationManager.getCurrentLocation((err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                    if (location) {
                      expect(location!=null).assertTrue();
                      console.info('Sub_Location_core_getCurrentLocation_0200: location=' + JSON.stringify(location));
                      expect(true).assertEqual(location!=null);
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>latitude ", typeof location.latitude)
                      expect(typeof location.latitude).assertEqual("number");
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>longitude ", typeof location.longitude)
                      expect(typeof location.longitude).assertEqual("number");
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>altitude ", typeof location.altitude)
                      expect(typeof location.altitude).assertEqual("number");
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>accuracy ", typeof location.accuracy)
                      expect(typeof location.accuracy).assertEqual("number");
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>speed ", typeof location.speed)
                      expect(typeof location.speed).assertEqual("number");
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>timeStamp", typeof location.timeStamp)
                      expect(typeof location.timeStamp).assertEqual("long");
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>direction", typeof location.direction)
                      expect(typeof location.direction).assertEqual("number");
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>timeSinceBoot", typeof location.timeSinceBoot)
                      expect(typeof location.timeSinceBoot).assertEqual("long");
                      if (location.additions) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>additions", typeof location.additions)
                      expect(location.additions instanceof Array);
                      }
                      if (location.additionSize) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>additionSize", typeof location.additionSize)
                      expect(typeof location.additionSize).assertEqual("int");
                      }
                      if (location.additionsMap) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>additionsMap", typeof location.additionsMap)
                      expect(location.additionsMap instanceof Map);
                      }
                      if (location.altitudeAccuracy) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
                      expect(typeof location.altitudeAccuracy).assertEqual("number");
                      }
                      if (location.speedAccuracy) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>speedAccuracy", typeof location.speedAccuracy)
                      expect(typeof location.speedAccuracy).assertEqual("number");
                      }
                      
                      if (location.directionAccuracy) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>directionAccuracy", typeof location.directionAccuracy)
                      expect(typeof location.directionAccuracy).assertEqual("number");
                      }
                      
                      if (location.uncertaintyOfTimeSinceBoot) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
                      expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                      }
                      
                      if (location.sourceType) {
                      console.info("Sub_Location_core_getCurrentLocation_0200 ======>sourceType", typeof location.sourceType)
                      expect(typeof location.sourceType).assertEqual("int");
                      }

                      if (location.poi) {
                        expect(location.poi != null).assertTrue();
                      }
                    }
                    if (err) {
                      console.error('Sub_Location_core_getCurrentLocation_0200: err=' + JSON.stringify(err));
                      expect(err.code).assertEqual(801);
                    }
              });
            } catch (err) {
              console.error("Sub_Location_core_getCurrentLocation_0200 errCode:" + err.code + ", message:" + err.message);
              expect(err.code).assertEqual(801);
            }
          done();
        });

        /**
         * @tc.number  Sub_Location_core_getCurrentLocation_0300
         * @tc.name  Sub_Location_core_getCurrentLocation_0300
         * @tc.desc  getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_getCurrentLocation_0300',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let request: geoLocationManager.SingleLocationRequest = {
                'locatingTimeoutMs': 10000,
                'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_ACCURACY,
                'needPoi': false
              };
            try {
            geoLocationManager.getCurrentLocation(request).then((location) => {
                expect(true).assertEqual(location!=null);
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>latitude ", typeof location.latitude)
                expect(typeof location.latitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>longitude ", typeof location.longitude)
                expect(typeof location.longitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>altitude ", typeof location.altitude)
                expect(typeof location.altitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>accuracy ", typeof location.accuracy)
                expect(typeof location.accuracy).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>speed ", typeof location.speed)
                expect(typeof location.speed).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>timeStamp", typeof location.timeStamp)
                expect(typeof location.timeStamp).assertEqual("long");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>direction", typeof location.direction)
                expect(typeof location.direction).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>timeSinceBoot", typeof location.timeSinceBoot)
                expect(typeof location.timeSinceBoot).assertEqual("long");
                if (location.additions) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>additions", typeof location.additions)
                expect(location.additions instanceof Array);
                }
                if (location.additionSize) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>additionSize", typeof location.additionSize)
                expect(typeof location.additionSize).assertEqual("int");
                }
                if (location.additionsMap) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>additionsMap", typeof location.additionsMap)
                expect(location.additionsMap instanceof Map);
                }
                if (location.altitudeAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
                expect(typeof location.altitudeAccuracy).assertEqual("number");
                }
                if (location.speedAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>speedAccuracy", typeof location.speedAccuracy)
                expect(typeof location.speedAccuracy).assertEqual("number");
                }
                
                if (location.directionAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>directionAccuracy", typeof location.directionAccuracy)
                expect(typeof location.directionAccuracy).assertEqual("number");
                }
                
                if (location.uncertaintyOfTimeSinceBoot) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
                expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                }
                
                if (location.sourceType) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>sourceType", typeof location.sourceType)
                expect(typeof location.sourceType).assertEqual("int");
                }
                if (location.poi) {
                  expect(location.poi != null).assertTrue();
                }
            }).catch((err) => {
                if (err instanceof BusinessError) {
                console.error('promise, Sub_Location_core_getCurrentLocation_0300: error=' + err.code + err.message);
                expect(err.code).assertEqual(801);
                }
                });
            } catch (err) {
            console.error("Sub_Location_core_getCurrentLocation_0300 errCode:" + err.code + ", message:" + err.message);
            expect(err.code).assertEqual(801);
            }
            await Utils.msSleep(1000)
            done();
        });

        /**
         * @tc.number  SUB_Location_core_getCurrentLocation_0400
         * @tc.name  SUB_Location_core_getCurrentLocation_0400
         * @tc.desc  getCurrentLocation(request: CurrentLocationRequest | SingleLocationRequest, callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('SUB_Location_core_getCurrentLocation_0400',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
          let requestInfo: geoLocationManager.CurrentLocationRequest = {
              'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
              'scenario': geoLocationManager.LocationRequestScenario.UNSET,
              'maxAccuracy':0
            };
            try {
              geoLocationManager.getCurrentLocation(requestInfo, (err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                if (location) {
                  expect(location!=null).assertTrue();
                  console.info('SUB_Location_core_getCurrentLocation_0400: location=' + JSON.stringify(location));
                  
                  expect(typeof location.latitude).assertEqual("number");
                  expect(location.latitude).assertLarger(-90);
                  expect(location.latitude).assertLess(90);
                  
                  expect(typeof location.longitude).assertEqual("number");
                  expect(location.longitude).assertLarger(-180);
                  expect(location.longitude).assertLess(180);
                  
                  expect(typeof location.altitude).assertEqual("number");
                  
                  expect(typeof location.accuracy).assertEqual("number");
                  expect(location.accuracy).assertLarger(-1);
                  
                  expect(typeof location.speed).assertEqual("number");
                  expect(location.speed).assertLarger(-1);
                  
                  expect(typeof location.timeStamp).assertEqual("long");
                  expect(location.timeStamp).assertLarger(0);
                  
                  expect(typeof location.direction).assertEqual("number");
                  expect(location.direction).assertLarger(-1);
                  
                  expect(typeof location.timeSinceBoot).assertEqual("long");
                  expect(location.timeSinceBoot).assertLarger(0);
                  
                  if (location.additions) {
                      expect(location.additions instanceof Array).assertTrue();
                  }
                  
                  if (location.additionsMap) {
                      expect(location.additionsMap instanceof Map).assertTrue();
                  }
                  
                  if (location.additionSize) {
                      expect(typeof location.additionSize).assertEqual("int");
                      expect(location.additionSize).assertLarger(-1);
                  }
                  
                  if (location.isFromMock) {
                      expect(typeof location.isFromMock).assertEqual("boolean");
                  }
                  
                  if (location.altitudeAccuracy) {
                      expect(typeof location.altitudeAccuracy).assertEqual("number");
                      expect(location.altitudeAccuracy).assertLarger(-1);
                  }
                  
                  if (location.speedAccuracy) {
                      expect(typeof location.speedAccuracy).assertEqual("number");
                      expect(location.speedAccuracy).assertLarger(-1);
                  }
                  
                  if (location.directionAccuracy) {
                      expect(typeof location.directionAccuracy).assertEqual("number");
                      expect(location.directionAccuracy).assertLarger(0);
                      expect(location.directionAccuracy).assertLess(360);
                  }
                  
                  if (location.uncertaintyOfTimeSinceBoot) {
                      expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                      expect(location.uncertaintyOfTimeSinceBoot).assertLarger(0);
                  }
                  
                  if (location.sourceType) {
                      expect(typeof location.sourceType).assertEqual("int");
                  }
                  
                  if (location.poi) {
                      expect(location.poi != null).assertTrue();
                  }
                }
                if (err) {
                  console.error('SUB_Location_core_getCurrentLocation_0400: err=' + JSON.stringify(err));
                  expect(err.code).assertEqual(801);
                  
                }
              });
            } catch (err) {
              console.error("SUB_Location_core_getCurrentLocation_0400 errCode:" + err.code + ", message:" + err.message);
              expect(err.code).assertEqual(801);
            }
          done();
      })

        /**
        * @tc.number  SUB_Location_core_getLastLocation_0100
        * @tc.name  SUB_Location_core_getLastLocation_0100
        * @tc.desc  getLastLocation(): Location
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_getLastLocation_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let location = geoLocationManager.getLastLocation();
                expect(location!=null).assertTrue();
                expect(true).assertEqual(location!=null);
                console.info("SUB_Location_core_getLastLocation_0100 ======>latitude ", typeof location.latitude)
                expect(typeof location.latitude).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>longitude ", typeof location.longitude)
                expect(typeof location.longitude).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>altitude ", typeof location.altitude)
                expect(typeof location.altitude).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>accuracy ", typeof location.accuracy)
                expect(typeof location.accuracy).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>speed ", typeof location.speed)
                expect(typeof location.speed).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>timeStamp", typeof location.timeStamp)
                expect(typeof location.timeStamp).assertEqual("long");
                console.info("SUB_Location_core_getLastLocation_0100 ======>direction", typeof location.direction)
                expect(typeof location.direction).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>timeSinceBoot", typeof location.timeSinceBoot)
                expect(typeof location.timeSinceBoot).assertEqual("long");
                if (location.additions) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>additions", typeof location.additions)
                expect(location.additions instanceof Array);
                }
                if (location.additionSize) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>additionSize", typeof location.additionSize)
                expect(typeof location.additionSize).assertEqual("int");
                }
                if (location.additionsMap) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>additionsMap", typeof location.additionsMap)
                expect(location.additionsMap instanceof Map);
                }
                if (location.altitudeAccuracy) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
                expect(typeof location.altitudeAccuracy).assertEqual("number");
                }
                if (location.speedAccuracy) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>speedAccuracy", typeof location.speedAccuracy)
                expect(typeof location.speedAccuracy).assertEqual("number");
                }
                
                if (location.directionAccuracy) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>directionAccuracy", typeof location.directionAccuracy)
                expect(typeof location.directionAccuracy).assertEqual("number");
                }
                
                if (location.uncertaintyOfTimeSinceBoot) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
                expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                }
                
                if (location.sourceType) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>sourceType", typeof location.sourceType)
                expect(typeof location.sourceType).assertEqual("int");
                }
                if (location.poi) {
                  expect(location.poi != null).assertTrue();
                  let poiInfo: geoLocationManager.PoiInfo = location.poi!
                  console.info('SUB_Location_core_getLastLocation_0100: poiInfo=' + JSON.stringify(poiInfo));
                  
                  expect(typeof poiInfo.timestamp).assertEqual("long");
                  
                  expect(poiInfo.poiArray instanceof Array).assertTrue();
                  
                  if (poiInfo.poiArray.length > 0) {
                      expect(poiInfo.timestamp).assertLarger(0);
                      expect(poiInfo.poiArray.length).assertLarger(0);
                      let poi: geoLocationManager.Poi = poiInfo.poiArray[0];
                      expect(typeof poi.id).assertEqual("string");
                      expect(poi.id.length).assertLarger(0);
                      
                      expect(typeof poi.confidence).assertEqual("number");
                      expect(poi.confidence).assertLarger(0);
                      expect(poi.confidence).assertLess(1);
                      
                      expect(typeof poi.name).assertEqual("string");
                      expect(poi.name.length).assertLarger(0);
                      
                      expect(typeof poi.latitude).assertEqual("number");
                      expect(poi.latitude).assertLarger(-90);
                      expect(poi.latitude).assertLess(90);
                      
                      expect(typeof poi.longitude).assertEqual("number");
                      expect(poi.longitude).assertLarger(-180);
                      expect(poi.longitude).assertLess(180);
                      
                      expect(typeof poi.administrativeArea).assertEqual("string");
                      expect(poi.administrativeArea.length).assertLarger(0);
                      
                      expect(typeof poi.subAdministrativeArea).assertEqual("string");
                      expect(poi.subAdministrativeArea.length).assertLarger(0);
                      
                      expect(typeof poi.locality).assertEqual("string");
                      expect(poi.locality.length).assertLarger(0);
                      
                      expect(typeof poi.subLocality).assertEqual("string");
                      expect(poi.subLocality.length).assertLarger(0);
                      
                      expect(typeof poi.address).assertEqual("string");
                      expect(poi.address.length).assertLarger(0);

                      expect(typeof poi.additionalInfo).assertEqual("string");
                      expect(poi.additionalInfo?.length).assertLarger(0);
                  }
                }
              } catch (err) {
                console.error("SUB_Location_core_getLastLocation_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
        });

        /**
        * @tc.number  SUB_Location_core_sendCommand_0100
        * @tc.name  SUB_Location_core_sendCommand_0100
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
            async (done:() => void): Promise<void> => {
              let locationCommand: geoLocationManager.LocationCommand ={
                  "scenario": geoLocationManager.LocationRequestScenario.DAILY_LIFE_SERVICE,
                  "command": "del_all"
              };
              geoLocationManager.sendCommand(locationCommand,
                (err:BusinessError | null, result: geoLocationManager.Location | undefined) => {
                  try{
                    if(err != null){
                      expect(err.code).assertEqual(801);
                      done();
                    }else{
                      expect(result == undefined).assertTrue();
                      done();
                    }
                  }catch (err){
                    console.info('[lbs_js] SUB_Location_core_sendCommand_0100 try err is:' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);
                  }
                }
              )
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0200
        * @tc.name  SUB_Location_core_sendCommand_0200
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
          async (done:() => void): Promise<void> => {
            let locationCommand: geoLocationManager.LocationCommand ={
              "scenario": geoLocationManager.LocationRequestScenario.DAILY_LIFE_SERVICE,
              "command": "del_all"
            };
            try{
              geoLocationManager.sendCommand(locationCommand).then((result) => {
                expect(result == undefined).assertTrue();
                done();
              }).catch((error) => {
                expect(error.code).assertEqual(801);
                done();
              })
            }catch (error){
              console.info('[lbs_js] SUB_Location_core_sendCommand_0200 try err is:' + JSON.stringify(error));
              expect(error.code).assertEqual(801);
            }
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0300
        * @tc.name  SUB_Location_core_sendCommand_0300
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
            async (done:() => void): Promise<void> => {
              let locationCommand: geoLocationManager.LocationCommand ={
                  "scenario": geoLocationManager.LocationRequestScenario.NAVIGATION,
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
                  }catch (err){
                    console.info('[lbs_js] SUB_Location_core_sendCommand_0300 try err is:' + JSON.stringify(err));
                    expect().assertFail();
                  }
                }
              )
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0400
        * @tc.name  SUB_Location_core_sendCommand_0400
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
          async (done:() => void): Promise<void> => {
            let locationCommand: geoLocationManager.LocationCommand ={
              "scenario": geoLocationManager.LocationRequestScenario.NAVIGATION,
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
              console.info('[lbs_js] SUB_Location_core_sendCommand_0400 try err is:' + JSON.stringify(error));
              expect().assertFail();
            }
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0500
        * @tc.name  SUB_Location_core_sendCommand_0500
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
            async (done:() => void): Promise<void> => {
              let locationCommand: geoLocationManager.LocationCommand ={
                  "scenario": geoLocationManager.LocationRequestScenario.TRAJECTORY_TRACKING,
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
                  }catch (err){
                    console.info('[lbs_js] SUB_Location_core_sendCommand_0500 try err is:' + JSON.stringify(err));
                    expect().assertFail();
                  }
                }
              )
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0600
        * @tc.name  SUB_Location_core_sendCommand_0600
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
          async (done:() => void): Promise<void> => {
            let locationCommand: geoLocationManager.LocationCommand ={
              "scenario": geoLocationManager.LocationRequestScenario.TRAJECTORY_TRACKING,
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
              console.info('[lbs_js] SUB_Location_core_sendCommand_0600 try err is:' + JSON.stringify(error));
              expect().assertFail();
            }
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0700
        * @tc.name  SUB_Location_core_sendCommand_0700
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
            async (done:() => void): Promise<void> => {
              let locationCommand: geoLocationManager.LocationCommand ={
                  "scenario": geoLocationManager.LocationRequestScenario.CAR_HAILING,
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
                  }catch (err){
                    console.info('[lbs_js] SUB_Location_core_sendCommand_0700 try err is:' + JSON.stringify(err));
                    expect().assertFail();
                  }
                }
              )
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0800
        * @tc.name  SUB_Location_core_sendCommand_0800
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
          async (done:() => void): Promise<void> => {
            let locationCommand: geoLocationManager.LocationCommand ={
              "scenario": geoLocationManager.LocationRequestScenario.CAR_HAILING,
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
              console.info('[lbs_js] SUB_Location_core_sendCommand_0800 try err is:' + JSON.stringify(error));
              expect().assertFail();
            }
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_0900
        * @tc.name  SUB_Location_core_sendCommand_0900
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
            async (done:() => void): Promise<void> => {
              let locationCommand: geoLocationManager.LocationCommand ={
                  "scenario": geoLocationManager.LocationRequestScenario.NO_POWER,
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
                  }catch (err){
                    console.info('[lbs_js] SUB_Location_core_sendCommand_0900 try err is:' + JSON.stringify(err));
                    expect().assertFail();
                  }
                }
              )
          }
        )

        /**
        * @tc.number  SUB_Location_core_sendCommand_1000
        * @tc.name  SUB_Location_core_sendCommand_1000
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_sendCommand_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
          async (done:() => void): Promise<void> => {
            let locationCommand: geoLocationManager.LocationCommand ={
              "scenario": geoLocationManager.LocationRequestScenario.NO_POWER,
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
              console.info('[lbs_js] SUB_Location_core_sendCommand_1000 try err is:' + JSON.stringify(error));
              expect().assertFail();
            }
          }
        )

        /**
        * @tc.number  SUB_Location_core_getCountryCode_0100
        * @tc.name  SUB_Location_core_getCountryCode_0100
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_getCountryCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
          async (done: () => void): Promise<void> => {
            try{
              geoLocationManager.getCountryCode().then((CountryCode) => {
                expect(CountryCode != null).assertTrue();
                console.info("SUB_Location_core_getCountryCode_0100 ======>country", typeof CountryCode.country)
                expect(typeof CountryCode.country).assertEqual("string");
                console.info("SUB_Location_core_getCountryCode_0100 ======>type", typeof CountryCode.type)
                expect(typeof CountryCode.type).assertEqual("int");
                done();
              }).catch((error) => {
                expect(error.code).assertEqual(801);
                done();
              })
            }catch(error){
              console.info('[lbs_js] SUB_Location_core_getCountryCode_0100 try err is:' + JSON.stringify(error));
              expect().assertFail();
            }
          }
        )

        /**
        * @tc.number  SUB_Location_core_getCountryCode_0200
        * @tc.name  SUB_Location_core_getCountryCode_0200
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_getCountryCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
            async (done: () => void): Promise<void> => {
                try{
                    geoLocationManager.getCountryCode((err, data) => {
                        if(err != null){
                            expect(err.code).assertEqual(401);
                            done();
                        }else{
                            expect(data != null).assertTrue();
                            if (data !== null && data !== undefined){
                              console.info("SUB_Location_core_getCountryCode_0200 ======>country", typeof data.country)
                              expect(typeof data.country).assertEqual("string");
                              console.info("SUB_Location_core_getCountryCode_0200 ======>type", typeof data.type)
                              expect(typeof data.type).assertEqual("int");
                            }
                            done();
                        }
                    })
                }catch(error){
                    console.info('[lbs_js] SUB_Location_core_getCountryCode_0200 try err is:' + JSON.stringify(error));
                }
            }
        )

        /**
        * @tc.number  SUB_Location_core_getCountryCode_0300
        * @tc.name  SUB_Location_core_getCountryCode_0300
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_getCountryCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
            async (done: () => void): Promise<void> => {
                try{
                    geoLocationManager.getCountryCode((err, data) => {
                        if(err != null){
                            expect(err.code).assertEqual(801);
                            done();
                        }else{
                            expect(data != null).assertTrue();
                            done();
                        }
                    })
                }catch(error){
                    console.info('[lbs_js] SUB_Location_core_getCountryCode_0300 try err is:' + JSON.stringify(error));
                    expect(error.code).assertEqual(801);
                }
            }
        )

        /**
        * @tc.number  SUB_Location_core_getDistanceBetweenLocations_0100
        * @tc.name  SUB_Location_core_getDistanceBetweenLocations_0100
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_getDistanceBetweenLocations_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
          async (done: () => void): Promise<void> => {
            try {
              let location1: geoLocationManager.Location = {
                "latitude": 30.12,
                "longitude": 120.11,
                "altitude": 0,
                "accuracy": 0,
                "speed": 0,
                "timeStamp": 0,
                "direction": 0,
                "timeSinceBoot": 0,
                "additionSize": 0
              }
              let location2: geoLocationManager.Location = {
                "latitude": 30.12,
                "longitude": 120.11,
                "altitude": 0,
                "accuracy": 0,
                "speed": 0,
                "timeStamp": 0,
                "direction": 0,
                "timeSinceBoot": 0,
                "additionSize": 0
              }
              let distance = geoLocationManager.getDistanceBetweenLocations(location1, location2);
              console.info("distance:" + distance);
              expect(distance != null).assertTrue();
              done();
            } catch (error) {
              console.error("SUB_Location_core_getDistanceBetweenLocations_0100: errCode" + error.code + ", errMessage" + error.message);
              expect(error.code).assertEqual(401);
              done();
            }
          }
        )

        /**
         * @tc.number  Sub_Location_core_onBluetoothScanResultChange_0200
         * @tc.name  Sub_Location_core_onBluetoothScanResultChange_0200
         * @tc.desc  onBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onBluetoothScanResultChange_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('Sub_Location_core_onBluetoothScanResultChange_0200: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
                console.info("Sub_Location_core_onBluetoothScanResultChange_0200 ======>deviceId", typeof result.deviceId)
                expect(typeof result.deviceId).assertEqual("string");
                console.info("Sub_Location_core_onBluetoothScanResultChange_0200 ======>rssi", typeof result.rssi)
                expect(typeof result.rssi).assertEqual("number");
                if (result.data) {
                  console.info("Sub_Location_core_onBluetoothScanResultChange_0200 ======>data", typeof result.data)
                  expect(result.data instanceof Array);
                }
                console.info("Sub_Location_core_onBluetoothScanResultChange_0200 ======>deviceName", typeof result.deviceName)
                expect(typeof result.deviceName).assertEqual("string");
                console.info("Sub_Location_core_onBluetoothScanResultChange_0200 ======>connectable", typeof result.connectable)
                expect(typeof result.connectable).assertEqual("boolean");
              };
              try {
                geoLocationManager.onBluetoothScanResultChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_onBluetoothScanResultChange_0200 errCode:" + err.code + ", message:" + err.message);
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
                if (state){
                  expect(state).assertTrue();
                } else {
                  expect(state).assertFalse();
                }
            }
            try {
                geoLocationManager.onLocationEnabledChange(state);
            } catch (err) {
                err = err as BusinessError;
                console.error("errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
            }          
          await Utils.msSleep(1000)
          done();
        })

        /**
        * @tc.number  SUB_core_isLocationEnabled_0100
        * @tc.name  SUB_core_isLocationEnabled_0100
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_core_isLocationEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            try{
                let location = geoLocationManager.isLocationEnabled();
                expect(typeof location).assertEqual('boolean');
            }catch (error){
                error = error as BusinessError;
                expect(error.code).assertEqual(801);
            }
        })

      /**
       * @tc.name   SUB_geoLocationManager_core_isWlanBssidMatched_0100
       * @tc.number SUB_geoLocationManager_core_isWlanBssidMatched_0100
       * @tc.desc   isWlanBssidMatched
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it("SUB_geoLocationManager_core_isWlanBssidMatched_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let wlanBssidArray: Array<string> = [];
          let rssiThreshold: int = -70;
          let needStartScan: boolean = true;
          geoLocationManager.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
            console.info("Wlan Bssid Matched Result:" + res);
            expect(res).assertFalse();
            done();
          })
        } catch (err) {
          console.info('---SUB_geoLocationManager_core_isWlanBssidMatched_0100  catch ---' + typeof err.code + ',err:' + err.code);
          expect(err.code).assertEqual(801);
        }
        done();
      })

      /**
         * @tc.number  SUB_Location_core_isGnssServiceSupported_0100
         * @tc.name  SUB_Location_core_isGnssServiceSupported_0100
         * @tc.desc  isGnssServiceSupported(): boolean
         * @tc.level  Level 2
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('SUB_Location_core_isGnssServiceSupported_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let isSupported: boolean = geoLocationManager.isGnssServiceSupported();
                console.info('SUB_Location_core_isGnssServiceSupported_0100: isSupported=' + isSupported);
                expect(typeof isSupported).assertEqual('boolean');
            } catch (err) {
                console.error('SUB_Location_core_isGnssServiceSupported_0100 errCode:' + err.code + ', message:' + err.message);
                expect(err.code).assertEqual(3301000);
            }
        })

        /**
         * @tc.number  SUB_Location_core_isGnssFenceServiceSupported_0100
         * @tc.name  SUB_Location_core_isGnssFenceServiceSupported_0100
         * @tc.desc  isGnssFenceServiceSupported(): boolean
         * @tc.level  Level 2
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('SUB_Location_core_isGnssFenceServiceSupported_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let isSupported: boolean = geoLocationManager.isGnssFenceServiceSupported();
                console.info('SUB_Location_core_isGnssFenceServiceSupported_0100: isSupported=' + isSupported);
                expect(typeof isSupported).assertEqual('boolean');
            } catch (err) {
                console.error('SUB_Location_core_isGnssFenceServiceSupported_0100 errCode:' + err.code + ', message:' + err.message);
                expect(err.code).assertEqual(3301000);
            }
        })

        /**
         * @tc.number  SUB_Location_core_isCachedGnssServiceSupported_0100
         * @tc.name  SUB_Location_core_isCachedGnssServiceSupported_0100
         * @tc.desc  isCachedGnssServiceSupported(): boolean
         * @tc.level  Level 2
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('SUB_Location_core_isCachedGnssServiceSupported_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let isSupported: boolean = geoLocationManager.isCachedGnssServiceSupported();
                console.info('SUB_Location_core_isCachedGnssServiceSupported_0100: isSupported=' + isSupported);
                expect(typeof isSupported).assertEqual('boolean');
            } catch (err) {
                console.error('SUB_Location_core_isCachedGnssServiceSupported_0100 errCode:' + err.code + ', message:' + err.message);
                expect(err.code).assertEqual(3301000);
            }
        })

        /**
         * @tc.number  SUB_Location_findMatchingWlan_promiss_0100
         * @tc.name    SUB_Location_findMatchingWlan_promiss_0100
         * @tc.desc    Test findMatchingWlan with real BSSID from getCurrentWifiBssidForLocating
         * @tc.level   Level 1
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it('SUB_Location_findMatchingWlan_promiss_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
          try {
            let bssid: string = geoLocationManager.getCurrentWifiBssidForLocating();
            hilog.info(domain, tag, 'getCurrentWifiBssidForLocating: %{public}s', bssid);
            
            if (bssid === '' || bssid === undefined || bssid === null) {
                hilog.info(domain, tag, 'No BSSID available, skip test');
                done();
                return;
            }
            
            let wlanBssidArray: Array<string> = [bssid];
            let rssiThreshold: int = -100;
            let needStartScan: boolean = true;
            
            let result: Array<geoLocationManager.MatchingWlanInfo> = await geoLocationManager.findMatchingWlan(
                wlanBssidArray, rssiThreshold, needStartScan);
            hilog.info(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0100 result: %{public}s', JSON.stringify(result));
            expect(result instanceof Array).assertTrue();
            if (result.length > 0) {
              hilog.info(domain, tag, 'result[0].index: %{public}d', result[0].index);
              hilog.info(domain, tag, 'result[0].ssid: %{public}s', result[0].ssid);
              hilog.info(domain, tag, 'typeof result[0].index: %{public}s', typeof result[0].index);
              hilog.info(domain, tag, 'typeof result[0].ssid: %{public}s', typeof result[0].ssid);
              expect(typeof result[0].index).assertEqual('int');
              expect(typeof result[0].ssid).assertEqual('string');
              expect(result[0].index >= 0).assertTrue();
              expect(result[0].index < wlanBssidArray.length).assertTrue();
            }
            done();
          } catch (err) {
            hilog.error(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0100 error: %{public}s', JSON.stringify(err));
            expect(err.code === 801).assertTrue();
            done();
          }
        });

        /**
         * @tc.number  SUB_Location_findMatchingWlan_promiss_0200
         * @tc.name    SUB_Location_findMatchingWlan_promiss_0200
         * @tc.desc    Test findMatchingWlan with empty BSSID array
         * @tc.level   Level 1
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it('SUB_Location_findMatchingWlan_promiss_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
          try {
            let wlanBssidArray: Array<string> = [];
            let rssiThreshold: int = -70;
            let needStartScan: boolean = true;
            
            let result: Array<geoLocationManager.MatchingWlanInfo> = await geoLocationManager.findMatchingWlan(
                wlanBssidArray, rssiThreshold, needStartScan);
            hilog.info(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0200 result: %{public}s', JSON.stringify(result));
            expect(result instanceof Array).assertTrue();
            expect(result.length === 0).assertTrue();
            done();
          } catch (err) {
            hilog.error(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0200 error: %{public}s', JSON.stringify(err));
            expect(err.code === 801).assertTrue();
            done();
          }
        });

        /**
         * @tc.number  SUB_Location_findMatchingWlan_promiss_0300
         * @tc.name    SUB_Location_findMatchingWlan_promiss_0300
         * @tc.desc    Test findMatchingWlan with multiple BSSIDs
         * @tc.level   Level 1
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it('SUB_Location_findMatchingWlan_promiss_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
          try {
            let wlanBssidArray: Array<string> = ['AA:BB:CC:DD:EE:FF', '11:22:33:44:55:66', 'FE:DC:BA:98:76:54'];
            let rssiThreshold: int = -80;
            let needStartScan: boolean = true;
            
            let result: Array<geoLocationManager.MatchingWlanInfo> = await geoLocationManager.findMatchingWlan(
                wlanBssidArray, rssiThreshold, needStartScan);
            hilog.info(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0300 result: %{public}s', JSON.stringify(result));
            expect(result instanceof Array).assertTrue();
            done();
          } catch (err) {
            hilog.error(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0300 error: %{public}s', JSON.stringify(err));
            expect(err.code === 801).assertTrue();
            done();
          }
        });

        /**
         * @tc.number  SUB_Location_findMatchingWlan_promiss_0400
         * @tc.name    SUB_Location_findMatchingWlan_promiss_0400
         * @tc.desc    Test findMatchingWlan with different rssiThreshold values
         * @tc.level   Level 1
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it('SUB_Location_findMatchingWlan_promiss_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
          try {
            let wlanBssidArray: Array<string> = ['AA:BB:CC:DD:EE:FF'];
            let rssiThreshold: int = -1000;
            let needStartScan: boolean = false;
            
            let result: Array<geoLocationManager.MatchingWlanInfo> = await geoLocationManager.findMatchingWlan(
                wlanBssidArray, rssiThreshold, needStartScan);
            hilog.info(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0400 result: %{public}s', JSON.stringify(result));
            expect(result instanceof Array).assertTrue();
            done();
          } catch (err) {
            hilog.error(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0400 error: %{public}s', JSON.stringify(err));
            expect(err.code === 801).assertTrue();
            done();
          }
        });

        /**
         * @tc.number  SUB_Location_findMatchingWlan_promiss_0500
         * @tc.name    SUB_Location_findMatchingWlan_promiss_0500
         * @tc.desc    Test findMatchingWlan error code 3301100 (location switch off)
         * @tc.level   Level 2
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it('SUB_Location_findMatchingWlan_promiss_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
          try {
            geoLocationManager.disableLocation()
            await Utils.msSleep(1000)
            let locationEnabled: boolean = geoLocationManager.isLocationEnabled();
            if (locationEnabled) {
                hilog.info(domain, tag, 'Location is enabled, skip error code test');
                done();
                return;
            }
            
            let wlanBssidArray: Array<string> = ['AA:BB:CC:DD:EE:FF'];
            let rssiThreshold: int = -70;
            let needStartScan: boolean = true;
            
            let result: Array<geoLocationManager.MatchingWlanInfo> = await geoLocationManager.findMatchingWlan(
                wlanBssidArray, rssiThreshold, needStartScan);
            hilog.info(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0500 result: %{public}s', JSON.stringify(result));
            done();
          } catch (err) {
            hilog.error(domain, tag, 'SUB_Location_findMatchingWlan_promiss_0500 error: %{public}s', JSON.stringify(err));
            if (err.code === 801) {
                expect(err.code === 801).assertTrue();
            } else {
                expect(err.code === 3301100).assertTrue();
            }
            done();
          }
        });

      /**
       * @tc.name   SUB_geoLocationManager_core_isWlanBssidMatched_0200
       * @tc.number SUB_geoLocationManager_core_isWlanBssidMatched_0200
       * @tc.desc   isWlanBssidMatched
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it("SUB_geoLocationManager_core_isWlanBssidMatched_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          geoLocationManager.disableLocation()
          console.info('---SUB_geoLocationManager_core_isWlanBssidMatched_0200 disableLocation');
          let wlanBssidArray: Array<string> = [];
          let rssiThreshold: int = -70;
          let needStartScan: boolean = true;
          geoLocationManager.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
            console.info("SUB_geoLocationManager_core_isWlanBssidMatched_0200 Result:" + res);
            expect(res).assertFalse();
          })
        } catch (err) {
          console.info('---SUB_geoLocationManager_core_isWlanBssidMatched_0200  catch ---' + typeof err.code + ',err:' + err.code);
          if (err.code === 801){
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(3301100);
          }
        }
        await changedLocationMode()
        console.info('---SUB_geoLocationManager_core_isWlanBssidMatched_0200 enableLocation');
        done();
      })

        




    })
}

