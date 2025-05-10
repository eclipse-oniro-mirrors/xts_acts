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

import usbMgr from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';


let gDeviceList: Array<usbMgr.USBDevice>;
let gPipe: usbMgr.USBDevicePipe | null;
let devices: usbMgr.USBDevice | null;
let isDeviceConnected: boolean = true;
const TAG = "[UsbCoreEtsTestEx]";

function deviceConnected() {
  if (gDeviceList.length > 0) {
    console.info(TAG, "Test USB device is connected");
    return true;
  }
  console.info(TAG, "Test USB device is not connected");
  return false;
}

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
    usbMgr.requestRight(gDeviceList[0].name).then(hasRight => {
      console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
    })
  } catch (err) {
    console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
    return
  }
}

function getPipe(testCaseName: string) {
  gPipe = usbMgr.connectDevice(devices);
  console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
  expect(gPipe !== null).assertTrue();
}

function toClosePipe(testCaseName: string) {
  let isPipClose = usbMgr.closePipe(gPipe);
  console.info(TAG, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
  expect(isPipClose).assertEqual(0);
}

/* usb core functions test */
export default function UsbCoreEtsTestEx() {
  describe('UsbCoreEtsTestEx', () => {

    beforeAll(async () => {
      console.log(TAG, '*************Usb Unit UsbCoreEtsTestEx Begin*************');

      // version > 17  host currentMode = 2 device currentMode = 1
      gDeviceList = usbMgr.getDevices();
      isDeviceConnected = deviceConnected();
      if (isDeviceConnected) {
        let hasRight = usbMgr.hasRight(gDeviceList[0].name);
        if (!hasRight) {
          console.info(TAG, `beforeAll: usb requestRight start`);
          await getPermission();
          CheckEmptyUtils.sleep(1000);
          await driveFn();
          CheckEmptyUtils.sleep(1000);
        }
      }
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
      gDeviceList = usbMgr.getDevices();
      if (isDeviceConnected) {
        devices = gDeviceList[0];
        console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
      }
    })

    afterEach(() => {
      console.info(TAG, 'afterEach: *************Usb Unit Test CaseEx*************');
      devices = null;
      gPipe = null;
      console.info(TAG, 'afterEach return devices : ' + JSON.stringify(devices));
      console.info(TAG, 'afterEach return gPipe : ' + JSON.stringify(gPipe));
    })

    afterAll(() => {
      console.log(TAG, '*************Usb Unit UsbCoreEtsTestEx End*************');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0100
     * @tc.name     : testConnectDevice002
     * @tc.desc     : Negative test: open device, error devAddress 2+10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDevice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb SUB_USB_HostManager_JS_Compatibility_0100 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.devAddress = 2 + 10000;
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testConnectDevice003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.busNum = 2 + 1000;
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testConnectDevice004 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.serial = 'asdfsd';
      try {
        gPipe = usbMgr.connectDevice(device);
        console.info(TAG, 'usb case testConnectDevice004 ret: ' + JSON.stringify(gPipe));
        expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
      } catch (err) {
        console.info(TAG, 'usb testConnectDevice004 fail: ' + err);
        expect(err !== null).assertTrue();
      }
      toClosePipe('testConnectDevice004');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0600
     * @tc.name     : testConnectDevice007
     * @tc.desc     : Negative test: open device, error productName 'sdfsdfe'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDevice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testConnectDevice007 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.productName = 'sdfsdfe';
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb connect_device_08 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.version = 'gwefsdf';
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testConnectDevice009 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.vendorId = 2 + 10000;
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testConnectDevice010 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.productId = 2 + 10000;
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb connect_device_11 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.clazz = 2 + 10000;
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb connect_device_12 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.subClass = 2 + 10000;
      try {
        gPipe = usbMgr.connectDevice(device);
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
    it('testConnectDevice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testConnectDevice013 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(devices));
      device.protocol = 2 + 10000;
      try {
        gPipe = usbMgr.connectDevice(device);
        console.info(TAG, 'usb case testConnectDevice013 ret: ' + JSON.stringify(gPipe));
        expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
      } catch (err) {
        console.info(TAG, 'usb testConnectDevice013 fail: ' + err);
        expect(err !== null).assertTrue();
      }
      toClosePipe('testConnectDevice013');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3400
     * @tc.name     : testHasRight002
     * @tc.desc     : Negative test: parameters exception, error deviceName add '$#'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testHasRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testHasRight002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let i = 0; i < gDeviceList.length; i++) {
        let deviceName = gDeviceList[i].name;
        deviceName = deviceName + '$#';
        let hasRight = usbMgr.hasRight(deviceName);
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
    it('testHasRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testHasRight003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let i = 0; i < gDeviceList.length; i++) {
        let deviceName = gDeviceList[i].name;
        deviceName = deviceName + 'abcdg';
        let hasRight = usbMgr.hasRight(deviceName);
        console.info(TAG, 'usb testHasRight003 ret :' + hasRight);
        expect(hasRight).assertFalse();
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
    it('testRequestRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testRequestRight002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let i = 0; i < gDeviceList.length; i++) {
        let deviceName = gDeviceList[i].name;
        deviceName = deviceName + '@#';
        try {
          let hasRight = await usbMgr.requestRight(deviceName);
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
    it('testRequestRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testRequestRight003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let i = 0; i < gDeviceList.length; i++) {
        let deviceName = gDeviceList[i].name;
        deviceName = deviceName + '123';

        try {
          let hasRight = await usbMgr.requestRight(deviceName);
          console.info(TAG, 'usb testRequestRight003 ret :' + hasRight);
          expect(hasRight).assertFalse();
        } catch (error) {
          console.info(TAG, 'usb testRequestRight003 error: ' + error);
          expect(error !== null).assertFalse();
        }
      }
    })
  })
}
