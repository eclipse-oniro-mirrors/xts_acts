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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import devicemanagerndktest from 'libactsdevicemanagerndk.so'

const KEY_CODE_EVENT_OK = 0;
const KEY_CODE_EVENT_ERROR = 1

export default function DeviceManagerTest() {
  describe('DeviceManagerTest', () => {
    /*
     * @tc.number     : SUB_DistributedServiceKit_Get_Local_Device_Name_0100
     * @tc.name       : testDistributedServiceKitGetLocalDeviceName0100
     * @tc.desc       : testing ERR_OK interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDistributedServiceKitGetLocalDeviceName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testDistributedServiceKitGetLocalDeviceName0100 start====");
          let result: number = devicemanagerndktest.GetLocalDeviceNameErrorCodeOK();
          console.info("====>testDistributedServiceKitGetLocalDeviceName0100 result====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testDistributedServiceKitGetLocalDeviceName0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })
  })
}
