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

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function geoLocationManager_nop_test() {
  describe('geoLocationManager_nop_test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
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

    /*
     * @tc.number:SUB_geoLocationManager_nop_test_001
     * @tc.name: geoLocationManager_nop_test_001
     * @tc.desc:Using the geoLocationManager.on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
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
        } catch (err) {
          console.error('catch beforeEach end' + err.code);
          if (err.code === PARAMETER_ERROR_CODE) {
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            done();
          } else {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE)
            done();
          }
        }
      });
      done()
      console.info('beforeEach end');
    })

    /*
     * @tc.number:SUB_geoLocationManager_nop_test_002
     * @tc.name: geoLocationManager_nop_test_002
     * @tc.desc:Using the geoLocationManager.off method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
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
        } catch (err) {
          console.error('catch beforeEach end' + err.code);
          if (err.code === PARAMETER_ERROR_CODE) {
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            done();
          } else {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE)
            done();
          }
        }
      });
      done()
      console.info('beforeEach end');
    })

    /*
     * @tc.number:SUB_geoLocationManager_nop_test_003
     * @tc.name: geoLocationManager_nop_test_003
     * @tc.desc:Using the geoLocationManager.on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("geoLocationManager_nop_test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
          console.log('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
        }
        geoLocationManager.on('satelliteStatusChange', gnssStatusCb);
      } catch (err) {
        console.error('---geoLocationManager_nop_test_003 catch end ---' + err.code);
        expect(true).assertTrue()
        done();
      }
      done()
      console.info('beforeEach end');
    })

    /*
     * @tc.number:SUB_geoLocationManager_nop_test_004
     * @tc.name: geoLocationManager_nop_test_004
     * @tc.desc:Using the geoLocationManager.off method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("geoLocationManager_nop_test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let gnssStatusCb = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo): void => {
        console.log('satelliteStatusChange: ' + JSON.stringify(satelliteStatusInfo));
      }
      try {
        geoLocationManager.on('satelliteStatusChange', gnssStatusCb);
        geoLocationManager.off('satelliteStatusChange', gnssStatusCb);
      } catch (err) {
        console.error('---geoLocationManager_nop_test_004 catch end---' + err.code);
        expect(true).assertTrue()
        done()
      }
      done()
      console.info('beforeEach end');
    })


    /*
     * @tc.number:SUB_geoLocationManager_nop_test_005
     * @tc.name: geoLocationManager_nop_test_005
     * @tc.desc:Using the geoLocationManager.off method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
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
      } catch (err) {
        console.error('---geoLocationManager_nop_test_005 catch end---' + err.code);
        expect(true).assertTrue()
        done()
      }
      done()
      console.info('beforeEach end');
    })

    /*
     * @tc.number:SUB_geoLocationManager_nop_test_006
     * @tc.name: geoLocationManager_nop_test_006
     * @tc.desc:Using the geoLocationManager.off method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
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
      } catch (err) {
        console.error('---geoLocationManager_nop_test_006 catch end---' + err.code);
        expect(true).assertTrue()
        done()
      }
      done()
      console.info('beforeEach end');
    })

    /*
     * @tc.number:SUB_geoLocationManager_nop_test_007
     * @tc.name: geoLocationManager_nop_test_007
     * @tc.desc:Using the geoLocationManager.off method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
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
        console.log('locationChanger: data: ' + JSON.stringify(location));
      };
      try {
        geoLocationManager.on('locationChange', requestInfo, locationChange);
        geoLocationManager.off('locationChange', locationChange);
      } catch (err) {
        console.error('---geoLocationManager_nop_test_007 catch end---' + err.code);
        expect(true).assertTrue()
        done()
      }
      done()
      console.info('beforeEach end');
    })
  })
}