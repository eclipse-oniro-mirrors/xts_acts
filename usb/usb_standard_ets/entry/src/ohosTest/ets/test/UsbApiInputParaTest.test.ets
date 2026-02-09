/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

const TAG = "[UsbApiInputParaTest]";

let USBDeviceFeature:usbMgr.USBDevice;
let USBDeviceFeature1:usbMgr.USBDevice;
let USBDeviceFeature2:usbMgr.USBDevice;
let USBDeviceFeature3:usbMgr.USBDevice;
let USBDeviceFeature4:usbMgr.USBDevice;
let USBConfigurationFeature:usbMgr.USBConfiguration;
let USBConfigurationFeature1:usbMgr.USBConfiguration;
let USBConfigurationFeature2:usbMgr.USBConfiguration;
let USBConfigurationFeature3:usbMgr.USBConfiguration;
let USBInterfaceFeature:usbMgr.USBInterface;
let USBInterfaceFeature1:usbMgr.USBInterface;
let USBInterfaceFeature2:usbMgr.USBInterface;
let USBEndpointFeature:usbMgr.USBEndpoint;
let USBEndpointFeature1:usbMgr.USBEndpoint;

USBDeviceFeature = {
  busNum: 2,
  devAddress: 3,
  serial: '',
  name: '',
  manufacturerName: '',
  productName: '',
  version: '',
  vendorId: 0,
  productId: 0,
  clazz: 0,
  subClass: 0,
  protocol: 0,
  configs: [],
}

USBConfigurationFeature = {
  id: 2,
  attributes: 3,
  maxPower: 0,
  name: '',
  isRemoteWakeup: true,
  isSelfPowered: true,
  interfaces: [],
}

USBInterfaceFeature = {
  id: 2,
  protocol: 3,
  clazz: 0,
  subClass: 0,
  alternateSetting: 0,
  name: '',
  endpoints: [],
}

USBEndpointFeature = {
  address: 2,
  attributes: 3,
  interval: 0,
  maxPacketSize: 0,
  direction: usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE,
  number: 0,
  type: 0,
  interfaceId: 0,
}

USBEndpointFeature1 = {
  address: 2,
  attributes: 3,
  interval: 0,
  maxPacketSize: 0,
  direction: usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE,
  number: 0,
  type: 0,
  interfaceId: 0,
}

USBInterfaceFeature1 = {
  id: 2,
  protocol: 3,
  clazz: 0,
  subClass: 0,
  alternateSetting: 0,
  name: '',
  endpoints: [USBEndpointFeature],
}

USBInterfaceFeature2 = {
  id: 2,
  protocol: 3,
  clazz: 0,
  subClass: 0,
  alternateSetting: 0,
  name: '',
  endpoints: [USBEndpointFeature1],
}

USBConfigurationFeature1 = {
  id: 2,
  attributes: 3,
  maxPower: 0,
  name: '',
  isRemoteWakeup: false,
  isSelfPowered: false,
  interfaces: [USBInterfaceFeature],
}

USBConfigurationFeature2 = {
  id: 2,
  attributes: 3,
  maxPower: 0,
  name: '',
  isRemoteWakeup: false,
  isSelfPowered: false,
  interfaces: [USBInterfaceFeature1],
}

USBConfigurationFeature3 = {
  id: 2,
  attributes: 3,
  maxPower: 0,
  name: '',
  isRemoteWakeup: false,
  isSelfPowered: false,
  interfaces: [USBInterfaceFeature2],
}

USBDeviceFeature1 = {
  busNum: 2,
  devAddress: 3,
  serial: '',
  name: '',
  manufacturerName: '',
  productName: '',
  version: '',
  vendorId: 0,
  productId: 0,
  clazz: 0,
  subClass: 0,
  protocol: 0,
  configs: [USBConfigurationFeature],
}

USBDeviceFeature2 = {
  busNum: 2,
  devAddress: 3,
  serial: '',
  name: '',
  manufacturerName: '',
  productName: '',
  version: '',
  vendorId: 0,
  productId: 0,
  clazz: 0,
  subClass: 0,
  protocol: 0,
  configs: [USBConfigurationFeature1],
}

USBDeviceFeature3 = {
  busNum: 2,
  devAddress: 3,
  serial: '',
  name: '',
  manufacturerName: '',
  productName: '',
  version: '',
  vendorId: 0,
  productId: 0,
  clazz: 0,
  subClass: 0,
  protocol: 0,
  configs: [USBConfigurationFeature2],
}

