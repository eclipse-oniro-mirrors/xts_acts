/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import deviceManager from '@ohos.driver.deviceManager'
import { BusinessError } from '@ohos.base';

const TAG = 0x0000;

export default function PermissionTest(){
  describe("PermissionTest", ():void => {
    let deviceId: double = 0;
    const PERMISSION_DENIED_CODE = 201;
    const TEST_DEVICE_ID = 0;
    const TEST_DRIVER_UID = 'testDriverUid';

    beforeAll(() => {
      hilog.info(TAG, 'testTag', 'beforeAll called');
      try {
        let devices = deviceManager.queryDevices(deviceManager.BusType.USB);
        if (devices != null && devices.length > 0 && devices[0] != null) {
          deviceId = devices[0].deviceId;
          hilog.info(TAG, 'testTag', 'deviceId: ' + devices[0].deviceId);
          hilog.info(TAG, 'testTag', 'busType: ' + devices[0].busType);
          hilog.info(TAG, 'testTag', 'description: ' + devices[0].description);
        } else {
          hilog.info(TAG, 'testTag', 'No devices found.');
        }
      } catch (err) {
        hilog.info(TAG, 'testTag', 'err: ' + err);
      }

      if (deviceId == 0) {
        hilog.info(TAG, 'testTag', 'Device ID has not been set.');
      }
      hilog.info(TAG, 'testTag', 'beforeAll called end');
    })
    afterAll(() => {
      hilog.info(TAG, 'testTag', 'afterAll called');
    })

    beforeEach(() => {
      hilog.info(TAG, 'testTag', 'beforeEach called');
    })

    afterEach(() => {
      hilog.info(TAG, 'testTag', 'afterEach called');
    })

    /**
     * @tc.name   Permission_bindDriverWithDeviceId_001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0100
     * @tc.desc   verify permission of bindDriverWithDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Permission_bindDriverWithDeviceId_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:()=>void) : Promise<void> => {
        hilog.info(TAG, 'testTag', '-------------------Permission_bindDriverWithDeviceId_001-------------------------');
        if (deviceId == 0) {
          hilog.info(TAG, 'testTag', 'Device ID has not been set.');
          return done();
        } else {
          try {
            await deviceManager.bindDriverWithDeviceId(TEST_DEVICE_ID, (error, data) => {
              hilog.info(TAG, 'testTag', 'Test function is called');
              done();
            });
            expect(false).assertTrue();
            done();
          } catch (error) {
            error = error as BusinessError;
            hilog.info(TAG, 'testTag',
              'Test case Permission_bindDriverWithDeviceId_001 catch err : ' + JSON.stringify(error));
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
        }
      })

    /**
     * @tc.name   Permission_unbindDriverWithDeviceId_001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0200
     * @tc.desc   verify permission of unbindDriverWithDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Permission_unbindDriverWithDeviceId_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:()=>void) : Promise<void> => {
      hilog.info(TAG, 'testTag', '----------------------Permission_unbindDriverWithDeviceId--------------------------');
      if (deviceId == 0) {
          hilog.info(TAG, 'testTag', 'Device ID has not been set.');
          return done();
        } else {
          try {
            await deviceManager.unbindDriverWithDeviceId(TEST_DEVICE_ID);
            expect(false).assertTrue();
            done();
          } catch (error) {
            error = error as BusinessError;
            hilog.info(TAG, 'testTag', 'Test case Permission_unbindDriverWithDeviceId catch err :' + JSON.stringify(error));
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
        }
    })

    /**
     * @tc.name   Permission_queryDevices_001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0300
     * @tc.desc   verify permission of queryDevices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Permission_queryDevices_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    async (done:()=>void) : Promise<void> => {
      hilog.info(TAG, 'testTag', '----------------------Permission_queryDevices_001---------------------------');
      if (deviceId == 0) {
        hilog.info(TAG, 'testTag', 'Device ID has not been set.');
        return done();
      } else {
        try {
          deviceManager.queryDevices();
          expect(false).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(TAG, 'testTag', 'Test case Permission_queryDevices_001 catch err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
    });
  })
}