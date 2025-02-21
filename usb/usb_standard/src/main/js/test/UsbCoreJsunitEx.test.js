/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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

import usbManager from '@ohos.usbManager';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


/* usb core functions test */
export default function UsbCoreJsFunctionsTestEx() {
describe('UsbCoreJsFunctionsTestEx', function () {

  var gDeviceList
  var portCurrentMode
  var invalidCode = 0;

  beforeAll(async function () {
    console.log('*************Usb Unit UsbCoreJsFunctionsTestEx Begin*************');
    var Version = usbManager.getVersion()
    console.info('begin test getversion :' + Version)
    // version > 17  host currentMode = 2 device currentMode = 1
    var usbPortList = usbManager.getPorts()
    if (usbPortList == undefined) {
      portCurrentMode = 1;
      return
    }
    gDeviceList = usbManager.getDevices();
    if (usbPortList.length > 0) {
      if (gDeviceList.length > 0) {
        if (usbPortList[0].status.currentMode == 1) {
          await usbManager.setPortRoles(usbPortList[0].id, usbManager.SOURCE, usbManager.HOST).then(data => {
            portCurrentMode = 2
            console.info('usb case setPortRolesEx return: ' + data);
          }).catch(error => {
            console.info('usb case setPortRolesEx error : ' + error);
          });
          CheckEmptyUtils.sleep(8000)
          console.log('*************Usb Unit Begin switch to host*************');
        }
      } else {
        portCurrentMode = 1
      }
    }
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test CaseEx*************');
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test CaseEx*************');
  })
  afterAll(function () {
    console.log('*************Usb Unit UsbCoreJsFunctionsTestEx End*************');
  })


  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0100
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error devAddress
   */
  it('SUB_USB_HostManager_JS_Compatibility_0100', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0100 begin');
    console.info('*****SUB_USB_HostManager_JS_Compatibility_0100 portCurrentMode**** ret : ' + portCurrentMode)
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0100 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0100 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.devAddress = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' devAddress ' + device.devAddress);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertTrue();

    console.info('usb SUB_USB_HostManager_JS_Compatibility_0100 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0200
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error busNum
   */
  it('SUB_USB_HostManager_JS_Compatibility_0200', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0200 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0200 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.busNum = 2 + 1000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' busNum ' + device.busNum);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertTrue();
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0200 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0300
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error serial
   */
  it('SUB_USB_HostManager_JS_Compatibility_0300', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0300 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0300 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.serial = 'asdfsd'
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' serial ' + device.serial);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0300 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0400
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error name
   */
  it('SUB_USB_HostManager_JS_Compatibility_0400', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0400 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0400 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0400 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.name = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) + ' name ' + device.name);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertTrue();
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0400 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0500
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error manufacturerName
   */
  it('SUB_USB_HostManager_JS_Compatibility_0500', 0, async function () {
    console.info('usb connect_device_06 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0500 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0500 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.manufacturerName = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' manufacturerName ' + device.manufacturerName);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertTrue();
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0500 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0600
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error productName
   */
  it('SUB_USB_HostManager_JS_Compatibility_0600', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0600 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0600 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0600 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.productName = 'sdfsdfe'
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' productName ' + device.productName);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0600 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0700
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error version
   */
  it('SUB_USB_HostManager_JS_Compatibility_0700', 0, async function () {
    console.info('usb connect_device_08 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0700 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0700 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.version = 'gwefsdf'
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' version ' + device.version);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0700 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0800
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error vendorId
   */
  it('SUB_USB_HostManager_JS_Compatibility_0800', 0, async function () {
    console.info('usb connect_device_09 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0800 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0800 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.vendorId = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' vendorId ' + device.vendorId);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0800 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_0900
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error productId
   */
  it('SUB_USB_HostManager_JS_Compatibility_0900', 0, async function () {
    console.info('usb connect_device_10 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_0900 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_0900 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.productId = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) +
      ' productId ' + device.productId);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_0900 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1000
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error clazz
   */
  it('SUB_USB_HostManager_JS_Compatibility_1000', 0, async function () {
    console.info('usb connect_device_11 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_1000 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_1000 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.clazz = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) + ' clazz ' + device.clazz);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1000 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1100
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error subClass
   */
  it('SUB_USB_HostManager_JS_Compatibility_1100', 0, async function () {
    console.info('usb connect_device_12 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_1100 requestRight hasRight: ' + hasRight);
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_1100 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_1100 requestRight end');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.subClass = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) + ' subClass ' + device.subClass);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1100 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1200
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, error protocol
   */
  it('SUB_USB_HostManager_JS_Compatibility_1200', 0, async function () {
    console.info('usb connect_device_13 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_Compatibility_1200 requestRight error:' + error);
      });
      console.info('usb SUB_USB_HostManager_JS_Compatibility_1200 requestRight end:');
      CheckEmptyUtils.sleep(5000)
    }

    var device = JSON.parse(JSON.stringify(gDeviceList[0]));
    device.protocol = 2 + 10000
    try {
      var usbDevicePipe = usbManager.connectDevice(device)
    } catch (err) {
      expect(true).assertTrue();
      console.info('usb connectDevice fail：' + err);
    }
    console.info('usb case connectDevice ret: ' + JSON.stringify(usbDevicePipe) + ' protocol ' + device.protocol);
    expect(CheckEmptyUtils.isEmpty(usbDevicePipe)).assertFalse();
    var isPipClose = usbManager.closePipe(usbDevicePipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1200 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0400
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, parameter type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_0400', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0400 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
        console.info('usb HostManager_JS_ErrCode_0400 requestRight hasRight:' + hasRight);
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_0400 requestRight error:' + error);
      });
      CheckEmptyUtils.sleep(5000)
    }
    try {
      var maskCode = usbManager.connectDevice("invalid");
      console.info('usb HostManager_JS_ErrCode_0400 case connectDevice return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0400 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0400 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1700
   * @tc.name: connectDevice
   * @tc.desc: Negative test: open device, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_1700', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1700 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usbManager.hasRight(gDeviceList[0].name);
    if (!isRight) {
      await usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
        console.info('usb HostManager_JS_ErrCode_1700 requestRight hasRight:' + hasRight);
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_1700 requestRight error:' + error);
      });
      CheckEmptyUtils.sleep(5000)
    }
    try {
      var maskCode = usbManager.connectDevice();
      console.info('usb HostManager_JS_ErrCode_1700 case connectDevice return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1700 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1700 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3400
   * @tc.name: hasRight
   * @tc.desc: Negative test: parameters exception, error deviceName
   */
  it('SUB_USB_HostManager_JS_Compatibility_3400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3400 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name
      deviceName = deviceName + '$#'
      var hasRight = usbManager.hasRight(deviceName)
      console.info('usb has_right ret :' + hasRight);
      expect(hasRight).assertFalse();
    }
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3400 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3500
   * @tc.name: hasRight
   * @tc.desc: Negative test: parameters exception, the device a letter name
   */
  it('SUB_USB_HostManager_JS_Compatibility_3500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3500 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name
      deviceName = deviceName + 'abcdg'
      var hasRight = usbManager.hasRight(deviceName)
      console.info('usb hasRight ret :' + hasRight);
      expect(hasRight).assertFalse();
    }
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3500 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0200
   * @tc.name: hasRight
   * @tc.desc: Negative test: Permission query, parameter type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_0200', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.hasRight(invalidCode);
      console.info('usb HostManager_JS_ErrCode_0200 case hasRight return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0200 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0200 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1800
   * @tc.name: hasRight
   * @tc.desc: Negative test: Permission query, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_1800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1800 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.hasRight();
      console.info('usb HostManager_JS_ErrCode_1800 case hasRight return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1800 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1800 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3200
   * @tc.name: requestRight
   * @tc.desc: Negative test: Request permission, error deviceName
   */
  it('SUB_USB_HostManager_JS_Compatibility_3200', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name
      deviceName = deviceName + '@#'
      await usbManager.requestRight(deviceName).then(hasRight => {
        console.info('usb request_right ret :' + hasRight);
        expect(hasRight).assertFalse();
        console.info('usb SUB_USB_HostManager_JS_Compatibility_3200 :  PASS');
      }).catch(error => {
        expect(error).assertFalse();
        console.info('usb SUB_USB_HostManager_JS_Compatibility_3200 error: ' + error);
      });
      CheckEmptyUtils.sleep(5000);
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3300
   * @tc.name: requestRight
   * @tc.desc: Negative test: Request permission, the device name is a number
   */
  it('SUB_USB_HostManager_JS_Compatibility_3300', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name
      deviceName = deviceName + '123'
      await usbManager.requestRight(deviceName).then(hasRight => {
        console.info('usb request_right ret :' + hasRight);
        expect(hasRight).assertFalse();
        console.info('usb SUB_USB_HostManager_JS_Compatibility_3300 :  PASS');
      }).catch(error => {
        expect(error).assertFalse();
        console.info('usb SUB_USB_HostManager_JS_Compatibility_3300 error: ' + error);
      });
      CheckEmptyUtils.sleep(5000);
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0300
   * @tc.name: requestRight
   * @tc.desc: Negative test: Request permission, parameter type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_0300', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.requestRight(invalidCode);
      console.info('usb HostManager_JS_ErrCode_0300 case requestRight return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0300 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0300 :  PASS');
    }
    CheckEmptyUtils.sleep(5000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1900
   * @tc.name: requestRight
   * @tc.desc: Negative test: Request permission, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_1900', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1900 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.requestRight();
      console.info('usb HostManager_JS_ErrCode_1900 case requestRight return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1900 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1900 :  PASS');
    }
    CheckEmptyUtils.sleep(5000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0100
   * @tc.name: getDevices
   * @tc.desc: Negative test: Get device list, parameters exception(parameter transfer without parameter interface)
   */
  it('SUB_USB_HostManager_JS_ErrCode_0100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0100 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    try {
      var maskCode = usbManager.getDevices("invalid");
      console.info('usb HostManager_JS_ErrCode_0100 case getDevices return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0100 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0100 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0500
   * @tc.name: closePipe
   * @tc.desc: Negative test: close device, parameter type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_0500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0500 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.closePipe("invalid");
      console.info('usb HostManager_JS_ErrCode_0500 case closePipe return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0500 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0500 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2000
   * @tc.name: closePipe
   * @tc.desc: Negative test: close device, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2000 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.closePipe();
      console.info('usb HostManager_JS_ErrCode_2000 case closePipe return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2000 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2000 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0600
   * @tc.name: getRawDescriptor
   * @tc.desc: Negative test: Get the original USB descriptor, parameter type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_0600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0600 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.getRawDescriptor("invalid");
      console.info('usb HostManager_JS_ErrCode_0600 case getRawDescriptor return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0600 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0600 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2100
   * @tc.name: getRawDescriptor
   * @tc.desc: Negative test: Get the original USB descriptor, parameter number exception,
   * necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2100 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.getRawDescriptor();
      console.info('usb HostManager_JS_ErrCode_2100 case getRawDescriptor return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2100 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2100 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0800
   * @tc.name: removeRight
   * @tc.desc: Negative test: Remove Permissions, parameter type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_0800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0800 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.removeRight(invalidCode);
      console.info('usb HostManager_JS_ErrCode_0800 case removeRight return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0800 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0800 :  PASS');
    }
    CheckEmptyUtils.sleep(5000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2200
   * @tc.name: removeRight
   * @tc.desc: Negative test: Remove Permissions, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2200', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.removeRight();
      console.info('usb HostManager_JS_ErrCode_2200 case removeRight return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2200 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2200 :  PASS');
    }
    CheckEmptyUtils.sleep(5000);
  })
})
}
