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
import { BusinessError } from '@ohos.base';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import parameter from '@ohos.systemparameter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

let gDeviceList: Array<usbMgr.USBDevice>;
let gPipe: usbMgr.USBDevicePipe | null;
let devices: usbMgr.USBDevice | null;
let isDeviceConnected: boolean = true;
let testParam: TransferTestParam;
const TAG = "[UsbDevicePipeTestEx]";

interface TransferTestParam {
  config: usbMgr.USBConfiguration;
  device: usbMgr.USBDevice;
  pip: usbMgr.USBDevicePipe;
  inEndpoint: usbMgr.USBEndpoint;
  interface: usbMgr.USBInterface;
  outEndpoint: usbMgr.USBEndpoint;
  usbRequest: null;
  sendData: string;
  isClaimed: number;
  maxInSize: number;
  maxOutSize: number;
}

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

function findInitPoint(testParam: TransferTestParam, interfaceIndex: number): boolean {
  let isEndpointFound  = false;
  const endpoints = testParam.config.interfaces[interfaceIndex].endpoints;

  endpoints.forEach((endpoint: usbMgr.USBEndpoint) => {
    if (endpoint.type === usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK) {
      isEndpointFound = true;
      if (endpoint.direction === usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) {
        testParam.maxOutSize = endpoint.maxPacketSize;
        testParam.outEndpoint = endpoint;
      } else if (endpoint.direction === usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) {
        testParam.maxInSize = endpoint.maxPacketSize;
        testParam.inEndpoint = endpoint;
      }
    }
  });

  if (isEndpointFound) {
    testParam.interface = testParam.config.interfaces[interfaceIndex];
    return isEndpointFound;
  }
  return isEndpointFound;
}

function getFlag(testParam: TransferTestParam, j: number) {
  if (testParam.config.interfaces[j].endpoints.length == 0) {
    return false;
  }

  if (testParam.config.interfaces[j].clazz != 10 ||
    testParam.config.interfaces[j].subClass != 0 ||
    testParam.config.interfaces[j].protocol != 2) {
    return false;
  }
  return true;
}

function initPoint(testParam: TransferTestParam) {
  for (let j = 0; j < testParam.config.interfaces.length; j++) {
    if (getFlag(testParam, j) == true) {
      if (findInitPoint(testParam, j) == true) {
        break
      }
    }
  }
}

// Prefabrication transmission related parameters
function getTransferTestParam(): TransferTestParam {

  testParam = {
    config: gDeviceList[0].configs[0],
    device: gDeviceList[0],
    pip: gPipe || { busNum: 0, devAddress: 0 },
    inEndpoint: gDeviceList[0].configs[0].interfaces[0].endpoints[0],
    interface: gDeviceList[0].configs[0].interfaces[0],
    outEndpoint: gDeviceList[0].configs[0].interfaces[0].endpoints[0],
    usbRequest: null,
    sendData: '',
    isClaimed: 0,
    maxInSize: 1024,
    maxOutSize: 1024,
  };

  console.info(TAG, 'usb case gDeviceList.length: ' + gDeviceList.length);
  for (let i = 0; i < gDeviceList.length; i++) {
    testParam.device = gDeviceList[i];
    testParam.config = testParam.device.configs[0];
    if (gPipe !== null) {
      testParam.pip = gPipe;
    }
    initPoint(testParam);
  }
  return testParam;
}

function getPipe(testCaseName: string) {
  gPipe = usbMgr.connectDevice(devices);
  console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
  expect(gPipe !== null).assertTrue();
}


function toReleaseInterface(testCaseName: string, conIndex: number, interIndex: number) {
  gDeviceList = usbMgr.getDevices();
  let tmpInterface = gDeviceList[0].configs[conIndex].interfaces[interIndex];
  let isClaim = usbMgr.releaseInterface(gPipe, tmpInterface);
  console.info(TAG, `usb ${testCaseName} toReleaseInterface ret: ${JSON.stringify(isClaim)}`);
  expect(isClaim).assertEqual(0);
}

