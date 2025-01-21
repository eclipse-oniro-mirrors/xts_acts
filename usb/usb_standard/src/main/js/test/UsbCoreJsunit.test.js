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

import usbManager from '@ohos.usbManager';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


/* usb core functions test */
export default function UsbCoreJsFunctionsTest() {
describe('UsbCoreJsFunctionsTest', function () {

  var gDeviceList;
  var gPipe;
  var portCurrentMode;

  beforeAll(async function () {
    console.log('*************Usb Unit UsbCoreJsFunctionsTest Begin*************');
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
      console.info('usb case gDeviceList.length return: ' + gDeviceList.length);
      if (gDeviceList.length > 0) {
        if (usbPortList[0].status.currentMode == 1) {
          await usbManager.setPortRoles(usbPortList[0].id, usbManager.SOURCE, usbManager.HOST).then(data => {
            portCurrentMode = 2
            console.info('usb case setPortRoles return: ' + data);
          }).catch(error => {
            console.info('usb case setPortRoles error : ' + error);
          });
          CheckEmptyUtils.sleep(8000)
          console.log('*************Usb Unit Begin switch to host*************');
        }
      } else {
        portCurrentMode = 1
      }
    }
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test  Case*************');
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test  Case*************');
  })
  afterAll(function () {
    console.log('*************Usb Unit UsbCoreJsFunctionsTest End*************');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0500
   * @tc.name: getDevices
   * @tc.desc: Positive test: Get device list
   * @tc.desc: 【C-ALL-HARDWARE-0502】必须支持连接标准 USB 外围设备
   */
  it('SUB_USB_HostManager_JS_Func_0500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Func_0500 begin');
    console.info('*****SUB_USB_HostManager_JS_Func_0500 portcurrentMode**** ret : ' + portCurrentMode)
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    gDeviceList = usbManager.getDevices();
    if (gDeviceList.length == 0) {
      console.info('usb case get_devices list is null')
      expect(false).assertTrue();
      return
    }
    console.info('usb case getDevices ret length: ' + gDeviceList.length);
    expect(gDeviceList.length).assertLarger(0);
    console.info('usb SUB_USB_HostManager_JS_Func_0500:  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0900
   * @tc.name: hasRight
   * @tc.desc: Positive test: Permission query
   */
  it('SUB_USB_HostManager_JS_Func_0900', 0, function () {
    console.info('usb has_right_01 begin');
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
      var hasRight = usbManager.hasRight(gDeviceList[i].name)
      console.info('usb has_right ret :' + hasRight);
    }

    expect(true).assertTrue();
    console.info('usb SUB_USB_HostManager_JS_Func_0900 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0800
   * @tc.name: requestRight
   * @tc.desc: Positive test: Request permission
   */
  it('SUB_USB_HostManager_JS_Func_0800', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Func_0800 begin');
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
      await usbManager.requestRight(gDeviceList[i].name).then(hasRight => {
        console.info('usb request_right ret :' + hasRight);
        expect(hasRight).assertTrue();
        console.info('usb SUB_USB_HostManager_JS_Func_0800 :  PASS');
      }).catch(error => {
        console.info('usb case device request right failed : ' + error + ' :' + gDeviceList[i].name);
        expect(false).assertTrue();
      });
      CheckEmptyUtils.sleep(5000);
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_1200
   * @tc.name: removeRight
   * @tc.desc: Positive test: Remove Permissions
   */
  it('SUB_USB_HostManager_JS_Func_1200', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Func_1200 begin');
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
        console.info('usb HostManager_JS_Func_1200 requestRight hasRight:' + hasRight);
      }).catch(error => {
        console.info('usb HostManager_JS_Func_1200 requestRight error:' + error);
      });
      CheckEmptyUtils.sleep(5000);
    }
    var remRight = usbManager.removeRight(gDeviceList[0].name);
    console.info('usb remove_right ret :' + remRight);
    expect(remRight).assertTrue();
    console.info('usb SUB_USB_HostManager_JS_Func_1200 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0100
   * @tc.name: connectDevice
   * @tc.desc: Positive test: open device
   */
  it('SUB_USB_HostManager_JS_Func_0100', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_Func_0100 begin');
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
        console.info('usb HostManager_JS_Func_0100 requestRight hasRight:' + hasRight);
      }).catch(error => {
        console.info('usb HostManager_JS_Func_0100 requestRight error:' + error);
      });
      CheckEmptyUtils.sleep(5000)
    }

    gPipe = usbManager.connectDevice(gDeviceList[0])
    console.info('usb case connectDevice ret: ' + JSON.stringify(gPipe));
    expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();

    console.info('usb SUB_USB_HostManager_JS_Func_0100 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1300
   * @tc.name: closePipe
   * @tc.desc: Negative test: close device, busNum error
   */
  it('SUB_USB_HostManager_JS_Compatibility_1300', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1300 begin');
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

    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.busNum = -23
    var isPipClose = usbManager.closePipe(tmpPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();

    console.info('usb SUB_USB_HostManager_JS_Compatibility_1300 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1400
   * @tc.name: closePipe
   * @tc.desc: Negative test: close device, devAddress error
   */
  it('SUB_USB_HostManager_JS_Compatibility_1400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1400 begin');
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
    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.devAddress = -23
    var isPipClose = usbManager.closePipe(tmpPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();

    console.info('usb SUB_USB_HostManager_JS_Compatibility_1400 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1500
   * @tc.name: closePipe
   * @tc.desc: Negative test: close device, devAddress && busNum error
   */
  it('SUB_USB_HostManager_JS_Compatibility_1500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1500 begin');
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
    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.devAddress = -23
    tmpPipe.busNum = -23
    var isPipClose = usbManager.closePipe(tmpPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();

    console.info('usb SUB_USB_HostManager_JS_Compatibility_1500 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0300
   * @tc.name: closePipe
   * @tc.desc: Positive test: close device
   */
  it('SUB_USB_HostManager_JS_Func_0300', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Func_0300 begin');
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

    console.info('usb case closePipe param: ' + JSON.stringify(gPipe));
    var isPipClose = usbManager.closePipe(gPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);

    console.info('usb SUB_USB_HostManager_JS_Func_0300 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0700
   * @tc.name: getRawDescriptor
   * @tc.desc: Positive test: Get the original USB descriptor
   */
  it('SUB_USB_HostManager_JS_Func_0700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Func_0700 begin');
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

    gPipe = usbManager.connectDevice(gDeviceList[0])
    console.info('usb case getRawDescriptor param: ' + JSON.stringify(gPipe));
    var descriptor = usbManager.getRawDescriptor(gPipe);
    console.info('usb case getRawDescriptor ret: ' + descriptor);
    expect(descriptor.length).assertLarger(0);
    var isPipClose = usbManager.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);

    console.info('usb SUB_USB_HostManager_JS_Func_0700 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0600
   * @tc.name: getFileDescriptor
   * @tc.desc: Positive test: Get file descriptor
   */
  it('SUB_USB_HostManager_JS_Func_0600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Func_0600 begin');
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
    gPipe = usbManager.connectDevice(gDeviceList[0])
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usbManager.getFileDescriptor(gPipe);
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    expect(fileDescriptor >= 0).assertTrue();
    var isPipClose = usbManager.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);

    console.info('usb SUB_USB_HostManager_JS_Func_0600 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2900
   * @tc.name: getFileDescriptor
   * @tc.desc: Negative test: Get file descriptor, error busNum=512
   */
  it('SUB_USB_HostManager_JS_Compatibility_2900', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2900 begin');
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
    gPipe = usbManager.connectDevice(gDeviceList[0])
    var tempPipe = {busNum : 255, devAddress : 255}
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usbManager.getFileDescriptor(tempPipe);
    expect(fileDescriptor < 0).assertTrue();
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    var isPipClose = usbManager.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2900 :  PASS');
  })

   /**
    * @tc.number: SUB_USB_HostManager_JS_Compatibility_3000
    * @tc.name: getFileDescriptor
    * @tc.desc: Negative test: Get file descriptor,error devAddress=512
    */
  it('SUB_USB_HostManager_JS_Compatibility_3000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3000 begin');
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
    gPipe = usbManager.connectDevice(gDeviceList[0])
    var tempPipe = {busNum : 255, devAddress : gPipe.devAddress}
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usbManager.getFileDescriptor(tempPipe);
    expect(fileDescriptor < 0).assertTrue();
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    var isPipClose = usbManager.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3000 :  PASS');
  })

  /**
  * @tc.number: SUB_USB_HostManager_JS_Compatibility_3100
  * @tc.name: getFileDescriptor
  * @tc.desc: Negative test: Get file descriptor,error busNum=512 && devAddress=512
  */
  it('SUB_USB_HostManager_JS_Compatibility_3100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3100 begin');
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
    gPipe = usbManager.connectDevice(gDeviceList[0])
    var tempPipe = {busNum : gPipe.busNum, devAddress : 255}
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usbManager.getFileDescriptor(tempPipe);
    expect(fileDescriptor < 0).assertTrue();
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    var isPipClose = usbManager.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3100 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0700
   * @tc.name: getFileDescriptor
   * @tc.desc: Negative test: Get file descriptor, parameter type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_0700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0700 begin');
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
    gPipe = usbManager.connectDevice(gDeviceList[0])
    try {
      var maskCode = usbManager.getFileDescriptor("invalid");
      console.info('usb HostManager_JS_ErrCode_0700 case getFileDescriptor return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_0700 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0700 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1600
   * @tc.name: getFileDescriptor
   * @tc.desc: Negative test: Get file descriptor, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_1600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1600 begin');
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
    gPipe = usbManager.connectDevice(gDeviceList[0])
    try {
      var maskCode = usbManager.getFileDescriptor();
      console.info('usb HostManager_JS_ErrCode_1600 case getFileDescriptor return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1600 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1600 :  PASS');
    }
  })
})
}
