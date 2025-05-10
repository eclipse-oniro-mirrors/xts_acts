/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, afterAll, describe, it, expect } from "@ohos/hypium"
import usbManager from "@ohos.usbManager"


export default function UsbNormalAppJsTest() {
  

  describe('UsbNormalAppJsTest', () => {

    const TAG: string = "[UsbNormalAppJsTest]";
    const PERMISSION_NORMAL_RIGHT_CODE: number = 14400001;
    let deviceList = usbManager.getDevices();
    let portCurrentMode = 0;
    

    beforeAll(async () => {
      console.log('*************Usb Unit UsbNormalAppJsTest Begin*************');
      if (deviceList.length > 0) {
        portCurrentMode = 1;
      }
    })

    afterAll( ()=> {
      console.log('*************Usb Unit UsbNormalAppJsTest End*************');
    })
  
    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0900
     * @tc.name       : testConnectDeviceNormalApp001
     * @tc.desc       : connectDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testConnectDeviceNormalApp001', 0, async (done: Function) => {
      if (portCurrentMode != 1) {
        console.info('usb case get_device port is device');
        done()
        return
      }
      let device = deviceList[0];
      try {
          let right = usbManager.hasRight(deviceList[0].name);
          console.log(TAG, 'hasRight result: ' + right);
          if (!right) {
            let devicepipe = usbManager.connectDevice(device);
            console.log(TAG, 'connectDevice failed result: ' + devicepipe);
            expect(devicepipe === null).assertTrue();
          }
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceNormalApp001 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(PERMISSION_NORMAL_RIGHT_CODE);
      }
      done()
    });

  })

}

