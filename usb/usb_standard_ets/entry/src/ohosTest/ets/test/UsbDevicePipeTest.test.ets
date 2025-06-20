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
import parameter from '@ohos.systemparameter';
import { BusinessError } from '@ohos.base'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';


let gDeviceList: Array<usbMgr.USBDevice>;
let gPipe: usbMgr.USBDevicePipe | null;
let isDeviceConnected: boolean = true;
let testParam: TransferTestParam;
const TAG = "[UsbDevicePipeTest]";

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

function getControlTransferParam(iReqType: number, iReq: number, iValue: number, iIndex: number, iLength: number) {
  let tmpUint8Array = new Uint8Array(512);

  let requestParam: usbMgr.USBDeviceRequestParams = {
    bmRequestType: iReqType,
    bRequest: iReq,
    wValue: iValue,
    wIndex: iIndex,
    wLength: iLength,
    data: tmpUint8Array
  }
  return requestParam;
}

function getTransferParam(iCmd: number, iReqTarType: usbMgr.USBRequestTargetType, iReqType: usbMgr.USBControlRequestType,
  iValue: number, iIndex: number) {
  let tmpUint8Array = new Uint8Array(512);
  let requestCmd = iCmd
  let requestTargetType = iReqTarType
  let requestType = iReqType
  let value = iValue;
  let index = iIndex;
  let controlParam: usbMgr.USBControlParams = {
    request: requestCmd,
    target: requestTargetType,
    reqType: requestType,
    value: value,
    index: index,
    data: tmpUint8Array
  }
  return controlParam;
}

async function callControlTransfer(pip: usbMgr.USBDevicePipe, controlParam: usbMgr.USBControlParams, timeout: number,
  caseName: string) {
  await usbMgr.controlTransfer(pip, controlParam, timeout).then(data => {
    console.info(TAG, 'usb controlTransfer ret data : ' + data + ' ' + caseName);
    console.info(TAG, 'usb controlTransfer controlParam.data buffer : ' + controlParam.data + ' ' + caseName);
    expect(data >= 0).assertTrue();
  }).catch ((error: BusinessError) => {
    console.info(TAG, 'usb ' + caseName + ' controlTransfer error : ' + JSON.stringify(error));
    expect(error === null).assertTrue();
  });
}

async function callControlTransferEx(pip: usbMgr.USBDevicePipe, controlParam: usbMgr.USBControlParams, timeout: number,
  caseName: string) {
  await usbMgr.controlTransfer(pip, controlParam, timeout).then(data => {
    console.info(TAG, 'usb controlTransfer ret data : ' + data + ' ' + caseName);
    expect(data === null).assertTrue();
  });
}

function toReleaseInterface(testCaseName: string, conIndex: number, interIndex: number) {
  gDeviceList = usbMgr.getDevices();
  let tmpInterface = gDeviceList[0].configs[conIndex].interfaces[interIndex];
  let isClaim = usbMgr.releaseInterface(gPipe, tmpInterface);
  console.info(TAG, `usb ${testCaseName} toReleaseInterface ret: ${JSON.stringify(isClaim)}`);
  expect(isClaim).assertEqual(0);
}

