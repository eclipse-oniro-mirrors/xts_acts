/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
export default function UsbPortAndFunctionsJsFunctionsTest() {
describe('UsbPortAndFunctionsJsFunctionsTest', function () {

  beforeAll(function () {
    console.log('*************Usb Unit UsbPortAndFunctionsJsFunctionsTest Begin*************');
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
    console.log('*************Usb Unit UsbPortAndFunctionsJsFunctionsTest End*************');
  })

  function callSetCurFunction(caseName, iValue) {
    console.info('usb case param case name:' + caseName);
    console.info('usb case param iValue:' + iValue);
    usb.setCurrentFunctions(iValue).then(data => {
      console.info('usb case SetCurFunction ret:' + data);
      expect(data).assertTrue();
      console.info('usb case ' + caseName + ': PASS');
    }).catch(error => {
      console.info('usb case ' + caseName + ' error : ' + error);
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(6000)
  }

  /**
   * @tc.number: SUB_USB_JS_0350
   * @tc.name: functions_test
   * @tc.desc: Positive test: Set the current USB function list in device mode, Set 1, Set as ACM function
   */
  it('SUB_USB_JS_0350', 0, function () {
    CheckEmptyUtils.sleep(3000)
    console.info('usb SUB_USB_JS_0350 set ACM begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);
    var funcString = usb.usbFunctionsToString(maskCode);
    console.info('usb case funcString:' + funcString);
    callSetCurFunction('SUB_USB_JS_0350 ACM 1', usb.ACM)
  })

  /**
   * @tc.number: SUB_USB_JS_0360
   * @tc.name: functions_test
   * @tc.desc: Positive test: Set the current USB function list in device mode, Set 2, Set as ECM function
   */
  it('SUB_USB_JS_0360', 0, function () {
    CheckEmptyUtils.sleep(3000)
    console.info('usb SUB_USB_JS_0360 set ECM begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);
    var funcString = usb.usbFunctionsToString(maskCode);
    console.info('usb case funcString:' + funcString);
    callSetCurFunction('SUB_USB_JS_0360 ECM 2', usb.ECM)
  })

  /**
   * @tc.number: SUB_USB_JS_0370
   * @tc.name: functions_test
   * @tc.desc: Positive test: Set the current USB function list in device mode, Set 3, Set as ACM、ECM function
   */
  it('SUB_USB_JS_0370', 0, function () {
    CheckEmptyUtils.sleep(3000)
    console.info('usb SUB_USB_JS_0370 set ACM ECM begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);
    var funcString = usb.usbFunctionsToString(maskCode);
    console.info('usb case funcString:' + funcString);
    callSetCurFunction('SUB_USB_JS_0370 ACM ECM 3', (usb.ACM | usb.ECM))
  })

  /**
   * @tc.number: SUB_USB_JS_0380
   * @tc.name: functions_test
   * @tc.desc: Positive test: Set the current USB function list in device mode, Set 4, Set as HDC function
   */
  it('SUB_USB_JS_0380', 0, function () {
    CheckEmptyUtils.sleep(3000)
    console.info('usb SUB_USB_JS_0380 set HDC begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);
    var funcString = usb.usbFunctionsToString(maskCode);
    console.info('usb case funcString:' + funcString);
    callSetCurFunction('SUB_USB_JS_0380 HDC 4', usb.HDC)
  })

  /**
   * @tc.number: SUB_USB_JS_0390
   * @tc.name: functions_test
   * @tc.desc: Positive test: Set the current USB function list in device mode, Set 5, Set as ACM、HDC function
   */
  it('SUB_USB_JS_0390', 0, function () {
    CheckEmptyUtils.sleep(3000)
    console.info('usb SUB_USB_JS_0390 set ACM HDC begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);
    var funcString = usb.usbFunctionsToString(maskCode);
    console.info('usb case funcString:' + funcString);
    callSetCurFunction('SUB_USB_JS_0390 ACM HDC 5', (usb.HDC | usb.ACM))
  })

  /**
   * @tc.number: SUB_USB_JS_0400
   * @tc.name: functions_test
   * @tc.desc: Positive test: Set the current USB function list in device mode, Set 6, Set as ECM、HDC function
   */
  it('SUB_USB_JS_0400', 0, function () {
    CheckEmptyUtils.sleep(3000)
    console.info('usb SUB_USB_JS_0400 set ECM HDC begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);
    var funcString = usb.usbFunctionsToString(maskCode);
    console.info('usb case funcString:' + funcString);
    callSetCurFunction('SUB_USB_JS_0400 ECM HDC 6', (usb.HDC | usb.ECM))
  })

    /**
   * @tc.number: SUB_USB_JS_0010
   * @tc.name: setPortRoles
   * @tc.desc: Positive test: Switch to Device, set powerRole 2 DataRole 2
   */
  it('SUB_USB_JS_0010', 0, function () {
    console.info('usb SUB_USB_JS_0010 device 2 2 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0010 device 2 2 usbPortList is null');
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < usbPortList.length; i++) {
      console.info('usb 0010 case set data role 2, data role 2');
      usb.setPortRoles(usbPortList[i].id, usb.SINK, usb.DEVICE).then(data => {
        console.info('usb 0010 case setPortRoles return: ' + data);
        expect(data).assertTrue();
      }).catch(error => {
        console.info('usb 0010 case setPortRoles error : ' + error);
        expect(false).assertTrue();
      });
      CheckEmptyUtils.sleep(8000)
    }

    console.info('usb SUB_USB_JS_0010 device 2 2:  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0020
   * @tc.name: setPortRoles
   * @tc.desc: Positive test: Switch to host, set powerRole 1 DataRole 1
   */
  it('SUB_USB_JS_0020', 0, function () {
    console.info('usb SUB_USB_JS_0020 host 1 1 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0020 host 1 1 usbPortList is null');
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < usbPortList.length; i++) {
      console.info('usb 0020 case set data role 1, data role 1');
      usb.setPortRoles(usbPortList[i].id, usb.SOURCE, usb.HOST).then(data => {
        console.info('usb 0020 case setPortRoles return: ' + data);
        expect(data).assertTrue();
      }).catch(error => {
        console.info('usb 0020 case setPortRoles error : ' + error);
        expect(false).assertTrue();
      });
      CheckEmptyUtils.sleep(8000)
    }

    console.info('usb SUB_USB_JS_0020 host 1 1:  PASS');
  })
})
}
