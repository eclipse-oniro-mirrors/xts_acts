/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import wantAgent from '@ohos.app.ability.wantAgent';
import geoLocationManager from '@ohos.geoLocationManager';
import geolocation from '@ohos.geolocation';
import { BusinessError } from '@ohos.base';
import notificationManager from '@ohos.notificationManager';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export async function changedLocationMode() {
  await geolocation.isLocationEnabled().then(async (result) => {
    console.info('[lbs_js] nop getLocationSwitchState result: ' + JSON.stringify(result));
    if (!result) {
      await geoLocationManager.enableLocation().then(async (res) => {
        console.info('[lbs_js] nop test requestEnableLocation promise result: ' + JSON.stringify(res));
      }).catch((error: BusinessError) => {
        console.info("[lbs_js] nop promise then error." + JSON.stringify(error));
        expect().assertFail();
      });
    }
  });
  await geolocation.isLocationEnabled().then(async (result) => {
    console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result));
  });
}

export default function geoLocationManager_nop_test() {
  describe('geoLocationManager_nop_test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      await changedLocationMode();
      done();
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   geoLocationManager_nop_test_001
     * @tc.number SUB_geoLocationManager_nop_test_001
     * @tc.desc   Using the geoLocationManager.on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nop_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: "com.example.myapplication",
            abilityName: "EntryAbility",
            action: "action1"
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };

      wantAgent.getWantAgent(wantAgentInfo).then((wantAgentObj) => {
        let requestInfo: geoLocationManager.GeofenceRequest = {
          'scenario': 0x301, "geofence": {
            "latitude": 31.12, "longitude": 121.11, "radius": 100, "expiration": 10000
          }
        };
        try {
          geoLocationManager.on('gnssFenceStatusChange', requestInfo, wantAgentObj);
          expect(wantAgentObj != null).assertTrue();
          done();
        } catch (err) {
          console.info('---geoLocationManager_nop_test_001  catch ---' + typeof err.code + ',err:' + err.code);
          if (Number(err.code) === 201) {
            expect(Number(err.code) === 201).assertTrue();
            done();
          } else {
            expect(Number(err.code) === 401).assertTrue();
            done();
          }
        }
      });
      console.info('geoLocationManager_nop_test_001 end');
    })

    /**
     * @tc.name   geoLocationManager_nop_test_002
     * @tc.number SUB_geoLocationManager_nop_test_002
     * @tc.desc   Using the geoLocationManager.off method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nop_test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: "com.example.myapplication",
            abilityName: "EntryAbility",
            action: "action1"
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };

      wantAgent.getWantAgent(wantAgentInfo).then((wantAgentObj) => {
        let requestInfo: geoLocationManager.GeofenceRequest = {
          'scenario': 0x301, "geofence": {
            "latitude": 31.12, "longitude": 121.11, "radius": 100, "expiration": 10000
          }
        };
        try {
          geoLocationManager.off('gnssFenceStatusChange', requestInfo, wantAgentObj);
          expect(wantAgentObj != null).assertTrue();
          done();
        } catch (err) {
          console.info('---geoLocationManager_nop_test_002  catch ---' + typeof err.code + ',err:' + err.code);
          if (Number(err.code) === 201) {
            expect(Number(err.code) === 201).assertTrue();
            done();
          } else {
            expect(Number(err.code) === 401).assertTrue();
            done();
          }
        }
      });
      console.info('geoLocationManager_nop_test_002 end');
    })

    /**
     * @tc.name   geoLocationManager_nop_test_003
     * @tc.number SUB_geoLocationManager_nop_test_003
     * @tc.desc   Using the geoLocationManager.on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nop_test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
          console.log('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
        }
        geoLocationManager.on('satelliteStatusChange', gnssStatusCb);
        expect(gnssStatusCb != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_nop_test_003  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_nop_test_003  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geoLocationManager_nop_test_003 end');
    })

    /**
     * @tc.name   geoLocationManager_nop_test_004
     * @tc.number SUB_geoLocationManager_nop_test_004
     * @tc.desc   Using the geoLocationManager.off method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nop_test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.log('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
      }
      try {
        geoLocationManager.on('satelliteStatusChange', gnssStatusCb);
        geoLocationManager.off('satelliteStatusChange', gnssStatusCb);
        expect(gnssStatusCb != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_nop_test_004  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_nop_test_004  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geoLocationManager_nop_test_004 end');
    })


    /**
     * @tc.name   geoLocationManager_nop_test_005
     * @tc.number SUB_geoLocationManager_nop_test_005
     * @tc.desc   Using the geoLocationManager.off method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nop_test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cachedLocationsCb = (locations: Array<geoLocationManager.Location>): void => {
        console.log('cachedGnssLocationsChange: locations: ' + JSON.stringify(locations));
      }
      let requestInfo: geoLocationManager.CachedGnssLocationsRequest = {
        'reportingPeriodSec': 10, 'wakeUpCacheQueueFull': true
      };
      try {
        geoLocationManager.on('cachedGnssLocationsChange', requestInfo, cachedLocationsCb);
        expect(cachedLocationsCb != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_nop_test_005  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_nop_test_005  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geoLocationManager_nop_test_005 end');
    })

    /**
     * @tc.name   geoLocationManager_nop_test_006
     * @tc.number SUB_geoLocationManager_nop_test_006
     * @tc.desc   Using the geoLocationManager.off method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nop_test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cachedLocationsCb = (locations: Array<geoLocationManager.Location>): void => {
        console.log('cachedGnssLocationsChange: locations: ' + JSON.stringify(locations));
      }
      let requestInfo: geoLocationManager.CachedGnssLocationsRequest = {
        'reportingPeriodSec': 10, 'wakeUpCacheQueueFull': true
      };
      try {
        geoLocationManager.on('cachedGnssLocationsChange', requestInfo, cachedLocationsCb);
        geoLocationManager.off('cachedGnssLocationsChange');
        expect(cachedLocationsCb != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_nop_test_006  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_nop_test_006  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geoLocationManager_nop_test_006 end');
    })

    /**
     * @tc.name   geoLocationManager_nop_test_007
     * @tc.number SUB_geoLocationManager_nop_test_007
     * @tc.desc   Using the geoLocationManager.off method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nop_test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let requestInfo: geoLocationManager.LocationRequest = {
        'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
        'scenario': geoLocationManager.LocationRequestScenario.UNSET,
        'timeInterval': 1,
        'distanceInterval': 0,
        'maxAccuracy': 0
      };
      let locationChange = (location: geoLocationManager.Location): void => {
        console.log('geoLocationManager_nop_test_007 locationChanger: data: ' + JSON.stringify(location));
      };
      try {
        geoLocationManager.on('locationChange', requestInfo, locationChange);
        geoLocationManager.off('locationChange', locationChange);
        expect(locationChange != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_nop_test_007  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_nop_test_007  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geoLocationManager_nop_test_007 end');
    })

    /**
     * @tc.name   geolocation_locationChange_nop_test_001
     * @tc.number SUB_geolocation_nop_test_001
     * @tc.desc   Using the locationChange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_locationChange_nop_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let requestInfo: geolocation.LocationRequest = {
        'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
        'scenario': geoLocationManager.LocationRequestScenario.UNSET,
        'timeInterval': 1,
        'distanceInterval': 0,
        'maxAccuracy': 0
      };
      let locationChange = (location: geolocation.Location): void => {
        console.log('geolocation_locationChange_nop_test_001 locationChanger: data: ' + JSON.stringify(location));
      };
      try {
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        console.info('---geolocation_locationChange_nop_test_001 catch success---');
        done();
      } catch (err) {
        console.info('---geolocation_locationChange_nop_test_001 catch end type---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geolocation_locationChange_nop_test_001 end');
    })

    /**
     * @tc.name   geolocation_locationServiceState_nop_test_002
     * @tc.number SUB_geolocation_nop_test_002
     * @tc.desc   Using the locationServiceState method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_locationServiceState_nop_test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let locationServiceState = (state: boolean): void => {
        console.info('locationServiceState: ' + JSON.stringify(state));
      };
      try {
        geolocation.on('locationServiceState', locationServiceState);
        geolocation.off('locationServiceState', locationServiceState);
        console.info('---geolocation_locationServiceState_nop_test_002 catch success---');
        done();
      } catch (err) {
        console.info('---geolocation_locationServiceState_nop_test_002 catch end type---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geolocation_locationServiceState_nop_test_002 end');
    })

    /**
     * @tc.name   geolocation_cachedGnssLocationsReporting_nop_test_003
     * @tc.number SUB_geolocation_cachedGnssLocationsReporting_nop_test_003
     * @tc.desc   Using the cachedGnssLocationsReporting method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_cachedGnssLocationsReporting_nop_test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cachedLocationsCb = (locations: Array<geolocation.Location>): void => {
        console.info('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
      };
      let requestInfo: geolocation.CachedGnssLocationsRequest = { 'reportingPeriodSec': 10, 'wakeUpCacheQueueFull': true };
      try {
        geolocation.on('cachedGnssLocationsReporting', requestInfo, cachedLocationsCb);
        geolocation.off('cachedGnssLocationsReporting');
        console.info('---geolocation_cachedGnssLocationsReporting_nop_test_003 catch success---');
        done();
      } catch (err) {
        console.info('---geolocation_cachedGnssLocationsReporting_nop_test_003 catch end type---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geolocation_cachedGnssLocationsReporting_nop_test_003 end');
    })

    /**
     * @tc.name   geolocation_gnssStatusChange_nop_test_004
     * @tc.number SUB_geolocation_gnssStatusChange_nop_test_004
     * @tc.desc   Using the gnssStatusChange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_gnssStatusChange_nop_test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let gnssStatusCb = (satelliteStatusInfo: geolocation.SatelliteStatusInfo): void => {
        console.info('gnssStatusChange: ' + JSON.stringify(satelliteStatusInfo));
      };
      try {
        geolocation.on('gnssStatusChange', gnssStatusCb);
        geolocation.off('gnssStatusChange', gnssStatusCb);
        console.info('---geolocation_gnssStatusChange_nop_test_004 catch success---');
        done();
      } catch (err) {
        console.info('---geolocation_gnssStatusChange_nop_test_004 catch end type---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geolocation_gnssStatusChange_nop_test_004 end');
    })

    /**
     * @tc.name   geolocation_nmeaMessageChange_nop_test_005
     * @tc.number SUB_geolocation_nmeaMessageChange_nop_test_005
     * @tc.desc   Using the nmeaMessageChange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_nmeaMessageChange_nop_test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let nmeaCb = (str: string): void => {
        console.info('nmeaMessageChange: ' + JSON.stringify(str));
      };
      try {
        geolocation.on('nmeaMessageChange', nmeaCb);
        geolocation.off('nmeaMessageChange', nmeaCb);
        expect(nmeaCb != null).assertTrue();
        console.info('---geolocation_nmeaMessageChange_nop_test_005 catch success---');
        done();
      } catch (err) {
        console.info('---geolocation_nmeaMessageChange_nop_test_005 catch end type---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geolocation_nmeaMessageChange_nop_test_005 end');
    })

    /**
      * @tc.name   geolocation_fenceStatusChange_nop_test_006
      * @tc.number SUB_geolocation_fenceStatusChange_nop_test_006
      * @tc.desc   Using the fenceStatusChange method without permission
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it("geolocation_fenceStatusChange_nop_test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: "com.example.myapplication",
            abilityName: "EntryAbility",
            action: "action1"
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      wantAgent.getWantAgent(wantAgentInfo).then((wantAgentObj) => {
        let requestInfo: geolocation.GeofenceRequest = {
          'priority': 0x201,
          'scenario': 0x301,
          "geofence": {
            "latitude": 31.12,
            "longitude": 121.11,
            "radius": 100,
            "expiration": 10000
          }
        }
        try {
          geolocation.on('fenceStatusChange', requestInfo, wantAgentObj);
          console.info('---geolocation_fenceStatusChange_nop_test_006 onfenceStatusChange success---');
          geolocation.off('fenceStatusChange', requestInfo, wantAgentObj);
          console.info('---geolocation_fenceStatusChange_nop_test_006 offfenceStatusChange success---');
          done();
        } catch (err) {
          console.info('---geolocation_fenceStatusChange_nop_test_006  catch end type---' + typeof err.code + ',err:' + err.code);
          expect(Number(err.code) === 106).assertTrue();
          done();
        }
      });
      console.info('geolocation_fenceStatusChange_nop_test_006 end');
    })

    /**
     * @tc.name   geolocation_getCurrentLocation_nop_test_007
     * @tc.number SUB_geolocation_getCurrentLocation_nop_test_0700
     * @tc.desc   Using the geolocation.getCurrentLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getCurrentLocation_nop_test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const requestInfo: geolocation.CurrentLocationRequest = {
        'priority': geolocation.LocationRequestPriority.FIRST_FIX,
        'scenario': geolocation.LocationRequestScenario.UNSET,
        'maxAccuracy': 0
      };

      const locationChange = (err: BusinessError, location: geolocation.Location) => {
        if (err) {
          console.info('geolocation_getCurrentLocation_nop_test_007 locationChanger: err=' + JSON.stringify(err));
          expect(err.code).assertEqual(3301200);
        } else if (location) {
          console.info('geolocation_getCurrentLocation_nop_test_007 locationChanger: location=' + JSON.stringify(location));
          expect(location !== null).assertTrue();
        } else {
          console.info('geolocation_getCurrentLocation_nop_test_007 locationChanger: no location, no err ');
          expect().assertFail();
        }
        done();
      };

      try {
        await geolocation.getCurrentLocation(requestInfo, locationChange);
        console.info('---geolocation_getCurrentLocation_nop_test_007  request success---');
        done();
      } catch (err) {
        console.info('---geolocation_getCurrentLocation_nop_test_007 catch end type---' + typeof err.code + ',err:' + err.code);
        if (err.code === 106) {
          expect(err.code).assertEqual(106);
        } else {
          expect().assertFalse();
        }
        done();
      }
    })

    /**
     * @tc.name   geolocation_getCurrentLocation_nop_test_008
     * @tc.number SUB_geolocation_getCurrentLocation_nop_test_0800
     * @tc.desc   Using the geolocation.getCurrentLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getCurrentLocation_nop_test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      try {
        console.info('geolocation_getCurrentLocation_nop_test_008  start getCurrentLocation');
        geolocation.getCurrentLocation((err: BusinessError, location: geolocation.Location) => {
          console.info('geolocation_getCurrentLocation_nop_test_008 getCurrentLocation');
          if (err) {
            console.info('geolocation_getCurrentLocation_nop_test_008  err=' + JSON.stringify(err) + ', type err:' + typeof err.code);
            expect(err.code).assertEqual(3301200);
          } else if (location) {
            console.info('geolocation_getCurrentLocation_nop_test_008  location=' + JSON.stringify(location));
            expect(location !== null).assertTrue();
            console.info('---geolocation_getCurrentLocation_nop_test_008 location success---');
          } else {
            console.info('geolocation_getCurrentLocation_nop_test_008 locationChanger: no location, no err ');
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.info('---geolocation_getCurrentLocation_nop_test_008 catch end type---' + typeof err.code + ',err:' + err.code);
        if (err.code === 106) {
          expect(err.code).assertEqual(106);
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   geolocation_getLastLocation_nop_test_010
     * @tc.number SUB_geolocation_getLastLocation_nop_test_010
     * @tc.desc   Using the geolocation.getLastLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getLastLocation_nop_test_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.getLastLocation((err: BusinessError, data) => {
          if (err) {
            console.info('geolocation_getLastLocation_nop_test_010 getLastLocation: err=' + JSON.stringify(err) + ", errtype:" + typeof err.code);
            expect(Number(err.code)).assertEqual(106);
            done();
          }
          else if (data) {
            console.info('geolocation_getLastLocation_nop_test_010 getLastLocation: data=' + JSON.stringify(data));
            expect(data !== null).assertTrue();
            done();
          } else {
            console.info('geolocation_getLastLocation_nop_test_010 getLastLocation: data = null');
            expect().assertFalse();
            done();
          }
        });
      } catch (err) {
        console.info('---geolocation_getLastLocation_nop_test_010 catch end type---' + typeof err.code + ',err:' + err.code);
        expect().assertFalse();
        done();
      }
      console.info('geolocation_getLastLocation_nop_test_010 end');
    })

    /**
     * @tc.name   geolocation_getLastLocation_nop_test_011
     * @tc.number SUB_geolocation_getLastLocation_nop_test_011
     * @tc.desc   Using the geolocation.getLastLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getLastLocation_nop_test_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const result = await geolocation.getLastLocation();
        console.info('geolocation_getLastLocation_nop_test_011 getLastLocation: result: ' + JSON.stringify(result));
        expect(result !== null).assertTrue();
        done();
      } catch (err) {
        console.info('---geolocation_getLastLocation_nop_test_011 catch ---' + ", errtype:" + typeof err.code + ", err:" + err.code);
        if (Number(err.code) !== 106) {
          expect().assertFail();
          done();
        } else {
          expect(Number(err.code)).assertEqual(106);
          done();
        }
        console.info('---geolocation_getLastLocation_nop_test_011 catch end err ---' + ", errtype:" + typeof err.code + ", err:" + err.code);
      }
    })

    /**
     * @tc.name   geolocation_isLocationEnabled_nop_test_012
     * @tc.number SUB_geolocation_isLocationEnabled_nop_test_012
     * @tc.desc   Using the geolocation.isLocationEnabled method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_isLocationEnabled_nop_test_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.isLocationEnabled((err: BusinessError, data: boolean) => {
          if (err) {
            console.info('geolocation_isLocationEnabled_nop_test_012 getLastLocation: err=' + JSON.stringify(err) + ", errtype:" + typeof err.code);
            if (Number(err.code) === 106) {
              expect(Number(err.code)).assertEqual(106);
              done();
            } else {
              expect().assertFail();
              done();
            }
          } else {
            console.info('geolocation_isLocationEnabled_nop_test_012 getLastLocation: data=' + JSON.stringify(data));
            expect(data).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.info('---geolocation_isLocationEnabled_nop_test_012 catch end---' + err.code + ", errMessage:" + err.message + ", errtype:" + typeof err.code);
        expect().assertFail();
        console.info('geolocation_isLocationEnabled_nop_test_012 end');
        done();
      }
    });

    /**
     * @tc.name   geolocation_isLocationEnabled_nop_test_013
     * @tc.number SUB_geolocation_isLocationEnabled_nop_test_013
     * @tc.desc   Using the geolocation.isLocationEnabled method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_isLocationEnabled_nop_test_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.isLocationEnabled().then((result: boolean) => {
          console.info('promise, geolocation_isLocationEnabled_nop_test_013: ' + JSON.stringify(result));
          expect(result).assertTrue()
          done();
        }).catch((error: BusinessError) => {
          console.info('---geolocation_isLocationEnabled_nop_test_013 catch end---' + error.code);
          expect(error.code).assertEqual(106);
          done();
        });
      } catch (err) {
        console.info('---geolocation_isLocationEnabled_nop_test_013 catch end---' + err.code);
        expect().assertFail();
        console.info('geolocation_isLocationEnabled_nop_test_013 end');
        done();
      }
    });

    /**
     * @tc.name   geolocation_getAddressesFromLocation_nop_test_014
     * @tc.number SUB_geolocation_getAddressesFromLocation_nop_test_014
     * @tc.desc   Using the geolocation.getAddressesFromLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getAddressesFromLocation_nop_test_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let reverseGeocodeRequest: geolocation.ReverseGeoCodeRequest = {
          "latitude": 31.12,
          "longitude": 121.11,
          "maxItems": 1
        };
        geolocation.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
          if (err) {
            console.info('geolocation_getAddressesFromLocation_nop_test_014 getAddressesFromLocation: err=' + JSON.stringify(err) + ', type:' + typeof err.code);
            if (Number(err.code) === 106) {
              expect(Number(err.code)).assertEqual(106);
              done();
            } else {
              expect().assertFalse();
              done();
            }
            return;
          }
          if (data) {
            console.info('geolocation_getAddressesFromLocation_nop_test_014 getAddressesFromLocation: data=' + JSON.stringify(data));
            expect(data != null).assertTrue();
            done();
            return;
          }
          console.info('geolocation_getAddressesFromLocation_nop_test_014 getAddressesFromLocation: no data, no err');
          done();
        });
      } catch (err) {
        console.info('---geolocation_getAddressesFromLocation_nop_test_014 catch end---' + err.code + ', type:' + typeof err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFail();
          done();
        }
        console.info('geolocation_getAddressesFromLocation_nop_test_014 end');
      }
    });

    /**
     * @tc.name   geolocation_getAddressesFromLocation_nop_test_015
     * @tc.number SUB_geolocation_getAddressesFromLocation_nop_test_015
     * @tc.desc   Using the geolocation.getAddressesFromLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getAddressesFromLocation_nop_test_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let reverseGeocodeRequest: geolocation.ReverseGeoCodeRequest = {
          "latitude": 31.12,
          "longitude": 121.11,
          "maxItems": 1
        };
        geolocation.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
          console.info('geolocation_getAddressesFromLocation_nop_test_015 getAddressesFromLocation: data=' + JSON.stringify(data));
          expect(data !== null).assertTrue()
          done();
        });
      } catch (err) {
        console.info('---geolocation_getAddressesFromLocation_nop_test_015 catch end---' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
        console.info('geolocation_getAddressesFromLocation_nop_test_015 end');
      }
    });

    /**
     * @tc.name   geolocation_getAddressesFromLocationName_nop_test_016
     * @tc.number SUB_geolocation_getAddressesFromLocationName_nop_test_016
     * @tc.desc   Using the geolocation.getAddressesFromLocationName method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getAddressesFromLocationName_nop_test_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let geocodeRequest: geolocation.GeoCodeRequest = { "description": "上海市浦东新区xx路xx号", "maxItems": 1 };
        geolocation.getAddressesFromLocationName(geocodeRequest, (err: BusinessError, data) => {
          if (err) {
            console.info('geolocation_getAddressesFromLocationName_nop_test_016 getAddressesFromLocationName: err=' + JSON.stringify(err));
            expect(Number(err.code)).assertEqual(106);
            done();
          }
          if (data) {
            console.info('geolocation_getAddressesFromLocationName_nop_test_016 getAddressesFromLocationName: data=' + JSON.stringify(data));
            expect(data !== null).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.info('---geolocation_getAddressesFromLocationName_nop_test_016 catch end---' + err.code);
        expect().assertFalse();
        done();
        console.info('geolocation_getAddressesFromLocationName_nop_test_016 end');
      }
    });

    /**
     * @tc.name   geolocation_getAddressesFromLocationName_nop_test_017
     * @tc.number SUB_geolocation_getAddressesFromLocationName_nop_test_017
     * @tc.desc   Using the geolocation.getAddressesFromLocationName method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getAddressesFromLocationName_nop_test_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let geocodeRequest: geolocation.GeoCodeRequest = { "description": "上海市浦东新区xx路xx号", "maxItems": 1 };
        geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
          console.info('geolocation_getAddressesFromLocationName_nop_test_017 getAddressesFromLocationName: ' + JSON.stringify(result));
          expect(result !== null).assertTrue()
          done();
        }).catch((error: BusinessError) => {
          console.info('geolocation_getAddressesFromLocationName_nop_test_017 promise, getAddressesFromLocationName: error=' + JSON.stringify(error));
          expect(error.code).assertEqual(107);
          done();
        });
      } catch (err) {
        console.info('---geolocation_getAddressesFromLocationName_nop_test_017 catch end---' + err.code);
        expect().assertFalse();
        done();
        console.info('geolocation_getAddressesFromLocationName_nop_test_017 end');
      }
    });

    /**
     * @tc.name   geolocation_isGeoServiceAvailable_nop_test_018
     * @tc.number SUB_geolocation_isGeoServiceAvailable_nop_test_018
     * @tc.desc   Using the geolocation.getAddressesFromLocationName method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_isGeoServiceAvailable_nop_test_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.isGeoServiceAvailable((err: BusinessError, data: boolean) => {
          if (err) {
            console.info('geolocation_isGeoServiceAvailable_nop_test_018 isGeoServiceAvailable: err=' + JSON.stringify(err));
            expect(Number(err.code)).assertEqual(106);
            done();
          }
          if (data) {
            console.info('geolocation_isGeoServiceAvailable_nop_test_018 isGeoServiceAvailable: data=' + JSON.stringify(data));
            expect(data !== null).assertTrue()
            done();
          }
        });
      } catch (err) {
        console.info('---geolocation_isGeoServiceAvailable_nop_test_018 catch end---' + err.code);
        expect().assertFalse();
        done();
        console.info('geolocation_isGeoServiceAvailable_nop_test_018 end');
      }
    });

    /**
     * @tc.name   geolocation_isGeoServiceAvailable_nop_test_019
     * @tc.number SUB_geolocation_isGeoServiceAvailable_nop_test_019
     * @tc.desc   Using the geolocation.getAddressesFromLocationName method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_isGeoServiceAvailable_nop_test_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.isGeoServiceAvailable().then((result: boolean) => {
          console.info('promise, geolocation_isGeoServiceAvailable_nop_test_019 result: ' + JSON.stringify(result));
          expect(result).assertTrue()
          done();
        });
      } catch (err) {
        console.info('---geolocation_isGeoServiceAvailable_nop_test_019 catch end---' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
        console.info('geolocation_isGeoServiceAvailable_nop_test_019 end');
      }
    });

    /**
     * @tc.name   geolocation_getCachedGnssLocationsSize_nop_test_020
     * @tc.number SUB_geolocation_getCachedGnssLocationsSize_nop_test_020
     * @tc.desc   Using the geolocation.getCachedGnssLocationsSize method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getCachedGnssLocationsSize_nop_test_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.getCachedGnssLocationsSize((size) => {
          console.info('geolocation_getCachedGnssLocationsSize_nop_test_020 getCachedGnssLocationsSize: size=' + JSON.stringify(size));
          expect(size !== null).assertTrue();
          done();
        });
      } catch (err) {
        console.info('---geolocation_getCachedGnssLocationsSize_nop_test_020 catch end---' + err.code);
        if (Number(err.code) === 106) {
          expect(Number(err.code)).assertEqual(106);
          done();
        } else {
          expect().assertFalse();
          done();
        }
        console.info('geolocation_getCachedGnssLocationsSize_nop_test_020 end');
      }
    });

    /**
     * @tc.name   geolocation_getCachedGnssLocationsSize_nop_test_021
     * @tc.number SUB_geolocation_getCachedGnssLocationsSize_nop_test_021
     * @tc.desc   Using the geolocation.getCachedGnssLocationsSize method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_getCachedGnssLocationsSize_nop_test_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.getCachedGnssLocationsSize().then((result) => {
          console.info('geolocation_getCachedGnssLocationsSize_nop_test_021 promise, getCachedGnssLocationsSize: ' + JSON.stringify(result));
          expect(result !== null).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.info('geolocation_getCachedGnssLocationsSize_nop_test_021 promise, getCachedGnssLocationsSize: error=' + JSON.stringify(error));
          expect(error.code).assertEqual(106);
          done();
        });
      } catch (err) {
        console.info('---geolocation_getCachedGnssLocationsSize_nop_test_021 catch end---' + err.code);
        expect().assertFalse();
        done();
        console.info('geolocation_getCachedGnssLocationsSize_nop_test_021 end');
      }
    });

    /**
     * @tc.name   geolocation_flushCachedGnssLocations_nop_test_022
     * @tc.number SUB_geolocation_flushCachedGnssLocations_nop_test_022
     * @tc.desc   Using the geolocation.flushCachedGnssLocations method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_flushCachedGnssLocations_nop_test_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.flushCachedGnssLocations((err: BusinessError, result: boolean) => {
          if (err) {
            console.info('geolocation_flushCachedGnssLocations_nop_test_022 flushCachedGnssLocations: err=' + JSON.stringify(err));
            expect(Number(err.code)).assertEqual(100);
            done();
          }
          if (result) {
            console.info('geolocation_flushCachedGnssLocations_nop_test_022 flushCachedGnssLocations: result=' + JSON.stringify(result));
            expect(result !== null).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.info('---geolocation_flushCachedGnssLocations_nop_test_022 catch end---' + err.code);
        expect().assertFalse();
        console.info('geolocation_flushCachedGnssLocations_nop_test_022 end');
        done();
      }
    });

    /**
     * @tc.name   geolocation_flushCachedGnssLocations_nop_test_023
     * @tc.number SUB_geolocation_flushCachedGnssLocations_nop_test_023
     * @tc.desc   Using the geolocation.flushCachedGnssLocations method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_flushCachedGnssLocations_nop_test_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.flushCachedGnssLocations().then((result) => {
          console.info('geolocation_flushCachedGnssLocations_nop_test_023 promise, flushCachedGnssLocations: ' + JSON.stringify(result));
          expect(result).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.info('geolocation_flushCachedGnssLocations_nop_test_023 promise, getCachedGnssLocationsSize: error=' + JSON.stringify(error));
          expect(error.code).assertEqual(100);
          done();
        });
      } catch (err) {
        console.info('---geolocation_flushCachedGnssLocations_nop_test_023 catch end---' + err.code);
        expect().assertFalse();
        done();
        console.info('geolocation_flushCachedGnssLocations_nop_test_023 end');
      }
    });

    /**
     * @tc.name   geolocation_sendCommand_nop_test_024
     * @tc.number SUB_geolocation_sendCommand_nop_test_024
     * @tc.desc   Using the sendCommand method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_sendCommand_nop_test_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let requestInfo: geolocation.LocationCommand = { 'scenario': 0x301, 'command': "command_1" };
        geolocation.sendCommand(requestInfo, (err: BusinessError, result) => {
          if (err) {
            console.info('geolocation_sendCommand_nop_test_024 sendCommand: err=' + JSON.stringify(err));
            expect(Number(err.code)).assertEqual(100);
            done();
          }
          if (result) {
            console.info('geolocation_sendCommand_nop_test_024 sendCommand: result=' + JSON.stringify(result));
            expect(result !== null).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.info('---geolocation_sendCommand_nop_test_024 catch end---' + err.code);
        expect().assertFalse();
        done();
        console.info('geolocation_sendCommand_nop_test_024 end');
      }
    });

    /**
     * @tc.name   geolocation_sendCommand_nop_test_025
     * @tc.number SUB_geolocation_sendCommand_nop_test_025
     * @tc.desc   Using the geolocation.sendCommand method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_sendCommand_nop_test_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let requestInfo: geolocation.LocationCommand = { 'scenario': 0x301, 'command': "command_1" };
        geolocation.sendCommand(requestInfo).then((result: boolean) => {
          console.info('geolocation_sendCommand_nop_test_025 result=' + JSON.stringify(result));
          expect(result).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.info('promise, geolocation_sendCommand_nop_test_025: error=' + JSON.stringify(error));
          expect(error.code).assertEqual(100);
          done();
        });
      } catch (err) {
        console.info("errCode:" + err.code + ", message:" + err.message);
        if (Number(err.code) === 201) {
          expect(Number(err.code)).assertEqual(201);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    });

    /**
     * @tc.name   geolocation_requestEnableLocation_nop_test_026
     * @tc.number SUB_geolocation_requestEnableLocation_nop_test_2600
     * @tc.desc   requestEnableLocation(callback: AsyncCallback<boolean>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_requestEnableLocation_nop_test_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geolocation.requestEnableLocation((err, data) => {
          if (err) {
            console.info('geolocation_requestEnableLocation_nop_test_026 requestEnableLocation: err=' + typeof err.code + ',err:' + err.code);
            expect(err.code === 201).assertTrue();
          }
          if (data) {
            console.info('geolocation_requestEnableLocation_nop_test_026 requestEnableLocation: data=' + JSON.stringify(data));
            expect(typeof data).assertEqual('boolean');
          }
        });
        done();
      } catch (err) {
        console.info('geolocation_requestEnableLocation_nop_test_026 requestEnableLocation: catch:' + typeof err.code + ',err:' + err.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   geolocation_requestEnableLocation_nop_test_027
     * @tc.number SUB_geolocation_requestEnableLocation_nop_test_2700
     * @tc.desc   requestEnableLocation(): Promise<boolean>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geolocation_requestEnableLocation_nop_test_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      geolocation.requestEnableLocation().then((result) => {
        console.info('geolocation_requestEnableLocation_nop_test_027 promise, requestEnableLocation: ' + JSON.stringify(result));
        if (result) {
          expect(typeof result).assertEqual('boolean');
        } else {
          expect().assertFail();
        }
        done();
      }).catch((err: BusinessError) => {
        console.info('promise, getCachedGnssLocationsSize: catch errtype=' + typeof err.code + ',err:' + err.code);
        expect(err.code).assertEqual(201);
        done();
      })
    });

    /**
     * @tc.name   geoLocationManager_locationError_nop_test_001
     * @tc.number SUB_geolocation_locationError_nop_test_001
     * @tc.desc   Using the locationError method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_locationError_nop_test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        geoLocationManager.on('locationChange', requestInfo, locationChange);
        expect(locationChange != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_locationError_nop_test_001 locationChange catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_locationError_nop_test_001 locationChange end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
        console.info('locationErrorChange: data: ' + JSON.stringify(errcode));
      };
      try {
        geoLocationManager.on('locationError', locationErrorChange);
        expect(locationErrorChange != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_locationError_nop_test_001 locationError catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_locationError_nop_test_001 locationError end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    });

    /**
     * @tc.name   geoLocationManager_locationError_nop_test_002
     * @tc.number SUB_geolocation_locationError_nop_test_002
     * @tc.desc   Using the locationError method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_locationError_nop_test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let requestInfo: geoLocationManager.LocationRequest = {
        'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
        'scenario': geoLocationManager.LocationRequestScenario.UNSET,
        'timeInterval': 1,
        'distanceInterval': 0,
        'maxAccuracy': 0
      };
      let locationChange = (location: geoLocationManager.Location): void => {
        console.info('geoLocationManager_locationError_nop_test_002 locationChange: data: ' + JSON.stringify(location));
      };
      try {
        geoLocationManager.on('locationChange', requestInfo, locationChange);
        expect(locationChange != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_locationError_nop_test_002 locationChange catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_locationError_nop_test_002 locationChange end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
        console.info('geoLocationManager_locationError_nop_test_002 locationErrorChange: data: ' + JSON.stringify(errcode));
      };
      try {
        geoLocationManager.on('locationError', locationErrorChange);
        expect(locationErrorChange != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_locationError_nop_test_002 locationError catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_locationError_nop_test_002 locationError end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    });

    /**
     * @tc.name   geoLocationManager_cachedGnssLocationsChange_nop_test_003
     * @tc.number SUB_geolocation_cachedGnssLocationsChange_nop_test_003
     * @tc.desc   Using the cachedGnssLocationsChange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_cachedGnssLocationsChange_nop_test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let cachedLocationsCb = (locations: Array<geoLocationManager.Location>): void => {
        console.info('cachedGnssLocationsChange: locations: ' + JSON.stringify(locations));
      }
      let requestInfo: geoLocationManager.CachedGnssLocationsRequest = {
        'reportingPeriodSec': 10,
        'wakeUpCacheQueueFull': true
      };
      try {
        geoLocationManager.on('cachedGnssLocationsChange', requestInfo, cachedLocationsCb);
        expect(cachedLocationsCb != null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_cachedGnssLocationsChange_nop_test_003  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_cachedGnssLocationsChange_nop_test_003  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    });

    /**
     * @tc.name   geoLocationManager_satellitestatuschange_nop_test_004
     * @tc.number SUB_geolocation_satellitestatuschange_nop_test_004
     * @tc.desc   Using the satellitestatuschange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_satellitestatuschange_nop_test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
        let totalNumber: number = satelliteStatusInfo.satellitesNumber;
        let satelliteIds: Array<number> = satelliteStatusInfo.satelliteIds;
        let carrierToNoiseDensitys: Array<number> = satelliteStatusInfo.carrierToNoiseDensitys;
        let altitudes: Array<number> = satelliteStatusInfo.altitudes;
        let azimuths: Array<number> = satelliteStatusInfo.azimuths;
        let carrierFrequencies: Array<number> = satelliteStatusInfo.carrierFrequencies;
        let satelliteConstellations: Array<geoLocationManager.SatelliteConstellationCategory> | undefined = satelliteStatusInfo.satelliteConstellation;
        let satelliteAdditionalInfos: Array<number> | undefined = satelliteStatusInfo.satelliteAdditionalInfo;
        for (let i = 0; i < totalNumber; i++) {
          let satelliteId: number = satelliteIds[i];
          let carrierToNoiseDensity: number = carrierToNoiseDensitys[i];
          let altitude: number = altitudes[i];
          let azimuth: number = azimuths[i];
          let carrierFrequency: number = carrierFrequencies[i];
          if (satelliteConstellations !== undefined) {
            let satelliteConstellation: geoLocationManager.SatelliteConstellationCategory = satelliteConstellations[i];
          }
          if (satelliteAdditionalInfos !== undefined) {
            let satelliteAdditionalInfo: number = satelliteAdditionalInfos[i];
          }
        }
      }
      try {
        geoLocationManager.on('satelliteStatusChange', gnssStatusCb);
        expect(gnssStatusCb != null).assertTrue;
        done();
      } catch (err) {
        console.info('---geoLocationManager_satellitestatuschange_nop_test_004  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_satellitestatuschange_nop_test_004  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   geoLocationManager_satellitestatuschange_nop_test_005
     * @tc.number SUB_geolocation_satellitestatuschange_nop_test_005
     * @tc.desc   Using the satellitestatuschange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_satellitestatuschange_nop_test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.info('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
      }
      try {
        geoLocationManager.on('satelliteStatusChange', gnssStatusCb);
        expect(gnssStatusCb != null).assertTrue;
        geoLocationManager.off('satelliteStatusChange', gnssStatusCb);
        expect(gnssStatusCb != null).assertTrue;
        done();
      } catch (err) {
        console.info('---geoLocationManager_satellitestatuschange_nop_test_005  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_satellitestatuschange_nop_test_005  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   geoLocationManager_nmeaMessage_nop_test_006
     * @tc.number SUB_geolocation_nmeaMessage_nop_test_006
     * @tc.desc   Using the nmeaMessage method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_nmeaMessage_nop_test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let nmeaCb = (str: string): void => {
        console.info('nmeaMessage: ' + JSON.stringify(str));
      }
      try {
        geoLocationManager.on('nmeaMessage', nmeaCb);
        expect(nmeaCb != null).assertTrue;
        done();
      } catch (err) {
        console.info('---geoLocationManager_nmeaMessage_nop_test_006  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_nmeaMessage_nop_test_006  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   geoLocationManager_bluetoothScanResultChange_nop_test_007
     * @tc.number SUB_geoLocationManager_bluetoothScanResultChange_nop_test_007
     * @tc.desc   Using the bluetoothScanResultChange method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_bluetoothScanResultChange_nop_test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let callback = (result: geoLocationManager.BluetoothScanResult): void => {
        console.info('geoLocationManager_bluetoothScanResultChange_nop_test_007 bluetoothScanResultChange: ' + JSON.stringify(result));
      };
      try {
        geoLocationManager.on('bluetoothScanResultChange', callback);
        expect(callback != null).assertTrue;
        geoLocationManager.off('bluetoothScanResultChange', callback);
        expect(callback != null).assertTrue;
        done();
      } catch (err) {
        console.info('---geoLocationManager_bluetoothScanResultChange_nop_test_007  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_bluetoothScanResultChange_nop_test_007  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    })



    /**
     * @tc.name   geoLocationManager_getCurrentLocation_nop_test_009
     * @tc.number SUB_geoLocationManager_getCurrentLocation_nop_test_009
     * @tc.desc   Using the geoLocationManager.getCurrentLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_getCurrentLocation_nop_test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let locationChange = (err: BusinessError, location: geolocation.Location): void => {
        if (err) {
          console.info('geoLocationManager_getCurrentLocation_nop_test_009 locationChanger: err=' + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(201);
          done();
        }
        if (location) {
          console.info('geoLocationManager_getCurrentLocation_nop_test_009 locationChanger: location=' + JSON.stringify(location));
          expect(location !== null).assertTrue();
          done();
        }
      };
      try {
        geoLocationManager.getCurrentLocation(locationChange);
        console.info('---geoLocationManager_getCurrentLocation_nop_test_009 catch success---');
        done();
      } catch (err) {
        console.info('---geoLocationManager_getCurrentLocation_nop_test_009 catch ---' + ', type err: ' + typeof err.code + ', err: ' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code)).assertEqual(201);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
      console.info('geoLocationManager_getCurrentLocation_nop_test_009 end');
    })

    /**
     * @tc.name   geoLocationManager_getLastLocation_nop_test_011
     * @tc.number SUB_geoLocationManager_getLastLocation_nop_test_1100
     * @tc.desc   Using the geoLocationManager.getCurrentLocation method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_getLastLocation_nop_test_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let location = geoLocationManager.getLastLocation();
        console.info('geoLocationManager_getLastLocation_nop_test_011 location: ' + JSON.stringify(location));
        console.info('---geoLocationManager_getLastLocation_nop_test_011 catch success---');
        expect().assertFalse();
        done();
      } catch (err) {
        console.info('---geoLocationManager_getLastLocation_nop_test_011 catch ---' + ', type err: ' + typeof err.code + ', err: ' + err.code);
        expect(Number(err.code)).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.name   geoLocationManager_getCachedGnssLocationsSize_nop_test_013
     * @tc.number SUB_geoLocationManager_getCachedGnssLocationsSize_nop_test_013
     * @tc.desc   Using the geoLocationManager.getCachedGnssLocationsSize method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_getCachedGnssLocationsSize_nop_test_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const result = await geoLocationManager.getCachedGnssLocationsSize();
        console.info('geoLocationManager_getCachedGnssLocationsSize_nop_test_013 promise, result: ' + JSON.stringify(result));
        expect(result !== null).assertTrue();
        done();
      } catch (err) {
        console.info('---geoLocationManager_getCachedGnssLocationsSize_nop_test_013 catch ---' + ', type err: ' + typeof err.code + ', err: ' + err.code);
        expect(Number(err.code)).assertEqual(201);
        console.info('geoLocationManager_getCachedGnssLocationsSize_nop_test_013 end');
        done();
      }
    });

    /**
     * @tc.name   geoLocationManager_flushCachedGnssLocations_nop_test_014
     * @tc.number SUB_geoLocationManager_flushCachedGnssLocations_nop_test_014
     * @tc.desc   Using the geoLocationManager.flushCachedGnssLocations method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_flushCachedGnssLocations_nop_test_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geoLocationManager.flushCachedGnssLocations((err) => {
          if (err) {
            console.info('flushCachedGnssLocations: err=' + JSON.stringify(err));
            expect(Number(err.code)).assertEqual(201);
            done();
          }
        });
      } catch (err) {
        console.info('---geoLocationManager_flushCachedGnssLocations_nop_test_014 catch end---' + err.code);
        expect().assertFalse();
        console.info('geoLocationManager_flushCachedGnssLocations_nop_test_014 end');
        done();
      }
    });

    /**
     * @tc.name   geoLocationManager_flushCachedGnssLocations_nop_test_015
     * @tc.number SUB_geoLocationManager_flushCachedGnssLocations_nop_test_015
     * @tc.desc   Using the geoLocationManager.flushCachedGnssLocations method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_flushCachedGnssLocations_nop_test_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        geoLocationManager.flushCachedGnssLocations().then(() => {
          console.info('promise, flushCachedGnssLocations: ');
          done();
        }).catch((error: BusinessError) => {
          console.info('promise, getCachedGnssLocationsSize: error=' + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info('---geoLocationManager_flushCachedGnssLocations_nop_test_015 catch end---' + err.code);
        expect().assertFalse();
        done();
        console.info('geoLocationManager_flushCachedGnssLocations_nop_test_015 end');
      }
    });

    /**
     * @tc.name   geoLocationManager_addGnssGeofence_nop_test_016
     * @tc.number SUB_geoLocationManager_addGnssGeofence_nop_test_016
     * @tc.desc   GnssGeofence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_addGnssGeofence_nop_test_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let geofence: geoLocationManager.Geofence = {
        "latitude": 34.12,
        "longitude": 124.11,
        "radius": 10000.0,
        "expiration": 10000.0
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
        geofenceTransitionCallback: (err: BusinessError, transition: geoLocationManager.GeofenceTransition) => {
          if (err) {
            console.info('geoLocationManager_addGnssGeofence_nop_test_016 geofenceTransitionCallback: err=' + JSON.stringify(err));
          }
          if (transition) {
            console.info("geoLocationManager_addGnssGeofence_nop_test_016 GeofenceTransition: %{public}s", JSON.stringify(transition));
          }
        }
      };
      try {
        geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
          console.info("geoLocationManager_addGnssGeofence_nop_test_016 success, fence id: " + id);
          let fenceId = id;
          expect(fenceId !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info("geoLocationManager_addGnssGeofence_nop_test_016 failed, promise errCode:" + err.code + ",errMessage:" + err.message);
          expect(Number(err.code)).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info("geoLocationManager_addGnssGeofence_nop_test_016 failed, err:" + JSON.stringify(err));
        expect().assertFalse();
        done();
      }
    });

    /**
     * @tc.name   geoLocationManager_getCurrentWifiBssidForLocating_nop_test_018
     * @tc.number SUB_geoLocationManager_getCurrentWifiBssidForLocating_nop_test_018
     * @tc.desc   GnssGeofence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_getCurrentWifiBssidForLocating_nop_test_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let bssid: string = geoLocationManager.getCurrentWifiBssidForLocating();
        console.info("geoLocationManager_getCurrentWifiBssidForLocating_nop_test_018 get wifi bssid:" + bssid);
        expect(bssid !== null).assertTrue();
        done();
      } catch (err) {
        console.error("geoLocationManager_getCurrentWifiBssidForLocating_nop_test_018: errCode" + err.code + ", errMessage" + err.message);
        if (Number(err.code) === 201) {
          expect(Number(err.code)).assertEqual(201);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    });

    /**
     * @tc.name   geoLocationManager_getPoiInfo_nop_test_019
     * @tc.number SUB_geoLocationManager_getPoiInfo_nop_test_019
     * @tc.desc   GnssGeofence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_getPoiInfo_nop_test_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        if (geoLocationManager.isPoiServiceSupported()) {
          geoLocationManager.getPoiInfo().then((poiInfo) => {
            console.info("geoLocationManager_getPoiInfo_nop_test_019 get PoiInfo:" + JSON.stringify(poiInfo));
            if (poiInfo !== undefined) {
              console.info("geoLocationManager_getPoiInfo_nop_test_019 get undefined PoiInfo :" + JSON.stringify(poiInfo));
              expect(poiInfo !== null).assertTrue();
              done();
            }
          }).catch((err: BusinessError) => {
            console.info('geoLocationManager_getPoiInfo_nop_test_019 promise, getPoiInfo: ' + typeof err.code + ',err:' + err.code);
            expect(Number(err.code)).assertEqual(201);
            done();
          });
        } else {
          console.info("geoLocationManager_getPoiInfo_nop_test_019 : Not Support Poi Service!");
          expect().assertFalse();
          done();
        }
      } catch (err) {
        console.info('---geoLocationManager_getPoiInfo_nop_test_019  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code)).assertEqual(201);
          console.info('---geoLocationManager_getPoiInfo_nop_test_019  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    });

    /**
     * @tc.name   geoLocationManager_addBeaconFence_nop_test_020
     * @tc.number SUB_geoLocationManager_addBeaconFence_nop_test_020
     * @tc.desc   GnssGeofence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_addBeaconFence_nop_test_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let manufactureDataBuffer: Uint8Array = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X55,
          0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X55]);
        let manufactureDataMaskBuffer: Uint8Array = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
          0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);

        let manufactureData: geoLocationManager.BeaconManufactureData = {
          manufactureId: 0X004C,
          manufactureData: manufactureDataBuffer.buffer,
          manufactureDataMask: manufactureDataMaskBuffer.buffer
        };

        let beacon: geoLocationManager.BeaconFence = {
          identifier: "11",
          beaconFenceInfoType: geoLocationManager.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
          manufactureData: manufactureData
        };

        let fenceRequest: geoLocationManager.BeaconFenceRequest = {
          beacon: beacon,
          transitionCallback: (transition: geoLocationManager.GeofenceTransition) => {
            if (transition) {
              console.info("GeofenceTransition: err" + JSON.stringify(transition));
            }
          },
          fenceExtensionAbilityName: "MyFenceExtensionAbility",
        };
        geoLocationManager.addBeaconFence(fenceRequest).then((id) => {
          console.info("geoLocationManager_addBeaconFence_nop_test_020 success, fence id:" + id);
          expect(id !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info('geoLocationManager_addBeaconFence_nop_test_020 promise, addBeaconFence: err=' + JSON.stringify(err) + 'type:' + typeof err.code);
          expect(Number(err.code)).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info('---geoLocationManager_addBeaconFence_nop_test_020  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code) === 201).assertTrue();
          console.info('---geoLocationManager_addBeaconFence_nop_test_020  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   geoLocationManager_removeBeaconFence_nop_test_021
     * @tc.number SUB_geoLocationManager_removeBeaconFence_nop_test_021
     * @tc.desc   GnssGeofence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_removeBeaconFence_nop_test_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let manufactureDataBuffer: Uint8Array = new Uint8Array([0X02, 0X15, 0X00, 0X11, 0X22, 0X33, 0X44, 0X55,
          0X66, 0X77, 0X88, 0X99, 0XAA, 0XBB, 0XCC, 0XDD, 0XEE, 0XFF, 0X11, 0X22, 0X33, 0X44, 0X55]);
        let manufactureDataMaskBuffer: Uint8Array = new Uint8Array([0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF,
          0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF, 0XFF]);

        let manufactureData: geoLocationManager.BeaconManufactureData = {
          manufactureId: 0X004C,
          manufactureData: manufactureDataBuffer.buffer,
          manufactureDataMask: manufactureDataMaskBuffer.buffer
        };

        let beacon: geoLocationManager.BeaconFence = {
          identifier: "11",
          beaconFenceInfoType: geoLocationManager.BeaconFenceInfoType.BEACON_MANUFACTURE_DATA,
          manufactureData: manufactureData
        };
        geoLocationManager.removeBeaconFence(beacon).then((result) => {
          console.info("geoLocationManager_removeBeaconFence_nop_test_021 promise, removeBeaconFence success");
          expect(result == null).assertTrue;
          done();
        }).catch((err: BusinessError) => {
          console.info("geoLocationManager_removeBeaconFence_nop_test_021 promise, errtype:" + typeof err.code + ", errCode:" + err.code + ", errMessage:" + err.message);
          expect(Number(err.code)).assertEqual(201);
          done();
        });
      } catch (err) {
        console.info('---geoLocationManager_removeBeaconFence_nop_test_021  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code)).assertEqual(201);
          console.info('---geoLocationManager_removeBeaconFence_nop_test_021  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   geoLocationManager_isWlanBssidMatched_nop_test_022
     * @tc.number SUB_geoLocationManager_isWlanBssidMatched_nop_test_022
     * @tc.desc   GnssGeofence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("geoLocationManager_isWlanBssidMatched_nop_test_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let wlanBssidArray: Array<string> = ["02:1b:32:23:ea:91", "02:1b:32:23:ea:93"];
        let bssid = geoLocationManager.getCurrentWifiBssidForLocating();
        console.info("getCurrentWifiBssidForLocating_0100" + bssid);
        if (bssid) {
          wlanBssidArray.push(bssid);
        } else {
          console.info("get bssid fail");
        }
        let rssiThreshold: number = -70;
        let needStartScan: boolean = true;
        geoLocationManager.isWlanBssidMatched(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
          console.info("Wlan Bssid Matched Result:" + res);
          expect(res).assertTrue();
          done();
        })
      } catch (err) {
        console.info('---geoLocationManager_isWlanBssidMatched_nop_test_022  catch ---' + typeof err.code + ',err:' + err.code);
        if (Number(err.code) === 201) {
          expect(Number(err.code)).assertEqual(201);
          console.info('---geoLocationManager_isWlanBssidMatched_nop_test_022  end type---' + typeof err.code + ',err:' + err.code);
          done();
        } else {
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   geoLocationManager_getActiveGeofences_nop_0023
     * @tc.number SUB_geoLocationManager_getActiveGeofences_nop_0023
     * @tc.desc   getActiveGeofences.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('geoLocationManager_getActiveGeofences_nop_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        geoLocationManager.getActiveGeoFences().then((res) => {
          if (res) {
            console.info("geoLocationManager_getActiveGeofences_nop_0023, fence num: " + res.size);
            expect(res != null).assertTrue();
            done();
          }
        }).catch((error: BusinessError) => {
          console.info("geoLocationManager_getActiveGeofences_nop_0023 promise, type err:" + typeof error.code + ', err:' + error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (error) {
        console.info("geoLocationManager_getActiveGeofences_nop_0023: errCode" + error.code + ", errMessage" + error.message);
        expect().assertFalse();
        done();
      }
    });

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
          console.info("SUB_Location_nop_findMatchingWlan_0100 Location is enabled, skip error code test ");
          done();
        }
        
        let wlanBssidArray: Array<string> = ['AA:BB:CC:DD:EE:FF'];
        let rssiThreshold: number = -70;
        let needStartScan: boolean = true;
        
        geoLocationManager.findMatchingWlan(wlanBssidArray, rssiThreshold, needStartScan).then((res) => {
          console.info('[lbs_js] SUB_Location_findMatchingWlan_0500 res: ' + JSON.stringify(res));
          expect().assertFail();
          done();
      }).catch((err: BusinessError) => {
          console.info('[lbs_js] SUB_Location_findMatchingWlan_0500 error: ' + JSON.stringify(err));
          if (err.code === 801) {
              expect(err.code === 801).assertTrue();
          } else {
              expect(err.code === 201).assertTrue();
          }
          done();
      });
      } catch (err) {
        console.info("SUB_Location_nop_findMatchingWlan_0100 error :" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      });


  })
}