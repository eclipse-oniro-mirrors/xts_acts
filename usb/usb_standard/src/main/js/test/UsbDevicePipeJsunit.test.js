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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

/* usb device pipe test */
export default function UsbDevicePipeJsFunctionsTest() {
describe('UsbDevicePipeJsFunctionsTest', function () {

  var gDeviceList;
  var gPipe;
  var portCurrentMode;

  beforeAll(async function () {
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTest Begin*************');
    var Version = usbManager.getVersion();
    console.info('usb unit begin test getversion :' + Version)
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
            console.info('usb case setPortRoles return: ' + data);
          }).catch(error => {
            console.info('usb case setPortRoles error : ' + error);
          });
          CheckEmptyUtils.sleep(8000);
          console.log('*************Usb Unit switch to host Begin*************');
        }

        gDeviceList[0].name;
        gDeviceList[0].version;
        gDeviceList[0].configs;
        gPipe = usbManager.connectDevice(gDeviceList[0]);
        console.info('usb unit connectDevice gPipe ret : ' + JSON.stringify(gPipe));
      } else {
        portCurrentMode = 1;
      }
    }
  })

  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Case*************');
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Case*************');
  })

  afterAll(function () {
    var isPipClose = usbManager.closePipe(gPipe);
    console.info('usb unit close gPipe ret : ' + isPipClose);
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTest End*************');
  })

  function findInitPoint(testParam, j) {
    var bfind = false
    for (var k = 0; k < testParam.config.interfaces[j].endpoints.length; k++) {
      var endpoint = testParam.config.interfaces[j].endpoints[k];
      endpoint.number = 1;
      endpoint.type = 2;
      endpoint.interfaceid = 1;
      if (endpoint.type == EventConstants.USB_ENDPOINT_XFER_BULK) {
        bfind = true
        if (endpoint.direction == usbManager.USB_REQUEST_DIR_TO_DEVICE) {
          testParam.maxOutSize = endpoint.maxPacketSize;
          testParam.outEndpoint = endpoint;
        } else if (endpoint.direction == usbManager.USB_REQUEST_DIR_FROM_DEVICE) {
          testParam.maxInSize = endpoint.maxPacketSize;
          testParam.inEndpoint = endpoint
        }
      }
    }
    if (bfind) {
      testParam.interface = testParam.config.interfaces[j]
      return bfind
    }
    return false
  }

  function getFlag(testParam, j) {
    if (testParam.config.interfaces[j].endpoints.length == 0) {
      return false
    }

    if (testParam.config.interfaces[j].clazz != 10 ||
      testParam.config.interfaces[j].subClass != 0 ||
      testParam.config.interfaces[j].protocol != 2) {
      return false
    }
    return true
  }

  function initPoint(testParam) {
    for (var j = 0; j < testParam.config.interfaces.length; j++) {
      if (getFlag(testParam, j) == true) {
        if (findInitPoint(testParam, j) == true) {
          break
        }
      }
    }
  }

  // Prefabrication transmission related parameters
  function getTransferTestParam() {
    var testParam = {
      config: null,
      device: null,
      pip: null,
      inEndpoint: null,
      interface: null,
      outEndpoint: null,
      usbRequest: null,
      sendData: '',
      isClaimed: 0,
      maxInSize: 1024,
      maxOutSize: 1024
    }

    console.info('usb case  gDeviceList.length: ' + gDeviceList.length);
    for (var i = 0; i < gDeviceList.length; i++) {
      testParam.device = gDeviceList[i]
      testParam.config = testParam.device.configs[0]
      testParam.pip = gPipe
      initPoint(testParam)
    }
    return testParam
  }

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_1000
   * @tc.name: bulkTransfer
   * @tc.desc: Positive test: bulk transfer, receive data
   */
  it('SUB_USB_HostManager_JS_TranFunc_1000', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_1000 begin');
    console.info('usb SUB_USB_HostManager_JS_TranFunc_1000 portcurrentMode ret : ' + portCurrentMode);
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

    console.info('usb case readData begin');
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    await usbManager.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case readData tmpUint8Array buffer : ' + CheckEmptyUtils.ab2str(tmpUint8Array));
      console.info('usb case readData ret: ' + data);
      expect(data >= 0).assertTrue();
      console.info('usb case SUB_USB_HostManager_JS_TranFunc_1000 :  PASS');
    }).catch(error => {
      console.info('usb case readData error : ' + JSON.stringify(error));
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_1100
   * @tc.name: bulkTransfer
   * @tc.desc: Positive test: bulk transfer, send data
   */
  it('SUB_USB_HostManager_JS_TranFunc_1100', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_1100 begin');
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

    testParam.sendData = 'send default';
    try {
      testParam.sendData = parameter.getSync('test_usb', 'default');
      console.log('usb parameter ' + JSON.stringify(testParam.sendData));
    } catch (e) {
      console.log('usb parameter getSync unexpected error: ' + e);
    }

    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_TranFunc_1100 ret: ' + data);
      console.info('usb case SUB_USB_HostManager_JS_TranFunc_1100 send data: ' + testParam.sendData);
      expect(data > 0).assertTrue();
      console.info('usb case SUB_USB_HostManager_JS_TranFunc_1100 :  PASS');
    }).catch(error => {
      console.info('usb write error : ' + JSON.stringify(error));
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0400
   * @tc.name: bulkTransfer
   * @tc.desc: Undefined option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0400', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0400 begin');
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

    testParam.sendData = 'send default';
    try {
      testParam.sendData = parameter.getSync('test_usb', 'default');
      console.log('usb HostManager_JS_TranCompatibility_0400 parameter ' + JSON.stringify(testParam.sendData));
    } catch (e) {
      console.log('usb HostManager_JS_TranCompatibility_0400 parameter getSync unexpected error: ' + e);
    }

    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, undefined).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0400 ret: ' + data);
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0400 send data: ' + testParam.sendData);
      expect(data > 0).assertTrue();
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0400 :  PASS');
    }).catch(error => {
      console.info('usb HostManager_JS_TranCompatibility_0400 write error : ' + JSON.stringify(error));
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0500
   * @tc.name: bulkTransfer
   * @tc.desc: Null option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0500', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0500 begin');
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

    testParam.sendData = 'send default';
    try {
      testParam.sendData = parameter.getSync('test_usb', 'default');
      console.log('usb HostManager_JS_TranCompatibility_0500 parameter ' + JSON.stringify(testParam.sendData));
    } catch (e) {
      console.log('usb HostManager_JS_TranCompatibility_0500 parameter getSync unexpected error: ' + e);
    }

    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, null).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0500 ret: ' + data);
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0500 send data: ' + testParam.sendData);
      expect(data > 0).assertTrue();
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0500 :  PASS');
    }).catch(error => {
      console.info('usb HostManager_JS_TranCompatibility_0500 write error : ' + JSON.stringify(error));
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0600
   * @tc.name: bulkTransfer
   * @tc.desc: Ignore option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0600', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0600 begin');
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

    testParam.sendData = 'send default';
    try {
      testParam.sendData = parameter.getSync('test_usb', 'default');
      console.log('usb HostManager_JS_TranCompatibility_0600 parameter ' + JSON.stringify(testParam.sendData));
    } catch (e) {
      console.log('usb HostManager_JS_TranCompatibility_0600 parameter getSync unexpected error: ' + e);
    }

    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array).then(data => {
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0600 ret: ' + data);
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0600 send data: ' + testParam.sendData);
      expect(data > 0).assertTrue();
      console.info('usb case SUB_USB_HostManager_JS_TranCompatibility_0600 :  PASS');
    }).catch(error => {
      console.info('usb HostManager_JS_TranCompatibility_0600 write error : ' + JSON.stringify(error));
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_0400
   * @tc.name: claimInterface
   * @tc.desc: Positive test: Get interface, and release
   */
  it('SUB_USB_HostManager_JS_Func_0400', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Func_0400 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb HostManager_JS_Func_0400 case get_device_list is null')
      expect(gDeviceList.length).assertEqual(-1);
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb HostManager_JS_Func_0400 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        //Attribute Prefabrication
        var interfaces = gDeviceList[0].configs[j].interfaces[k];
        interfaces.id = 1;
        interfaces.name = '';
        interfaces.alternateSetting = 0;
        var isClaim = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[k], true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertEqual(0);
        if (isClaim == 0) {
          isClaim = usbManager.releaseInterface(gPipe, gDeviceList[0].configs[j].interfaces[k])
          console.info('usb case releaseInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
          gPipe = usbManager.connectDevice(gDeviceList[0])
        }
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Func_0400 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_4000
   * @tc.name: claimInterface
   * @tc.desc: Negative test: Get interface, parameter force type error, use default options
   */
  it('SUB_USB_HostManager_JS_ErrCode_4000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_4000 begin');
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
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case SUB_USB_HostManager_JS_ErrCode_4000 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var TmpInterface = gDeviceList[0].configs[j].interfaces[k];
        console.info("usb case HostManager_JS_ErrCode_4000 claimInterface TmpInterface.id return:" + TmpInterface.id);
        console.info("usb case HostManager_JS_ErrCode_4000 claimInterface TmpInterface return:"
          + JSON.stringify(TmpInterface));
        var maskCode = usbManager.claimInterface(gPipe, TmpInterface, "invalid");
        console.info('usb HostManager_JS_ErrCode_4000 case claimInterface return: ' + maskCode);
        expect(maskCode).assertEqual(0);
      }
    }
    console.info('usb SUB_USB_HostManager_JS_ErrCode_4000 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2100
   * @tc.name: claimInterface
   * @tc.desc: Test the claimInterface() interface.
   * Undefined option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_Compatibility_2100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2100 begin');
    if (portCurrentMode == 1) {
      console.info('usb case HostManager_JS_Compatibility_2100 get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case HostManager_JS_Compatibility_2100 get_device_list is null')
      expect(gDeviceList.length).assertEqual(-1);
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case HostManager_JS_Compatibility_2100 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2100 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        //Attribute Prefabrication
        var interfaces = gDeviceList[0].configs[j].interfaces[k];
        var isClaim = usbManager.claimInterface(gPipe, interfaces, undefined)
        console.info('usb case HostManager_JS_Compatibility_2100 claimInterface function return: ' + isClaim);
        expect(isClaim).assertEqual(0);
        if (isClaim == 0) {
          isClaim = usbManager.releaseInterface(gPipe, gDeviceList[0].configs[j].interfaces[k])
          console.info('usb case HostManager_JS_Compatibility_2100 releaseInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
          gPipe = usbManager.connectDevice(gDeviceList[0])
        }
      }
    }
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2100 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2200
   * @tc.name: claimInterface
   * @tc.desc: Test the claimInterface() interface.
   * Null option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_Compatibility_2200', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case HostManager_JS_Compatibility_2200 get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case HostManager_JS_Compatibility_2200 get_device_list is null')
      expect(gDeviceList.length).assertEqual(-1);
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case HostManager_JS_Compatibility_2200 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2200 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        //Attribute Prefabrication
        var interfaces = gDeviceList[0].configs[j].interfaces[k];
        var isClaim = usbManager.claimInterface(gPipe, interfaces, null)
        console.info('usb case HostManager_JS_Compatibility_2200 claimInterface function return: ' + isClaim);
        expect(isClaim).assertEqual(0);
        if (isClaim == 0) {
          isClaim = usbManager.releaseInterface(gPipe, gDeviceList[0].configs[j].interfaces[k])
          console.info('usb case HostManager_JS_Compatibility_2200 releaseInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
          gPipe = usbManager.connectDevice(gDeviceList[0])
        }
      }
    }
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2200 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_2300
   * @tc.name: claimInterface
   * @tc.desc: Test the claimInterface() interface.
   * Ignore option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_Compatibility_2300', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case HostManager_JS_Compatibility_2300 get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case HostManager_JS_Compatibility_2300 get_device_list is null')
      expect(gDeviceList.length).assertEqual(-1);
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb case HostManager_JS_Compatibility_2300 current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case HostManager_JS_Compatibility_2300 current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        //Attribute Prefabrication
        var interfaces = gDeviceList[0].configs[j].interfaces[k];
        var isClaim = usbManager.claimInterface(gPipe, interfaces)
        console.info('usb case HostManager_JS_Compatibility_2300 claimInterface function return: ' + isClaim);
        expect(isClaim).assertEqual(0);
        if (isClaim == 0) {
          isClaim = usbManager.releaseInterface(gPipe, gDeviceList[0].configs[j].interfaces[k])
          console.info('usb case HostManager_JS_Compatibility_2300 releaseInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
          gPipe = usbManager.connectDevice(gDeviceList[0])
        }
      }
    }
    console.info('usb SUB_USB_HostManager_JS_Compatibility_2300 :  PASS');
  })

  function getTransferParam(iCmd, iReqTarType, iReqType, iValue, iIndex) {
    var tmpUint8Array = new Uint8Array(512);
    var requestCmd = iCmd
    var requestTargetType = iReqTarType
    var requestType = iReqType
    var value = iValue;
    var index = iIndex;
    var controlParam = {
      request: requestCmd,
      target: requestTargetType,
      reqType: requestType,
      value: value,
      index: index,
      data: tmpUint8Array
    }
    return controlParam
  }

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_1000
   * @tc.name: setConfiguration
   * @tc.desc: Positive test: Set Device Configuration
   */
  it('SUB_USB_HostManager_JS_Func_1000', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Func_1000 begin');
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
      var configs = gDeviceList[0].configs[j];
      configs.id = 1;
      configs.name = '';
      configs.maxPower = 1;
      configs.isRemoteWakeup = true;
      configs.isSelfPowered = true;
      var ret = usbManager.setConfiguration(gPipe, gDeviceList[0].configs[j])
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertEqual(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Func_1000 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_3600
   * @tc.name: setConfiguration
   * @tc.desc: Negative test: Set Device Configuration, USBConfig id error
   */
  it('SUB_USB_HostManager_JS_Compatibility_3600', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_3600 begin');
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
      var config = JSON.parse(JSON.stringify(gDeviceList[0].configs[j]));
      config.id = 255
      var ret = usbManager.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_3600 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Func_1100
   * @tc.name: setInterface
   * @tc.desc: Positive test: Set device interface
   */
  it('SUB_USB_HostManager_JS_Func_1100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Func_1100 begin');
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
      var isClaim = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)
      expect(isClaim).assertEqual(0)
      if (isClaim == 0) {
        var ret = usbManager.setInterface(gPipe, gDeviceList[0].configs[j].interfaces[0])
        console.info('usb case setInterface return : ' + ret);
        expect(ret).assertEqual(0);
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Func_1100 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_Compatibility_4100
   * @tc.name: setInterface
   * @tc.desc: Negative test: Set device interface, error tmpInterface.id
   */
  it('SUB_USB_HostManager_JS_Compatibility_4100', 0, function () {
    console.info('usb SUB_USB_HostManager_JS_Compatibility_4100 begin');
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usbManager.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)
      expect(isClaim).assertEqual(0)
      if (isClaim == 0) {
        var tmpInterface = JSON.parse(JSON.stringify(gDeviceList[0].configs[j].interfaces[0]));
        tmpInterface.id = 234
        var ret = usbManager.setInterface(gPipe, tmpInterface)
        console.info('usb case setInterface return : ' + ret)
        expect(ret).assertLess(0)
      }
    }

    console.info('usb SUB_USB_HostManager_JS_Compatibility_4100 :  PASS');
  })

  async function callControlTransfer(pip, controlParam, timeout, caseName) {
    await usbManager.controlTransfer(pip, controlParam, timeout).then(data => {
      console.info('usb controlTransfer ret data : ' + data + ' ' + caseName);
      console.info('usb controlTransfer controlParam.data buffer : ' + controlParam.data + ' ' + caseName);
      expect(data >= 0).assertTrue();
      console.info('usb' + caseName + ':  PASS');
    }).catch(error => {
      console.info('usb ' + caseName + ' controlTransfer error : ' + JSON.stringify(error));
      console.info('usb' + caseName + ':  FAILED');
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  }

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0100
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, GetDescriptor: cmd 6 target 2 reqType 128 value 512 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0100', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0100 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(6, usbManager.USB_REQUEST_TARGET_DEVICE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_DEVICE & 0x1f), (2 << 8), 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0100 GetDescriptor');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0200
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, GetStatus: cmd 0 target 0 reqType 128 value 0 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0200', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(0, usbManager.USB_REQUEST_TARGET_DEVICE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
    await callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_HostManager_JS_TranFunc_0200 GetStatus');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0100
   * @tc.name: controlTransfer
   * @tc.desc: Test the bulkTransfer interface
   * Undefined option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0100', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0100 begin');
    if (portCurrentMode == 1) {
      console.info('usb case HostManager_JS_TranCompatibility_0100 get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var controlParam = getTransferParam(0, usbManager.USB_REQUEST_TARGET_DEVICE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
    await callControlTransfer(testParam.pip, controlParam, undefined,
      'SUB_USB_HostManager_JS_TranCompatibility_0100 GetStatus');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0200
   * @tc.name: controlTransfer
   * @tc.desc: Test the bulkTransfer interface
   * Null option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0200', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case HostManager_JS_TranCompatibility_0200 get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var controlParam = getTransferParam(0, usbManager.USB_REQUEST_TARGET_DEVICE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
    await callControlTransfer(testParam.pip, controlParam, null,
      'SUB_USB_HostManager_JS_TranCompatibility_0200 GetStatus');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranCompatibility_0300
   * @tc.name: controlTransfer
   * @tc.desc: Test the bulkTransfer interface
   * Ignore option arguments, use default options.
   */
  it('SUB_USB_HostManager_JS_TranCompatibility_0300', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranCompatibility_0300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case HostManager_JS_TranCompatibility_0300 get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var controlParam = getTransferParam(0, usbManager.USB_REQUEST_TARGET_DEVICE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
    await usbManager.controlTransfer(testParam.pip, controlParam).then(data => {
      console.info('usb controlTransfer ret data : ' + data + ' '
        + 'HostManager_JS_TranCompatibility_0300 GetStatus');
      console.info('usb controlTransfer controlParam.data buffer : '
        + controlParam.data + ' ' + 'HostManager_JS_TranCompatibility_0300 GetStatus');
      expect(data >= 0).assertTrue();
      console.info('usb' + 'SUB_USB_HostManager_JS_TranCompatibility_0300 GetStatus' + ':  PASS');
    }).catch(error => {
      console.info('usb HostManager_JS_TranCompatibility_0300 controlTransfer error : ' + JSON.stringify(error));
      console.info('usb' + 'SUB_USB_HostManager_JS_TranCompatibility_0300 GetStatus' + ':  FAILED');
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0300
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, GetConfiguration: cmd 8 target 0 reqType 128 value 0 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0300', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(8, usbManager.USB_REQUEST_TARGET_DEVICE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0300 GetConfiguration');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0400
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, GetInterface: cmd 10 target 0 reqType 129 value 0 index 1
   */
  it('SUB_USB_HostManager_JS_TranFunc_0400', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0400 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(10, usbManager.USB_REQUEST_TARGET_INTERFACE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_INTERFACE & 0x1f), 0, 1);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0400 GetInterface');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0500
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, ClearFeature: cmd 1 target 0 reqType 0 value 0 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0500', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0500 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(1, usbManager.USB_REQUEST_TARGET_DEVICE,
      (usbManager.USB_REQUEST_DIR_TO_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0500 ClearFeature');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0600
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, ClearFeature: cmd 255 target 1 reqType 129 value 512 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0600', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0600 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usbManager.USB_REQUEST_TARGET_INTERFACE,
      (usbManager.USB_REQUEST_DIR_FROM_DEVICE) | (usbManager.USB_REQUEST_TYPE_STANDARD << 5)
      | (usbManager.USB_REQUEST_TARGET_INTERFACE & 0x1f), (2 << 8), 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0600 ClearFeature');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0700
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, ClearFeature: cmd 255 target 2 reqType 34 value 512 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0700', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0700 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usbManager.USB_REQUEST_TARGET_ENDPOINT,
      (usbManager.USB_REQUEST_DIR_TO_DEVICE) | (usbManager.USB_REQUEST_TYPE_CLASS << 5)
      | (usbManager.USB_REQUEST_TARGET_ENDPOINT & 0x1f), (2 << 8), 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0700 ClearFeature');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0800
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, ClearFeature: cmd 255 target 3 reqType 67 value 512 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0800', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0800 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usbManager.USB_REQUEST_TARGET_OTHER,
      (usbManager.USB_REQUEST_DIR_TO_DEVICE) | (usbManager.USB_REQUEST_TYPE_VENDOR << 5)
      | (usbManager.USB_REQUEST_TARGET_OTHER & 0x1f), (2 << 8), 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0800 ClearFeature');
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_TranFunc_0900
   * @tc.name: controlTransfer
   * @tc.desc: Positive test: control transfer, ClearFeature: cmd 255 target 3 reqType 35 value 0 index 0
   */
  it('SUB_USB_HostManager_JS_TranFunc_0900', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_TranFunc_0900 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usbManager.USB_REQUEST_TARGET_OTHER,
      (usbManager.USB_REQUEST_DIR_TO_DEVICE) | (usbManager.USB_REQUEST_TYPE_CLASS << 5)
      | (usbManager.USB_REQUEST_TARGET_OTHER & 0x1f), 0, 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_TranFunc_0900 ClearFeature');
  })

  async function callControlTransferEx(pip, controlParam, timeout, caseName) {
    await usbManager.controlTransfer(pip, controlParam, timeout).then(data => {
      console.info('usb controlTransfer ret data : ' + data + ' ' + caseName);
      expect(false).assertTrue();
      console.info('usb' + caseName + ':  FAILED');
    }).catch(error => {
      console.info('usb controlTransfer error : ' + JSON.stringify(error));
      console.info('usb' + caseName + ':  FAILED');
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  }

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_1300
   * @tc.name: controlTransfer
   * @tc.desc: Negative test: control transfer, parameter number exception, input a parameter
   */
  it('SUB_USB_HostManager_JS_ErrCode_1300', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_1300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }
    try {
      await usbManager.controlTransfer("invalid").then(data => {
        console.info('usb HostManager_JS_ErrCode_1300 case controlTransfer ret data : ' + data);
        expect(false).assertTrue();
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_1300 case controlTransfer error : ' + JSON.stringify(error));
        expect(false).assertTrue();
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_1300 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_1300 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2300
   * @tc.name: controlTransfer
   * @tc.desc: Negative test: control transfer, parameter number exception, necessary parameters not input
   */
  it('SUB_USB_HostManager_JS_ErrCode_2300', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2300 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }
    try {
      await usbManager.controlTransfer().then(data => {
        console.info('usb HostManager_JS_ErrCode_2300 case controlTransfer ret data : ' + data);
        expect(false).assertTrue();
      }).catch(error => {
        console.info('usb HostManager_JS_ErrCode_2300 case controlTransfer error : ' + JSON.stringify(error));
        expect(false).assertTrue();
      });
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_2300 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_2300 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_3200
   * @tc.name: controlTransfer
   * @tc.desc: Negative test: control transfer, parameter pipe type error
   */
  it('SUB_USB_HostManager_JS_ErrCode_3200', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_3200 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }
    var testParamPip = "invalid";
    var timeout = 5000;
    var controlParam = getTransferParam(255, usbManager.USB_REQUEST_TARGET_OTHER,
      (usbManager.USB_REQUEST_DIR_TO_DEVICE) | (usbManager.USB_REQUEST_TYPE_CLASS << 5)
      | (usbManager.USB_REQUEST_TARGET_OTHER & 0x1f), 0, 0);
    try {
      await callControlTransferEx(testParamPip, controlParam, timeout,
        'SUB_USB_HostManager_JS_ErrCode_3200 ClearFeature');
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_3200 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_3200 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_4400
   * @tc.name: controlTransfer
   * @tc.desc: Negative test: control transfer,
   * parameter contrlparam type error(The controlParam should have the data property)
   */
  it('SUB_USB_HostManager_JS_ErrCode_4400', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_4400 begin');
    if (portCurrentMode == 1) {
      console.info('usb HostManager_JS_ErrCode_4400 case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }
    var controlParam = "invalid";
    var timeout = 5000;
    try {
      await callControlTransferEx(testParam.pip, controlParam, timeout,
        'SUB_USB_HostManager_JS_ErrCode_4400 ClearFeature');
    } catch (err) {
      console.info('usb HostManager_JS_ErrCode_4400 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_HostManager_JS_ErrCode_4400 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_HostManager_JS_ErrCode_2900
   * @tc.name: controlTransfer
   * @tc.desc: Negative test: control transfer, parameter timeout type error, use default options.
   */
  it('SUB_USB_HostManager_JS_ErrCode_2900', 0, async function () {
    console.info('usb SUB_USB_HostManager_JS_ErrCode_2900 begin');
    if (portCurrentMode == 1) {
      console.info('usb 1570 case get_device port is device');
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam();
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }
    var timeout = "invalid";
    var controlParam = getTransferParam(255, usbManager.USB_REQUEST_TARGET_OTHER,
      (usbManager.USB_REQUEST_DIR_TO_DEVICE) | (usbManager.USB_REQUEST_TYPE_CLASS << 5)
      | (usbManager.USB_REQUEST_TARGET_OTHER & 0x1f), 0, 0);
    await callControlTransfer(testParam.pip, controlParam, timeout,
      'SUB_USB_HostManager_JS_ErrCode_2900 ClearFeature');
  })
})
}
