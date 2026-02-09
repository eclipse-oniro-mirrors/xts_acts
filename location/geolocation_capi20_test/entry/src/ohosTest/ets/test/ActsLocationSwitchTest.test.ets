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
import { geoLocationManager } from '@kit.LocationKit';
import { changedLocationMode } from "./ActsLocation20Test.test";

const OS_LOCATION_ERR_OK = 0;

export default function ActsLocationSwitchTest() {
  describe('ActsLocationSwitchTest', () => {
    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      await changedLocationMode();
      done();
    })
    afterAll(async (done: Function) => {
      geoLocationManager.disableLocation()
      done();
    }
    )

    /**
     * @tc.name   testLocationKitOH_Location_StartLocatingTest0103
     * @tc.number SUB_LocationKit_OH_Location_StartLocating_Test_0103
     * @tc.desc   test OH_Location_StartLocating1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocationKitOH_Location_StartLocatingTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testLocationKitOH_Location_StartLocatingTest0103 start====");
          let result = locationcapi20.OH_Location_StartLocating4();
          console.info("====>testLocationKitOH_Location_StartLocatingTest0103 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testLocationKitOH_Location_StartLocatingTest0103 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      }
    )

    /**
     * @tc.name   testLocationKitOH_Location_StartLocatingTest0104
     * @tc.number SUB_LocationKit_OH_Location_StartLocating_Test_0104
     * @tc.desc   test OH_Location_StartLocating1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLocationKitOH_Location_StartLocatingTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testLocationKitOH_Location_StartLocatingTest0104 start====");
          let result = locationcapi20.OH_Location_StartLocating4();
          console.info("====>testLocationKitOH_Location_StartLocatingTest0104 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testLocationKitOH_Location_StartLocatingTest0104 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      }
    )
  })
}
