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

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'location'; //日志标识字符串,作为tag标识当前runner类下的测试行为
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

  describe("actslocationTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async () => {
      await changedLocationMode()
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.location.geolocation.gnss")
      await Utils.msSleep(4000);
      g_context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'get UIAbilityContext end');
      try {
        await Utils.msSleep(2000);
        hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION')
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
      await Utils.msSleep(1000);
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
        console.info("Sub_Location_onSatelliteStatusChange_0100 ======>satellitesNumber ", typeof satelliteStatusInfo.satellitesNumber)
        expect(satelliteStatusInfo.satellitesNumber instanceof int);
        console.info("Sub_Location_onSatelliteStatusChange_0100 ======>satelliteIds ", typeof satelliteStatusInfo.satelliteIds)
        expect(satelliteStatusInfo.satelliteIds instanceof Array);
        console.info("Sub_Location_onSatelliteStatusChange_0100 ======>carrierToNoiseDensitys ", typeof satelliteStatusInfo.carrierToNoiseDensitys)
        expect(satelliteStatusInfo.carrierToNoiseDensitys instanceof Array);
        console.info("Sub_Location_onSatelliteStatusChange_0100 ======>altitudes ", typeof satelliteStatusInfo.altitudes)
        expect(satelliteStatusInfo.altitudes instanceof Array);
        console.info("Sub_Location_onSatelliteStatusChange_0100 ======>azimuths ", typeof satelliteStatusInfo.azimuths)
        expect(satelliteStatusInfo.azimuths instanceof Array);
        console.info("Sub_Location_onSatelliteStatusChange_0100 ======>carrierFrequencies ", typeof satelliteStatusInfo.carrierFrequencies)
        expect(satelliteStatusInfo.carrierFrequencies instanceof Array);
        if (satelliteStatusInfo.satelliteConstellation) {
          console.info("Sub_Location_onSatelliteStatusChange_0100 ======>satelliteConstellation ", typeof satelliteStatusInfo.satelliteConstellation)
          expect(satelliteStatusInfo.satelliteConstellation instanceof Array);
        }
        if (satelliteStatusInfo.satelliteAdditionalInfo) {
          console.info("Sub_Location_onSatelliteStatusChange_0100 ======>satelliteAdditionalInfo ", typeof satelliteStatusInfo.satelliteAdditionalInfo)
          expect(satelliteStatusInfo.satelliteAdditionalInfo instanceof Array);
        }
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
        expect(err.code).assertEqual(801);
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
        console.info("Sub_Location_offSatelliteStatusChange_0100 ======>satellitesNumber ", typeof satelliteStatusInfo.satellitesNumber)
        expect(satelliteStatusInfo.satellitesNumber instanceof int);
        console.info("Sub_Location_offSatelliteStatusChange_0100 ======>satelliteIds ", typeof satelliteStatusInfo.satelliteIds)
        expect(satelliteStatusInfo.satelliteIds instanceof Array);
        console.info("Sub_Location_offSatelliteStatusChange_0100 ======>carrierToNoiseDensitys ", typeof satelliteStatusInfo.carrierToNoiseDensitys)
        expect(satelliteStatusInfo.carrierToNoiseDensitys instanceof Array);
        console.info("Sub_Location_offSatelliteStatusChange_0100 ======>altitudes ", typeof satelliteStatusInfo.altitudes)
        expect(satelliteStatusInfo.altitudes instanceof Array);
        console.info("Sub_Location_offSatelliteStatusChange_0100 ======>azimuths ", typeof satelliteStatusInfo.azimuths)
        expect(satelliteStatusInfo.azimuths instanceof Array);
        console.info("Sub_Location_offSatelliteStatusChange_0100 ======>carrierFrequencies ", typeof satelliteStatusInfo.carrierFrequencies)
        expect(satelliteStatusInfo.carrierFrequencies instanceof Array);
        if (satelliteStatusInfo.satelliteConstellation) {
          console.info("Sub_Location_offSatelliteStatusChange_0100 ======>satelliteConstellation ", typeof satelliteStatusInfo.satelliteConstellation)
          expect(satelliteStatusInfo.satelliteConstellation instanceof Array);
        }
        if (satelliteStatusInfo.satelliteAdditionalInfo) {
          console.info("Sub_Location_offSatelliteStatusChange_0100 ======>satelliteAdditionalInfo ", typeof satelliteStatusInfo.satelliteAdditionalInfo)
          expect(satelliteStatusInfo.satelliteAdditionalInfo instanceof Array);
        }
      }
      try {
        geoLocationManager.offSatelliteStatusChange(gnssStatusCb);
      } catch (err) {
        console.error("errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(801);
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
        expect(err.code).assertEqual(801);
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
        expect(err.code).assertEqual(801);
        done();
      }
      await Utils.msSleep(1000)
      done();
    })

    /**
     * @tc.name   SUB_geolocation_CachedGnssLocationsRequest_test_001
     * @tc.number SUB_geolocation_CachedGnssLocationsRequest_test_001
     * @tc.desc   Using the CachedGnssLocationsRequest method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_geolocation_CachedGnssLocationsRequest_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CachedGnssLocationsRequest: geoLocationManager.CachedGnssLocationsRequest = {
        "reportingPeriodSec": 1000,
        "wakeUpCacheQueueFull": true
      };
      try {
        if (CachedGnssLocationsRequest.reportingPeriodSec > 0) {
          expect(typeof CachedGnssLocationsRequest.reportingPeriodSec).assertEqual("int");
          expect(typeof CachedGnssLocationsRequest.wakeUpCacheQueueFull).assertEqual("boolean");
          console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 catch end---success');
          done();
        } else {
          console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 catch end---fail')
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 catch end---err:' + err.code);
        expect().assertFail();
        done();
      }
      console.info('---SUB_geolocation_CachedGnssLocationsRequest_test_001 end---');
      done();
    });

    /**
     * @tc.number  SUB_Location_onCachedGnssLocationsChange_gnss_0100
     * @tc.name  SUB_Location_onCachedGnssLocationsChange_gnss_0100
     * @tc.desc  onCachedGnssLocationsChange(request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void
     * @tc.level  Level 0
     * @tc.type  Function
     * @tc.size  MEDIUMTEST
    */
    it('SUB_Location_onCachedGnssLocationsChange_gnss_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let request: geoLocationManager.CachedGnssLocationsRequest = {
          'reportingPeriodSec': 1000,
          'wakeUpCacheQueueFull': true
      };
      
      let callbackCalled: boolean = false;
      let locations: Array<geoLocationManager.Location> = [];
      
      let callback = (result: Array<geoLocationManager.Location>): void => {
          callbackCalled = true;
          locations = result;
          console.info('SUB_Location_onCachedGnssLocationsChange_gnss_0100: locations=' + JSON.stringify(result));
          expect(result instanceof Array).assertTrue();
          
          if (result.length > 0) {
              let location: geoLocationManager.Location = result[0];
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
          }
      };
      
      try {
          geoLocationManager.onCachedGnssLocationsChange(request, callback);
      } catch (err) {
          console.error("SUB_Location_onCachedGnssLocationsChange_gnss_0100 errCode:" + err.code + ", message:" + err.message);
          expect(err.code).assertEqual(801);
      }
      
      await Utils.msSleep(1000);
      done();
  })

  /**
   * @tc.number  SUB_Location_onCachedGnssLocationsChange_gnss_0200
   * @tc.name  SUB_Location_onCachedGnssLocationsChange_gnss_0200
   * @tc.desc  onCachedGnssLocationsChange(request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void - Verify parameter error
   * @tc.level  Level 0
   * @tc.type  Function
   * @tc.size  MEDIUMTEST
   */
  it('SUB_Location_onCachedGnssLocationsChange_gnss_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let request: geoLocationManager.CachedGnssLocationsRequest = {
          'reportingPeriodSec': 0,
          'wakeUpCacheQueueFull': false
      };
      
      let callback = (result: Array<geoLocationManager.Location>): void => {
          console.info('SUB_Location_onCachedGnssLocationsChange_gnss_0200: locations=' + JSON.stringify(result));
      };
      
      try {
          geoLocationManager.onCachedGnssLocationsChange(request, callback);
          expect().assertFail();
      } catch (err) {
          console.error("SUB_Location_onCachedGnssLocationsChange_gnss_0200 errCode:" + err.code + ", message:" + err.message);
          if (err.code === 401) {
              expect(err.code).assertEqual(401);
          } else {
              expect(err.code).assertEqual(801);
          }
          
      }
      await Utils.msSleep(1000);
      done();
  })

  /**
   * @tc.number  SUB_Location_offCachedGnssLocationsChange_gnss_0100
   * @tc.name  SUB_Location_offCachedGnssLocationsChange_gnss_0100
   * @tc.desc  offCachedGnssLocationsChange(callback?: Callback<Array<Location>>): void
   * @tc.level  Level 0
   * @tc.type  Function
   * @tc.size  MEDIUMTEST
   */
  it('SUB_Location_offCachedGnssLocationsChange_gnss_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    let request: geoLocationManager.CachedGnssLocationsRequest = {
        'reportingPeriodSec': 1000,
        'wakeUpCacheQueueFull': true
    };
    
    let callback = (result: Array<geoLocationManager.Location>): void => {
        console.info('SUB_Location_offCachedGnssLocationsChange_gnss_0100: locations=' + JSON.stringify(result));
        expect(result instanceof Array).assertTrue();
    };
    
    try {
        geoLocationManager.onCachedGnssLocationsChange(request, callback);
        geoLocationManager.offCachedGnssLocationsChange(callback);
    } catch (err) {
        console.error("SUB_Location_offCachedGnssLocationsChange_gnss_0100 errCode:" + err.code + ", message:" + err.message);
        expect(err.code).assertEqual(801);
    }
    
    await Utils.msSleep(1000);
    done();
})

    /**
   * @tc.name   SUB_geolocation_getCachedGnssLocationsSize_test_0100
   * @tc.number SUB_geolocation_getCachedGnssLocationsSize_test_0100
   * @tc.desc   getCachedGnssLocationsSize(callback: AsyncCallback<number>): void
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it("SUB_geolocation_getCachedGnssLocationsSize_test_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      geoLocationManager.getCachedGnssLocationsSize((err, size) => {
        if (size !== null && size !== undefined) {
          console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0100 getCachedGnssLocationsSize: size=' + JSON.stringify(size) + ', type:' + typeof size);
          expect(typeof size).assertEqual("int");
        }
        if (err !== null && err !== undefined) {
          console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0100 getCachedGnssLocationsSize: err=' + err.code + ', type:' + typeof err);
          expect(err.code).assertEqual(801);
        }
      });
    } catch (err) {
      console.info('---SUB_geolocation_getCachedGnssLocationsSize_test_0100 catch end---' + err.code);
      expect(err.code).assertEqual(801);
    }
    console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0100 end');
    await Utils.msSleep(1000);
    done();
  });

    /**
   * @tc.name   SUB_geolocation_getCachedGnssLocationsSize_test_0300
   * @tc.number SUB_geolocation_getCachedGnssLocationsSize_test_0300
   * @tc.desc   Using the geolocation.getCachedGnssLocationsSize method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it("SUB_geolocation_getCachedGnssLocationsSize_test_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      geoLocationManager.getCachedGnssLocationsSize().then((size) => {
        console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0300 promise, getCachedGnssLocationsSize: ' + JSON.stringify(size) + ', type:' + typeof size);
        if (size !== null) {
          expect(typeof size).assertEqual("int");
        } else {
          expect().assertFail();
        }
      }).catch((error) => {
        console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0300 promise, getCachedGnssLocationsSize: error=' + error.code + JSON.stringify(error));
        expect(error.code).assertEqual(801);
      });
    } catch (err) {
      console.info('---SUB_geolocation_getCachedGnssLocationsSize_test_0300 catch end---' + err.code);
      expect(err.code).assertEqual(801);
    }
    await Utils.msSleep(1000);
    done();
  });

    /**
   * @tc.name   SUB_geolocation_flushCachedGnssLocations_test_0100
   * @tc.number SUB_geolocation_flushCachedGnssLocations_test_0100
   * @tc.desc   flushCachedGnssLocations(callback: AsyncCallback<void>): void
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it("SUB_geolocation_flushCachedGnssLocations_test_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      geoLocationManager.flushCachedGnssLocations((err) => {
        if (err) {
          console.info('SUB_geolocation_flushCachedGnssLocations_test_0100 flushCachedGnssLocations: err=' + err.code + ', type:' + typeof err);
          expect(err.code).assertEqual(801);
        } else {
          expect(err === undefined).assertTrue();
        }
    });
    } catch (err) {
      console.info('---SUB_geolocation_flushCachedGnssLocations_test_0100 catch end---' + err.code);
      expect(err.code).assertEqual(801);
      console.info('SUB_geolocation_flushCachedGnssLocations_test_0100 end');
    }
    await Utils.msSleep(1000);
    done();
  });

    /**
   * @tc.name   SUB_geolocation_flushCachedGnssLocations_test_0300
   * @tc.number SUB_geolocation_flushCachedGnssLocations_test_0300
   * @tc.desc   flushCachedGnssLocations(): Promise<void>
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it("SUB_geolocation_flushCachedGnssLocations_test_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      geoLocationManager.flushCachedGnssLocations().then(() => {
        console.info('SUB_geolocation_flushCachedGnssLocations_test_0300 promise, flushCachedGnssLocations: success');
      }).catch((error) => {
        console.info('SUB_geolocation_flushCachedGnssLocations_test_0300 promise, getCachedGnssLocationsSize: error=' + error.code + JSON.stringify(error));
        expect(error.code).assertEqual(801);
        done();
      });
    } catch (err) {
      console.info('---SUB_geolocation_flushCachedGnssLocations_test_0300 catch end---' + err.code);
      expect(err.code).assertEqual(801);
      done();
    }
    done();
  });

  /**
   * @tc.number  SUB_Location_onCachedGnssLocationsChange_gnss_0300
   * @tc.name  SUB_Location_onCachedGnssLocationsChange_gnss_0300
   * @tc.desc  onCachedGnssLocationsChange(request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void
   * @tc.level  Level 0
   * @tc.type  Function
   * @tc.size  MEDIUMTEST
   */
  it('SUB_Location_onCachedGnssLocationsChange_gnss_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      geoLocationManager.disableLocation()
      console.info('SUB_Location_onCachedGnssLocationsChange_gnss_0300: disableLocation');
      let request: geoLocationManager.CachedGnssLocationsRequest = {
          'reportingPeriodSec': 1000,
          'wakeUpCacheQueueFull': true
      };
      
      let callback = (result: Array<geoLocationManager.Location>): void => {
          console.info('SUB_Location_onCachedGnssLocationsChange_gnss_0300: locations=' + JSON.stringify(result));
      };
      
      try {
          geoLocationManager.onCachedGnssLocationsChange(request, callback);
          expect().assertFail();
      } catch (err) {
          console.error("SUB_Location_onCachedGnssLocationsChange_gnss_0300 errCode:" + err.code + ", message:" + err.message);
          if (err.code === 3301100) {
              expect(err.code).assertEqual(3301100);
          } else {
              expect(err.code).assertEqual(801);
          }
      }
      await Utils.msSleep(1000);
      done();
  })

  /**
   * @tc.number  SUB_Location_offCachedGnssLocationsChange_gnss_0200
   * @tc.name  SUB_Location_offCachedGnssLocationsChange_gnss_0200
   * @tc.desc  offCachedGnssLocationsChange(callback?: Callback<Array<Location>>): void
   * @tc.level  Level 0
   * @tc.type  Function
   * @tc.size  MEDIUMTEST
   */
  it('SUB_Location_offCachedGnssLocationsChange_gnss_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    let request: geoLocationManager.CachedGnssLocationsRequest = {
      'reportingPeriodSec': 1000,
      'wakeUpCacheQueueFull': true
    };
      let callback = (result: Array<geoLocationManager.Location>): void => {
          console.info('SUB_Location_offCachedGnssLocationsChange_gnss_0200: locations=' + JSON.stringify(result));
      };
      
      try {
          geoLocationManager.onCachedGnssLocationsChange(request, callback);
          geoLocationManager.offCachedGnssLocationsChange(callback);
          expect().assertFail();
      } catch (err) {
          console.error("SUB_Location_offCachedGnssLocationsChange_gnss_0200 errCode:" + err.code + ", message:" + err.message);
          if (err.code === 3301100) {
              expect(err.code).assertEqual(3301100);
          } else {
              expect(err.code).assertEqual(801);
          }
      }
      await Utils.msSleep(1000);
      done();
  })

  /**
   * @tc.name   SUB_geolocation_getCachedGnssLocationsSize_test_0200
   * @tc.number SUB_geolocation_getCachedGnssLocationsSize_test_0200
   * @tc.desc   Using the geolocation.getCachedGnssLocationsSize method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it("SUB_geolocation_getCachedGnssLocationsSize_test_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      geoLocationManager.getCachedGnssLocationsSize((err, size) => {
        console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0200 getCachedGnssLocationsSize: size=' + JSON.stringify(size) + ', type:' + typeof size);
        if (size !== null && size !== undefined) {
          console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0200 getCachedGnssLocationsSize: size=' + JSON.stringify(size) + ', type:' + typeof size);
          expect(typeof size).assertEqual("int");
        }
        if (err !== null && err !== undefined) {
          console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0200 getCachedGnssLocationsSize: err=' + err.code + ', type:' + typeof err);
          if (err.code === 3301100) {
            expect(err.code).assertEqual(3301100);
          } else {
            expect(err.code).assertEqual(801);
          }
        }
      });
    } catch (err) {
      console.info('---SUB_geolocation_getCachedGnssLocationsSize_test_0200 catch end---' + err.code);
      if (err.code === 3301100) {
        expect(err.code).assertEqual(3301100);
      } else {
        expect(err.code).assertEqual(801);
      }
    }
    await Utils.msSleep(1000);
    done();
  });

  /**
   * @tc.name   SUB_geolocation_getCachedGnssLocationsSize_test_0400
   * @tc.number SUB_geolocation_getCachedGnssLocationsSize_test_0400
   * @tc.desc   Using the geolocation.getCachedGnssLocationsSize method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it("SUB_geolocation_getCachedGnssLocationsSize_test_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      geoLocationManager.getCachedGnssLocationsSize().then((size) => {
        console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0400 promise, getCachedGnssLocationsSize: ' + JSON.stringify(size) + ', type:' + typeof size);
        if (size !== null) {
          expect(typeof size).assertEqual("int");
        } else {
          expect().assertFail();
        }
      }).catch((error) => {
        console.info('SUB_geolocation_getCachedGnssLocationsSize_test_0400 promise, getCachedGnssLocationsSize: error=' + error.code + JSON.stringify(error));
        if (error.code === 3301100) {
          expect(error.code).assertEqual(3301100);
        } else {
          expect(error.code).assertEqual(801);
        }
      });
    } catch (err) {
      console.info('---SUB_geolocation_getCachedGnssLocationsSize_test_0400 catch end---' + err.code);
      if (err.code === 3301100) {
        expect(err.code).assertEqual(3301100);
      } else {
        expect(err.code).assertEqual(801);
      }
    }
    await Utils.msSleep(1000);
    done();
  });

  /**
 * @tc.name   SUB_geolocation_flushCachedGnssLocations_test_0200
 * @tc.number SUB_geolocation_flushCachedGnssLocations_test_0200
 * @tc.desc   flushCachedGnssLocations(callback: AsyncCallback<void>): void
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
  it("SUB_geolocation_flushCachedGnssLocations_test_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      console.info('SUB_geolocation_flushCachedGnssLocations_test_0200 disableLocation: success');
      geoLocationManager.flushCachedGnssLocations((err) => {
        if (err) {
          console.info('SUB_geolocation_flushCachedGnssLocations_test_0200 flushCachedGnssLocations: err.code=' + err.code);
          if (err.code === 3301100) {
            expect(err.code).assertEqual(3301100);
          } else {
            expect(err.code).assertEqual(801);
          }
        } else {
          expect(err === undefined).assertTrue();
        }
      });
    } catch (err) {
      console.info('---SUB_geolocation_flushCachedGnssLocations_test_0200 catch end---' + err.code);
      if (err.code === 3301100) {
        expect(err.code).assertEqual(3301100);
      } else {
        expect(err.code).assertEqual(801);
      }
    }
    await Utils.msSleep(1000);
    done();
  });

  /**
   * @tc.name   SUB_geolocation_flushCachedGnssLocations_test_0400
   * @tc.number SUB_geolocation_flushCachedGnssLocations_test_0400
   * @tc.desc   flushCachedGnssLocations(): Promise<void>
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it("SUB_geolocation_flushCachedGnssLocations_test_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    try {
      geoLocationManager.flushCachedGnssLocations().then(() => {
        console.info('SUB_geolocation_flushCachedGnssLocations_test_0400 promise, flushCachedGnssLocations: success');
      }).catch((error) => {
        console.info('SUB_geolocation_flushCachedGnssLocations_test_0400 promise: error=' + JSON.stringify(error) + error.code);
        if (error.code === 3301100) {
          expect(error.code).assertEqual(3301100);
        } else {
          expect(error.code).assertEqual(801);
        }
      });
    } catch (err) {
      console.info('---SUB_geolocation_flushCachedGnssLocations_test_0400 catch end---' + err.code);
      if (err.code === 3301100) {
        expect(err.code).assertEqual(3301100);
      } else {
        expect(err.code).assertEqual(801);
      }
    }
    geoLocationManager.enableLocation();
    console.info('SUB_geolocation_flushCachedGnssLocations_test_0400 enableLocation: success');
    await Utils.msSleep(1000);
    done();
  });

  })
}