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
import EventConstants from './EventConstants.js';
import parameter from '@ohos.systemparameter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

/* usb device pipe test */
export default function UsbDevicePipeJsFunctionsTestEx() {
describe('UsbDevicePipeJsFunctionsTestEx', function () {

  var gDeviceList;
  var gPipe;
  var portCurrentMode;

  beforeAll(async function () {
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTestEx Begin*************');
    var Version = usbManager.getVersion();
    console.info('usb unit begin test getversion :' + Version);

    // version > 17  host currentMode = 2 device currentMode = 1
    var usbPortList = usbManager.getPorts();
    if (usbPortList == undefined) {
      portCurrentMode = 1;
      return
    }
    gDeviceList = usbManager.getDevices();
    if (usbPortList.length > 0) {
      if (gDeviceList.length > 0) {
        if (usbPortList[0].status.currentMode == 1) {
          await usbManager.setPortRoles(usbPortList[0].id, usbManager.SOURCE, usbManager.HOST).then(data => {
            portCurrentMode = 2;
            console.info('usb case setPortRoles  return: ' + data);
          }).catch(error => {
            console.info('usb case setPortRoles  error : ' + error);
          });
  
          console.log('*************Usb Unit switch to host Ex Begin*************');
          CheckEmptyUtils.sleep(8000);
        }

        gPipe = usbManager.connectDevice(gDeviceList[0]);
        console.info('usb unit connectDevice  gPipe ret : ' + JSON.stringify(gPipe));
      } else {
        portCurrentMode = 1;
      }
    }
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Ex Case*************');
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Ex Case*************');
  })
  afterAll(function () {
    var isPipClose = usbManager.closePipe(gPipe);
    console.info('usb unit close gPipe ret : ' + isPipClose);
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTestEx End*************');
  })

  function findInitPoint(testParam, j) {
    var bfind = false
    for (var k = 0; k < testParam.config.interfaces[j].endpoints.length; k++) {
      var endpoint = testParam.config.interfaces[j].endpoints[k];
      if (endpoint.type == EventConstants.USB_ENDPOINT_XFER_BULK) {

        bfind = true
        if (endpoint.direction == usbManager.USB_REQUEST_DIR_TO_DEVICE) {
          testParam.outEndpoint = endpoint;
          testParam.maxOutSize = endpoint.maxPacketSize;
        } else if (endpoint.direction == usbManager.USB_REQUEST_DIR_FROM_DEVICE) {
          testParam.inEndpoint = endpoint
          testParam.maxInSize = endpoint.maxPacketSize;
        }
      }
    }
    if (bfind) {
      testParam.interface = testParam.config.interfaces[j]
      return true
    }
    return false
  }

  function getFlag(testParam, j) {
    if (testParam.config.interfaces[j].clazz != 10 ||
      testParam.config.interfaces[j].subClass != 0 ||
      testParam.config.interfaces[j].protocol != 2) {
      return false
    }

    if (testParam.config.interfaces[j].endpoints.length == 0) {
      return false
    }

    return true
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

    console.info('usb case gDeviceList.length: ' + gDeviceList.length);
    for (var i = 0; i < gDeviceList.length; i++) {
      testParam.device = gDeviceList[i]
      testParam.config = testParam.device.configs[0]
      testParam.pip = gPipe
      initPoint(testParam)
    }
    return testParam
  }

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0700
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, send data, error outEndpoint.address = 123
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0700 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy 03';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam
    TmpTestParam.outEndpoint.address = 123
    usbManager.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0700 ret: ' + data);
      expect(data).assertEqual(-1);
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0700 :  PASS');
    }).catch(error => {
      console.info('usb HostManager_JS_TranCompatibility_0700 write error : ' + JSON.stringify(error));
      expect(false).assertFalse();
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0700 :  PASS');
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0800
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, send data, error outEndpoint.number = 123
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0800 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy  04';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam
    TmpTestParam.outEndpoint.number = 123
    usbManager.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0800 ret: ' + data);
      expect(data).assertEqual(-1);
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0800 :  PASS');
    }).catch(error => {
      console.info('usb HostManager_JS_TranCompatibility_0800 write error : ' + JSON.stringify(error));
      expect(false).assertFalse();
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0800 :  PASS');
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0900
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, send data, error outEndpoint.type = 123
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0900', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0900 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy 05';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam
    TmpTestParam.outEndpoint.type = 123
    usbManager.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0900 ret: ' + data);
      expect(data).assertEqual(-1);
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0900 :  PASS');
    }).catch(error => {
      console.info('usb HostManager_JS_TranCompatibility_0900 write error : ' + JSON.stringify(error));
      expect(false).assertFalse();
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0900 :  PASS');
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_0900
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter number exception, input a parameter
   */
   it('SUB_USB_HostManager_JS_ErrCode_0900', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_0900 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.inEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    try {
      usbManager.bulkTransfer(testParam.pip).then(data => {
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_0900 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_0900 :  FAILED');
      }).catch(error => {
        console.info('usb SUB_USB_HostManager_JS_ErrCode_0900 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_0900 :  FAILED');
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1100 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_0900 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3600
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter number exception, input two parameter
   */
  it('SUB_USB_HostManager_JS_ErrCode_3600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3600 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.inEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    try {
      usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint).then(data => {
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3600 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3600 :  FAILED');
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_3600 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3600 :  FAILED');
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3600 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3600 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2400
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2400 begin');
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
      usbManager.bulkTransfer().then(data => {
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_2400 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_2400 :  FAILED');
      }).catch(error => {
        console.info('usb 1310 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_2400 :  FAILED');
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2400 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2400 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3000
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter pipe type error
   */
   it('SUB_USB_HostManager_JS_ErrCode_3000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3000 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info('usb case testParam_interface and testParam_inEndpoint is null');
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpTestParam = testParam;
    tmpTestParam.pip = "invalid";
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    try {
      usbManager.bulkTransfer(tmpTestParam.pip, tmpTestParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3000 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3000 :  FAILED');
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_3000 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3000 :  FAILED');
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3000 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3000 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3700
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter endpoint type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_3700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3700 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info('usb case testParam_interface and testParam_inEndpoint is null');
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpTestParam = testParam;
    tmpTestParam.inEndpoint = "invalid";
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    try {
      usbManager.bulkTransfer(tmpTestParam.pip, tmpTestParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3700 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3700 :  FAILED');
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_3700 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3700 :  FAILED');
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3700 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3700 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3800
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter Uint8Array type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_3800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3800 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info('usb case testParam_interface and testParam_inEndpoint is null');
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpUint8Array = "invalid";
    try {
      usbManager.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3800 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3800 :  FAILED');
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_3800 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_3800 :  FAILED');
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3800 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3800 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_4100
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter timeout type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_4100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_4100 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.inEndpoint == null) {
      console.info('usb case testParam_interface and testParam_inEndpoint is null');
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usbManager.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case sendData begin');
    testParam.sendData = 'send default';
    try {
      testParam.sendData = parameter.getSync('test_usb', 'default');
      console.log('usb parameter ' + JSON.stringify(testParam.sendData));
    } catch (e) {
      console.log('usb parameter getSync unexpected error: ' + e);
    }

    var tmpTimeOut = "invalid";
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
      usbManager.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, tmpTimeOut).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_ErrCode_4100 ret: ' + data);
      console.info('usb case SUB_USB_HostManager_JS_ErrCode_4100 send data: ' + testParam.sendData);
      expect(data > 0).assertTrue();
      console.info('usb case SUB_USB_HostManager_JS_ErrCode_4100 :  PASS');
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_4100 write error : ' + JSON.stringify(error));
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_4100 :  FAILED');
        expect(false).assertTrue();
      });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2400
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error id
   */
  it('SUB_USB_HostManager_JS_Compatibility_2400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2400 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case SUB_USB_HostManager_JS_Compatibility_2400 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2400 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        TmpInterface.id = 123;
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true);
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_2400 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2500
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error protocol
   */
  it('SUB_USB_HostManager_JS_Compatibility_2500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2500 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case SUB_USB_HostManager_JS_Compatibility_2500 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2500 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.protocol = 120
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_2500 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2600
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error clazz
   */
  it('SUB_USB_HostManager_JS_Compatibility_2600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2600 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case SUB_USB_HostManager_JS_Compatibility_2600 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2600 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.clazz = 784
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_2600 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2700
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error name
   */
  it('SUB_USB_HostManager_JS_Compatibility_2700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2700 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case SUB_USB_HostManager_JS_Compatibility_2700 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2700 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.name = '123sdf'
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_2700 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2800
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error subClass
   */
  it('SUB_USB_HostManager_JS_Compatibility_2800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2800 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case SUB_USB_HostManager_JS_Compatibility_2800 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2800 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.subClass = 1210
        var isClaim = usbManager.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_2800 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1000
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter number exception, input a parameter
   */
  it('SUB_USB_HostManager_JS_ErrCode_1000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1000 begin');
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
    if (gDeviceList[0].configs.length == 0) {
      console.info('usb HostManager_JS_ErrCode_1000 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.claimInterface("invalid");
      console.info('usb HostManager_JS_ErrCode_1000 case claimInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1000 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1000 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2500
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2500 begin');
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
    if (gDeviceList[0].configs.length == 0) {
      console.info('usb HostManager_JS_ErrCode_2500 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.claimInterface();
      console.info('usb HostManager_JS_ErrCode_2500 case claimInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2500 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2500 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3100
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter pipe type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_3100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3100 begin');
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

    var testParamPip = "invalid";

    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info('usb case HostManager_JS_ErrCode_3100 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usbManager.claimInterface(testParamPip, TmpInterface, true);
          console.info('usb HostManager_JS_ErrCode_3100 case claimInterface return: ' + maskCode);
          expect(false).assertTrue();
        }
      }
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3100 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3100 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3900
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter iface type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_3900', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3900 begin');
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

    var TmpInterface = "invalid";
    try {
      var maskCode = usbManager.claimInterface(gPipe, TmpInterface);
      console.info('usb HostManager_JS_ErrCode_3900 case claimInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3900 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3900 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1600
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface id
   */
  it('SUB_USB_HostManager_JS_Compatibility_1600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1600 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb SUB_USB_HostManager_JS_Compatibility_1600 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb HostManager_JS_Compatibility_1600 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.id = 134
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_1600 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1700
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface name
   */
  it('SUB_USB_HostManager_JS_Compatibility_1700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1700 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb SUB_USB_HostManager_JS_Compatibility_1700 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb HostManager_JS_Compatibility_1700 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.name = '134wer'
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_1700 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1800
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface clazz
   */
  it('SUB_USB_HostManager_JS_Compatibility_1800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1800 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb SUB_USB_HostManager_JS_Compatibility_1800 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb HostManager_JS_Compatibility_1800 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.clazz = 78
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_1800 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_1900
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface protocol
   */
  it('SUB_USB_HostManager_JS_Compatibility_1900', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_1900 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb SUB_USB_HostManager_JS_Compatibility_1900 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb HostManager_JS_Compatibility_1900 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.protocol = 124
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_1900 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2000
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface subClass
   */
  it('SUB_USB_HostManager_JS_Compatibility_2000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2000 begin');
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

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb SUB_USB_HostManager_JS_Compatibility_2000 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb HostManager_JS_Compatibility_2000 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.subClass = 784
        var isClaim = usbManager.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_2000 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1400
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter number exception, input a parameter
   */
  it('SUB_USB_HostManager_JS_ErrCode_1400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1400 begin');
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
    if (gDeviceList[0].configs.length == 0) {
      console.info('usb HostManager_JS_ErrCode_1400 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    try {
      var maskCode = usbManager.releaseInterface("invalid");
      console.info('usb HostManager_JS_ErrCode_1400 case releaseInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1400 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1400 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2600
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2600 begin');
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
    if (gDeviceList[0].configs.length == 0) {
      console.info('usb HostManager_JS_ErrCode_2600 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usbManager.releaseInterface();
      console.info('usb HostManager_JS_ErrCode_2600 case releaseInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2600 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2600 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3300
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter pipe type error
   */
   it('SUB_USB_HostManager_JS_ErrCode_3300', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    
    var testParamPip = "invalid";

    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info('usb case HostManager_JS_ErrCode_3300 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usbManager.releaseInterface(testParamPip, TmpInterface);
          console.info('usb HostManager_JS_ErrCode_3300 case releaseInterface return: ' + maskCode);
          expect(false).assertTrue();
        }
      }
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3300 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3300 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1500
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter iface type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_1500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1500 begin');
    if (portCurrentMode == 1) {
      console.info('usb HostManager_JS_ErrCode_1500 case get_device port is device')
      expect(false).assertFalse();
      return
    }
    
    var TmpInterface = "invalid";
    try {
      var maskCode = usbManager.releaseInterface(gPipe, TmpInterface);
      console.info('usb HostManager_JS_ErrCode_1500 case releaseInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1500 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1500 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_4200
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface protocol error
   */
  it('SUB_USB_HostManager_JS_Compatibility_4200', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_4200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue()
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaimed = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.protocol = 482
      var ret = usbManager.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_4200 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_4300
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface clazz error
   */
  it('SUB_USB_HostManager_JS_Compatibility_4300', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_4300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue()
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.clazz = 482
      var ret = usbManager.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_4300 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_4400
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface subClass error
   */
  it('SUB_USB_HostManager_JS_Compatibility_4400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_4400 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue()
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.subClass = 482
      var ret = usbManager.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);

    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_4400 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_4500
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface name error
   */
  it('SUB_USB_HostManager_JS_Compatibility_4500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_4400 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue()
      return
    }
    gPipe = usbManager.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.name = 'wer32'
      var ret = usbManager.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_4500 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1200
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter number exception, input a parameter
   */
  it('SUB_USB_HostManager_JS_ErrCode_1200', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1200 begin');
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
      var maskCode = usbManager.setInterface("invalid");
      console.info('usb HostManager_JS_ErrCode_1200 case setInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1200 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1200 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2700
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2700 begin');
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
      var maskCode = usbManager.setInterface();
      console.info('usb HostManager_JS_ErrCode_2700 case setInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2700 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2700 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3400
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter pipe type error
   */
   it('SUB_USB_HostManager_JS_ErrCode_3400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3400 begin');
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
    
    var testParamPip = "invalid";

    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info('usb case HostManager_JS_ErrCode_3400 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usbManager.setInterface(testParamPip, TmpInterface);
          console.info('usb HostManager_JS_ErrCode_3400 case setInterface return: ' + maskCode);
          expect(false).assertTrue();
        }
      }
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3400 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3400 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_4300
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter iface type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_4300', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_4300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case HostManager_JS_ErrCode_4300 get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case HostManager_JS_ErrCode_4300 get_device_list is null')
      expect(false).assertTrue();
      return
    }
    
    var TmpInterface = "invalid";
    try {
      var maskCode = usbManager.setInterface(gPipe, TmpInterface);
      console.info('usb HostManager_JS_ErrCode_4300 case setInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_4300 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_4300 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3700
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig name error
   */
  it('SUB_USB_HostManager_JS_Compatibility_3700', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3700 begin');
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
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j]
      config.name = 'asdfsd'
      var ret = usbManager.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertEqual(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_3700 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3800
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig name, id error
   */
  it('SUB_USB_HostManager_JS_Compatibility_3800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3800 begin');
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j]
      config.name = 'asdfsd'
      config.id = 154
      var ret = usbManager.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_3800 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3900
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig attributes error
   */
  it('SUB_USB_HostManager_JS_Compatibility_3900', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3900 begin');
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j]
      config.attributes = 154
      var ret = usbManager.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_3900 :  PASS');
  })

/**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_4000
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig name interval(1-16) error
   */
  it('SUB_USB_HostManager_JS_Compatibility_4000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_4000 begin');
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j]
      config.name = 'asdfsd'
      config.interfaces[0].endpoints[0].interval = 0
      var ret = usbManager.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_4000 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1100
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter number exception, input a parameter
   */
  it('SUB_USB_HostManager_JS_ErrCode_1100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1100 begin');
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
      var maskCode = usbManager.setConfiguration("invalid");
      console.info('usb HostManager_JS_ErrCode_1100 case setConfiguration return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1100 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1100 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2800
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2800', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2800 begin');
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
      var maskCode = usbManager.setConfiguration();
      console.info('usb HostManager_JS_ErrCode_2800 case setConfiguration return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2800 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2800 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3500
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter pipe type error
   */
   it('SUB_USB_HostManager_JS_ErrCode_3500', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3500 begin');
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
    
    var testParamPip = "invalid";

    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        var TmpConfig = gDeviceList[0].configs[j];
        var maskCode = usbManager.setConfiguration(testParamPip, TmpConfig);
        console.info('usb HostManager_JS_ErrCode_3500 case setConfiguration return: ' + maskCode);
        expect(false).assertTrue();
      }
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3500 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3500 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_4200
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter config type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_4200', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_4200 begin');
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
    
    var TmpConfig = "invalid";

    try {
      var maskCode = usbManager.setConfiguration(gPipe, TmpConfig);
      console.info('usb HostManager_JS_ErrCode_4200 case setConfiguration return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_4200 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_4200 :  PASS');
    }
  })
})
}