USBDeviceFeature4 = {
  busNum: 2,
  devAddress: 3,
  serial: '',
  name: '',
  manufacturerName: '',
  productName: '',
  version: '',
  vendorId: 0,
  productId: 0,
  clazz: 0,
  subClass: 0,
  protocol: 0,
  configs: [USBConfigurationFeature3],
}

export default function UsbApiInputParaTest() {
  describe('UsbApiInputParaTest', () => {

    beforeAll(async () => {
      console.log(TAG, '*************Usb Unit UsbApiInputParaTest Begin*************');
    })

    beforeEach(() =>  {
      console.info(TAG, 'beforeEach: *************Usb Unit Test  Case*************');
    })

    afterEach(() => {
      console.info(TAG, 'afterEach: *************Usb Unit Test  Case*************');
    })

    afterAll(() => {
      console.log(TAG, '*************Usb Unit UsbApiInputParaTest End*************');
    })

    /**
     * @tc.name   testHasRightNoString
     * @tc.number SUB_USB_HostManager_InputPara_0100
     * @tc.desc   hasRight input parameter ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightNoString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasRightNoString begin');
      let ret = usbMgr.hasRight("");
      console.info(TAG, 'usb testHasRightNoString ret: ' + ret);
      expect(ret).assertFalse();
      done();
    })

    /**
     * @tc.name   testHasRightNull
     * @tc.number SUB_USB_HostManager_InputPara_0200
     * @tc.desc   hasRight input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasRightNull begin');
      try {
        let ret = usbMgr.hasRight(null);
        console.info(TAG, 'usb testHasRightNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testHasRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testHasRightUndefined
     * @tc.number SUB_USB_HostManager_InputPara_0300
     * @tc.desc   hasRight input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasRightUndefined begin');
      try {
        let ret = usbMgr.hasRight(undefined);
        console.info(TAG, 'usb testHasRightUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testHasRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testRequestRightNoString
     * @tc.number SUB_USB_HostManager_InputPara_0400
     * @tc.desc   requestRight input parameter ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightNoString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestRightNoString begin');
      let ret = await usbMgr.requestRight("");
      console.info(TAG, 'usb testRequestRightNoString ret: ' + ret);
      expect(ret).assertFalse();
      done();
    })

    /**
     * @tc.name   testRequestRightNull
     * @tc.number SUB_USB_HostManager_InputPara_0500
     * @tc.desc   requestRight input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestRightNull begin');
      try {
        let ret = await usbMgr.requestRight(null);
        console.info(TAG, 'usb testRequestRightNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testRequestRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testRequestRightUndefined
     * @tc.number SUB_USB_HostManager_InputPara_0600
     * @tc.desc   requestRight input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestRightUndefined begin');
      try {
        let ret = await usbMgr.requestRight(undefined);
        console.info(TAG, 'usb testRequestRightUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testRequestRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testClosePipeNull
     * @tc.number SUB_USB_HostManager_InputPara_0700
     * @tc.desc   closePipe input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClosePipeNull begin');
      try {
        let ret = usbMgr.closePipe(null);
        console.info(TAG, 'usb testClosePipeNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testClosePipeNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testClosePipeUndefined
     * @tc.number SUB_USB_HostManager_InputPara_0800
     * @tc.desc   closePipe input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClosePipeUndefined begin');
      try {
        let ret = usbMgr.closePipe(undefined);
        console.info(TAG, 'usb testClosePipeUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testClosePipeUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testGetRawDescriptorNull
     * @tc.number SUB_USB_HostManager_InputPara_0900
     * @tc.desc   getRawDescriptor input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetRawDescriptorNull begin');
      try {
        let ret = usbMgr.getRawDescriptor(null);
        console.info(TAG, 'usb testGetRawDescriptorNull ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testGetRawDescriptorNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testGetRawDescriptorUndefined
     * @tc.number SUB_USB_HostManager_InputPara_1000
     * @tc.desc   getRawDescriptor input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetRawDescriptorUndefined begin');
      try {
        let ret = usbMgr.getRawDescriptor(undefined);
        console.info(TAG, 'usb testGetRawDescriptorUndefined ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testGetRawDescriptorUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testGetFileDescriptorNull
     * @tc.number SUB_USB_HostManager_InputPara_1100
     * @tc.desc   getFileDescriptor input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetFileDescriptorNull begin');
      try {
        let ret = usbMgr.getFileDescriptor(null);
        console.info(TAG, 'usb testGetFileDescriptorNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testGetFileDescriptorNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testGetFileDescriptorUndefined
     * @tc.number SUB_USB_HostManager_InputPara_1200
     * @tc.desc   getFileDescriptor input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetFileDescriptorUndefined begin');
      try {
        let ret = usbMgr.getFileDescriptor(undefined);
        console.info(TAG, 'usb testGetFileDescriptorUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testGetFileDescriptorUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceNull
     * @tc.number SUB_USB_HostManager_InputPara_1300
     * @tc.desc   connectDevice input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceNull begin');
      try {
        let ret = usbMgr.connectDevice(null);
        console.info(TAG, 'usb testConnectDeviceNull ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceUndefined
     * @tc.number SUB_USB_HostManager_InputPara_1400
     * @tc.desc   connectDevice input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceUndefined begin');
      try {
        let ret = usbMgr.connectDevice(undefined);
        console.info(TAG, 'usb testConnectDeviceUndefined ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testClaimInterfaceNull
     * @tc.number SUB_USB_HostManager_InputPara_1500
     * @tc.desc   claimInterface input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceNull begin');
      try {
        let ret = usbMgr.claimInterface(null, null, false);
        console.info(TAG, 'usb testClaimInterfaceNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testClaimInterfaceNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testClaimInterfaceUndefined
     * @tc.number SUB_USB_HostManager_InputPara_1600
     * @tc.desc   claimInterface input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceUndefined begin');
      try {
        let ret = usbMgr.claimInterface(undefined, undefined, false);
        console.info(TAG, 'usb testClaimInterfaceUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testClaimInterfaceUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterfaceNull
     * @tc.number SUB_USB_HostManager_InputPara_1700
     * @tc.desc   releaseInterface input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceNull begin');
      try {
        let ret = usbMgr.releaseInterface(null, null);
        console.info(TAG, 'usb testReleaseInterfaceNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReleaseInterfaceNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterfaceUndefined
     * @tc.number SUB_USB_HostManager_InputPara_1800
     * @tc.desc   releaseInterface input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceUndefined begin');
      try {
        let ret = usbMgr.releaseInterface(undefined, undefined);
        console.info(TAG, 'usb testReleaseInterfaceUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReleaseInterfaceUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetConfigurationNull
     * @tc.number SUB_USB_HostManager_InputPara_1900
     * @tc.desc   setConfiguration input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationNull begin');
      try {
        let ret = usbMgr.setConfiguration(null, null);
        console.info(TAG, 'usb testSetConfigurationNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetConfigurationNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetConfigurationUndefined
     * @tc.number SUB_USB_HostManager_InputPara_2000
     * @tc.desc   setConfiguration input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationUndefined begin');
      try {
        let ret = usbMgr.setConfiguration(undefined, undefined);
        console.info(TAG, 'usb testSetConfigurationUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetConfigurationUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetInterfaceNull
     * @tc.number SUB_USB_HostManager_InputPara_2100
     * @tc.desc   setInterface input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceNull begin');
      try {
        let ret = usbMgr.setInterface(null, null);
        console.info(TAG, 'usb testSetInterfaceNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetInterfaceNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetInterfaceUndefined
     * @tc.number SUB_USB_HostManager_InputPara_2200
     * @tc.desc   setInterface input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceUndefined begin');
      try {
        let ret = usbMgr.setInterface(undefined, undefined);
        console.info(TAG, 'usb testSetInterfaceUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetInterfaceUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testControlTransferNull
     * @tc.number SUB_USB_HostManager_InputPara_2300
     * @tc.desc   controlTransfer input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testControlTransferNull begin');
      try {
        let ret = usbMgr.controlTransfer(null, null, null);
        console.info(TAG, 'usb testControlTransferNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testControlTransferNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testControlTransferUndefined
     * @tc.number SUB_USB_HostManager_InputPara_2400
     * @tc.desc   controlTransfer input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransferUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testControlTransferUndefined begin');
      try {
        let ret = usbMgr.controlTransfer(undefined, undefined, undefined);
        console.info(TAG, 'usb testControlTransferUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testControlTransferUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testBulkTransferNull
     * @tc.number SUB_USB_HostManager_InputPara_2500
     * @tc.desc   bulkTransfer input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testBulkTransferNull begin');
      try {
        let ret = usbMgr.bulkTransfer(null, null, null);
        console.info(TAG, 'usb testBulkTransferNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testBulkTransferNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testBulkTransferUndefined
     * @tc.number SUB_USB_HostManager_InputPara_2600
     * @tc.desc   bulkTransfer input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testBulkTransferUndefined begin');
      try {
        let ret = usbMgr.bulkTransfer(undefined, undefined, undefined);
        console.info(TAG, 'usb testBulkTransferUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testBulkTransferUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testUsbControlTransferNull
     * @tc.number SUB_USB_HostManager_InputPara_2700
     * @tc.desc   usbControlTransfer input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbControlTransferNull begin');
      try {
        let ret = usbMgr.usbControlTransfer(null, null, null);
        console.info(TAG, 'usb testUsbControlTransferNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbControlTransferNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testUsbControlTransferUndefined
     * @tc.number SUB_USB_HostManager_InputPara_2800
     * @tc.desc   usbControlTransfer input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbControlTransferUndefined begin');
      try {
        let ret = usbMgr.usbControlTransfer(undefined, undefined, undefined);
        console.info(TAG, 'usb testUsbControlTransferUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbControlTransferUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testHasAccessoryRightNull
     * @tc.number SUB_USB_HostManager_InputPara_2900
     * @tc.desc   hasAccessoryRight input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasAccessoryRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasAccessoryRightNull begin');
      try {
        let ret = usbMgr.hasAccessoryRight(null);
        console.info(TAG, 'usb testHasAccessoryRightNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testHasAccessoryRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testHasAccessoryRightUndefined
     * @tc.number SUB_USB_HostManager_InputPara_3000
     * @tc.desc   hasAccessoryRight input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasAccessoryRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasAccessoryRightUndefined begin');
      try {
        let ret = usbMgr.hasAccessoryRight(undefined);
        console.info(TAG, 'usb testHasAccessoryRightUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testHasAccessoryRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testRequestAccessoryRightNull
     * @tc.number SUB_USB_HostManager_InputPara_3100
     * @tc.desc   requestAccessoryRight input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestAccessoryRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestAccessoryRightNull begin');
      try {
        let ret = usbMgr.requestAccessoryRight(null);
        console.info(TAG, 'usb testRequestAccessoryRightNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testRequestAccessoryRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testRequestAccessoryRightUndefined
     * @tc.number SUB_USB_HostManager_InputPara_3200
     * @tc.desc   requestAccessoryRight input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestAccessoryRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestAccessoryRightUndefined begin');
      try {
        let ret = usbMgr.requestAccessoryRight(undefined);
        console.info(TAG, 'usb testRequestAccessoryRightUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testRequestAccessoryRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testCancelAccessoryRightNull
     * @tc.number SUB_USB_HostManager_InputPara_3300
     * @tc.desc   cancelAccessoryRight input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelAccessoryRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testCancelAccessoryRightNull begin');
      try {
        usbMgr.cancelAccessoryRight(null);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCancelAccessoryRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testCancelAccessoryRightUndefined
     * @tc.number SUB_USB_HostManager_InputPara_3400
     * @tc.desc   cancelAccessoryRight input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelAccessoryRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testCancelAccessoryRightUndefined begin');
      try {
        usbMgr.cancelAccessoryRight(undefined);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCancelAccessoryRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testOpenAccessoryNull
     * @tc.number SUB_USB_HostManager_InputPara_3500
     * @tc.desc   openAccessory input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpenAccessoryNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testOpenAccessoryNull begin');
      try {
        let ret = usbMgr.openAccessory(null);
        console.info(TAG, 'usb testOpenAccessoryNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testOpenAccessoryNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testOpenAccessoryUndefined
     * @tc.number SUB_USB_HostManager_InputPara_3600
     * @tc.desc   openAccessory input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpenAccessoryUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testOpenAccessoryUndefined begin');
      try {
        let ret = usbMgr.openAccessory(undefined);
        console.info(TAG, 'usb testOpenAccessoryUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testOpenAccessoryUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testCloseAccessoryNull
     * @tc.number SUB_USB_HostManager_InputPara_3700
     * @tc.desc   closeAccessory input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCloseAccessoryNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testCloseAccessoryNull begin');
      try {
        usbMgr.closeAccessory(null);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCloseAccessoryNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testCloseAccessoryUndefined
     * @tc.number SUB_USB_HostManager_InputPara_3800
     * @tc.desc   closeAccessory input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCloseAccessoryUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testCloseAccessoryUndefined begin');
      try {
        usbMgr.closeAccessory(undefined);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCloseAccessoryUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testUsbSubmitTransferNull
     * @tc.number SUB_USB_HostManager_InputPara_3900
     * @tc.desc   usbSubmitTransfer input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbSubmitTransferNull begin');
      try {
        usbMgr.usbSubmitTransfer(null);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbSubmitTransferNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testUsbSubmitTransferUndefined
     * @tc.number SUB_USB_HostManager_InputPara_4000
     * @tc.desc   usbSubmitTransfer input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransferUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbSubmitTransferUndefined begin');
      try {
        usbMgr.usbSubmitTransfer(undefined);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbSubmitTransferUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testUsbCancelTransferNull
     * @tc.number SUB_USB_HostManager_InputPara_4100
     * @tc.desc   usbCancelTransfer input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbCancelTransferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbCancelTransferNull begin');
      try {
        usbMgr.usbCancelTransfer(null);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbCancelTransferNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testUsbCancelTransferUndefined
     * @tc.number SUB_USB_HostManager_InputPara_4200
     * @tc.desc   usbCancelTransfer input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbCancelTransferUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbCancelTransferUndefined begin');
      try {
        usbMgr.usbCancelTransfer(undefined);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbCancelTransferUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testResetUsbDeviceNull
     * @tc.number SUB_USB_HostManager_InputPara_4300
     * @tc.desc   resetUsbDevice input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testResetUsbDeviceNull begin');
      try {
        let ret = usbMgr.resetUsbDevice(null);
        console.info(TAG, 'usb testResetUsbDeviceNull ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testResetUsbDeviceNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testResetUsbDeviceUndefined
     * @tc.number SUB_USB_HostManager_InputPara_4400
     * @tc.desc   resetUsbDevice input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testResetUsbDeviceUndefined begin');
      try {
        let ret = usbMgr.resetUsbDevice(undefined);
        console.info(TAG, 'usb testResetUsbDeviceUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testResetUsbDeviceUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInputPara
     * @tc.number SUB_USB_HostManager_InputPara_4500
     * @tc.desc   connectDevice input parameter USBDeviceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara USBDeviceFeature: ' + JSON.stringify(USBDeviceFeature));
        let ret = usbMgr.connectDevice(USBDeviceFeature);
        console.info(TAG, 'usb testConnectDeviceInputPara ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceInputPara fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInputPara001
     * @tc.number SUB_USB_HostManager_InputPara_4600
     * @tc.desc   connectDevice input parameter USBDeviceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara001 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara001 USBDeviceFeature1: ' + JSON.stringify(USBDeviceFeature1));
        let ret = usbMgr.connectDevice(USBDeviceFeature1);
        console.info(TAG, 'usb testConnectDeviceInputPara001 ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceInputPara001 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInputPara002
     * @tc.number SUB_USB_HostManager_InputPara_4700
     * @tc.desc   connectDevice input parameter USBDeviceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara002 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara002 USBDeviceFeature2: ' + JSON.stringify(USBDeviceFeature2));
        let ret = usbMgr.connectDevice(USBDeviceFeature2);
        console.info(TAG, 'usb testConnectDeviceInputPara002 ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceInputPara002 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInputPara003
     * @tc.number SUB_USB_HostManager_InputPara_4800
     * @tc.desc   connectDevice input parameter USBDeviceFeature3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara003 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara003 USBDeviceFeature3: ' + JSON.stringify(USBDeviceFeature3));
        let ret = usbMgr.connectDevice(USBDeviceFeature3);
        console.info(TAG, 'usb testConnectDeviceInputPara003 ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceInputPara003 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInputPara004
     * @tc.number SUB_USB_HostManager_InputPara_4900
     * @tc.desc   connectDevice input parameter USBDeviceFeature4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara004 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara004 USBDeviceFeature4: ' + JSON.stringify(USBDeviceFeature4));
        let ret = usbMgr.connectDevice(USBDeviceFeature4);
        console.info(TAG, 'usb testConnectDeviceInputPara004 ret: ' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testConnectDeviceInputPara004 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testClaimInterfaceInputPara
     * @tc.number SUB_USB_HostManager_InputPara_5000
     * @tc.desc   claimInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceInputPara begin');
      try {
        console.info(TAG, 'usb testClaimInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
        let ret = usbMgr.claimInterface(null,USBInterfaceFeature);
        console.info(TAG, 'usb testClaimInterfaceInputPara ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testClaimInterfaceInputPara fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testClaimInterfaceInputPara001
     * @tc.number SUB_USB_HostManager_InputPara_5100
     * @tc.desc   claimInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceInputPara001 begin');
      try {
        console.info(TAG, 'usb testClaimInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
        let ret = usbMgr.claimInterface(null,USBInterfaceFeature1);
        console.info(TAG, 'usb testClaimInterfaceInputPara001 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testClaimInterfaceInputPara001 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testClaimInterfaceInputPara002
     * @tc.number SUB_USB_HostManager_InputPara_5200
     * @tc.desc   claimInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceInputPara002 begin');
      try {
        console.info(TAG, 'usb testClaimInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
        let ret = usbMgr.claimInterface(null,USBInterfaceFeature2);
        console.info(TAG, 'usb testClaimInterfaceInputPara002 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testClaimInterfaceInputPara002 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterfaceInputPara
     * @tc.number SUB_USB_HostManager_InputPara_5300
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceInputPara begin');
      try {
        console.info(TAG, 'usb testReleaseInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
        let ret = usbMgr.releaseInterface(null,USBInterfaceFeature);
        console.info(TAG, 'usb testReleaseInterfaceInputPara ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReleaseInterfaceInputPara fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterfaceInputPara001
     * @tc.number SUB_USB_HostManager_InputPara_5400
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceInputPara001 begin');
      try {
        console.info(TAG, 'usb testReleaseInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
        let ret = usbMgr.releaseInterface(null,USBInterfaceFeature1);
        console.info(TAG, 'usb testReleaseInterfaceInputPara001 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReleaseInterfaceInputPara001 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterfaceInputPara002
     * @tc.number SUB_USB_HostManager_InputPara_5500
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceInputPara002 begin');
      try {
        console.info(TAG, 'usb testReleaseInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
        let ret = usbMgr.releaseInterface(null,USBInterfaceFeature2);
        console.info(TAG, 'usb testReleaseInterfaceInputPara002 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReleaseInterfaceInputPara002 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetConfigurationInputPara
     * @tc.number SUB_USB_HostManager_InputPara_5600
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara USBConfigurationFeature: ' + JSON.stringify(USBConfigurationFeature));
        let ret = usbMgr.setConfiguration(null,USBConfigurationFeature);
        console.info(TAG, 'usb testSetConfigurationInputPara ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetConfigurationInputPara fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetConfigurationInputPara001
     * @tc.number SUB_USB_HostManager_InputPara_5700
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara001 begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara001 USBConfigurationFeature1: ' + JSON.stringify(USBConfigurationFeature1));
        let ret = usbMgr.setConfiguration(null,USBConfigurationFeature1);
        console.info(TAG, 'usb testSetConfigurationInputPara001 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetConfigurationInputPara001 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetConfigurationInputPara002
     * @tc.number SUB_USB_HostManager_InputPara_5800
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara002 begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara002 USBConfigurationFeature2: ' + JSON.stringify(USBConfigurationFeature2));
        let ret = usbMgr.setConfiguration(null,USBConfigurationFeature2);
        console.info(TAG, 'usb testSetConfigurationInputPara002 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetConfigurationInputPara002 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetConfigurationInputPara003
     * @tc.number SUB_USB_HostManager_InputPara_5900
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara003 begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara003 USBConfigurationFeature3: ' + JSON.stringify(USBConfigurationFeature3));
        let ret = usbMgr.setConfiguration(null,USBConfigurationFeature3);
        console.info(TAG, 'usb testSetConfigurationInputPara003 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetConfigurationInputPara003 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetInterfaceInputPara
     * @tc.number SUB_USB_HostManager_InputPara_6000
     * @tc.desc   setInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceInputPara begin');
      try {
        console.info(TAG, 'usb testSetInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
        let ret = usbMgr.setInterface(null,USBInterfaceFeature);
        console.info(TAG, 'usb testSetInterfaceInputPara ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetInterfaceInputPara fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetInterfaceInputPara001
     * @tc.number SUB_USB_HostManager_InputPara_6100
     * @tc.desc   setInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceInputPara001 begin');
      try {
        console.info(TAG, 'usb testSetInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
        let ret = usbMgr.setInterface(null,USBInterfaceFeature1);
        console.info(TAG, 'usb testSetInterfaceInputPara001 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetInterfaceInputPara001 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetInterfaceInputPara002
     * @tc.number SUB_USB_HostManager_InputPara_6200
     * @tc.desc   setInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceInputPara002 begin');
      try {
        console.info(TAG, 'usb testSetInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
        let ret = usbMgr.setInterface(null,USBInterfaceFeature2);
        console.info(TAG, 'usb testSetInterfaceInputPara002 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetInterfaceInputPara002 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testUsbTransferInputPara
     * @tc.number SUB_USB_HostManager_InputPara_6300
     * @tc.desc   usbControlTransfer input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbTransferInputPara begin');
      try {
        let pip: usbMgr.USBDevicePipe = {
          devAddress: 1,
          busNum: 2,
        };
        let transferParams: usbMgr.UsbDataTransferParams = {
          devPipe: pip,
          flags: usbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK,
          endpoint: 1,
          type: usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK,
          timeout: 2000,
          length: 10,
          callback: () => {},
          userData: new Uint8Array(10),
          buffer: new Uint8Array(10),
          isoPacketCount: 0,
        };
        usbMgr.usbSubmitTransfer(transferParams);
        usbMgr.usbCancelTransfer(transferParams);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbTransferInputPara fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testUsbTransferInputPara001
     * @tc.number SUB_USB_HostManager_InputPara_6400
     * @tc.desc   usbSubmitTransfer/usbCancelTransfer input parameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbTransferInputPara001 begin');
      try {
        let pip: usbMgr.USBDevicePipe = {
          devAddress: 1,
          busNum: 2,
        };
        let transferParams: usbMgr.UsbDataTransferParams = {
          devPipe: pip,
          flags: usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER,
          endpoint: 1,
          type: usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT,
          timeout: 2000,
          length: 10,
          callback: () => {},
          userData: new Uint8Array(10),
          buffer: new Uint8Array(10),
          isoPacketCount: 1,
        };
        usbMgr.usbSubmitTransfer(transferParams);
        usbMgr.usbCancelTransfer(transferParams);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbTransferInputPara001 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testUsbTransferInputPara002
     * @tc.number SUB_USB_HostManager_InputPara_6500
     * @tc.desc   usbSubmitTransfer/usbCancelTransfer input parameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbTransferInputPara002 begin');
      try {
        let pip: usbMgr.USBDevicePipe = {
          devAddress: 1,
          busNum: 2,
        };
        let transferParams: usbMgr.UsbDataTransferParams = {
          devPipe: pip,
          flags: usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET,
          endpoint: 1,
          type: usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS,
          timeout: 2000,
          length: 10,
          callback: () => {},
          userData: new Uint8Array(10),
          buffer: new Uint8Array(10),
          isoPacketCount: 2,
        };
        usbMgr.usbSubmitTransfer(transferParams);
        usbMgr.usbCancelTransfer(transferParams);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbTransferInputPara002 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testUsbTransferInputPara003
     * @tc.number SUB_USB_HostManager_InputPara_6600
     * @tc.desc   usbSubmitTransfer/usbCancelTransfer input parameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testUsbTransferInputPara003 begin');
      try {
        let pip: usbMgr.USBDevicePipe = {
          devAddress: 1,
          busNum: 2,
        };
        let transferParams: usbMgr.UsbDataTransferParams = {
          devPipe: pip,
          flags: usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_TRANSFER,
          endpoint: 1,
          type: usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK,
          timeout: 2000,
          length: 10,
          callback: () => {},
          userData: new Uint8Array(10),
          buffer: new Uint8Array(10),
          isoPacketCount: 1,
        };
        usbMgr.usbSubmitTransfer(transferParams);
        usbMgr.usbCancelTransfer(transferParams);
        done();
      } catch (err) {
        console.info(TAG, 'usb testUsbTransferInputPara003 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(14400001);
        done();
      }
    })
  })
}
