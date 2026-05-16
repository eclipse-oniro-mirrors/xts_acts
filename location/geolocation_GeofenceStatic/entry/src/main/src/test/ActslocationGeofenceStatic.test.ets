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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, Hypium, beforeEach } from "../../../hypium/index";
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
            console.error('enableLocation: err=' + JSON.stringify(err));
          }
        });
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
      }
    }
  };

export async function disableLocationMode() {
  try {
    geoLocationManager.disableLocation()
  } 
  catch (error) {
    console.info("[lbs_js] disableLocationMode error." + JSON.stringify(error));
    expect().assertFail();
  }
}

export default function actslocationTest() {

    describe("actslocationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async() => {
          await changedLocationMode()
          hilog.info(domain, tag, 'beforeAll start');
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          hilog.info(domain, tag, 'beforeAll AbilityDelegator');
          abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.location.geolocation.geofence")
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

        afterAll(async() => {
          await changedLocationMode()
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
        * @tc.number  SUB_Location_GF_addGnssGeofence_0100
        * @tc.name  SUB_Location_GF_addGnssGeofence_0100
        * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_GF_addGnssGeofence_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let isAccessToken = canIUse("SystemCapability.Location.Location.Geofence");
            console.info("SUB_Location_GF_addGnssGeofence_0100: " + isAccessToken);
            if (!isAccessToken) {
                console.info("SUB_Location_GF_addGnssGeofence_0100 The device does not support Geofence");
                expect(isAccessToken).assertFalse();
                done();
            } else {
                let geofence: geoLocationManager.Geofence = {
                    "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0, "coordinateSystemType": geoLocationManager.CoordinateSystemType.GCJ02
                }
                let transitionStatusList: Array<geoLocationManager.GeofenceTransitionEvent> = [];
                let notificationRequestList: Array<notificationManager.NotificationRequest> =[];
                let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
                    geofence: geofence,
                    monitorTransitionEvents: transitionStatusList,
                    notifications: notificationRequestList,
                    loiterTimeMs: 10000,
                    fenceExtensionAbilityName: "",
                    geofenceTransitionCallback: (err: BusinessError<void>|null, transition: geoLocationManager.GeofenceTransition|undefined) => {
                    if (err) {
                        console.error('SUB_Location_GF_addGnssGeofence_0100 geofenceTransitionCallback: err=' + JSON.stringify(err));
                        expect().assertFalse();
                    }
                    if (transition) {
                        console.info("SUB_Location_GF_addGnssGeofence_0100 GeofenceTransition: %{public}s", JSON.stringify(transition));
                        expect(transition !== null).assertTrue();
                    }
                    }
                }
                try {
                    geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                    console.info("SUB_Location_GF_addGnssGeofence_0100 success, fence id: " + id);
                    expect(typeof id).assertEqual("int");
                    }).catch((err) => {
                    console.error("SUB_Location_GF_addGnssGeofence_0100 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                    if (err.code === 801){
                      expect(err.code).assertEqual(801);
                    } else {
                      expect(err.code).assertEqual(401);
                    }
                    });
                    done();
                } catch (error) {
                    console.error("SUB_Location_GF_addGnssGeofence_0100 failed, err:" + JSON.stringify(error));
                    if (error.code === 801){
                      expect(error.code).assertEqual(801);
                    } else {
                      expect(error.code).assertEqual(401);
                    }
                } 
                done();
            }
            }
        )

        /**
        * @tc.number  SUB_Location_GF_addGnssGeofence_0200
        * @tc.name  SUB_Location_GF_addGnssGeofence_0200
        * @tc.desc  addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_GF_addGnssGeofence_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let isAccessToken = canIUse("SystemCapability.Location.Location.Geofence");
            console.info("SUB_Location_GF_addGnssGeofence_0200: " + isAccessToken);
            if (!isAccessToken) {
                console.info("SUB_Location_GF_addGnssGeofence_0200 The device does not support Geofence");
                expect(isAccessToken).assertFalse();
                done();
            } else {
                await disableLocationMode()
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
                        console.error('SUB_Location_GF_addGnssGeofence_0200 geofenceTransitionCallback: err=' + JSON.stringify(err));
                        expect().assertFalse();
                    }
                    if (transition) {
                        console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition: %{public}s", JSON.stringify(transition));
                        expect(transition !== null).assertTrue();
                        console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>geofenceId ", typeof transition.geofenceId);
                        expect(typeof transition.geofenceId).assertEqual("int");
                        console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>transitionEvent ", JSON.stringify(transition.transitionEvent));
                        expect(transition.transitionEvent !== null).assertTrue();
                        if (transition.beaconFence !== null && transition.beaconFence !== undefined) {
                          console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>beaconFence ", JSON.stringify(transition.beaconFence));
                          expect(transition.beaconFence !== null).assertTrue();

                          console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>beaconFence.identifier ", JSON.stringify(transition.beaconFence?.identifier));
                          expect(typeof transition.beaconFence?.identifier).assertEqual("string");
                          console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>beaconFence.beaconFenceInfoType ", JSON.stringify(transition.beaconFence?.beaconFenceInfoType));
                          expect(transition.beaconFence?.beaconFenceInfoType !== null).assertTrue();
                          if (transition.beaconFence?.manufactureData !== null && transition.beaconFence?.manufactureData !== undefined) 
                            console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>beaconFence.manufactureData ", JSON.stringify(transition.beaconFence?.manufactureData?.manufactureData));
                            expect(transition.beaconFence?.manufactureData?.manufactureData !== null).assertTrue();
                            console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>beaconFence.manufactureData.manufactureId ", JSON.stringify(transition.beaconFence?.manufactureData?.manufactureId));
                            expect(typeof transition.beaconFence?.manufactureData?.manufactureId).assertEqual("int");
                            console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>beaconFence.manufactureData.manufactureData ", JSON.stringify(transition.beaconFence?.manufactureData?.manufactureData));
                            expect(transition.beaconFence?.manufactureData?.manufactureData !== null).assertTrue();
                            console.info("SUB_Location_GF_addGnssGeofence_0200 GeofenceTransition======>beaconFence.manufactureData.manufactureDataMask ", JSON.stringify(transition.beaconFence?.manufactureData?.manufactureDataMask));
                            expect(transition.beaconFence?.manufactureData?.manufactureDataMask !== null).assertTrue();
                          }
                        }
                    }
                    
                }
                try {
                    console.info("SUB_Location_GF_addGnssGeofence_0200 ======>loiterTimeMs ", typeof gnssGeofenceRequest.loiterTimeMs);
                    expect(typeof gnssGeofenceRequest.loiterTimeMs).assertEqual("int");
                    console.info("SUB_Location_GF_addGnssGeofence_0200 ======>fenceExtensionAbilityName ", typeof gnssGeofenceRequest.fenceExtensionAbilityName);
                    expect(typeof gnssGeofenceRequest.fenceExtensionAbilityName).assertEqual("string");
                    geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
                    console.info("SUB_Location_GF_addGnssGeofence_0200 success, fence id: " + id);
                    expect(true).assertEqual(id!=null);
                    }).catch((err) => {
                    console.error("SUB_Location_GF_addGnssGeofence_0200 failed, promise errCode:" + (err as BusinessError).code +",errMessage:" + (err as BusinessError).message);
                    expect(err.code).assertEqual(3301100);
                    });
                    done();
                } catch (error) {
                    console.error("SUB_Location_GF_addGnssGeofence_0200 failed, err:" + JSON.stringify(error));
                    expect(error.code).assertEqual(3301100);
                } 
                await changedLocationMode()
                done();
            }
            }
        )

        /**
        * @tc.number  SUB_GeoFence_getGeofenceSupportedCoordTypes_0100
        * @tc.name  SUB_GeoFence_getGeofenceSupportedCoordTypes_0100
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_GeoFence_getGeofenceSupportedCoordTypes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            try{
                let supportedCoordTypes: Array<geoLocationManager.CoordinateSystemType> = geoLocationManager.getGeofenceSupportedCoordTypes();
                console.info("SUB_GeoFence_getGeofenceSupportedCoordTypes_0100 success, supportedCoordTypes: " + JSON.stringify(supportedCoordTypes));
                if (supportedCoordTypes.length == 0) {
                  expect(supportedCoordTypes.length == 0).assertFalse();
                } else {
                  expect(supportedCoordTypes.length > 0).assertTrue();
                }
            }catch(error){
                error = error as BusinessError;
                expect(error.code).assertEqual(801);
            }
        })

        /**
        * @tc.number  SUB_GeoFence_Geofencerequestconfig_0100
        * @tc.name  SUB_GeoFence_Geofencerequestconfig_0100
        * @tc.desc  Test Location API functionality
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_GeoFence_Geofencerequestconfig_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            try{
              let manufactureDataBuffer: Uint8Array = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X55,
                0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X55]);
              let manufactureDataMaskBuffer: Uint8Array = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
                0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);

              let manufactureData: geoLocationManager.BeaconManufactureData = {
                manufactureId: 12,
                manufactureData: manufactureDataBuffer.buffer,
                manufactureDataMask: manufactureDataMaskBuffer.buffer
              };
              let geofence: geoLocationManager.Geofence = {
                  "latitude": 34.12, "longitude": 124.11, "radius": 10000.0, "expiration": 10000.0
              }
              let Geofencerequest: geoLocationManager.GeofenceRequest = {
                  scenario: geoLocationManager.LocationRequestScenario.NAVIGATION,
                  geofence: geofence
              }
              console.info("SUB_GeoFence_Geofencerequestconfig_0100 ======>beacon ", JSON.stringify(manufactureData.manufactureId));
              console.info("SUB_GeoFence_Geofencerequestconfig_0100 ======>geofence ", JSON.stringify(Geofencerequest.geofence));
              expect(typeof manufactureData.manufactureId).assertEqual("int");
            }catch(error){
              console.info("SUB_GeoFence_Geofencerequestconfig_0100 error: ", error.code);
              expect(error.code !== null).assertTrue();
            }
        })

        /**
         * @tc.number  Sub_Geofence_removeGnssGeofence_0100
         * @tc.name  Sub_Geofence_removeGnssGeofence_0100
         * @tc.desc  removeGnssGeofence(geofenceId: number): Promise<void>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Geofence_removeGnssGeofence_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let fenceId = 1;
            try {
              geoLocationManager.removeGnssGeofence(fenceId).then(() => {
                console.info("Sub_Geofence_removeGnssGeofence_0100 success fenceId:" + fenceId);
                expect(true).assertEqual(fenceId!=null);
              }).catch((err) => {
                if (err instanceof BusinessError) {
                  console.error("Sub_Geofence_removeGnssGeofence_0100: error=" + err.code + err.message);
                  expect(err.code).assertEqual(801);
                }
              });
            } catch (error) {
              console.error("Sub_Geofence_removeGnssGeofence_0100: error=" + JSON.stringify(error));
              expect(error.code).assertEqual(801);
            }
            await Utils.msSleep(1000)
            done();
        })  






    })
}