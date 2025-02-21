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
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import EventConstants from './EventConstants.js';
import parameter from '@ohos.systemparameter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

/* usb device pipe test */
export default function UsbDevicePipeJsFunctionsTestEx() {
describe('UsbDevicePipeJsFunctionsTestEx', function () {

  let gDeviceList;
  let gPipe;
  let isDeviceConnected;
  const TAG = "[UsbDevicePipeJsFunctionsTest]";

  function deviceConnected() {
    if (gDeviceList.length > 0) {
        console.info(TAG, "Test USB device is connected");
        return true;
    }
    console.info(TAG, "Test USB device is not connected");
    return false;
  }

  beforeAll(async function () {
    console.log(TAG, '*************Usb Unit UsbDevicePipeJsFunctionsTestEx Begin*************');
    var Version = usbManager.getVersion();
    console.info(TAG, 'usb unit begin test getversion :' + Version);

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
      gPipe = usbManager.connectDevice(gDeviceList[0]);
      console.info(TAG, 'usb unit connectDevice  gPipe ret : ' + JSON.stringify(gPipe));
    }
  })
  beforeEach(function () {
    console.info(TAG, 'beforeEach: *************Usb Unit Test Ex Case*************');
    gDeviceList = usbManager.getDevices();
    console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(gDeviceList));
  })
  afterEach(function () {
    console.info(TAG, 'afterEach: *************Usb Unit Test Ex Case*************');
    gDeviceList = null;
  })
  afterAll(function () {
    let isPipClose = usbManager.closePipe(gPipe);
    console.info(TAG, 'usb unit close gPipe ret : ' + isPipClose);
    console.log(TAG, '*************Usb Unit UsbDevicePipeJsFunctionsTestEx End*************');
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

  function findInitPoint(testParam, j) {
    var bfind = false;
    for (var k = 0; k < testParam.config.interfaces[j].endpoints.length; k++) {
      var endpoint = testParam.config.interfaces[j].endpoints[k];
      if (endpoint.type == EventConstants.USB_ENDPOINT_XFER_BULK) {

        bfind = true;
        if (endpoint.direction == usbManager.USB_REQUEST_DIR_TO_DEVICE) {
          testParam.outEndpoint = endpoint;
          testParam.maxOutSize = endpoint.maxPacketSize;
        } else if (endpoint.direction == usbManager.USB_REQUEST_DIR_FROM_DEVICE) {
          testParam.inEndpoint = endpoint;
          testParam.maxInSize = endpoint.maxPacketSize;
        }
      }
    }
    if (bfind) {
      testParam.interface = testParam.config.interfaces[j];
      return true;
    }
    return false;
  }

  function getFlag(testParam, j) {
    if (testParam.config.interfaces[j].clazz != 10 ||
      testParam.config.interfaces[j].subClass != 0 ||
      testParam.config.interfaces[j].protocol != 2) {
      return false;
    }

    if (testParam.config.interfaces[j].endpoints.length == 0) {
      return false;
    }

    return true;
  }

  function initPoint(testParam) {
    for (var j = 0; j < testParam.config.interfaces.length; j++) {
      if (getFlag(testParam, j)) {
        if (findInitPoint(testParam, j)) {
          break
        }
      }
    }
  }

  // Prefabrication transmission related parameters
  function getTransferTestParam() {
    var testParam = {
      device: null,
      config: null,
      pip: null,
      inEndpoint: null,
      outEndpoint: null,
      interface: null,
      usbRequest: null,
      sendData: '',
      isClaimed: 0,
      maxInSize: 1024,
      maxOutSize: 1024
    }

    console.info(TAG, 'usb case gDeviceList.length: ' + gDeviceList.length);
    for (var i = 0; i < gDeviceList.length; i++) {
      testParam.device = gDeviceList[i];
      testParam.config = testParam.device.configs[0];
      testParam.pip = gPipe;
      initPoint(testParam);
    }
    return testParam;
  }

  function getPipe(testCaseName) {
    gPipe = usbManager.connectDevice(devices);
    console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
    expect(gPipe.length > 0).assertTrue();
  }


  function toReleaseInterface(testCaseName, conIndex, interIndex) {
    gDeviceList = usbManager.getDevices();
    let tmpInterface = gDeviceList[0].configs[conIndex].interfaces[interIndex];
    let isClaim = usbManager.releaseInterface(gPipe, tmpInterface);
    console.info(TAG, `usb ${testCaseName} toReleaseInterface ret: ${JSON.stringify(isClaim)}`);
    expect(isClaim).assertEqual(0);
  }

  /**
   * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_0700
   * @tc.name     : testBulkTransfer006
   * @tc.desc     : Negative test: bulk transfer, send data, error outEndpoint.address = 123
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer006', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer006 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.outEndpoint == null) {
      expect(testParam.interface == null).assertFalse();
      expect(testParam.outEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy 03';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam;
    TmpTestParam.outEndpoint.address = 123;
    try {
      await usbManager.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
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
   * @tc.level    : Level 2
   */
  it('testBulkTransfer007', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer007 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.outEndpoint == null) {
      expect(testParam.interface == null).assertFalse();
      expect(testParam.outEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy  04';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam;
    TmpTestParam.outEndpoint.number = 123;
    try {
      await usbManager.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
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
   * @tc.level    : Level 2
   */
  it('testBulkTransfer008', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer008 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.outEndpoint == null) {
      expect(testParam.interface == null).assertFalse();
      expect(testParam.outEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy 05';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam;
    TmpTestParam.outEndpoint.type = 123;
    try {
      await usbManager.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
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
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0900
   * @tc.name     : testBulkTransfer009
   * @tc.desc     : Negative test: bulk transfer, parameter number exception, input a parameter
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer009', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer009 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.inEndpoint == null) {
      expect(testParam.interface == null).assertFalse();
      expect(testParam.inEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    try {
      await usbManager.bulkTransfer(testParam.pip).then(data => {
        console.info(TAG, 'usb case testBulkTransfer009 ret: ' + data);
        expect(data === null).assertTrue();
      })
    } catch (err) {
      console.info(TAG, 'usb testBulkTransfer009 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3600
   * @tc.name     : testBulkTransfer010
   * @tc.desc     : Negative test: bulk transfer, parameter number exception, input two parameter
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer010', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer010 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.inEndpoint == null) {
      expect(testParam.interface == null).assertFalse();
      expect(testParam.inEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    try {
      await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint).then(data => {
        console.info(TAG, 'usb case testBulkTransfer010 ret: ' + data);
        expect(data === null).assertTrue();
      })
    } catch (err) {
      console.info(TAG, 'usb testBulkTransfer010 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2400
   * @tc.name     : testBulkTransfer011
   * @tc.desc     : Negative test: bulk transfer, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer011', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer011 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      await usbManager.bulkTransfer().then(data => {
        console.info(TAG, 'usb case testBulkTransfer011 ret: ' + data);
        expect(data === null).assertTrue();
      })
    } catch (err) {
      console.info(TAG, 'usb testBulkTransfer011 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3000
   * @tc.name     : testBulkTransfer012
   * @tc.desc     : Negative test: bulk transfer, parameter pipe type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer012', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer012 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info(TAG, 'usb case testParam_interface and testParam_inEndpoint is null');
      expect(testParam.interface == null).assertFalse();
      expect(testParam.inEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info(TAG, 'usb case readData begin');
    var tmpTestParam = testParam;
    tmpTestParam.pip = "invalid";
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    try {
      await usbManager.bulkTransfer(tmpTestParam.pip, tmpTestParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info(TAG, 'usb case testBulkTransfer012 ret: ' + data);
        expect(data === null).assertTrue();
      })
    } catch (err) {
      console.info(TAG, 'usb testBulkTransfer012 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3700
   * @tc.name     : testBulkTransfer013
   * @tc.desc     : Negative test: bulk transfer, parameter endpoint type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer013', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer013 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info(TAG, 'usb case testParam_interface and testParam_inEndpoint is null');
      expect(testParam.interface == null).assertFalse();
      expect(testParam.inEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info(TAG, 'usb case readData begin');
    var tmpTestParam = testParam;
    tmpTestParam.inEndpoint = "invalid";
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    try {
      await usbManager.bulkTransfer(tmpTestParam.pip, tmpTestParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info(TAG, 'usb case testBulkTransfer013 ret: ' + data);
        expect(data === null).assertTrue();
      })
    } catch (err) {
      console.info(TAG, 'usb testBulkTransfer013 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3800
   * @tc.name     : testBulkTransfer014
   * @tc.desc     : Negative test: bulk transfer, parameter Uint8Array type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer014', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer014 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info(TAG, 'usb case testParam_interface and testParam_inEndpoint is null');
      expect(testParam.interface == null).assertFalse();
      expect(testParam.inEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info(TAG, 'usb case readData begin');
    var tmpUint8Array = "invalid";
    try {
      await usbManager.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info(TAG, 'usb case testBulkTransfer014 ret: ' + data);
        expect(data === null).assertTrue();
      })
    } catch (err) {
      console.info(TAG, 'usb testBulkTransfer014 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_4100
   * @tc.name     : testBulkTransfer015
   * @tc.desc     : Negative test: bulk transfer, parameter timeout type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testBulkTransfer015', 0, async function () {
    console.info(TAG, 'usb testBulkTransfer015 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info(TAG, 'usb case testParam_interface and testParam_inEndpoint is null');
      expect(testParam.interface == null).assertFalse();
      expect(testParam.inEndpoint == null).assertFalse();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info(TAG, 'usb case testBulkTransfer015 readData begin');
    let tmpTimeOut = "invalid";
    let tmpUint8Array = new Uint8Array(testParam.maxInSize);
    await usbManager.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, tmpTimeOut).then(data => {
      console.info(TAG, 'usb case testBulkTransfer015 ret: ' + data);
      console.info(TAG, 'usb case testBulkTransfer015 readData: ' + CheckEmptyUtils.ab2str(tmpUint8Array));
      expect(data >= 0).assertTrue();
    }).catch(error => {
      console.info(TAG, 'usb testBulkTransfer015 readData error : ' + JSON.stringify(error));
      expect(error === null).assertTrue();
    });
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2400
   * @tc.name     : testClaimInterface006
   * @tc.desc     : Negative test: Get interface, USBInterface afferent error id
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClaimInterface006', 0, function () {
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testClaimInterface006 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        TmpInterface.id = 123;
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true);
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
   * @tc.level    : Level 2
   */
  it('testClaimInterface007', 0, function () {
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testClaimInterface007 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        TmpInterface.protocol = 120;
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true);
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
   * @tc.level    : Level 2
   */
  it('testClaimInterface008', 0, function () {
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testClaimInterface008 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        TmpInterface.clazz = 784;
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true);
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
   * @tc.level    : Level 2
   */
  it('testClaimInterface009', 0, function () {
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testClaimInterface009 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        TmpInterface.name = '123sdf';
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true)
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
   * @tc.level    : Level 2
   */
  it('testClaimInterface010', 0, function () {
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testClaimInterface010 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        TmpInterface.subClass = 1210;
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true);
        console.info(TAG, 'usb case testClaimInterface010 function return: ' + isClaim);
        expect(isClaim).assertEqual(0);
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1000
   * @tc.name     : testClaimInterface011
   * @tc.desc     : Negative test: Get interface, parameter number exception, input a parameter
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClaimInterface011', 0, function () {
    console.info(TAG, 'usb testClaimInterface011 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info(TAG, 'usb testClaimInterface011 case current device.configs.length = 0');
      expect(gDeviceList[0].configs.length == 0).assertFalse();
      return
    }
    try {
      var maskCode = usbManager.claimInterface("invalid");
      console.info(TAG, 'usb testClaimInterface011 case claimInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testClaimInterface011 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2500
   * @tc.name     : testClaimInterface012
   * @tc.desc     : Negative test: Get interface, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClaimInterface012', 0, function () {
    console.info(TAG, 'usb testClaimInterface012 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info(TAG, 'usb testClaimInterface012 case current device.configs.length = 0');
      expect(gDeviceList[0].configs.length == 0).assertFalse();
      return
    }
    try {
      var maskCode = usbManager.claimInterface();
      console.info(TAG, 'usb testClaimInterface012 case claimInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testClaimInterface012 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3100
   * @tc.name     : testClaimInterface013
   * @tc.desc     : Negative test: Get interface, parameter pipe type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClaimInterface013', 0, function () {
    console.info(TAG, 'usb testClaimInterface013 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var testParamPip = "invalid";
    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testClaimInterface013 current device.configs.interfaces.length = 0');
          expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usbManager.claimInterface(testParamPip, TmpInterface, true);
          console.info(TAG, 'usb testClaimInterface013 case claimInterface return: ' + maskCode);
          expect(maskCode === null).assertTrue();
        }
      }
    } catch (err) {
      console.info(TAG, 'usb testClaimInterface013 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3900
   * @tc.name     : testClaimInterface014
   * @tc.desc     : Negative test: Get interface, parameter iface type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClaimInterface014', 0, function () {
    console.info(TAG, 'usb testClaimInterface014 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var TmpInterface = "invalid";
    try {
      var maskCode = usbManager.claimInterface(gPipe, TmpInterface);
      console.info(TAG, 'usb testClaimInterface014 case claimInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testClaimInterface014 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1600
   * @tc.name     : testReleaseInterface001
   * @tc.desc     : Negative test: release Interface, error Interface id
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface001', 0, function () {
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb testReleaseInterface001 case current device.configs.interfaces.length = 0');
        expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        let tmpInterface = gDeviceList[0].configs[j].interfaces[k];
        let isClaimed = usbManager.claimInterface(gPipe, tmpInterface, true);
        console.info(TAG, 'usb case testReleaseInterface001 claimInterface return: ' + isClaimed);
        expect(isClaimed).assertEqual(0);

        tmpInterface.id = 134;
        let isClaim = usbManager.releaseInterface(gPipe, tmpInterface);
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
   * @tc.level    : Level 2
   */
  it('testReleaseInterface002', 0, function () {
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
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb testReleaseInterface002 case current device.configs.interfaces.length = 0');
        expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse();
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k];
        let isClaimed = usbManager.claimInterface(gPipe, tmpInterface, true);
        expect(isClaimed).assertEqual(0);

        tmpInterface.name = '134wer';
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testReleaseInterface002 function return: ' + isClaim);
        expect(isClaim == 0).assertTrue();
        toReleaseInterface('testReleaseInterface002', j, k);
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1800
   * @tc.name     : testReleaseInterface003
   * @tc.desc     : Negative test: release Interface, error Interface clazz
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface003', 0, function () {
    console.info(TAG, 'usb testReleaseInterface003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info(TAG, 'usb testReleaseInterface003 case current device.configs.length = 0');
      xpect(gDeviceList[0].configs.length == 0).assertFalse();
      return
    }
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb testReleaseInterface003 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k];
        let isClaimed = usbManager.claimInterface(gPipe, tmpInterface, true);
        expect(isClaimed).assertEqual(0);

        tmpInterface.clazz = 78;
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testReleaseInterface003 function return: ' + isClaim);
        expect(isClaim == 0).assertTrue();
        toReleaseInterface('testReleaseInterface003', j, k);
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1900
   * @tc.name     : testReleaseInterface004
   * @tc.desc     : Negative test: release Interface, error Interface protocol
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface004', 0, function () {
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
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb testReleaseInterface004 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k];
        let isClaimed = usbManager.claimInterface(gPipe, tmpInterface, true);
        expect(isClaimed).assertEqual(0);

        tmpInterface.protocol = 124;
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testReleaseInterface004 function return: ' + isClaim);
        expect(isClaim == 0).assertTrue();
        toReleaseInterface('testReleaseInterface004', j, k);
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2000
   * @tc.name     : testReleaseInterface005
   * @tc.desc     : Negative test: release Interface, error Interface subClass
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface005', 0, function () {
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
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb testReleaseInterface005 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k];
        let isClaimed = usbManager.claimInterface(gPipe, tmpInterface, true);
        expect(isClaimed).assertEqual(0);

        tmpInterface.subClass = 784;
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface);
        console.info(TAG, 'usb case testReleaseInterface005 function return: ' + isClaim);
        expect(isClaim == 0).assertTrue();
        toReleaseInterface('testReleaseInterface005', j, k);
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1400
   * @tc.name     : testReleaseInterface006
   * @tc.desc     : Negative test: release Interface, parameter number exception, input a parameter
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface006', 0, function () {
    console.info(TAG, 'usb testReleaseInterface006 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.releaseInterface("invalid");
      console.info(TAG, 'usb testReleaseInterface006 case releaseInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testReleaseInterface006 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2600
   * @tc.name     : testReleaseInterface007
   * @tc.desc     : Negative test: release Interface, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface007', 0, function () {
    console.info(TAG, 'usb testReleaseInterface007 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.releaseInterface();
      console.info(TAG, 'usb testReleaseInterface007 case releaseInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testReleaseInterface007 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3300
   * @tc.name     : testReleaseInterface008
   * @tc.desc     : Negative test: release Interface, parameter pipe type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface008', 0, function () {
    console.info(TAG, 'usb testReleaseInterface008 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    var testParamPip = "invalid";
    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testReleaseInterface008 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usbManager.releaseInterface(testParamPip, TmpInterface);
          console.info(TAG, 'usb testReleaseInterface008 case releaseInterface return: ' + maskCode);
          expect(maskCode === null).assertTrue();
        }
      }
    } catch (err) {
      console.info(TAG, 'usb testReleaseInterface008 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1500
   * @tc.name     : testReleaseInterface009
   * @tc.desc     : Negative test: release Interface, parameter iface type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testReleaseInterface009', 0, function () {
    console.info(TAG, 'usb testReleaseInterface009 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    var TmpInterface = "invalid";
    try {
      var maskCode = usbManager.releaseInterface(gPipe, TmpInterface);
      console.info(TAG, 'usb testReleaseInterface009 case releaseInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testReleaseInterface009 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_4200
   * @tc.name     : testSetInterface003
   * @tc.desc     : Negative test: Set device interface, Interface protocol error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetInterface003', 0, function () {
    console.info(TAG, 'usb testSetInterface003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testSetInterface003 current device.configs.interfaces.length = 0');
        expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse(0);
      }
      var isClaimed = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
      expect(isClaimed).assertEqual(0);

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0];
      tmpInterface.protocol = 482;
      var ret = usbManager.setInterface(gPipe, tmpInterface);
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
   * @tc.level    : Level 2
   */
  it('testSetInterface004', 0, function () {
    console.info(TAG, 'usb testSetInterface004 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testSetInterface004 current device.configs.interfaces.length = 0');
        expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse(0);
      }
      var isClaimed = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
      expect(isClaimed).assertEqual(0);

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0];
      tmpInterface.clazz = 482;
      var ret = usbManager.setInterface(gPipe, tmpInterface);
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
   * @tc.level    : Level 2
   */
  it('testSetInterface005', 0, function () {
    console.info(TAG, 'usb testSetInterface005 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testSetInterface005 current device.configs.interfaces.length = 0');
        expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse(0);
      }
      var isClaimed = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
      expect(isClaimed).assertEqual(0);

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0];
      tmpInterface.subClass = 482;
      var ret = usbManager.setInterface(gPipe, tmpInterface);
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
   * @tc.level    : Level 2
   */
  it('testSetInterface006', 0, function () {
    console.info(TAG, 'usb testSetInterface006 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info(TAG, 'usb case testSetInterface005 current device.configs.interfaces.length = 0');
        expect(gDeviceList[0].configs[j].interfaces.length == 0).assertFalse(0);
      }
      var isClaimed = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);
      expect(isClaimed).assertEqual(0);

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0];
      tmpInterface.name = 'wer32';
      var ret = usbManager.setInterface(gPipe, tmpInterface);
      console.info(TAG, 'usb case testSetInterface006 return : ' + ret);
      expect(ret == 0).assertTrue();

      toReleaseInterface('testSetInterface006', j, 0);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1200
   * @tc.name     : testSetInterface007
   * @tc.desc     : Negative test: Set device interface, parameter number exception, input a parameter
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetInterface007', 0, function () {
    console.info(TAG, 'usb testSetInterface007 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.setInterface("invalid");
      console.info(TAG, 'usb testSetInterface007 case setInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testSetInterface007 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2700
   * @tc.name     : testSetInterface008
   * @tc.desc     : Negative test: Set device interface, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetInterface008', 0, function () {
    console.info(TAG, 'usb testSetInterface008 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.setInterface();
      console.info(TAG, 'usb testSetInterface008 case setInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testSetInterface008 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3400
   * @tc.name     : testSetInterface009
   * @tc.desc     : Negative test: Set device interface, parameter pipe type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetInterface009', 0, function () {
    console.info(TAG, 'usb testSetInterface009 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var testParamPip = "invalid";
    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info(TAG, 'usb case testSetInterface009 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usbManager.setInterface(testParamPip, TmpInterface);
          console.info(TAG, 'usb testSetInterface009 case setInterface return: ' + maskCode);
          expect(maskCode === null).assertTrue();
        }
      }
    } catch (err) {
      console.info(TAG, 'usb testSetInterface009 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_4300
   * @tc.name     : testSetInterface010
   * @tc.desc     : Negative test: Set device interface, parameter iface type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetInterface010', 0, function () {
    console.info(TAG, 'usb testSetInterface010 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    var TmpInterface = "invalid";
    try {
      var maskCode = usbManager.setInterface(gPipe, TmpInterface);
      console.info(TAG, 'usb testSetInterface010 case setInterface return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testSetInterface010 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3700
   * @tc.name     : testSetConfiguration003
   * @tc.desc     : Negative test: Set Device Configuration, USBConfig name error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetConfiguration003', 0, function () {
    console.info(TAG, 'usb testSetConfiguration003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j];
      config.name = 'asdfsd';
      var ret = usbManager.setConfiguration(gPipe, config);
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
   * @tc.level    : Level 2
   */
  it('testSetConfiguration004', 0, function () {
    console.info(TAG, 'usb testSetConfiguration004 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j];
      config.name = 'asdfsd';
      config.id = 154;
      var ret = usbManager.setConfiguration(gPipe, config);
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
   * @tc.level    : Level 2
   */
  it('testSetConfiguration005', 0, function () {
    console.info(TAG, 'usb testSetConfiguration005 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j];
      config.attributes = 154;
      var ret = usbManager.setConfiguration(gPipe, config);
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
   * @tc.level    : Level 2
   */
  it('testSetConfiguration006', 0, function () {
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j];
      config.name = 'asdfsd';
      config.interfaces[0].endpoints[0].interval = 0;
      var ret = usbManager.setConfiguration(gPipe, config);
      console.info(TAG, 'usb case testSetConfiguration006 return : ' + ret);
      expect(ret == 0).assertTrue();
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1100
   * @tc.name     : testSetConfiguration007
   * @tc.desc     : Negative test: Set Device Configuration, parameter number exception, input a parameter
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetConfiguration007', 0, function () {
    console.info(TAG, 'usb testSetConfiguration007 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.setConfiguration("invalid");
      console.info(TAG, 'usb testSetConfiguration007 case setConfiguration return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testSetConfiguration007 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_2800
   * @tc.name     : testSetConfiguration008
   * @tc.desc     : Negative test: Set Device Configuration, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetConfiguration008', 0, function () {
    console.info(TAG, 'usb testSetConfiguration008 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    try {
      var maskCode = usbManager.setConfiguration();
      console.info(TAG, 'usb testSetConfiguration008 case setConfiguration return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testSetConfiguration008 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_3500
   * @tc.name     : testSetConfiguration009
   * @tc.desc     : Negative test: Set Device Configuration, parameter pipe type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetConfiguration009', 0, function () {
    console.info(TAG, 'usb testSetConfiguration009 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    var testParamPip = "invalid";
    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        var TmpConfig = gDeviceList[0].configs[j];
        var maskCode = usbManager.setConfiguration(testParamPip, TmpConfig);
        console.info(TAG, 'usb testSetConfiguration009 case setConfiguration return: ' + maskCode);
        expect(maskCode === null).assertTrue();
      }
    } catch (err) {
      console.info(TAG, 'usb testSetConfiguration009 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_4200
   * @tc.name     : testSetConfiguration010
   * @tc.desc     : Negative test: Set Device Configuration, parameter config type error
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testSetConfiguration010', 0, function () {
    console.info(TAG, 'usb testSetConfiguration010 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    var TmpConfig = "invalid";
    try {
      var maskCode = usbManager.setConfiguration(gPipe, TmpConfig);
      console.info(TAG, 'usb testSetConfiguration010 case setConfiguration return: ' + maskCode);
      expect(maskCode === null).assertTrue();
    } catch (err) {
      console.info(TAG, 'usb testSetConfiguration010 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

})
}