/* usb device pipe test */
export default function UsbDevicePipeTestEx() {
  describe('UsbDevicePipeTestEx', () => {

    beforeAll(async () => {
      console.log(TAG, '*************Usb Unit UsbDevicePipeTestEx Begin*************');

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
        gPipe = usbMgr.connectDevice(gDeviceList[0]);
        console.info(TAG, 'usb unit connectDevice  gPipe ret : ' + JSON.stringify(gPipe));
      }
    })
    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test Ex Case*************');
      try {
        gDeviceList = usbMgr.getDevices();
      } catch (error) {
        console.info(TAG, 'beforeEach catch error : ' + error);
      }
      console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(gDeviceList));
    })
    afterEach(() => {
      console.info(TAG, 'afterEach: *************Usb Unit Test Ex Case*************');
    })
    afterAll(() => {
      let isPipClose = usbMgr.closePipe(gPipe);
      console.info(TAG, 'usb unit close gPipe ret : ' + isPipClose);
      console.log(TAG, '*************Usb Unit UsbDevicePipeTestEx End*************');
    })

    /**
     * @tc.name   testBulkTransfer006
     * @tc.number SUB_USB_HostManager_JS_TranCompatibility_0700
     * @tc.desc   Negative test: bulk transfer, send data, error outEndpoint.address = 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer006 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      testParam.isClaimed = usbMgr.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send time 13213213 wzy 03';
      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let TmpTestParam = testParam;
      TmpTestParam.outEndpoint.address = 123;
      try {
        await usbMgr.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
          console.info(TAG, 'usb case testBulkTransfer006 ret: ' + data);
          console.info(TAG, 'usb case testBulkTransfer006 send data: ' + CheckEmptyUtils.ab2str(tmpUint8Array));
          expect(data).assertEqual(-1);
        })
      } catch(error) {
        console.info(TAG, 'usb testBulkTransfer006 write error : ' + JSON.stringify(error));
        expect(error !== null).assertFalse();
      }
    })

    /**
     * @tc.name   testBulkTransfer007
     * @tc.number SUB_USB_HostManager_JS_TranCompatibility_0800
     * @tc.desc   Negative test: bulk transfer, send data, error outEndpoint.number = 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer007 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      testParam.isClaimed = usbMgr.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send time 13213213 wzy  04';
      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let TmpTestParam = testParam;
      TmpTestParam.outEndpoint.number = 123;
      try {
        await usbMgr.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
          console.info(TAG, 'usb case testBulkTransfer007 ret: ' + data);
          console.info(TAG, 'usb case testBulkTransfer007 send data: ' + CheckEmptyUtils.ab2str(tmpUint8Array));
          expect(data > 0).assertTrue();
        })
      } catch(error) {
        console.info(TAG, 'usb testBulkTransfer007 write error : ' + JSON.stringify(error));
        expect(error !== null).assertFalse();
      }
    })

    /**
     * @tc.name   testBulkTransfer008
     * @tc.number SUB_USB_HostManager_JS_TranCompatibility_0900
     * @tc.desc   Negative test: bulk transfer, send data, error outEndpoint.type = 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer008 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      testParam.isClaimed = usbMgr.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send time 13213213 wzy 05';
      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let TmpTestParam = testParam;
      TmpTestParam.outEndpoint.type = 123;
      try {
        await usbMgr.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
          console.info(TAG, 'usb case testBulkTransfer008 ret: ' + data);
          console.info(TAG, 'usb case testBulkTransfer008 send data: ' + CheckEmptyUtils.ab2str(tmpUint8Array));
          expect(data > 0).assertTrue();
        })
      } catch(error) {
        console.info(TAG, 'usb testBulkTransfer008 write error : ' + JSON.stringify(error));
        expect(error !== null).assertFalse();
      }
    })

    /**
     * @tc.name   testClaimInterface006
     * @tc.number SUB_USB_HostManager_JS_Compatibility_2400
     * @tc.desc   Negative test: Get interface, USBInterface afferent error id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClaimInterface006 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface006 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface006 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          TmpInterface.id = 123;
          let isClaim = usbMgr.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface006 function return: ' + isClaim);
          expect(isClaim !== 0).assertTrue();
        }
      }
    })

    /**
     * @tc.name   testClaimInterface007
     * @tc.number SUB_USB_HostManager_JS_Compatibility_2500
     * @tc.desc   Negative test: Get interface, USBInterface afferent error protocol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClaimInterface007 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface007 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface007 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          TmpInterface.protocol = 120;
          let isClaim = usbMgr.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface007 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.name   testClaimInterface008
     * @tc.number SUB_USB_HostManager_JS_Compatibility_2600
     * @tc.desc   Negative test: Get interface, USBInterface afferent error clazz
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClaimInterface008 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface008 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface008 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          TmpInterface.clazz = 784;
          let isClaim = usbMgr.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface008 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.name   testClaimInterface009
     * @tc.number SUB_USB_HostManager_JS_Compatibility_2700
     * @tc.desc   Negative test: Get interface, USBInterface afferent error name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb SUB_USB_HostManager_JS_Compatibility_2700 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface009 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface009 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          TmpInterface.name = '123sdf';
          let isClaim = usbMgr.claimInterface(gPipe, TmpInterface, true)
          console.info(TAG, 'usb case testClaimInterface009 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.name   testClaimInterface010
     * @tc.number SUB_USB_HostManager_JS_Compatibility_2800
     * @tc.desc   Negative test: Get interface, USBInterface afferent error subClass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb SUB_USB_HostManager_JS_Compatibility_2800 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface010 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface010 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          TmpInterface.subClass = 1210;
          let isClaim = usbMgr.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface010 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.name   testReleaseInterface001
     * @tc.number SUB_USB_HostManager_JS_Compatibility_1600
     * @tc.desc   Negative test: release Interface, error Interface id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testReleaseInterface001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb testReleaseInterface001 case current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb testReleaseInterface001 case current device.configs.interfaces.length = 0');
          expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let tmpInterface = gDeviceList[0].configs[j].interfaces[k];
          let isClaimed = usbMgr.claimInterface(gPipe, tmpInterface, true);
          console.info(TAG, 'usb case testReleaseInterface001 claimInterface return: ' + isClaimed);
          expect(isClaimed).assertEqual(0);

          tmpInterface.id = 134;
          let isClaim = usbMgr.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface001 function return: ' + isClaim);
          expect(isClaim !== 0).assertTrue();
          toReleaseInterface('testReleaseInterface001', j, k);
        }
      }
    })

    /**
     * @tc.name   testReleaseInterface002
     * @tc.number SUB_USB_HostManager_JS_Compatibility_1700
     * @tc.desc   Negative test: release Interface, error Interface name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testReleaseInterface002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb testReleaseInterface002 case current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }
      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb testReleaseInterface002 case current device.configs.interfaces.length = 0');
          expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let tmpInterface = gDeviceList[0].configs[j].interfaces[k];
          let isClaimed = usbMgr.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.name = '134wer';
          let isClaim = usbMgr.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface002 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.name   testReleaseInterface003
     * @tc.number SUB_USB_HostManager_JS_Compatibility_1800
     * @tc.desc   Negative test: release Interface, error Interface clazz
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testReleaseInterface003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb testReleaseInterface003 case current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }
      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb testReleaseInterface003 case current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let tmpInterface = gDeviceList[0].configs[j].interfaces[k];
          let isClaimed = usbMgr.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.clazz = 78;
          let isClaim = usbMgr.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface003 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.name   testReleaseInterface004
     * @tc.number SUB_USB_HostManager_JS_Compatibility_1900
     * @tc.desc   Negative test: release Interface, error Interface protocol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb SUB_USB_HostManager_JS_Compatibility_1900 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb testReleaseInterface004 case current device.configs.length = 0');
        expect(false).assertTrue();
        return
      }
      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb testReleaseInterface004 case current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let tmpInterface = gDeviceList[0].configs[j].interfaces[k];
          let isClaimed = usbMgr.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.protocol = 124;
          let isClaim = usbMgr.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface004 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.name   testReleaseInterface005
     * @tc.number SUB_USB_HostManager_JS_Compatibility_2000
     * @tc.desc   Negative test: release Interface, error Interface subClass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testReleaseInterface005 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb testReleaseInterface005 case current device.configs.length = 0');
        expect(false).assertTrue();
        return
      }
      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb testReleaseInterface005 case current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let tmpInterface = gDeviceList[0].configs[j].interfaces[k];
          let isClaimed = usbMgr.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.subClass = 784;
          let isClaim = usbMgr.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface005 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.name   testSetInterface003
     * @tc.number SUB_USB_HostManager_JS_Compatibility_4200
     * @tc.desc   Negative test: Set device interface, Interface protocol error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetInterface003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testSetInterface003 current device.configs.interfaces.length = 0');
          expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
        }
        let isClaimed = usbMgr.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.protocol = 482;
        let ret = usbMgr.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface003 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface003', j, 0);
      }
    })

    /**
     * @tc.name   testSetInterface004
     * @tc.number SUB_USB_HostManager_JS_Compatibility_4300
     * @tc.desc   Negative test: Set device interface, Interface clazz error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetInterface004 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testSetInterface004 current device.configs.interfaces.length = 0');
          expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
        }
        let isClaimed = usbMgr.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.clazz = 482;
        let ret = usbMgr.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface004 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface004', j, 0);
      }
    })

    /**
     * @tc.name   testSetInterface005
     * @tc.number SUB_USB_HostManager_JS_Compatibility_4400
     * @tc.desc   Negative test: Set device interface, Interface subClass error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetInterface005 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testSetInterface005 current device.configs.interfaces.length = 0');
          expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
        }
        let isClaimed = usbMgr.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.subClass = 482;
        let ret = usbMgr.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface005 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface005', j, 0);
      }
    })

    /**
     * @tc.name   testSetInterface006
     * @tc.number SUB_USB_HostManager_JS_Compatibility_4500
     * @tc.desc   Negative test: Set device interface, Interface name error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetInterface006 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testSetInterface005 current device.configs.interfaces.length = 0');
          expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
        }
        let isClaimed = usbMgr.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.name = 'wer32';
        let ret = usbMgr.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface006 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface006', j, 0);
      }
    })

    /**
     * @tc.name   testSetConfiguration003
     * @tc.number SUB_USB_HostManager_JS_Compatibility_3700
     * @tc.desc   Negative test: Set Device Configuration, USBConfig name error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetConfiguration003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let config = gDeviceList[0].configs[j];
        config.name = 'asdfsd';
        let ret = usbMgr.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration003 return : ' + ret);
        expect(ret).assertEqual(0);
      }
    })

    /**
     * @tc.name   testSetConfiguration004
     * @tc.number SUB_USB_HostManager_JS_Compatibility_3800
     * @tc.desc   Negative test: Set Device Configuration, USBConfig name, id error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetConfiguration004 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let config = gDeviceList[0].configs[j];
        config.name = 'asdfsd';
        config.id = 154;
        let ret = usbMgr.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration004 return : ' + ret);
        expect(ret).assertLess(0);
      }
    })

    /**
     * @tc.name   testSetConfiguration005
     * @tc.number SUB_USB_HostManager_JS_Compatibility_3900
     * @tc.desc   Negative test: Set Device Configuration, USBConfig attributes error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetConfiguration005 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let config = gDeviceList[0].configs[j];
        config.attributes = 154;
        let ret = usbMgr.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration005 return : ' + ret);
        expect(ret == 0).assertTrue();
      }
    })

    /**
     * @tc.name   testSetConfiguration006
     * @tc.number SUB_USB_HostManager_JS_Compatibility_4000
     * @tc.desc   Negative test: Set Device Configuration, USBConfig name interval(1-16) error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetConfiguration006 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      if (gDeviceList.length == 0) {
        console.info(TAG, 'usb case get_device_list is null')
        expect(false).assertTrue();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let config = gDeviceList[0].configs[j];
        config.name = 'asdfsd';
        config.interfaces[0].endpoints[0].interval = 0;
        let ret = usbMgr.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration006 return : ' + ret);
        expect(ret == 0).assertTrue();
      }
    })
  })
}
