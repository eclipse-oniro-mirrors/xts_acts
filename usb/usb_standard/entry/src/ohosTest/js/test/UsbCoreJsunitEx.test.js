/*
 * Copyright (c) 2021-2025 Huawei Device Co., Ltd.
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
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';


/* usb core functions test */
export default function UsbCoreJsFunctionsTestEx() {
describe('UsbCoreJsFunctionsTestEx', function () {

  let gDeviceList;
  let gPipe;
  let devices;
  let isDeviceConnected;
  const TAG = "[UsbCoreJsFunctionsTestEx]";
  const PARAM_INVALIDCODE = 123;
  const PARAM_INVALID = "invalid";

  function deviceConnected() {
    if (gDeviceList.length > 0) {
        console.info(TAG, "Test USB device is connected");
        return true;
    }
    console.info(TAG, "Test USB device is not connected");
    return false;
  }

  beforeAll(async function () {
    console.log(TAG, '*************Usb Unit UsbCoreJsFunctionsTestEx Begin*************');
    var Version = usbManager.getVersion();
    console.info(TAG, 'begin test getversion :' + Version)
    // version > 17  host currentMode = 2 device currentMode = 1
    gDeviceList = usbManager.getDevices();
    isDeviceConnected = deviceConnected();
    if (isDeviceConnected) {
      let hasRight = usbManager.hasRight(gDeviceList[0].name);
      if (!hasRight) {
        console.info(TAG, `beforeAll: usb requestRight start`);
        await getPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
      }
    }
  })

  beforeEach(function () {
    console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
    gDeviceList = usbManager.getDevices();
    if (isDeviceConnected) {
      devices = gDeviceList[0];
      console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
    }
  })

  afterEach(function () {
    console.info(TAG, 'afterEach: *************Usb Unit Test CaseEx*************');
    devices = null;
    gPipe = null;
    console.info(TAG, 'afterEach return devices : ' + JSON.stringify(devices));
    console.info(TAG, 'afterEach return gPipe : ' + JSON.stringify(gPipe));
  })

  afterAll(function () {
    console.log(TAG, '*************Usb Unit UsbCoreJsFunctionsTestEx End*************');
  })

  async function driveFn() {
    console.info('**************driveFn**************');
    try {
        let driver = await UiDriver.create();
        console.info(TAG, ` come in driveFn`);
        console.info(TAG, `driver is ${JSON.stringify(driver)}`);
        CheckEmptyUtils.sleep(1000);
        let button = await driver.findComponent(BY.text('允许'));
        console.info(TAG, `button is ${JSON.stringify(button)}`);
        CheckEmptyUtils.sleep(1000);
        await button.click();
    } catch (err) {
        console.info(TAG, 'err is ' + err);
        return;
    }
  }

  async function getPermission() {
    console.info('**************getPermission**************');
    try {
      usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
        console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
      })
    } catch (err) {
      console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
      return
    }
  }

  function getPipe(testCaseName) {
    gPipe = usbManager.connectDevice(devices);
    console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
    expect(gPipe !== null).assertTrue();
  }

  function toClosePipe(testCaseName) {
    let isPipClose = usbManager.closePipe(gPipe);
    console.info(TAG, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
    expect(isPipClose).assertEqual(0);
  }

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0100
   * @tc.name     : testConnectDevice002
   * @tc.desc     : Negative test: open device, error devAddress 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb SUB_USB_HostManager_JS_Compatibility_0100 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.devAddress = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice002 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice002 fail: ' + err);
      expect(err !== null).assertTrue();
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0200
   * @tc.name     : testConnectDevice003
   * @tc.desc     : Negative test: open device, error busNum 2+1000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.busNum = 2 + 1000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice003 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice003 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0300
   * @tc.name     : testConnectDevice004
   * @tc.desc     : Negative test: open device, error serial 'asdfsd'
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice004 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.serial = 'asdfsd';
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice004 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice004 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice004');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0400
   * @tc.name     : testConnectDevice005
   * @tc.desc     : Negative test: open device, error name 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice005 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.name = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice005 ret: ' + JSON.stringify(gPipe));
      expect(gPipe !== null).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice005 fail: ' + err);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0500
   * @tc.name     : testConnectDevice006
   * @tc.desc     : Negative test: open device, error manufacturerName 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice006 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    var device = JSON.parse(JSON.stringify(devices));
    device.manufacturerName = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice006 ret: ' + JSON.stringify(gPipe));
      expect(gPipe !== null).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice006 fail: ' + err);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0600
   * @tc.name     : testConnectDevice007
   * @tc.desc     : Negative test: open device, error productName 'sdfsdfe'
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice007 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.productName = 'sdfsdfe';
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice007 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice007 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice007');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0700
   * @tc.name     : testConnectDevice008
   * @tc.desc     : Negative test: open device, error version 'gwefsdf'
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb connect_device_08 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.version = 'gwefsdf';
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice008 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice008 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice008');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0800
   * @tc.name     : testConnectDevice009
   * @tc.desc     : Negative test: open device, error vendorId 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice009 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.vendorId = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice009 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice009 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice009');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0900
   * @tc.name     : testConnectDevice010
   * @tc.desc     : Negative test: open device, error productId 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice010 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.productId = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice010 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice010 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice010');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1000
   * @tc.name     : testConnectDevice011
   * @tc.desc     : Negative test: open device, error clazz 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb connect_device_11 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.clazz = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice011 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice011 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice011');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1100
   * @tc.name     : testConnectDevice012
   * @tc.desc     : Negative test: open device, error subClass 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb connect_device_12 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.subClass = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice012 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice012 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice012');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1200
   * @tc.name     : testConnectDevice013
   * @tc.desc     : Negative test: open device, error protocol 2+10000
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice013 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var device = JSON.parse(JSON.stringify(devices));
    device.protocol = 2 + 10000;
    try {
      gPipe = usbManager.connectDevice(device);
      console.info(TAG, 'usb case testConnectDevice013 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice013 fail: ' + err);
      expect(err !== null).assertTrue();
    }
    toClosePipe('testConnectDevice013');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0400
   * @tc.name     : testConnectDevice014
   * @tc.desc     : Negative test: open device, parameter type error PARAM_INVALID
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice014 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.connectDevice(PARAM_INVALID);
      console.info(TAG, 'usb testConnectDevice014 case connectDevice return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice014 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1700
   * @tc.name     : testConnectDevice015
   * @tc.desc     : Negative test: open device, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testConnectDevice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testConnectDevice015 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.connectDevice();
      console.info(TAG, 'usb testConnectDevice015 case connectDevice return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testConnectDevice015 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3400
   * @tc.name     : testHasRight002
   * @tc.desc     : Negative test: parameters exception, error deviceName add '$#'
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testHasRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testHasRight002 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name;
      deviceName = deviceName + '$#';
      var hasRight = usbManager.hasRight(deviceName);
      console.info(TAG, 'usb testHasRight002 ret :' + hasRight);
      expect(hasRight).assertFalse();
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3500
   * @tc.name     : testHasRight003
   * @tc.desc     : Negative test: parameters exception, the device add 'abcdg'
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testHasRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testHasRight003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name;
      deviceName = deviceName + 'abcdg';
      var hasRight = usbManager.hasRight(deviceName);
      console.info(TAG, 'usb testHasRight003 ret :' + hasRight);
      expect(hasRight).assertFalse();
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0200
   * @tc.name     : testHasRight004
   * @tc.desc     : Negative test: Permission query, parameter type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testHasRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testHasRight004 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.hasRight(PARAM_INVALIDCODE);
      console.info(TAG, 'usb testHasRight004 case hasRight return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testHasRight004 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1800
   * @tc.name     : testHasRight005
   * @tc.desc     : Negative test: Permission query, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testHasRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testHasRight005 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.hasRight();
      console.info(TAG, 'usb testHasRight005 case hasRight return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testHasRight005 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3200
   * @tc.name     : testRequestRight002
   * @tc.desc     : Negative test: Request permission, error deviceName add '@#'
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testRequestRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testRequestRight002 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name;
      deviceName = deviceName + '@#';
      try {
        let hasRight = await usbManager.requestRight(deviceName);
        console.info(TAG, 'usb testRequestRight002 ret :' + hasRight);
        expect(hasRight).assertFalse();
      } catch (error) {
        console.info(TAG, 'usb testRequestRight002 error: ' + error);
        expect(error !== null).assertFalse();
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3300
   * @tc.name     : testRequestRight003
   * @tc.desc     : Negative test: Request permission, the device name is a number
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testRequestRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    console.info(TAG, 'usb testRequestRight003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var deviceName = gDeviceList[i].name;
      deviceName = deviceName + '123';

      try {
        let hasRight = await usbManager.requestRight(deviceName);
        console.info(TAG, 'usb testRequestRight003 ret :' + hasRight);
        expect(hasRight).assertFalse();
      } catch (error) {
        console.info(TAG, 'usb testRequestRight003 error: ' + error);
        expect(error !== null).assertFalse();
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0300
   * @tc.name     : testRequestRight004
   * @tc.desc     : Negative test: Request permission, parameter type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testRequestRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testRequestRight004 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.requestRight(PARAM_INVALIDCODE);
      console.info(TAG, 'usb testRequestRight004 case requestRight return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testRequestRight004 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1900
   * @tc.name     : testRequestRight005
   * @tc.desc     : Negative test: Request permission, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testRequestRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testRequestRight005 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.requestRight();
      console.info(TAG, 'usb testRequestRight005 case requestRight return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testRequestRight005 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0100
   * @tc.name     : testGetDevices002
   * @tc.desc     : Negative test: Get device list, parameters exception(parameter transfer without parameter interface)
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testGetDevices002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testGetDevices002 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    try {
      var maskCode = usbManager.getDevices(PARAM_INVALID);
      console.info(TAG, 'usb testGetDevices002 case getDevices return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testGetDevices002 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0500
   * @tc.name     : testClosePipe005
   * @tc.desc     : Negative test: close device, parameter type error PARAM_INVALID
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testClosePipe005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testClosePipe005 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.closePipe(PARAM_INVALID);
      console.info(TAG, 'usb testClosePipe005 case closePipe return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testClosePipe005 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2000
   * @tc.name     : testClosePipe006
   * @tc.desc     : Negative test: close device, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testClosePipe006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb SUB_USB_HostManager_JS_ErrCode_2000 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.closePipe();
      console.info(TAG, 'usb testClosePipe006 case closePipe return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testClosePipe006 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0600
   * @tc.name     : testGetRawDescriptor002
   * @tc.desc     : Negative test: Get the original USB descriptor, parameter type error PARAM_INVALID
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testGetRawDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testGetRawDescriptor002 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.getRawDescriptor(PARAM_INVALID);
      console.info(TAG, 'usb testGetRawDescriptor002 case getRawDescriptor return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testGetRawDescriptor002 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2100
   * @tc.name     : testGetRawDescriptor003
   * @tc.desc     : Negative test: Get the original USB descriptor, parameter number exception,
   *           necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testGetRawDescriptor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testGetRawDescriptor003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.getRawDescriptor();
      console.info(TAG, 'usb testGetRawDescriptor003 case getRawDescriptor return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testGetRawDescriptor003 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0800
   * @tc.name     : testRemoveRight002
   * @tc.desc     : Negative test: Remove Permissions, parameter type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testRemoveRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testRemoveRight002 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.removeRight(PARAM_INVALIDCODE);
      console.info(TAG, 'usb testRemoveRight002 case removeRight return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testRemoveRight002 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2200
   * @tc.name     : testRemoveRight003
   * @tc.desc     : Negative test: Remove Permissions, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 3
   */
  it('testRemoveRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
    console.info(TAG, 'usb testRemoveRight003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.removeRight();
      console.info(TAG, 'usb testRemoveRight003 case removeRight return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testRemoveRight003 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

})
}
