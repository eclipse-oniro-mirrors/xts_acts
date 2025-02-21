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
import EventConstants from './EventConstants.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

/* usb device pipe test */
export default function UsbDevicePipeJsFunctionsTestEx() {
describe('UsbDevicePipeJsFunctionsTestEx', function () {

  var gDeviceList
  var gPipe
  var portCurrentMode

  beforeAll(function () {
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTestEx Begin*************');
    var Version = usb.getVersion()
    console.info('usb unit begin test getversion :' + Version)

    // version > 17  host currentMode = 2 device currentMode = 1
    var usbPortList = usb.getPorts()
    if (usbPortList == undefined) {
      portCurrentMode = 1;
      return
    }
    gDeviceList = usb.getDevices();
    if (usbPortList.length > 0) {
      if (gDeviceList.length > 0) {
        if (usbPortList[0].status.currentMode == 1) {
          usb.setPortRoles(usbPortList[0].id, usb.SOURCE, usb.HOST).then(data => {
            portCurrentMode = 2
            console.info('usb case setPortRoles  return: ' + data);
          }).catch(error => {
            console.info('usb case setPortRoles  error : ' + error);
          });
  
          console.log('*************Usb Unit switch to host Ex Begin*************');
          CheckEmptyUtils.sleep(8000)
        }
      } else {
        portCurrentMode = 1
      }
    }

    gPipe = usb.connectDevice(gDeviceList[0])
    console.info('usb unit connectDevice  gPipe ret : ' + JSON.stringify(gPipe));
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Ex Case*************');
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Ex Case*************');
  })
  afterAll(function () {
    var isPipClose = usb.closePipe(gPipe)
    console.info('usb unit close gPipe ret : ' + isPipClose);
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTestEx End*************');
  })

  function findInitPoint(testParam, j) {
    var bfind = false
    for (var k = 0; k < testParam.config.interfaces[j].endpoints.length; k++) {
      var endpoint = testParam.config.interfaces[j].endpoints[k];
      if (endpoint.type == EventConstants.USB_ENDPOINT_XFER_BULK) {

        bfind = true
        if (endpoint.direction == usb.USB_REQUEST_DIR_TO_DEVICE) {
          testParam.outEndpoint = endpoint;
          testParam.maxOutSize = endpoint.maxPacketSize;
        } else if (endpoint.direction == usb.USB_REQUEST_DIR_FROM_DEVICE) {
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
   * @tc.number: SUB_USB_JS_0650
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, send data, error outEndpoint.address = 123
   */
  it('SUB_USB_JS_0650', 0, function () {
    console.info('usb SUB_USB_JS_0650 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy 03';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam
    TmpTestParam.outEndpoint.address = 123
    usb.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_JS_0650 ret: ' + data);
      expect(data).assertEqual(-1);
      console.info('usb case SUB_USB_JS_0650 :  PASS');
    }).catch(error => {
      console.info('usb 03 write error : ' + JSON.stringify(error));
      expect(false).assertFalse();
      console.info('usb case SUB_USB_JS_0650 :  PASS');
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_JS_0660
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, send data, error outEndpoint.number = 123
   */
  it('SUB_USB_JS_0660', 0, function () {
    console.info('usb SUB_USB_JS_0660 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy  04';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam
    TmpTestParam.outEndpoint.number = 123
    usb.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_JS_0660 ret: ' + data);
      expect(data).assertEqual(-1);
      console.info('usb case SUB_USB_JS_0660 :  PASS');
    }).catch(error => {
      console.info('usb 04 write error : ' + JSON.stringify(error));
      expect(false).assertFalse();
      console.info('usb case SUB_USB_JS_0660 :  PASS');
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_JS_0670
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, send data, error outEndpoint.type = 123
   */
  it('SUB_USB_JS_0670', 0, function () {
    console.info('usb SUB_USB_JS_0670 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send time 13213213 wzy 05';
    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    var TmpTestParam = testParam
    TmpTestParam.outEndpoint.type = 123
    usb.bulkTransfer(TmpTestParam.pip, TmpTestParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_JS_0670 ret: ' + data);
      expect(data).assertEqual(-1);
      console.info('usb case SUB_USB_JS_0670 :  PASS');
    }).catch(error => {
      console.info('usb 05 write error : ' + JSON.stringify(error));
      expect(false).assertFalse();
      console.info('usb case SUB_USB_JS_0670 :  PASS');
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_JS_1100
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter number exception, input a parameter
   */
   it('SUB_USB_JS_1100', 0, function () {
    console.info('usb SUB_USB_JS_1100 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    try {
      usb.bulkTransfer(testParam.pip).then(data => {
        console.info('usb case SUB_USB_JS_1100 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1100 :  FAILED');
      }).catch(error => {
        console.info('usb SUB_USB_JS_1100 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1100 :  FAILED');
      });
    } catch (err) {
      console.info('usb 1100 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1100 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1480
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter number exception, input two parameter
   */
  it('SUB_USB_JS_1480', 0, function () {
    console.info('usb SUB_USB_JS_1480 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    try {
      usb.bulkTransfer(testParam.pip, testParam.outEndpoint).then(data => {
        console.info('usb case SUB_USB_JS_1480 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1480 :  FAILED');
      }).catch(error => {
        console.info('usb 1480 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1480 :  FAILED');
      });
    } catch (err) {
      console.info('usb 1480 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1480 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1310
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1310', 0, function () {
    console.info('usb SUB_USB_JS_1310 begin');
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
      usb.bulkTransfer().then(data => {
        console.info('usb case SUB_USB_JS_1310 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1310 :  FAILED');
      }).catch(error => {
        console.info('usb 1310 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1310 :  FAILED');
      });
    } catch (err) {
      console.info('usb 1480 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1310 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1420
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter pipe type error
   */
   it('SUB_USB_JS_1420', 0, function () {
    console.info('usb SUB_USB_JS_1420 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpTestParam = testParam;
    tmpTestParam.pip = "invalid";
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    try {
      usb.bulkTransfer(tmpTestParam.pip, tmpTestParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info('usb case SUB_USB_JS_1420 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1420 :  FAILED');
      }).catch(error => {
        console.info('usb 1420 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1420 :  FAILED');
      });
    } catch (err) {
      console.info('usb 1420 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1420 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1490
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter endpoint type error
   */
  it('SUB_USB_JS_1490', 0, function () {
    console.info('usb SUB_USB_JS_1490 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpTestParam = testParam;
    tmpTestParam.inEndpoint = "invalid";
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    try {
      usb.bulkTransfer(tmpTestParam.pip, tmpTestParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info('usb case SUB_USB_JS_1490 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1490 :  FAILED');
      }).catch(error => {
        console.info('usb 1490 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1490 :  FAILED');
      });
    } catch (err) {
      console.info('usb 1490 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1490 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1500
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter Uint8Array type error
   */
  it('SUB_USB_JS_1500', 0, function () {
    console.info('usb SUB_USB_JS_1500 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpUint8Array = "invalid";
    try {
      usb.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, 5000).then(data => {
        console.info('usb case SUB_USB_JS_1500 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1500 :  FAILED');
      }).catch(error => {
        console.info('usb 1500 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1500 :  FAILED');
      });
    } catch (err) {
      console.info('usb 1500 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1500 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1530
   * @tc.name: bulkTransfer
   * @tc.desc: Negative test: bulk transfer, parameter timeout type error
   */
  it('SUB_USB_JS_1530', 0, function () {
    console.info('usb SUB_USB_JS_1530 begin');
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

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpTimeOut = "invalid";
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    try {
      usb.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, tmpTimeOut).then(data => {
        console.info('usb case SUB_USB_JS_1530 ret: ' + data);
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1530 :  FAILED');
      }).catch(error => {
        console.info('usb 1530 write error : ' + JSON.stringify(error));
        expect(false).assertTrue();
        console.info('usb case SUB_USB_JS_1530 :  FAILED');
      });
    } catch (err) {
      console.info('usb 1530 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1530 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_0430
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error id
   */
  it('SUB_USB_JS_0430', 0, function () {
    console.info('usb SUB_USB_JS_0430 begin');
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
      console.info('usb case SUB_USB_JS_0430 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case SUB_USB_JS_0430 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        TmpInterface.id = 123;
        var isClaim = usb.claimInterface(gPipe, TmpInterface, true);
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0430 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0440
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error protocol
   */
  it('SUB_USB_JS_0440', 0, function () {
    console.info('usb SUB_USB_JS_0440 begin');
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
      console.info('usb case SUB_USB_JS_0440 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case SUB_USB_JS_0440 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.protocol = 120
        var isClaim = usb.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0440 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0450
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error clazz
   */
  it('SUB_USB_JS_0450', 0, function () {
    console.info('usb SUB_USB_JS_0450 begin');
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
      console.info('usb case SUB_USB_JS_0450 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case SUB_USB_JS_0450 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.clazz = 784
        var isClaim = usb.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0450 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0460
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error name
   */
  it('SUB_USB_JS_0460', 0, function () {
    console.info('usb SUB_USB_JS_0460 begin');
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
      console.info('usb case SUB_USB_JS_0460 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case SUB_USB_JS_0460 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.name = '123sdf'
        var isClaim = usb.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0460 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0470
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, USBInterface afferent error subClass
   */
  it('SUB_USB_JS_0470', 0, function () {
    console.info('usb SUB_USB_JS_0470 begin');
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
      console.info('usb case SUB_USB_JS_0470 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case SUB_USB_JS_0470 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k]
        TmpInterface.subClass = 1210
        var isClaim = usb.claimInterface(gPipe, TmpInterface, true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0470 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1110
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter number exception, input a parameter
   */
  it('SUB_USB_JS_1110', 0, function () {
    console.info('usb SUB_USB_JS_1110 begin');
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
      console.info('usb 1110 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usb.claimInterface("invalid");
      console.info('usb 1110 case claimInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1110 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1110 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1320
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1320', 0, function () {
    console.info('usb SUB_USB_JS_1320 begin');
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
      console.info('usb 1320 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usb.claimInterface();
      console.info('usb 1320 case claimInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1320 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1320 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1430
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter pipe type error
   */
  it('SUB_USB_JS_1430', 0, function () {
    console.info('usb SUB_USB_JS_1430 begin');
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
          console.info('usb case SUB_USB_JS_1430 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usb.claimInterface(testParamPip, TmpInterface, true);
          console.info('usb 1430 case claimInterface return: ' + maskCode);
          expect(false).assertTrue();
        }
      }
    } catch (err) {
      console.info('usb 1430 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1430 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1510
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter iface type error
   */
  it('SUB_USB_JS_1510', 0, function () {
    console.info('usb SUB_USB_JS_1510 begin');
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
      var maskCode = usb.claimInterface(gPipe, TmpInterface);
      console.info('usb 1510 case claimInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1510 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1510 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1520
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter force type error
   */
  it('SUB_USB_JS_1520', 0, function () {
    console.info('usb SUB_USB_JS_1520 begin');
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
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info('usb case SUB_USB_JS_1520 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usb.claimInterface(gPipe, TmpInterface, "invalid");
          console.info('usb 1520 case claimInterface return: ' + maskCode);
          expect(false).assertTrue();
        }
      }
    } catch (err) {
      console.info('usb 1520 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1520 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_0280
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface id
   */
  it('SUB_USB_JS_0280', 0, function () {
    console.info('usb SUB_USB_JS_0280 begin');
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
      console.info('usb SUB_USB_JS_0280 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb SUB_USB_JS_0280 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.id = 134
        var isClaim = usb.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0280 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0290
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface name
   */
  it('SUB_USB_JS_0290', 0, function () {
    console.info('usb SUB_USB_JS_0290 begin');
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
      console.info('usb SUB_USB_JS_0290 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb SUB_USB_JS_0290 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.name = '134wer'
        var isClaim = usb.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0290 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0300
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface clazz
   */
  it('SUB_USB_JS_0300', 0, function () {
    console.info('usb SUB_USB_JS_0300 begin');
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
      console.info('usb SUB_USB_JS_0300 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb SUB_USB_JS_0300 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.clazz = 78
        var isClaim = usb.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0300 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0310
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface protocol
   */
  it('SUB_USB_JS_0310', 0, function () {
    console.info('usb SUB_USB_JS_0310 begin');
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
      console.info('usb SUB_USB_JS_0310 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb SUB_USB_JS_0310 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.protocol = 124
        var isClaim = usb.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0310 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0320
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, error Interface subClass
   */
  it('SUB_USB_JS_0320', 0, function () {
    console.info('usb SUB_USB_JS_0320 begin');
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
      console.info('usb SUB_USB_JS_0320 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb SUB_USB_JS_0320 case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var tmpInterface = gDeviceList[0].configs[j].interfaces[k]
        tmpInterface.subClass = 784
        var isClaim = usb.releaseInterface(gPipe, tmpInterface)
        console.info('usb case releaseInterface function return: ' + isClaim);
        expect(isClaim).assertLess(0);
      }
    }

    console.info('usb SUB_USB_JS_0320 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1150
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter number exception, input a parameter
   */
  it('SUB_USB_JS_1150', 0, function () {
    console.info('usb SUB_USB_JS_1150 begin');
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
      console.info('usb 1150 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    try {
      var maskCode = usb.releaseInterface("invalid");
      console.info('usb 1150 case releaseInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1150 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1150 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1330
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1330', 0, function () {
    console.info('usb SUB_USB_JS_1330 begin');
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
      console.info('usb 1330 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usb.releaseInterface();
      console.info('usb 1330 case releaseInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1330 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1330 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1450
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter pipe type error
   */
   it('SUB_USB_JS_1450', 0, function () {
    console.info('usb SUB_USB_JS_1450 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    
    var testParamPip = "invalid";

    try {
      for (var j = 0; j < gDeviceList[0].configs.length; j++) {
        if (gDeviceList[0].configs[j].interfaces.length == 0) {
          console.info('usb case SUB_USB_JS_1450 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usb.releaseInterface(testParamPip, TmpInterface);
          console.info('usb 1450 case releaseInterface return: ' + maskCode);
          expect(false).assertTrue();
        }
      }
    } catch (err) {
      console.info('usb 1450 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1450 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1580
   * @tc.name: releaseInterface
   * @tc.desc: Negative test: release Interface, parameter iface type error
   */
  it('SUB_USB_JS_1580', 0, function () {
    console.info('usb SUB_USB_JS_1580 begin');
    if (portCurrentMode == 1) {
      console.info('usb 1580 case get_device port is device')
      expect(false).assertFalse();
      return
    }
    
    var TmpInterface = "invalid";
    try {
      var maskCode = usb.releaseInterface(gPipe, TmpInterface);
      console.info('usb 1580 case releaseInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1580 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1580 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_0820
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface protocol error
   */
  it('SUB_USB_JS_0820', 0, function () {
    console.info('usb SUB_USB_JS_0820 begin');
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
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaimed = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true);

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.protocol = 482
      var ret = usb.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_JS_0820 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0830
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface clazz error
   */
  it('SUB_USB_JS_0830', 0, function () {
    console.info('usb SUB_USB_JS_0830 begin');
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
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.clazz = 482
      var ret = usb.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_JS_0830 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0840
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface subClass error
   */
  it('SUB_USB_JS_0840', 0, function () {
    console.info('usb SUB_USB_JS_0840 begin');
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
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.subClass = 482
      var ret = usb.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);

    }

    console.info('usb SUB_USB_JS_0840 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0850
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, Interface name error
   */
  it('SUB_USB_JS_0850', 0, function () {
    console.info('usb SUB_USB_JS_0840 begin');
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
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)

      var tmpInterface = gDeviceList[0].configs[j].interfaces[0]
      tmpInterface.name = 'wer32'
      var ret = usb.setInterface(gPipe, tmpInterface)
      console.info('usb case setInterface return : ' + ret)
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_JS_0850 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1130
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter number exception, input a parameter
   */
  it('SUB_USB_JS_1130', 0, function () {
    console.info('usb SUB_USB_JS_1130 begin');
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
      var maskCode = usb.setInterface("invalid");
      console.info('usb 1130 case setInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1130 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1130 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1340
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1340', 0, function () {
    console.info('usb SUB_USB_JS_1340 begin');
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
      var maskCode = usb.setInterface();
      console.info('usb 1340 case setInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1340 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1340 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1460
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter pipe type error
   */
   it('SUB_USB_JS_1460', 0, function () {
    console.info('usb SUB_USB_JS_1460 begin');
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
          console.info('usb case SUB_USB_JS_1460 current device.configs.interfaces.length = 0');
        }
        for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
          var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
          var maskCode = usb.setInterface(testParamPip, TmpInterface);
          console.info('usb 1460 case setInterface return: ' + maskCode);
          expect(false).assertTrue();
        }
      }
    } catch (err) {
      console.info('usb 1460 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1460 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1550
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, parameter iface type error
   */
  it('SUB_USB_JS_1550', 0, function () {
    console.info('usb SUB_USB_JS_1550 begin');
    if (portCurrentMode == 1) {
      console.info('usb case 1550 get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case 1550 get_device_list is null')
      expect(false).assertTrue();
      return
    }
    
    var TmpInterface = "invalid";
    try {
      var maskCode = usb.setInterface(gPipe, TmpInterface);
      console.info('usb 1550 case setInterface return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1550 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1550 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_0760
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig name error
   */
  it('SUB_USB_JS_0760', 0, function () {
    console.info('usb SUB_USB_JS_0760 begin');
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
    gPipe = usb.connectDevice(gDeviceList[0])
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = gDeviceList[0].configs[j]
      config.name = 'asdfsd'
      var ret = usb.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertEqual(0);
    }

    console.info('usb SUB_USB_JS_0760 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0770
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig name, id error
   */
  it('SUB_USB_JS_0770', 0, function () {
    console.info('usb SUB_USB_JS_0770 begin');
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
      var ret = usb.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_JS_0770 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0780
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig attributes error
   */
  it('SUB_USB_JS_0780', 0, function () {
    console.info('usb SUB_USB_JS_0780 begin');
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
      var ret = usb.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_JS_0780 :  PASS');
  })

/**
   * @tc.number: SUB_USB_JS_0790
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig name interval(1-16) error
   */
  it('SUB_USB_JS_0790', 0, function () {
    console.info('usb SUB_USB_JS_0790 begin');
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
      var ret = usb.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_JS_0790 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1120
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter number exception, input a parameter
   */
  it('SUB_USB_JS_1120', 0, function () {
    console.info('usb SUB_USB_JS_1120 begin');
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
      var maskCode = usb.setConfiguration("invalid");
      console.info('usb 1120 case setConfiguration return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1120 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1120 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1350
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1350', 0, function () {
    console.info('usb SUB_USB_JS_1350 begin');
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
      var maskCode = usb.setConfiguration();
      console.info('usb 1350 case setConfiguration return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1350 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1350 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1470
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter pipe type error
   */
   it('SUB_USB_JS_1470', 0, function () {
    console.info('usb SUB_USB_JS_1470 begin');
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
        var maskCode = usb.setConfiguration(testParamPip, TmpConfig);
        console.info('usb 1470 case setConfiguration return: ' + maskCode);
        expect(false).assertTrue();
      }
    } catch (err) {
      console.info('usb 1470 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1470 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1540
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, parameter config type error
   */
  it('SUB_USB_JS_1540', 0, function () {
    console.info('usb SUB_USB_JS_1540 begin');
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
      var maskCode = usb.setConfiguration(gPipe, TmpConfig);
      console.info('usb 1540 case setConfiguration return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1540 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1540 :  PASS');
    }
  })
})
}