/* usb device pipe test */
export default function UsbDevicePipeTest() {
  describe('UsbDevicePipeTest', () => {

    beforeAll( async () => {
      console.log(TAG, '*************Usb Unit UsbDevicePipeTest Begin*************');

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
        console.info(TAG, 'usb unit connectDevice gPipe ret : ' + JSON.stringify(gPipe));
      }
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test Case*************');
      gDeviceList = usbMgr.getDevices();
      console.info(TAG, 'beforeEach return getDevices : ' + JSON.stringify(gDeviceList));
      console.info(TAG, 'beforeEach return connectDevice gPipe : ' + JSON.stringify(gPipe));
    })
    afterEach(() => {
      console.info(TAG, 'afterEach: *************Usb Unit Test Case*************');
    })

    afterAll(() => {
      let isPipClose = usbMgr.closePipe(gPipe);
      console.info(TAG, 'usb unit close gPipe ret : ' + isPipClose);
      console.log(TAG, '*************Usb Unit UsbDevicePipeTest End*************');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_1000
     * @tc.name     : testBulkTransfer001
     * @tc.desc     : Positive test: bulk transfer, receive data
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.inEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.inEndpoint == null).assertFalse();
        return
      }
      testParam.isClaimed = usbMgr.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      console.info(TAG, 'usb case testBulkTransfer001 readData begin');
      let tmpUint8Array = new Uint8Array(testParam.maxInSize);
      try {
        let data = await usbMgr.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, 5000);
        console.info(TAG, 'usb case readData tmpUint8Array buffer : ' + CheckEmptyUtils.ab2str(tmpUint8Array));
        console.info(TAG, 'usb case readData ret: ' + data);
        expect(data >= 0).assertTrue();
      } catch (error) {
        console.info(TAG, 'usb case testBulkTransfer001 error : ' + error);
        expect(error === null).assertTrue();
      }
      let isClaim = usbMgr.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer001 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_1100
     * @tc.name     : testBulkTransfer002
     * @tc.desc     : Positive test: bulk transfer, send data
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer002 begin');
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

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb parameter getSync unexpected error: ' + e);
      }
      console.info(TAG, 'testBulkTransfer002 *********** ret: ' + JSON.stringify(testParam.outEndpoint));
      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      try {
        let data = await usbMgr.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000);
        console.info(TAG, 'usb case testBulkTransfer002 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer002 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      } catch (error) {
        console.info(TAG, 'usb testBulkTransfer002 write error : ' + error);
        expect(error === null).assertTrue();
      }
      let isClaim = usbMgr.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer002 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0400
     * @tc.name     : testBulkTransfer003
     * @tc.desc     : Undefined option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransfer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer003 begin');
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

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb testBulkTransfer003 parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb testBulkTransfer003 parameter getSync unexpected error: ' + e);
      }

      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      try {
        let data = await usbMgr.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, undefined);
        console.info(TAG, 'usb case testBulkTransfer003 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer003 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      } catch (error) {
        console.info(TAG, 'usb testBulkTransfer003 write error : ' + JSON.stringify(error));
        expect(error === null).assertTrue();
      }
      let isClaim = usbMgr.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer003 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0500
     * @tc.name     : testBulkTransfer004
     * @tc.desc     : Null option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransfer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer004 begin');
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

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb testBulkTransfer004 parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb testBulkTransfer004 parameter getSync unexpected error: ' + e);
      }

      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      await usbMgr.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, null).then(data => {
        console.info(TAG, 'usb case testBulkTransfer004 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer004 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      }).catch ((error: BusinessError) => {
        console.info(TAG, 'usb testBulkTransfer004 write error : ' + JSON.stringify(error));
        expect(error === null).assertTrue();
      });
      let isClaim = usbMgr.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer004 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibilityErr_0500
     * @tc.name     : testBulkTransfer801Err001
     * @tc.desc     : Null option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransfer801Err001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer801Err001 begin');
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

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb testBulkTransfer801Err001 parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb testBulkTransfer801Err001 parameter getSync unexpected error: ' + e);
      }
      try {
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        await usbMgr.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, null).then(data => {
          console.info(TAG, 'usb case testBulkTransfer801Err001 ret: ' + data);
          console.info(TAG, 'usb case testBulkTransfer801Err001 send data: ' + testParam.sendData);
          expect(data > 0).assertTrue();
        }).catch ((error: BusinessError) => {
          console.info(TAG, 'usb testBulkTransfer801Err001 write error : ' + JSON.stringify(error));
          expect(error === null).assertTrue();
        });
        let isClaim = usbMgr.releaseInterface(testParam.pip, testParam.interface);
        console.info(TAG, 'usb case testBulkTransfer801Err001 isClaim: ' + isClaim);
        expect(isClaim).assertEqual(0);
      } catch (err) {
        console.info(TAG, 'testBulkTransfer801Err001 catch err code: ', err);
        expect(err.code).assertEqual(801);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0600
     * @tc.name     : testBulkTransfer005
     * @tc.desc     : Ignore option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransfer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testBulkTransfer005 begin');
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

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb testBulkTransfer005 parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb testBulkTransfer005 parameter getSync unexpected error: ' + e);
      }

      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      await usbMgr.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array).then(data => {
        console.info(TAG, 'usb case testBulkTransfer005 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer005 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      }).catch ((error: BusinessError) => {
        console.info(TAG, 'usb testBulkTransfer005 write error : ' + JSON.stringify(error));
        expect(error === null).assertTrue();
      });
      let isClaim = usbMgr.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer005 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0400
     * @tc.name     : testClaimInterface001
     * @tc.desc     : Positive test: Get interface, and release
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClaimInterface001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb testClaimInterface001 case current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          //Attribute Prefabrication
          let interfaces = gDeviceList[0].configs[j].interfaces[k];
          let isClaim = usbMgr.claimInterface(gPipe, interfaces, true);
          console.info(TAG, 'usb case testClaimInterface001 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);

          toReleaseInterface('testClaimInterface001', j, k);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2100
     * @tc.name     : testClaimInterface003
     * @tc.desc     : Test the claimInterface() interface. Undefined option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClaimInterface003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface003 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface003 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          //Attribute Prefabrication
          let interfaces = gDeviceList[0].configs[j].interfaces[k];
          let isClaim = usbMgr.claimInterface(gPipe, interfaces, undefined);
          console.info(TAG, 'usb case testClaimInterface003 claimInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);

          toReleaseInterface('testClaimInterface003', j, k);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2200
     * @tc.name     : testClaimInterface004
     * @tc.desc     : Test the claimInterface() interface. Null option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterface004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClaimInterface004 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface004 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface004 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          //Attribute Prefabrication
          let interfaces = gDeviceList[0].configs[j].interfaces[k];
          let isClaim = usbMgr.claimInterface(gPipe, interfaces, null);
          console.info(TAG, 'usb case testClaimInterface004 claimInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);

          toReleaseInterface('testClaimInterface004', j, k);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2300
     * @tc.name     : testClaimInterface005
     * @tc.desc     : Test the claimInterface() interface. Ignore option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterface005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClaimInterface005 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb case testClaimInterface005 current device.configs.length = 0');
        expect(gDeviceList[0].configs.length == 0).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface005 current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          //Attribute Prefabrication
          let interfaces = gDeviceList[0].configs[j].interfaces[k];
          let isClaim = usbMgr.claimInterface(gPipe, interfaces);
          console.info(TAG, 'usb case testClaimInterface005 claimInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);

          toReleaseInterface('testClaimInterface005', j, k);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_1000
     * @tc.name     : testSetConfiguration001
     * @tc.desc     : Positive test: Set Device Configuration
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfiguration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetConfiguration001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let configs = gDeviceList[0].configs[j];
        configs.id = 1;
        configs.name = '';
        configs.maxPower = 1;
        configs.isRemoteWakeup = true;
        configs.isSelfPowered = true;
        let ret = usbMgr.setConfiguration(gPipe, gDeviceList[0].configs[j]);
        console.info(TAG, 'usb case testSetConfiguration001 return : ' + ret);
        expect(ret).assertEqual(0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3600
     * @tc.name     : testSetConfiguration002
     * @tc.desc     : Negative test: Set Device Configuration, USBConfig id error 255
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfiguration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetConfiguration002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let config: usbMgr.USBConfiguration = JSON.parse(JSON.stringify(gDeviceList[0].configs[j]));
        config.id = 255;
        let ret = usbMgr.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration002 return : ' + ret);
        expect(ret).assertLess(0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_1100
     * @tc.name     : testSetInterface001
     * @tc.desc     : Positive test: Set device interface
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetInterface001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let isClaim = usbMgr.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaim).assertEqual(0);

        let ret = usbMgr.setInterface(gPipe, gDeviceList[0].configs[j].interfaces[0]);
        console.info(TAG, 'usb case testSetInterface001 return : ' + ret);
        expect(ret).assertEqual(0);

        toReleaseInterface('testSetInterface002', j, 0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_4100
     * @tc.name     : testSetInterface002
     * @tc.desc     : Negative test: Set device interface, error tmpInterface.id 234
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testSetInterface002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        let isClaim = usbMgr.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaim).assertEqual(0);

        let tmpInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(gDeviceList[0].configs[j].interfaces[0]));
        tmpInterface.id = 234;
        let ret = usbMgr.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface002 return : ' + ret);
        expect(ret !== 0).assertTrue();

        toReleaseInterface('testSetInterface002', j, 0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0100
     * @tc.name     : testControlTransfer001
     * @tc.desc     : Positive test: control transfer, GetDescriptor: cmd 6 target 2 reqType 128 value 512 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(6, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), (2 << 8), 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer001 GetDescriptor');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0200
     * @tc.name     : testControlTransfer002
     * @tc.desc     : Positive test: control transfer, GetStatus: cmd 0 target 0 reqType 128 value 0 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(0, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer002 GetStatus');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0300
     * @tc.name     : testControlTransfer005
     * @tc.desc     : Test the bulkTransfer interface. Ignore option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer005 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let controlParam = getTransferParam(0, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
      await usbMgr.controlTransfer(testParam.pip, controlParam).then(data => {
        console.info(TAG, 'usb controlTransfer ret data : ', data, ' ', 'testControlTransfer005 GetStatus');
        console.info(TAG, 'usb controlTransfer controlParam.data buffer : ',
          controlParam.data, ' ', 'testControlTransfer005 GetStatus');
        expect(data >= 0).assertTrue();
      }).catch ((error: BusinessError) => {
        console.info(TAG, 'usb testControlTransfer005 controlTransfer error : ' + JSON.stringify(error));
        expect(error === null).assertTrue();
      });
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibilityErr_0300
     * @tc.name     : testControlTransfer801Err001
     * @tc.desc     : Test the bulkTransfer interface. Ignore option arguments, use default options.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer801Err001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer801Err001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }
      try{
        let controlParam = getTransferParam(0, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
        await usbMgr.controlTransfer(testParam.pip, controlParam).then(data => {
          console.info(TAG, 'usb controlTransfer ret data : ', data, ' ', 'testControlTransfer801Err001 GetStatus');
          console.info(TAG, 'usb controlTransfer controlParam.data buffer : ',
            controlParam.data, ' ', 'testControlTransfer801Err001 GetStatus');
          expect(data >= 0).assertTrue();
        }).catch ((error: BusinessError) => {
          console.info(TAG, 'usb testControlTransfer801Err001 controlTransfer error : ' + JSON.stringify(error));
          expect(error === null).assertTrue();
        });
      }catch(err){
        console.info(TAG, 'testControlTransfer801Err001 catch err code: ', err);
        expect(err.code).assertEqual(801);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0300
     * @tc.name     : testControlTransfer006
     * @tc.desc     : Positive test: control transfer, GetConfiguration: cmd 8 target 0 reqType 128 value 0 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer006 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(8, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer006 GetConfiguration');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0400
     * @tc.name     : testControlTransfer007
     * @tc.desc     : Positive test: control transfer, GetInterface: cmd 10 target 0 reqType 129 value 0 index 1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer007 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(10, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE & 0x1f), 0, 1);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer007 GetInterface');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0500
     * @tc.name     : testControlTransfer008
     * @tc.desc     : Positive test: control transfer, ClearFeature: cmd 1 target 0 reqType 0 value 0 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer008 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(1, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer008 ClearFeature');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0600
     * @tc.name     : testControlTransfer009
     * @tc.desc     : Positive test: control transfer, ClearFeature: cmd 255 target 1 reqType 129 value 512 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer009 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE & 0x1f), (2 << 8), 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer009 ClearFeature');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0700
     * @tc.name     : testControlTransfer010
     * @tc.desc     : Positive test: control transfer, ClearFeature: cmd 255 target 2 reqType 34 value 512 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer010 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_CLASS << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT & 0x1f), (2 << 8), 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer010 ClearFeature');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0800
     * @tc.name     : testControlTransfer011
     * @tc.desc     : Positive test: control transfer, ClearFeature: cmd 255 target 3 reqType 67 value 512 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer011 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_VENDOR << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER & 0x1f), (2 << 8), 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer011 ClearFeature');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranFunc_0900
     * @tc.name     : testControlTransfer012
     * @tc.desc     : Positive test: control transfer, ClearFeature: cmd 255 target 3 reqType 35 value 0 index 0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testControlTransfer012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testControlTransfer012 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      let testParam = getTransferTestParam();
      if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.inEndpoint == null).assertFalse();
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }

      let timeout = 5000;
      let controlParam = getTransferParam(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER,
        (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_CLASS << 5)
          | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER & 0x1f), 0, 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer012 ClearFeature');
    })
  })
}
