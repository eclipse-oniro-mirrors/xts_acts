/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, afterAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import usbMgr from "@ohos.usbManager"


export default function UsbSceneEtsTest() {
  

  describe('UsbSceneEtsTest', () => {

    const TAG: string = "[UsbSceneEtsTest]";
    let deviceList = usbMgr.getDevices();
    let portCurrentMode = 0;
    

    beforeAll(async () => {
      console.log('*************Usb Unit UsbSceneEtsTest Begin*************');
      if (deviceList.length > 0) {
        portCurrentMode = 1;
      }
    })

    afterAll( ()=> {
      console.log('*************Usb Unit UsbSceneEtsTest End*************');
    })
  
    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0900
     * @tc.name       : testConnectDeviceNormalApp001
     * @tc.desc       : connectDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testConnectDeviceNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (portCurrentMode != 1) {
        console.info('usb case get_device port is device');
        done()
        return
      }
      let device = deviceList[0];
      try {
          let right = usbMgr.hasRight(deviceList[0].name);
          console.log(TAG, 'hasRight result: ' + right);
          if (!right) {
            let devicepipe = usbMgr.connectDevice(device);
            console.log(TAG, 'connectDevice failed result: ' + devicepipe);
            expect(devicepipe === null).assertTrue();
          }
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceNormalApp001 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(14400001);
      }
      done()
    });

  })

}

