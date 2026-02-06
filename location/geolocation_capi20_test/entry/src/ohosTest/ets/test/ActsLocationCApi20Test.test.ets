/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import locationcapi20 from 'liblocationcapi20.so'
import { geolocation, geoLocationManager } from '@kit.LocationKit';

const OS_LOCATION_ERR_OK = 0;

export default function ActsLocationCApi20Test() {
  describe('ActsLocationCApi20Test', () => {
    beforeAll(async (done: Function) => {
      geoLocationManager.disableLocation()
      done();
    }
    )

    /**
     * @tc.number  : SUB_LocationKit_OHLocationInfoGetAdditionalInfo_Test_0100
     * @tc.name    : testLocationKitOHLocationInfoGetAdditionalInfoTest0100
     * @tc.desc    : test OHLocationInfoGetAdditionalInfo.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOHLocationInfoGetAdditionalInfoTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OHLocationInfoGetAdditionalInfo_Test_0100 start====");
          let result = locationcapi20.OHLocationInfoGetAdditionalInfo();
          console.info("====>SUB_LocationKit_OHLocationInfoGetAdditionalInfo_Test_0100 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OHLocationInfoGetAdditionalInfo_Test_0100 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0100
     * @tc.name    : testLocationKitOH_Location_IsLocatingEnabledTest0100
     * @tc.desc    : test OH_Location_IsLocatingEnabled1.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_IsLocatingEnabledTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0100 start====");
          let result = locationcapi20.OH_Location_IsLocatingEnabled1();
          console.info("====>SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0100 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0100 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0101
     * @tc.name    : testLocationKitOH_Location_IsLocatingEnabledTest0101
     * @tc.desc    : test OH_Location_IsLocatingEnabled2.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_IsLocatingEnabledTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0101 start====");
          let result = locationcapi20.OH_Location_IsLocatingEnabled2();
          console.info("====>SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0101 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_Location_IsLocatingEnabled_Test_0101 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_StartLocating_Test_0100
     * @tc.name    : testLocationKitOH_Location_StartLocatingTest0100
     * @tc.desc    : test OH_Location_StartLocating1.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_StartLocatingTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_Location_StartLocating_Test_0100 start====");
          let result = locationcapi20.OH_Location_StartLocating1();
          console.info("====>SUB_LocationKit_OH_Location_StartLocating_Test_0100 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_Location_StartLocating_Test_0100 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      }
    )
    /**
     * @tc.number  : SUB_LocationKit_OH_Location_StartLocating_Test_0101
     * @tc.name    : testLocationKitOH_Location_StartLocatingTest0101
     * @tc.desc    : test OH_Location_StartLocating2.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_StartLocatingTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_Location_StartLocating_Test_0101 start====");
          let result = locationcapi20.OH_Location_StartLocating2();
          console.info("====>SUB_LocationKit_OH_Location_StartLocating_Test_0101 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_Location_StartLocating_Test_0101 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_StopLocating_Test_0100
     * @tc.name    : testLocationKitOH_Location_StopLocatingTest0100
     * @tc.desc    : test OH_Location_StopLocating2.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_StopLocatingTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_Location_StopLocating_Test_0100 start====");
          let result = locationcapi20.OH_Location_StopLocating2();
          console.info("====>SUB_LocationKit_OH_Location_StopLocating_Test_0100 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_Location_StopLocating_Test_0100 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0100
     * @tc.name    : testLocationKitOH_LocationRequestConfig_SetUseSceneTest0100
     * @tc.desc    : test OH_LocationRequestConfig_SetUseScene0100.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_LocationRequestConfig_SetUseSceneTest0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0100 start====");
          let result = locationcapi20.OH_LocationRequestConfig_SetUseScene0100();
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0100 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0100 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0101
     * @tc.name    : testLocationKitOH_LocationRequestConfig_SetUseSceneTest0101
     * @tc.desc    : test OH_LocationRequestConfig_SetUseScene0101.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_LocationRequestConfig_SetUseSceneTest0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0101 start====");
          let result = locationcapi20.OH_LocationRequestConfig_SetUseScene0101();
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0101 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0101 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0102
     * @tc.name    : testLocationKitOH_LocationRequestConfig_SetUseSceneTest0102
     * @tc.desc    : test OH_LocationRequestConfig_SetUseScene0102.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_LocationRequestConfig_SetUseSceneTest0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0102 start====");
          let result = locationcapi20.OH_LocationRequestConfig_SetUseScene0102();
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0102 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_LocationRequestConfig_SetUseScene_Test_0102 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0100
     * @tc.name    : testLocationKitOH_LocationRequestConfig_SetPowerConsumptionSceneTest0100
     * @tc.desc    : test OH_LocationRequestConfig_SetPowerConsumptionScene0100.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_LocationRequestConfig_SetPowerConsumptionSceneTest0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0100 start====");
          let result = locationcapi20.OH_LocationRequestConfig_SetPowerConsumptionScene0100();
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0100 result: " +
            result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0100 catch err: " +
            err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0101
     * @tc.name    : testLocationKitOH_LocationRequestConfig_SetPowerConsumptionSceneTest0101
     * @tc.desc    : test OH_LocationRequestConfig_SetPowerConsumptionScene0101.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_LocationRequestConfig_SetPowerConsumptionSceneTest0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0101 start====");
          let result = locationcapi20.OH_LocationRequestConfig_SetPowerConsumptionScene0101();
          console.info("====>SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0101 result: " +
            result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_LocationKit_OH_LocationRequestConfig_SetPowerConsumptionScene_Test_0101 catch err: " +
            err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })
  })
}
