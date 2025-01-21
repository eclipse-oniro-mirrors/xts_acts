/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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

import usb from '@ohos.usb';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

/* usb core functions test */
export default function UsbFunctionsJsFunctionsTest() {
describe('UsbFunctionsJsFunctionsTest', function () {

  beforeAll(function () {
    console.log('*************Usb Unit UsbFunctionsJsFunctionsTest Begin*************');
    var Version = usb.getVersion()
    console.info('begin test getversion :' + Version)
    // version > 17  host currentMode = 2 device currentMode = 1
    var usbPortList = usb.getPorts()
    if (usbPortList.length > 0) {
      if (usbPortList[0].status.currentMode == 2) {
        usb.setPortRoles(usbPortList[0].id, usb.SINK, usb.DEVICE).then(data => {
          console.info('usb case setPortRoles return: ' + data);
        }).catch(error => {
          console.info('usb case setPortRoles error : ' + error);
        });
        CheckEmptyUtils.sleep(8000)
        console.log('*************Usb Unit switch to device Begin*************');
      }
    }
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit  Test Case*************');
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit  Test Case*************');
  })
  afterAll(function () {
    console.log('*************Usb Unit UsbFunctionsJsFunctionsTest End*************');
  })

  /**
   * @tc.number: SUB_USB_JS_0330
   * @tc.name: getCurrentFunctions
   * @tc.desc: Positive test: Get current device mode, mask and description character conversion
   * @tc.desc: 【C-ALL-HARDWARE-0500】端口必须可连接到具有标准A型或C型的主机模式的USB端口
   */
  it('SUB_USB_JS_0330', 0, function () {
    console.info('usb SUB_USB_JS_0330 begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);

    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case usbFunctionsToString return str: ' + strMaskCode);
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(maskCode);
    console.info('usb SUB_USB_JS_0330 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0340
   * @tc.name: usbFunctionString
   * @tc.desc: Negative test: Get current device mode, mask and description character conversion, nMaskcode=0
   */
  it('SUB_USB_JS_0340', 0, function () {
    console.info('usb SUB_USB_JS_0340 begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);

    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case usbFunctionsToString return str: ' + strMaskCode);
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode usbFunctionsFromString return int: ' + nMaskCode);

    var errmaskCode = 0
    var strMaskCode = usb.usbFunctionsToString(errmaskCode)

    console.info('usb case ' + errmaskCode + ' usbFunctionsToString return str: ' + strMaskCode);

    var errStrMaskCode = 'none'
    var nMaskCode = usb.usbFunctionsFromString(errStrMaskCode)
    console.info('usb case errStrMaskCode ' + errStrMaskCode +
      ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.NONE);
    console.info('usb SUB_USB_JS_0340 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1000
   * @tc.name: getCurrentFunctions
   * @tc.desc: Negative test: Get the current device mode,
   * parameters exception(parameter transfer without parameter interface)
   */
  it('SUB_USB_JS_1000', 0, function () {
    console.info('usb SUB_USB_JS_1000 begin');
    try {
      var maskCode = usb.getCurrentFunctions("invalid");
      console.info('usb 1000 case getCurrentFunctions return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1000 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1000 :  PASS');
    }
  })
})
}
