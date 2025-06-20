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

import usb from '@ohos.usb';
import { UiDriver, BY } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base'
import CheckEmptyUtils from './CheckEmptyUtils.js';
import EventConstants from './EventConstants.js';
import parameter from '@ohos.systemparameter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';


let gDeviceList: Array<usb.USBDevice>;
let gPipe: usb.USBDevicePipe;
let devices: usb.USBDevice;
let isDeviceConnected: boolean = true;
let testParam: TransferTestParam;
const TAG = "[UsbApiDeprecatedEtsTest]";

interface TransferTestParam {
  config: usb.USBConfig;
  device: usb.USBDevice;
  pip: usb.USBDevicePipe;
  inEndpoint: usb.USBEndpoint;
  interface: usb.USBInterface;
  outEndpoint: usb.USBEndpoint;
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
    usb.requestRight(gDeviceList[0].name).then(hasRight => {
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

  endpoints.forEach((endpoint: usb.USBEndpoint) => {
    if (endpoint.type === EventConstants.USB_ENDPOINT_XFER_BULK) {
      isEndpointFound = true;
      if (endpoint.direction === usb.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) {
        testParam.maxOutSize = endpoint.maxPacketSize;
        testParam.outEndpoint = endpoint;
      } else if (endpoint.direction === usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) {
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
    pip: gPipe,
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
    testParam.pip = gPipe;
    initPoint(testParam);
  }
  return testParam;
}


function getTransferParam(iCmd: number, iReqTarType: usb.USBRequestTargetType, iReqType: usb.USBControlRequestType,
  iValue: number, iIndex: number) {
  let tmpUint8Array = new Uint8Array(512);
  let requestCmd = iCmd
  let requestTargetType = iReqTarType
  let requestType = iReqType
  let value = iValue;
  let index = iIndex;
  let controlParam: usb.USBControlParams = {
    request: requestCmd,
    target: requestTargetType,
    reqType: requestType,
    value: value,
    index: index,
    data: tmpUint8Array
  }
  return controlParam;
}

async function callControlTransfer(pip: usb.USBDevicePipe, controlParam: usb.USBControlParams, timeout: number,
  caseName: string) {
  await usb.controlTransfer(pip, controlParam, timeout).then(data => {
    console.info(TAG, 'usb controlTransfer ret data : ' + data + ' ' + caseName);
    console.info(TAG, 'usb controlTransfer controlParam.data buffer : ' + controlParam.data + ' ' + caseName);
    expect(data >= 0).assertTrue();
  }).catch ((error: BusinessError) => {
    console.info(TAG, 'usb ' + caseName + ' controlTransfer error : ' + JSON.stringify(error));
    expect(error === null).assertTrue();
  });
}

async function callControlTransferEx(pip: usb.USBDevicePipe, controlParam: usb.USBControlParams, timeout: number,
  caseName: string) {
  await usb.controlTransfer(pip, controlParam, timeout).then(data => {
    console.info(TAG, 'usb controlTransfer ret data : ' + data + ' ' + caseName);
    expect(data === null).assertTrue();
  });
}

function toReleaseInterface(testCaseName: string, conIndex: number, interIndex: number) {
  gDeviceList = usb.getDevices();
  let tmpInterface = gDeviceList[0].configs[conIndex].interfaces[interIndex];
  let isClaim = usb.releaseInterface(gPipe, tmpInterface);
  console.info(TAG, `usb ${testCaseName} toReleaseInterface ret: ${JSON.stringify(isClaim)}`);
  expect(isClaim).assertEqual(0);
}

function getPipe(testCaseName: string) {
  gPipe = usb.connectDevice(devices);
  console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
  expect(gPipe !== null).assertTrue();
}

function toClosePipe(testCaseName: string) {
  let isPipClose = usb.closePipe(gPipe);
  console.info(TAG, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
  expect(isPipClose).assertEqual(0);
}

/* usb core functions test */
export default function UsbApiDeprecatedEtsTest() {
  describe('UsbApiDeprecatedEtsTest', () => {
    
    beforeAll(async () => {
      console.log(TAG, '*************Usb Unit UsbApiDeprecatedEtsTest Begin*************');

      // version > 17  host currentMode = 2 device currentMode = 1
      try {
        gDeviceList = usb.getDevices();
        console.info(TAG, 'beforeAll: usb case gDeviceList return: ' + gDeviceList);
        isDeviceConnected = deviceConnected();
        if (isDeviceConnected) {
          console.info(TAG, 'beforeAll: usb case gDeviceList return: ' + JSON.stringify(gDeviceList));
          let hasRight = usb.hasRight(gDeviceList[0].name);
          if (!hasRight) {
            console.info(TAG, `beforeAll: usb requestRight start`);
            await getPermission();
            CheckEmptyUtils.sleep(1000);
            await driveFn();
            CheckEmptyUtils.sleep(1000);
          }
        }
      } catch (error) {
        console.info(TAG, `beforeAll usb catch error: ${error}`);
      }
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test  Case*************');
      gDeviceList = usb.getDevices();
      if (isDeviceConnected) {
        devices = gDeviceList[0];
        console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
      }
    })

    afterEach(() => {
      console.info(TAG, 'afterEach: *************Usb Unit Test  Case*************');
      console.info(TAG, 'afterEach return devices : ' + JSON.stringify(devices));
      console.info(TAG, 'afterEach return devices : ' + JSON.stringify(gPipe));
    })

    afterAll(() => {
      console.log(TAG, '*************Usb Unit UsbApiDeprecatedEtsTest End*************');
    })
    

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0500
     * @tc.name     : testGetDevices001
     * @tc.desc     : Positive test: Get device list
     * @tc.desc     : 【C-ALL-HARDWARE-0502】必须支持连接标准 USB 外围设备
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info(TAG, 'usb testGetDevices001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        done();
        return
      }
      gDeviceList = usb.getDevices();
      console.info(TAG, 'usb case getDevices ret length: ' + gDeviceList.length);
      expect(gDeviceList.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0900
     * @tc.name     : testHasRight001
     * @tc.desc     : Positive test: Permission query
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testHasRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info(TAG, 'usb testHasRight001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        done();
        return
      }

      for (let i = 0; i < gDeviceList.length; i++) {
        let hasRight = usb.hasRight(gDeviceList[i].name);
        console.info(TAG, 'usb has_right ret :' + hasRight);
        expect(hasRight).assertTrue();
      }
      done();
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0800
     * @tc.name     : testRequestRight001
     * @tc.desc     : Positive test: Request permission
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRequestRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testRequestRight001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      for (let i = 0; i < gDeviceList.length; i++) {
        try {
          let hasRight = await usb.requestRight(gDeviceList[i].name);
          console.info(TAG, 'usb testRequestRight001 ret :' + hasRight);
          expect(hasRight).assertTrue();
        } catch(error) {
          console.info(TAG, 'usb case device request right failed : ' + error + ' :' + gDeviceList[i].name);
          expect(error !== null).assertFalse();
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0100
     * @tc.name     : testConnectDevice001
     * @tc.desc     : Positive test: open device
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      gPipe = usb.connectDevice(devices);
      console.info(TAG, 'usb case testConnectDevice001 ret: ' + JSON.stringify(gPipe));
      expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
      toClosePipe('testConnectDevice001');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0300
     * @tc.name     : testClosePipe001
     * @tc.desc     : Positive test: close device
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClosePipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClosePipe001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }
      getPipe('testClosePipe001');

      let isPipClose = usb.closePipe(gPipe);
      console.info(TAG, 'usb case closePipe ret: ' + isPipClose);
      expect(isPipClose).assertEqual(0);
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1300
     * @tc.name     : testClosePipe002
     * @tc.desc     : Negative test: close device, busNum error -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClosePipe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClosePipe002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testClosePipe002');
      let tmpPipe: usb.USBDevicePipe = JSON.parse(JSON.stringify(gPipe));
      tmpPipe.busNum = -23;
      console.info(TAG, 'usb case testClosePipe002 param: ' + JSON.stringify(tmpPipe));
      let isPipClose = usb.closePipe(tmpPipe);
      console.info(TAG, 'usb case testClosePipe002 ret: ' + isPipClose);
      expect(isPipClose == 0).assertFalse();
      toClosePipe('testClosePipe002');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1400
     * @tc.name     : testClosePipe003
     * @tc.desc     : Negative test: close device, devAddress error -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClosePipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClosePipe003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testClosePipe003');
      let tmpPipe: usb.USBDevicePipe = JSON.parse(JSON.stringify(gPipe));
      tmpPipe.devAddress = -23;
      console.info(TAG, 'usb case testClosePipe003 param: ' + JSON.stringify(tmpPipe));
      let isPipClose = usb.closePipe(tmpPipe);
      console.info(TAG, 'usb case testClosePipe003 ret: ' + isPipClose);
      expect(isPipClose == 0).assertFalse();
      toClosePipe('testClosePipe003');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1500
     * @tc.name     : testClosePipe004
     * @tc.desc     : Negative test: close device, devAddress && busNum error -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClosePipe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testClosePipe004 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testClosePipe004');
      let tmpPipe: usb.USBDevicePipe = JSON.parse(JSON.stringify(gPipe));
      tmpPipe.devAddress = -23;
      tmpPipe.busNum = -23;
      console.info(TAG, 'usb case testClosePipe004 param: ' + JSON.stringify(tmpPipe));
      let isPipClose = usb.closePipe(tmpPipe);
      console.info(TAG, 'usb case testClosePipe004 ret: ' + isPipClose);
      expect(isPipClose == 0).assertFalse();
      toClosePipe('testClosePipe004');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0700
     * @tc.name     : testGetRawDescriptor001
     * @tc.desc     : Positive test: Get the original USB descriptor
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetRawDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testGetRawDescriptor001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testGetRawDescriptor001');
      let descriptor = usb.getRawDescriptor(gPipe);
      console.info(TAG, 'usb case testGetRawDescriptor001 ret: ' + JSON.stringify(descriptor));
      expect(descriptor.length).assertLarger(0);
      toClosePipe('testGetRawDescriptor001');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0600
     * @tc.name     : testGetFileDescriptor001
     * @tc.desc     : Positive test: Get file descriptor
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testGetFileDescriptor001 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testGetFileDescriptor001');
      let fileDescriptor = usb.getFileDescriptor(gPipe);
      console.info(TAG, 'usb case testGetFileDescriptor001 ret: ' + fileDescriptor);
      expect(fileDescriptor >= 0).assertTrue();
      toClosePipe('testGetFileDescriptor001');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2900
     * @tc.name     : testGetFileDescriptor002
     * @tc.desc     : Negative test: Get file descriptor, error busNum=255 devAddress=255
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testGetFileDescriptor002 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testGetFileDescriptor002');
      let tempPipe: usb.USBDevicePipe = {busNum : 255, devAddress : 255};
      console.info(TAG, 'usb case testGetFileDescriptor002 param: ' + JSON.stringify(tempPipe));
      let fileDescriptor = usb.getFileDescriptor(tempPipe);
      console.info(TAG, 'usb case testGetFileDescriptor002 ret: ' + fileDescriptor);
      expect(fileDescriptor).assertEqual(-1);
      toClosePipe('testGetFileDescriptor002');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3000
     * @tc.name     : testGetFileDescriptor003
     * @tc.desc     : Negative test: Get file descriptor,error busNum=255
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testGetFileDescriptor003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testGetFileDescriptor003');
      let tempPipe: usb.USBDevicePipe = {busNum : 255, devAddress : gPipe.devAddress};
      console.info(TAG, 'usb case testGetFileDescriptor003 param: ' + JSON.stringify(tempPipe));
      let fileDescriptor = usb.getFileDescriptor(tempPipe);
      console.info(TAG, 'usb case testGetFileDescriptor003 ret: ' + fileDescriptor);
      expect(fileDescriptor).assertEqual(-1);
      toClosePipe('testGetFileDescriptor003');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3100
     * @tc.name     : testGetFileDescriptor004
     * @tc.desc     : Negative test: Get file descriptor,error devAddress=255
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testGetFileDescriptor004 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      getPipe('testGetFileDescriptor004');
      let tempPipe: usb.USBDevicePipe = {busNum : gPipe.busNum, devAddress : 255};
      console.info(TAG, 'usb case testGetFileDescriptor004 param: ' + JSON.stringify(tempPipe));
      let fileDescriptor = usb.getFileDescriptor(tempPipe);
      expect(fileDescriptor).assertEqual(-1);
      console.info(TAG, 'usb case testGetFileDescriptor004 ret: ' + fileDescriptor);
      toClosePipe('testGetFileDescriptor004');
    })
    //****************************************************************

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0100
     * @tc.name     : testConnectDevice002
     * @tc.desc     : Negative test: open device, error devAddress 2+10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDevice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb SUB_USB_HostManager_JS_Compatibility_0100 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.devAddress = 2 + 10000;
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice003 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.busNum = 2 + 1000;
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice004 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.serial = 'asdfsd';
      try {
        gPipe = usb.connectDevice(device);
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
     * @tc.name     : testConnectDevice006
     * @tc.desc     : Negative test: open device, error productName 'sdfsdfe'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDevice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice006 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.productName = 'sdfsdfe';
      try {
        gPipe = usb.connectDevice(device);
        console.info(TAG, 'usb case testConnectDevice006 ret: ' + JSON.stringify(gPipe));
        expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
      } catch (err) {
        console.info(TAG, 'usb testConnectDevice006 fail: ' + err);
        expect(err !== null).assertTrue();
      }
      toClosePipe('testConnectDevice006');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_0600
     * @tc.name     : testConnectDevice007
     * @tc.desc     : Negative test: open device, error manufacturerName 'sdfsdfe'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDevice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice007 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.manufacturerName = 'sdfsdfe';
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb connect_device_08 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.version = 'gwefsdf';
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice009 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.vendorId = 2 + 10000;
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice010 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.productId = 2 + 10000;
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb connect_device_11 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.clazz = 2 + 10000;
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb connect_device_12 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.subClass = 2 + 10000;
      try {
        gPipe = usb.connectDevice(device);
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
    it('testConnectDevice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, 'usb testConnectDevice013 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      let device: usb.USBDevice = JSON.parse(JSON.stringify(devices));
      device.protocol = 2 + 10000;
      try {
        gPipe = usb.connectDevice(device);
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
        let hasRight = usb.hasRight(deviceName);
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
        let hasRight = usb.hasRight(deviceName);
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
          let hasRight = await usb.requestRight(deviceName);
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
          let hasRight = await usb.requestRight(deviceName);
          console.info(TAG, 'usb testRequestRight003 ret :' + hasRight);
          expect(hasRight).assertFalse();
        } catch (error) {
          console.info(TAG, 'usb testRequestRight003 error: ' + error);
          expect(error !== null).assertFalse();
        }
      }
    })
    //********************************************************

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

      getPipe('testBulkTransfer001');
      let testParam = getTransferTestParam();
      console.info(TAG, 'usb case getTransferTestParam testParam: ' + JSON.stringify(testParam));
      if (testParam.interface == null || testParam.inEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.inEndpoint == null).assertFalse();
        return
      }
      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      console.info(TAG, 'usb case testBulkTransfer001 readData begin');
      let tmpUint8Array = new Uint8Array(testParam.maxInSize);
      try {
        let data = await usb.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, 5000);
        console.info(TAG, 'usb case readData tmpUint8Array buffer : ' + CheckEmptyUtils.ab2str(tmpUint8Array));
        console.info(TAG, 'usb case readData ret: ' + data);
        expect(data >= 0).assertTrue();
      } catch (error) {
        console.info(TAG, 'usb case testBulkTransfer001 error : ' + error);
        expect(error === null).assertTrue();
      }
      let isClaim = usb.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer001 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
      toClosePipe('testBulkTransfer001');
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

      getPipe('testBulkTransfer002');
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }
      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
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
        let data = await usb.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000);
        console.info(TAG, 'usb case testBulkTransfer002 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer002 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      } catch (error) {
        console.info(TAG, 'usb testBulkTransfer002 write error : ' + error);
        expect(error === null).assertTrue();
      }
      let isClaim = usb.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer002 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
      toClosePipe('testBulkTransfer002');
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

      getPipe('testBulkTransfer003');
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }
      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb testBulkTransfer003 parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb testBulkTransfer003 parameter getSync unexpected error: ' + e);
      }

      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let timeout = undefined;
      try {
        let data = await usb.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, timeout);
        console.info(TAG, 'usb case testBulkTransfer003 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer003 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      } catch (error) {
        console.info(TAG, 'usb testBulkTransfer003 write error : ' + JSON.stringify(error));
        expect(error === null).assertTrue();
      }
      let isClaim = usb.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer003 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
      toClosePipe('testBulkTransfer003');
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

      getPipe('testBulkTransfer004');
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }
      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb testBulkTransfer004 parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb testBulkTransfer004 parameter getSync unexpected error: ' + e);
      }

      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let timeout = null;
      await usb.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, timeout).then(data => {
        console.info(TAG, 'usb case testBulkTransfer004 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer004 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      }).catch ((error: BusinessError) => {
        console.info(TAG, 'usb testBulkTransfer004 write error : ' + JSON.stringify(error));
        expect(error === null).assertTrue();
      });
      let isClaim = usb.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer004 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
      toClosePipe('testBulkTransfer004');
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

      getPipe('testBulkTransfer801Err001');
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }
      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
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
        await usb.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, null).then(data => {
          console.info(TAG, 'usb case testBulkTransfer801Err001 ret: ' + data);
          console.info(TAG, 'usb case testBulkTransfer801Err001 send data: ' + testParam.sendData);
          expect(data > 0).assertTrue();
        }).catch ((error: BusinessError) => {
          console.info(TAG, 'usb testBulkTransfer801Err001 write error : ' + JSON.stringify(error));
          expect(error === null).assertTrue();
        });
        let isClaim = usb.releaseInterface(testParam.pip, testParam.interface);
        console.info(TAG, 'usb case testBulkTransfer801Err001 isClaim: ' + isClaim);
        expect(isClaim).assertEqual(0);
      } catch (err) {
        console.info(TAG, 'testBulkTransfer801Err001 catch err code: ', err);
        expect(err.code).assertEqual(801);
      }
      toClosePipe('testBulkTransfer801Err001');
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

      getPipe('testBulkTransfer005');
      let testParam = getTransferTestParam();
      if (testParam.interface == null || testParam.outEndpoint == null) {
        expect(testParam.interface == null).assertFalse();
        expect(testParam.outEndpoint == null).assertFalse();
        return
      }
      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send default';
      try {
        testParam.sendData = parameter.getSync('test_usb', 'default');
        console.log('usb testBulkTransfer005 parameter ' + JSON.stringify(testParam.sendData));
      } catch (e) {
        console.log('usb testBulkTransfer005 parameter getSync unexpected error: ' + e);
      }

      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      await usb.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array).then(data => {
        console.info(TAG, 'usb case testBulkTransfer005 ret: ' + data);
        console.info(TAG, 'usb case testBulkTransfer005 send data: ' + testParam.sendData);
        expect(data > 0).assertTrue();
      }).catch ((error: BusinessError) => {
        console.info(TAG, 'usb testBulkTransfer005 write error : ' + JSON.stringify(error));
        expect(error === null).assertTrue();
      });
      let isClaim = usb.releaseInterface(testParam.pip, testParam.interface);
      console.info(TAG, 'usb case testBulkTransfer005 isClaim: ' + isClaim);
      expect(isClaim).assertEqual(0);
      toClosePipe('testBulkTransfer005');
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
          let isClaim = usb.claimInterface(gPipe, interfaces, true);
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
          let isClaim = usb.claimInterface(gPipe, interfaces, undefined);
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
          let isClaim = usb.claimInterface(gPipe, interfaces, null);
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
          let isClaim = usb.claimInterface(gPipe, interfaces);
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
        let ret = usb.setConfiguration(gPipe, gDeviceList[0].configs[j]);
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
        let config: usb.USBConfig = JSON.parse(JSON.stringify(gDeviceList[0].configs[j]));
        config.id = 255;
        let ret = usb.setConfiguration(gPipe, config);
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
        let isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaim).assertEqual(0);

        let ret = usb.setInterface(gPipe, gDeviceList[0].configs[j].interfaces[0]);
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
        let isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaim).assertEqual(0);

        let tmpInterface: usb.USBInterface = JSON.parse(JSON.stringify(gDeviceList[0].configs[j].interfaces[0]));
        tmpInterface.id = 234;
        let ret = usb.setInterface(gPipe, tmpInterface);
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
      let controlParam = getTransferParam(6, usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), (2 << 8), 0);
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
      let controlParam = getTransferParam(0, usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
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

      let controlParam = getTransferParam(0, usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
      await usb.controlTransfer(testParam.pip, controlParam).then(data => {
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
        let controlParam = getTransferParam(0, usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
          (usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
        await usb.controlTransfer(testParam.pip, controlParam).then(data => {
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
      let controlParam = getTransferParam(8, usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
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
      let controlParam = getTransferParam(10, usb.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE,
        (usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE & 0x1f), 0, 1);
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
      let controlParam = getTransferParam(1, usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
        (usb.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
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
      let controlParam = getTransferParam(255, usb.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE,
        (usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE & 0x1f), (2 << 8), 0);
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
      let controlParam = getTransferParam(255, usb.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT,
        (usb.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_CLASS << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT & 0x1f), (2 << 8), 0);
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
      let controlParam = getTransferParam(255, usb.USBRequestTargetType.USB_REQUEST_TARGET_OTHER,
        (usb.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_VENDOR << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_OTHER & 0x1f), (2 << 8), 0);
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
      let controlParam = getTransferParam(255, usb.USBRequestTargetType.USB_REQUEST_TARGET_OTHER,
        (usb.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) | (usb.USBControlRequestType.USB_REQUEST_TYPE_CLASS << 5)
          | (usb.USBRequestTargetType.USB_REQUEST_TARGET_OTHER & 0x1f), 0, 0);
      await callControlTransfer(testParam.pip, controlParam, timeout, 'testControlTransfer012 ClearFeature');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0700
     * @tc.name     : testBulkTransfer006
     * @tc.desc     : Negative test: bulk transfer, send data, error outEndpoint.address = 123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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

      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send time 13213213 wzy 03';
      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let TmpTestParam = testParam;
      TmpTestParam.outEndpoint.address = 123;
      try {
        await usb.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
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
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0800
     * @tc.name     : testBulkTransfer007
     * @tc.desc     : Negative test: bulk transfer, send data, error outEndpoint.number = 123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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

      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send time 13213213 wzy  04';
      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let TmpTestParam = testParam;
      TmpTestParam.outEndpoint.number = 123;
      try {
        await usb.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
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
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0900
     * @tc.name     : testBulkTransfer008
     * @tc.desc     : Negative test: bulk transfer, send data, error outEndpoint.type = 123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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

      testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
      expect(testParam.isClaimed).assertEqual(0);

      testParam.sendData = 'send time 13213213 wzy 05';
      let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      let TmpTestParam = testParam;
      TmpTestParam.outEndpoint.type = 123;
      try {
        await usb.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
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
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2400
     * @tc.name     : testClaimInterface006
     * @tc.desc     : Negative test: Get interface, USBInterface afferent error id
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaim = usb.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface006 function return: ' + isClaim);
          expect(isClaim !== 0).assertTrue();
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2500
     * @tc.name     : testClaimInterface007
     * @tc.desc     : Negative test: Get interface, USBInterface afferent error protocol
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaim = usb.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface007 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2600
     * @tc.name     : testClaimInterface008
     * @tc.desc     : Negative test: Get interface, USBInterface afferent error clazz
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaim = usb.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface008 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2700
     * @tc.name     : testClaimInterface009
     * @tc.desc     : Negative test: Get interface, USBInterface afferent error name
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaim = usb.claimInterface(gPipe, TmpInterface, true)
          console.info(TAG, 'usb case testClaimInterface009 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2800
     * @tc.name     : testClaimInterface010
     * @tc.desc     : Negative test: Get interface, USBInterface afferent error subClass
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaim = usb.claimInterface(gPipe, TmpInterface, true);
          console.info(TAG, 'usb case testClaimInterface010 function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1600
     * @tc.name     : testReleaseInterface001
     * @tc.desc     : Negative test: release Interface, error Interface id
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaimed = usb.claimInterface(gPipe, tmpInterface, true);
          console.info(TAG, 'usb case testReleaseInterface001 claimInterface return: ' + isClaimed);
          expect(isClaimed).assertEqual(0);

          tmpInterface.id = 134;
          let isClaim = usb.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface001 function return: ' + isClaim);
          expect(isClaim !== 0).assertTrue();
          toReleaseInterface('testReleaseInterface001', j, k);
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1700
     * @tc.name     : testReleaseInterface002
     * @tc.desc     : Negative test: release Interface, error Interface name
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaimed = usb.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.name = '134wer';
          let isClaim = usb.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface002 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1800
     * @tc.name     : testReleaseInterface003
     * @tc.desc     : Negative test: release Interface, error Interface clazz
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaimed = usb.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.clazz = 78;
          let isClaim = usb.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface003 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1900
     * @tc.name     : testReleaseInterface004
     * @tc.desc     : Negative test: release Interface, error Interface protocol
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaimed = usb.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.protocol = 124;
          let isClaim = usb.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface004 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2000
     * @tc.name     : testReleaseInterface005
     * @tc.desc     : Negative test: release Interface, error Interface subClass
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
          let isClaimed = usb.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.subClass = 784;
          let isClaim = usb.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface005 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2100
     * @tc.name     : testReleaseInterface006
     * @tc.desc     : Negative test: release Interface, error Interface alternateSetting
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterface006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, 'usb testReleaseInterface006 begin');
      if (!isDeviceConnected) {
        expect(isDeviceConnected).assertFalse();
        return
      }

      if (gDeviceList[0].configs.length == 0) {
        console.info(TAG, 'usb testReleaseInterface006 case current device.configs.length = 0');
        expect(false).assertTrue();
        return
      }
      for (let j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb testReleaseInterface006 case current device.configs.interfaces.length = 0');
        }
        for (let k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          let tmpInterface = gDeviceList[0].configs[j].interfaces[k];
          let isClaimed = usb.claimInterface(gPipe, tmpInterface, true);
          expect(isClaimed).assertEqual(0);

          tmpInterface.alternateSetting = 784;
          let isClaim = usb.releaseInterface(gPipe, tmpInterface);
          console.info(TAG, 'usb case testReleaseInterface006 function return: ' + isClaim);
          expect(isClaim == 0).assertTrue();
        }
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_4200
     * @tc.name     : testSetInterface003
     * @tc.desc     : Negative test: Set device interface, Interface protocol error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let isClaimed = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.protocol = 482;
        let ret = usb.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface003 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface003', j, 0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_4300
     * @tc.name     : testSetInterface004
     * @tc.desc     : Negative test: Set device interface, Interface clazz error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let isClaimed = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.clazz = 482;
        let ret = usb.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface004 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface004', j, 0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_4400
     * @tc.name     : testSetInterface005
     * @tc.desc     : Negative test: Set device interface, Interface subClass error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let isClaimed = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.subClass = 482;
        let ret = usb.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface005 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface005', j, 0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_4500
     * @tc.name     : testSetInterface006
     * @tc.desc     : Negative test: Set device interface, Interface name error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let isClaimed = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
        expect(isClaimed).assertEqual(0);

        let tmpInterface = gDeviceList[0].configs[j].interfaces[0];
        tmpInterface.name = 'wer32';
        let ret = usb.setInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testSetInterface006 return : ' + ret);
        expect(ret == 0).assertTrue();

        toReleaseInterface('testSetInterface006', j, 0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3700
     * @tc.name     : testSetConfiguration003
     * @tc.desc     : Negative test: Set Device Configuration, USBConfig name error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let ret = usb.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration003 return : ' + ret);
        expect(ret).assertEqual(0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3800
     * @tc.name     : testSetConfiguration004
     * @tc.desc     : Negative test: Set Device Configuration, USBConfig name, id error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let ret = usb.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration004 return : ' + ret);
        expect(ret).assertLess(0);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3900
     * @tc.name     : testSetConfiguration005
     * @tc.desc     : Negative test: Set Device Configuration, USBConfig attributes error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let ret = usb.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration005 return : ' + ret);
        expect(ret == 0).assertTrue();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Compatibility_4000
     * @tc.name     : testSetConfiguration006
     * @tc.desc     : Negative test: Set Device Configuration, USBConfig name interval(1-16) error
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
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
        let ret = usb.setConfiguration(gPipe, config);
        console.info(TAG, 'usb case testSetConfiguration006 return : ' + ret);
        expect(ret == 0).assertTrue();
      }
    })
  })
}
