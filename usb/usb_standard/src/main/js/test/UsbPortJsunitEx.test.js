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
export default function UsbPortJsFunctionsTestEx() {
describe('UsbPortJsFunctionsTestEx', function () {

  var gPort;
  beforeAll(function () {
    console.log('*************Usb Unit UsbPortJsFunctionsTestEx Begin*************');
    var Version = usb.getVersion()
    console.info('begin test getversion :' + Version)
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Case*************');
  })

  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Case*************');
  })

  afterAll(function () {
    console.log('*************Usb Unit UsbPortJsFunctionsTest End*************');
  })

  /**
   * @tc.number: SUB_USB_JS_0230
   * @tc.name: getSupportedModes
   * @tc.desc: Negative test: Get the combination mask of the mode list supported by the specified port, id error
   */
  it('SUB_USB_JS_0230', 0, function () {
    console.info('usb SUB_USB_JS_0230 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0230 usbPortList is null');
      expect(false).assertTrue();
      return
    }

    expect(usbPortList.length > 0).assertTrue();
    gPort = usbPortList[0]
    var portID = usbPortList[0].id + 10
    var maskCode = usb.getSupportedModes(portID)
    expect(maskCode).assertEqual(usb.NONE);

    console.info('usb SUB_USB_JS_0230 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1210
   * @tc.name: getSupportedModes
   * @tc.desc: Negative test: Get the combination mask of the mode list supported by the specified port,
   * parameter type error
   */
  it('SUB_USB_JS_1210', 0, function () {
    console.info('usb SUB_USB_JS_1210 begin');
    try {
      var maskCode = usb.getSupportedModes("invalid");
      console.info('usb 1210 case getSupportedModes return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1210 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1210 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1380
   * @tc.name: getSupportedModes
   * @tc.desc: Negative test: Get the combination mask of the mode list supported by the specified port,
   * parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1380', 0, function () {
    console.info('usb SUB_USB_JS_1380 begin');
    try {
      var maskCode = usb.getSupportedModes();
      console.info('usb 1380 case getSupportedModes return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1380 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1380 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_0030
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: dataRole error
   */
  it('SUB_USB_JS_0030', 0, function () {
    var portId = gPort.id;
    var powerRole = usb.SINK;
    var dataRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb 0030 case setPortRoles return: ' + data);
      expect(data).assertFalse();
    }).catch(error => {
      console.info('usb 0030 case setPortRoles error : ' + error);
      expect(error).assertFalse();
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0030:  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0040
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: portId && powerRole error
   */
  it('SUB_USB_JS_0040', 0, function () {
    var portId = gPort.id;
    var powerRole = usb.NONE - 1;
    var dataRole = usb.DEVICE;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb 0040 case setPortRoles return: ' + data);
      expect(data).assertFalse();
    }).catch(error => {
      console.info('usb 0040 case setPortRoles error : ' + error);
      expect(error).assertFalse();
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0040:  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0050
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: portId && dataRole error
   */
  it('SUB_USB_JS_0050', 0, function () {
    var portId = gPort.id - 3;
    var powerRole = usb.SINK;
    var dataRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb 0050 case setPortRoles return: ' + data);
      expect(data).assertFalse();
    }).catch(error => {
      console.info('usb 0050 case setPortRoles error : ' + error);
      expect(error).assertFalse();
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0050:  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0060
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: powerRole && dataRole error
   */
  it('SUB_USB_JS_0060', 0, function () {
    var portId = gPort.id;
    var powerRole = usb.NONE - 1;
    var dataRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb 0060 case setPortRoles return: ' + data);
      expect(data).assertFalse();
    }).catch(error => {
      console.info('usb 0060 case setPortRoles error : ' + error);
      expect(error).assertFalse();
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0060:  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0070
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: portId && powerRole && dataRole error
   */
  it('SUB_USB_JS_0070', 0, function () {
    var portId = gPort.id - 1;
    var dataRole = usb.NONE - 1;
    var powerRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb 0070 case setPortRoles return: ' + data);
      expect(data).assertFalse();
    }).catch(error => {
      console.info('usb 0070 case setPortRoles error : ' + error);
      expect(error).assertFalse();
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0070:  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0080
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: portId error
   */
  it('SUB_USB_JS_0080', 0, function () {
    var portId = gPort.id - 1;
    var powerRole = 1;
    var dataRole = 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb 0080 case setPortRoles return: ' + data);
      expect(data).assertFalse();
    }).catch(error => {
      console.info('usb 0080 case setPortRoles error : ' + error);
      expect(error).assertFalse();
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0080:  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1410
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: parameter portId type exception
   */
  it('SUB_USB_JS_1410', 0, function () {
    console.info('usb SUB_USB_JS_1410 begin');
    var portId = "invalid";
    var powerRole = usb.SINK;
    var dataRole = usb.DEVICE;
    try {
      var maskCode = usb.setPortRoles(portId, powerRole, dataRole);
      console.info('usb 1410 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1410 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1410 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1190
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: parameter number exception, input a parameter
   */
  it('SUB_USB_JS_1190', 0, function () {
    console.info('usb SUB_USB_JS_1190 begin');
    try {
      var maskCode = usb.setPortRoles("invalid");
      console.info('usb 1190 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1190 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1190 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1390
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1390', 0, function () {
    console.info('usb SUB_USB_JS_1390 begin');
    try {
      var maskCode = usb.setPortRoles();
      console.info('usb 1390 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1390 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1390 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1590
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: parameter number exception, parameter powerRole type exception
   */
  it('SUB_USB_JS_1590', 0, function () {
    console.info('usb SUB_USB_JS_1590 begin');
    var portId = gPort.id;
    var powerRole = "invalid";
    var dataRole = usb.DEVICE;
    try {
      var maskCode = usb.setPortRoles(portId, powerRole, dataRole);
      console.info('usb 1590 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1590 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1590 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1600
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: parameter number exception, parameter dataRole type exception
   */
  it('SUB_USB_JS_1600', 0, function () {
    console.info('usb SUB_USB_JS_1600 begin');
    var portId = gPort.id;
    var powerRole = usb.SINK;
    var dataRole = "invalid";
    try {
      var maskCode = usb.setPortRoles(portId, powerRole, dataRole);
      console.info('usb 1600 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1600 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1600 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1610
   * @tc.name: setPortRoles
   * @tc.desc: Negative test: parameter number exception, input two parameter
   */
  it('SUB_USB_JS_1610', 0, function () {
    console.info('usb SUB_USB_JS_1610 begin');
    var portId = gPort.id;
    var powerRole = usb.SINK;
    try {
      var maskCode = usb.setPortRoles(portId, powerRole);
      console.info('usb 1610 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1610 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1610 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1200
   * @tc.name: getPorts
   * @tc.desc: Negative test: parameters exception(parameter transfer without parameter interface)
   */
  it('SUB_USB_JS_1200', 0, function () {
    console.info('usb SUB_USB_JS_1200 begin');
    try {
      var maskCode = usb.getPorts("invalid");
      console.info('usb 1200 case getPorts return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1200 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1200 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1180
   * @tc.name: setCurrentFunctions
   * @tc.desc: Negative test: parameter type error
   */
  it('SUB_USB_JS_1180', 0, function () {
    console.info('usb SUB_USB_JS_1180 begin');
    try {
      var maskCode = usb.setCurrentFunctions("invalid");
      console.info('usb 1180 case setCurrentFunctions return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1180 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1180 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1400
   * @tc.name: setCurrentFunctions
   * @tc.desc: Negative test: parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1400', 0, function () {
    console.info('usb SUB_USB_JS_1400 begin');
    try {
      var maskCode = usb.setCurrentFunctions();
      console.info('usb 1400 case setCurrentFunctions return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1400 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1400 :  PASS');
    }
  })
})
}
