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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
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

let domain: int = 0x0000;
let tag: string = 'location';
const TEST_SUIT_NAME = 'ActslocationTest'
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
  describe('actslocationTest', () => {
    beforeAll(async() => {
      await changedLocationMode()
      await Utils.msSleep(2000);
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number  Sub_Location_onLocationChange_0100
     * @tc.name  Sub_Location_onLocationChange_0100
     * @tc.desc  onLocationChange(request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_onLocationChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let request: geoLocationManager.ContinuousLocationRequest = {
        'interval': 1,
        'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
      };
      let locationCallback = (location: geoLocationManager.Location): void => {
        console.info('locationCallback: data: ' + JSON.stringify(location));
        expect(true).assertEqual(location != null);
      };
      try {
        geoLocationManager.onLocationChange(request, locationCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
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
    it('Sub_Location_offLocationChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      let requestInfo: geoLocationManager.LocationRequest = {
        'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
        'scenario': geoLocationManager.LocationRequestScenario.UNSET,
        'timeInterval': 1,
        'distanceInterval': 0,
        'maxAccuracy': 0
      };
      let locationChange = (location: geoLocationManager.Location): void => {
        console.info('locationChange: data: ' + JSON.stringify(location));
        expect(true).assertEqual(location != null);
      };
      try {
        geoLocationManager.offLocationChange(locationChange);
      } catch (err) {
        err = err as BusinessError;
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
    it('Sub_Location_onLocationError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        expect(true).assertEqual(errcode != null);
      };
      try {
        geoLocationManager.onLocationError(locationErrorChange);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
        done();
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
    it('Sub_Location_offLocationError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
        console.info('locationErrorChange: data: ' + JSON.stringify(errcode));
        expect(true).assertEqual(errcode != null);
      };
      try {
        geoLocationManager.offLocationError(locationErrorChange);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
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
    it('Sub_Location_onSatelliteStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
        expect(true).assertEqual(satelliteStatusInfo != null);
        // 表示卫星个数
        let totalNumber: number = satelliteStatusInfo.satellitesNumber;
        let satelliteIds: Array<Int> = satelliteStatusInfo.satelliteIds;
        let carrierToNoiseDensitys: Array<number> = satelliteStatusInfo.carrierToNoiseDensitys;
        let altitudes: Array<number> = satelliteStatusInfo.altitudes;
        let azimuths: Array<number> = satelliteStatusInfo.azimuths;
        let carrierFrequencies: Array<number> = satelliteStatusInfo.carrierFrequencies;
        let satelliteConstellations: Array<geoLocationManager.SatelliteConstellationCategory> | undefined = satelliteStatusInfo.satelliteConstellation;
        let satelliteAdditionalInfos: Array<Int> | undefined = satelliteStatusInfo.satelliteAdditionalInfo;
        for (let i = 0; i < totalNumber; i++) {
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
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
        done();
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
    it('Sub_Location_offSatelliteStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
        expect(true).assertEqual(satelliteStatusInfo != null);
      }
      try {
        geoLocationManager.offSatelliteStatusChange(gnssStatusCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
        done();
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
    it('Sub_Location_onNmeaMessage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let nmeaCb = (str: string): void => {
        console.info('nmeaMessage: ' + JSON.stringify(str));
        expect(true).assertEqual(str != null);
      }
      try {
        geoLocationManager.onNmeaMessage(nmeaCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
        done();
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
    it('Sub_Location_offNmeaMessage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let nmeaCb = (str: string): void => {
        console.info('nmeaMessage: ' + JSON.stringify(str));
        expect(true).assertEqual(str != null);
        done();
      }
      try {
        geoLocationManager.offNmeaMessage(nmeaCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
        done();
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
    it('Sub_Location_onBluetoothScanResultChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callback = (result: geoLocationManager.BluetoothScanResult): void => {
        console.info('bluetoothScanResultChange: ' + JSON.stringify(result));
        expect(true).assertEqual(result != null);
        done();
      };
      try {
        geoLocationManager.onBluetoothScanResultChange(callback);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
        done();
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
    it('Sub_Location_offBluetoothScanResultChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callback = (result: geoLocationManager.BluetoothScanResult): void => {
        console.info('bluetoothScanResultChange: ' + JSON.stringify(result));
        expect(true).assertEqual(result != null);
        done();
      };
      try {
        geoLocationManager.offBluetoothScanResultChange(callback);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(201);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.number  Sub_Location_getCurrentLocation_0100
     * @tc.name  Sub_Location_getCurrentLocation_0100
     * @tc.desc  getCurrentLocation(request: CurrentLocationRequest | SingleLocationRequest, callback: AsyncCallback<Location>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_getCurrentLocation_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let requestInfo: geoLocationManager.CurrentLocationRequest = {
        'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
        'scenario': geoLocationManager.LocationRequestScenario.UNSET,
        'maxAccuracy': 0
      };
      try {
        geoLocationManager.getCurrentLocation(requestInfo, (err: BusinessError<void> | null, location: geoLocationManager.Location | undefined) => {
          if (location) {
            expect(true).assertEqual(location != null);
            console.info('locationChange: location=' + JSON.stringify(location));
            done();
          }
          if (err) {
            console.error('locationChange: err=' + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          }
        });
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.number  Sub_Location_getCurrentLocation_0200
     * @tc.name  Sub_Location_getCurrentLocation_0200
     * @tc.desc  getCurrentLocation(callback: AsyncCallback<Location>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_getCurrentLocation_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        geoLocationManager.getCurrentLocation((err: BusinessError<void> | null, location: geoLocationManager.Location | undefined) => {
          if (location) {
            expect(true).assertEqual(JSON.stringify(location) != null);
            console.info('locationChange: location=' + JSON.stringify(location));
            done();
          }
          if (err) {
            console.error('locationChange: err=' + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          }
        });
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.number  Sub_Location_getCurrentLocation_0300
     * @tc.name  Sub_Location_getCurrentLocation_0300
     * @tc.desc  getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_getCurrentLocation_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let request: geoLocationManager.SingleLocationRequest = {
        'locatingTimeoutMs': 10000,
        'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_ACCURACY
      };
      try {
        geoLocationManager.getCurrentLocation(request).then((location) => {
          expect(location != null).assertTrue();
          done();
        }).catch((err) => {
          if (err instanceof BusinessError) {
            console.error('promise, getCurrentLocation: error=' + err.code + err.message);
            done();
          }
          if (err.code === 201) {
            expect(err.code === 201).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        done();
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
    it('SUB_Location_getLastLocation_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let location = geoLocationManager.getLastLocation();
        expect(location != null).assertTrue();
        done();
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        if (err.code === 3301200) {
          expect(err.code === 3301200).assertTrue();
          done();
        } else {
          expect(err.code).assertEqual(201);
          done();
        }
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
          geofenceTransitionCallback: (err: BusinessError<void> | null, transition: geoLocationManager.GeofenceTransition | undefined) => {
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
            console.info("addGnssGeofence_0100 success, fence id: " + id);
            expect(true).assertEqual(id != null);
            done();
          }).catch((err) => {
            console.error("addGnssGeofence_0100 failed, promise errCode:" + (err as BusinessError).code + ",errMessage:" + (err as BusinessError).message);
            expect(err.code).assertEqual(201);
            done();
          });
          done();
        } catch (error) {
          console.error("addGnssGeofence_0100 failed, err:" + JSON.stringify(error));
          done();
        }
        done();
      }
    })

    /**
     * @tc.number  Sub_Location_removeGnssGeofence_0100
     * @tc.name  Sub_Location_removeGnssGeofence_0100
     * @tc.desc  removeGnssGeofence(geofenceId: number): Promise<void>
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('Sub_Location_removeGnssGeofence_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fenceId = 1;
      try {
        geoLocationManager.removeGnssGeofence(fenceId).then(() => {
          console.info("removeGnssGeofence success fenceId:" + fenceId);
          expect(true).assertEqual(fenceId != null);
          done();
        }).catch((err) => {
          if (err instanceof BusinessError) {
            console.error("removeGnssGeofence: error=" + err.code + err.message);
            expect(err.code).assertEqual(201);
            done();
          }
        });
      } catch (error) {
        console.error("removeGnssGeofence: error=" + JSON.stringify(error));
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
    * @tc.number  SUB_Location_getCurrentWifiBssidForLocating_0100
    * @tc.name  SUB_Location_getCurrentWifiBssidForLocating_0100
    * @tc.desc  getCurrentWifiBssidForLocating(): string
    * @tc.level  Level 2
    * @tc.type  Function
    * @tc.size  MEDIUMTEST
    */
    it('SUB_Location_getCurrentWifiBssidForLocating_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
      console.info("SUB_Location_getCurrentWifiBssidForLocating_0100: " + isAccessToken);
      if (!isAccessToken) {
        console.info("The device does not support Gnss");
        expect(isAccessToken).assertFalse();
        done();
      } else {
        try {
          let getCurrentWifiBssidForLocating = geoLocationManager.getCurrentWifiBssidForLocating();
          console.info('[lbs_js] getCurrentWifiBssidForLocating_0100 result is:' + JSON.stringify(getCurrentWifiBssidForLocating));
          expect(getCurrentWifiBssidForLocating != null).assertTrue();
          done();
        } catch (error) {
          console.info('[lbs_js] getCurrentWifiBssidForLocating_0100 catch err is:' + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
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
      let isAccessToken = canIUse("SystemCapability.Location.Location.Gnss");
      console.info("SUB_Location_getActiveGeoFences_0100: " + isAccessToken);
      if (!isAccessToken) {
        console.info("The device does not support Gnss");
        expect(isAccessToken).assertFalse();
      } else {
        try {
          geoLocationManager.getActiveGeoFences().then((res) => {
            if (res) {
              console.info("SUB_Location_getActiveGeoFences_0100 fence num:" + res.size);
              expect(true).assertEqual(res != null);
              done();
            }
          }).catch((error) => {
            console.error('promise, SUB_Location_getActiveGeoFences_0100: error=' + error.code);
            expect(error.code).assertEqual(201);
            done();
          });
        } catch (error) {
          console.error("SUB_Location_getActiveGeoFences_0100: errCode" + error.code + ", errMessage" + error.message);
          expect().assertFalse();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_Location_isWlanBssidMatched_nop_test_001
     * @tc.number SUB_Location_isWlanBssidMatched_nop_test_001
     * @tc.desc   isWlanBssidMatched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Location_isWlanBssidMatched_nop_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let wlanBssidArray: Array<string> = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
        let bssid = geoLocationManager.getCurrentWifiBssidForLocating();
        console.info("getCurrentWifiBssidForLocating_0100" + bssid);
        if (bssid) {
          wlanBssidArray.push(bssid);
        } else {
          console.info("get bssid fail");
        }
        let rssiThreshold: int = -70;
        let needStartScan: boolean = true;
        geoLocationManager.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
          console.info("Wlan Bssid Matched Result:" + res);
          expect(res).assertTrue();
          done();
        })
      } catch (err) {
        console.info('---SUB_Location_isWlanBssidMatched_nop_test_001  catch ---' + typeof err.code + ',err:' + err.code);
        if (err.code === 201) {
          expect(err.code).assertEqual(201);
          console.info('---SUB_Location_isWlanBssidMatched_nop_test_001  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_geolocation_getCachedGnssLocationsSize_nop_test_001
     * @tc.number SUB_geolocation_getCachedGnssLocationsSize_nop_test_001
     * @tc.desc   Using the geolocation.getCachedGnssLocationsSize method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_geolocation_getCachedGnssLocationsSize_nop_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        geoLocationManager.getCachedGnssLocationsSize((size) => {
          console.info('SUB_geolocation_getCachedGnssLocationsSize_nop_test_001 getCachedGnssLocationsSize: size=' + JSON.stringify(size));
          expect().assertFalse();
          done();
        });
      } catch (err) {
        console.info('---SUB_geolocation_getCachedGnssLocationsSize_nop_test_001 catch end---' + err.code);
        if (err.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('SUB_geolocation_getCachedGnssLocationsSize_nop_test_001 end');
      done();
    });

    /**
     * @tc.name   SUB_geolocation_getCachedGnssLocationsSize_nop_test_002
     * @tc.number SUB_geolocation_getCachedGnssLocationsSize_nop_test_002
     * @tc.desc   Using the geolocation.getCachedGnssLocationsSize method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_geolocation_getCachedGnssLocationsSize_nop_test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        geoLocationManager.getCachedGnssLocationsSize().then((result) => {
          console.info('SUB_geolocation_getCachedGnssLocationsSize_nop_test_002 promise, getCachedGnssLocationsSize: ' + JSON.stringify(result));
          expect().assertFalse();
          done();
        }).catch((error) => {
          console.info('SUB_geolocation_getCachedGnssLocationsSize_nop_test_002 promise, getCachedGnssLocationsSize: error=' + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info('---SUB_geolocation_getCachedGnssLocationsSize_nop_test_002 catch end---' + err.code);
        expect().assertFail();
        done();
      }
      done();
    });

    /**
     * @tc.name   SUB_geolocation_flushCachedGnssLocations_nop_test_001
     * @tc.number SUB_geolocation_flushCachedGnssLocations_nop_test_001
     * @tc.desc   Using the geolocation.flushCachedGnssLocations method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_geolocation_flushCachedGnssLocations_nop_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        geoLocationManager.flushCachedGnssLocations((err) => {
          if (err) {
            console.info('SUB_geolocation_flushCachedGnssLocations_nop_test_001 flushCachedGnssLocations: err=' + JSON.stringify(err));
            expect(err === undefined).assertFalse();
            done();
          }
        });
      } catch (err) {
        console.info('---SUB_geolocation_flushCachedGnssLocations_nop_test_001 catch end---' + err.code);
        expect(err.code).assertEqual(201);
        console.info('SUB_geolocation_flushCachedGnssLocations_nop_test_001 end');
        done();
      }
      done();
    });

    /**
     * @tc.name   SUB_geolocation_flushCachedGnssLocations_nop_test_002
     * @tc.number SUB_geolocation_flushCachedGnssLocations_nop_test_002
     * @tc.desc   Using the geolocation.flushCachedGnssLocations method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_geolocation_flushCachedGnssLocations_nop_test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        geoLocationManager.flushCachedGnssLocations().then(() => {
          console.info('SUB_geolocation_flushCachedGnssLocations_nop_test_002 promise, flushCachedGnssLocations: success');
          done();
        }).catch((error) => {
          console.info('SUB_geolocation_flushCachedGnssLocations_nop_test_002 promise, getCachedGnssLocationsSize: error=' + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info('---SUB_geolocation_flushCachedGnssLocations_nop_test_002 catch end---' + err.code);
        expect().assertFail();
        done();
      }
      done();
    });

    /**
     * @tc.number  SUB_Location_nop_onCachedGnssLocationsChange_0100
     * @tc.name  SUB_Location_nop_onCachedGnssLocationsChange_0100
     * @tc.desc  onCachedGnssLocationsChange(request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('SUB_Location_nop_onCachedGnssLocationsChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let request: geoLocationManager.CachedGnssLocationsRequest = {
          'reportingPeriodSec': 1000,
          'wakeUpCacheQueueFull': true
      };
      
      let callback = (result: Array<geoLocationManager.Location>): void => {
          console.info('SUB_Location_nop_onCachedGnssLocationsChange_0100: locations=' + JSON.stringify(result));
      };
      
      try {
          geoLocationManager.onCachedGnssLocationsChange(request, callback);
          expect().assertFail();
      } catch (err) {
          console.error("SUB_Location_nop_onCachedGnssLocationsChange_0100 errCode:" + err.code + ", message:" + err.message);
          expect(err.code).assertEqual(201);
      }
      await Utils.msSleep(1000);
      done();
  })

    /**
     * @tc.name   SUB_Location_nop_offCachedGnssLocationsChange_0100
     * @tc.number SUB_Location_nop_offCachedGnssLocationsChange_0100
     * @tc.desc   Using the offCachedGnssLocationsChange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Location_nop_offCachedGnssLocationsChange_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cachedLocationsCb = (locations: Array<geoLocationManager.Location>): void => {
        console.log('cachedGnssLocationsChange: locations: ' + JSON.stringify(locations));
      }
      let requestInfo: geoLocationManager.CachedGnssLocationsRequest = {
        'reportingPeriodSec': 10, 'wakeUpCacheQueueFull': true
      };
      try {
        geoLocationManager.onCachedGnssLocationsChange(requestInfo, cachedLocationsCb);
        geoLocationManager.offCachedGnssLocationsChange();
        expect(cachedLocationsCb != null).assertTrue();
        done();
      } catch (err) {
        console.info('---SUB_Location_nop_offCachedGnssLocationsChange_0100  catch ---' + typeof err.code + ',err:' + err.code);
        expect(err.code).assertEqual(201);
      }
      console.info('SUB_Location_nop_offCachedGnssLocationsChange_0100 end');
      done();
    })

    /**
     * @tc.number  SUB_Location_nop_setLocationSwitchIgnored_0100
     * @tc.name  SUB_Location_nop_setLocationSwitchIgnored_0100
     * @tc.desc  setLocationSwitchIgnored(isIgnored: boolean): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('SUB_Location_nop_setLocationSwitchIgnored_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        geoLocationManager.setLocationSwitchIgnored(true);
        expect().assertFail();
      } catch (err) {
        console.info('---SUB_Location_nop_setLocationSwitchIgnored_0100 catch end---' + err.code);
        expect(err.code).assertEqual(201);
      }
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.number  SUB_Location_nop_enableLocationMock_0100
     * @tc.name  SUB_Location_nop_enableLocationMock_0100
     * @tc.desc  enableLocationMock(): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
     */
    it('SUB_Location_nop_enableLocationMock_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        geoLocationManager.enableLocationMock();
        expect().assertFail();
      } catch (err) {
        console.info('---SUB_Location_nop_enableLocationMock_0100 catch end---' + err.code);
        expect(err.code).assertEqual(201);
      }
      await Utils.msSleep(1000);
      done();
      })

    /**
     * @tc.number  SUB_Location_nop_findMatchingWlan_0100
     * @tc.name    SUB_Location_nop_findMatchingWlan_0100
     * @tc.desc    Test findMatchingWlan error code 201
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it('SUB_Location_nop_findMatchingWlan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
        hilog.info(domain, tag, 'SUB_Location_nop_findMatchingWlan_0100 result: %{public}s', JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        hilog.error(domain, tag, 'SUB_Location_nop_findMatchingWlan_0100 error: %{public}s', JSON.stringify(err));
        if (err.code === 801) {
            expect(err.code === 801).assertTrue();
        } else {
            expect(err.code === 201).assertTrue();
        }
        done();
      }
      });






  })
}