/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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
export default function UsbPortJsFunctionsTest() {
describe('UsbPortJsFunctionsTest', function () {

  beforeAll(function () {
    console.log('*************Usb Unit UsbPortJsFunctionsTest Begin*************');
    var Version = usb.getVersion()
    console.info('begin test getversion :' + Version)
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test  Case*************');
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test  Case*************');
  })
  afterAll(function () {
    console.log('*************Usb Unit UsbPortJsFunctionsTest End*************');
  })

  /**
   * @tc.number: SUB_USB_JS_0410
   * @tc.name: getPorts
   * @tc.desc: Positive test: Get USB port description information list
   */
  it('SUB_USB_JS_0410', 0, function () {
    console.info('usb SUB_USB_JS_0410 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0410 usbPortList is null');
      expect(false).assertTrue();
      return
    }
    expect(usbPortList.length > 0).assertTrue();
    console.info('usb SUB_USB_JS_0410 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0220
   * @tc.name: getSupportedModes
   * @tc.desc: Positive test: Get the combination mask of the mode list supported by the specified port
   */
  it('SUB_USB_JS_0220', 0, function () {
    console.info('usb SUB_USB_JS_0220 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0220 usbPortList is null');
      expect(false).assertTrue();
      return
    }

    expect(usbPortList.length > 0).assertTrue();
    for (var i = 0; i < usbPortList.length; i++) {
      var maskCode = usb.getSupportedModes(usbPortList[i].id)
      expect(maskCode).assertEqual(usbPortList[i].supportedModes);
    }

    console.info('usb SUB_USB_JS_0220 :  PASS');
  })

})
}
