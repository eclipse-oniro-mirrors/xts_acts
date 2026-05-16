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

import usb from '@ohos.usb';
import { BusinessError } from '@ohos.base'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

const TAG = "[UsbApiDeprecatedAddEtsTest]";

let USBDeviceFeature:usb.USBDevice;
let USBDeviceFeature1:usb.USBDevice;
let USBDeviceFeature2:usb.USBDevice;
let USBDeviceFeature3:usb.USBDevice;
let USBDeviceFeature4:usb.USBDevice;
let USBConfigFeature:usb.USBConfig;
let USBConfigFeature1:usb.USBConfig;
let USBConfigFeature2:usb.USBConfig;
let USBConfigFeature3:usb.USBConfig;
let USBInterfaceFeature:usb.USBInterface;
let USBInterfaceFeature1:usb.USBInterface;
let USBInterfaceFeature2:usb.USBInterface;
let USBEndpointFeature:usb.USBEndpoint;
let USBEndpointFeature1:usb.USBEndpoint;

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

USBConfigFeature = {
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
  direction: usb.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE,
  number: 0,
  type: 0,
  interfaceId: 0,
}

USBEndpointFeature1 = {
  address: 2,
  attributes: 3,
  interval: 0,
  maxPacketSize: 0,
  direction: usb.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE,
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

USBConfigFeature1 = {
  id: 2,
  attributes: 3,
  maxPower: 0,
  name: '',
  isRemoteWakeup: false,
  isSelfPowered: false,
  interfaces: [USBInterfaceFeature],
}

USBConfigFeature2 = {
  id: 2,
  attributes: 3,
  maxPower: 0,
  name: '',
  isRemoteWakeup: false,
  isSelfPowered: false,
  interfaces: [USBInterfaceFeature1],
}

USBConfigFeature3 = {
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
  configs: [USBConfigFeature],
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
  configs: [USBConfigFeature1],
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
  configs: [USBConfigFeature2],
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
  configs: [USBConfigFeature3],
}

export default function UsbApiDeprecatedAddEtsTest() {
  describe('UsbApiDeprecatedAddEtsTest', () => {
    
    beforeAll(async () => {
      console.log(TAG, '*************Usb Unit UsbApiDeprecatedAddEtsTest Begin*************');
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test  Case*************');
    })

    afterEach(() => {
      console.info(TAG, 'afterEach: *************Usb Unit Test  Case*************');
    })

    afterAll(() => {
      console.log(TAG, '*************Usb Unit UsbApiDeprecatedEtsTest End*************');
    })
    

    /**
     * @tc.name   testHasRightNoString
     * @tc.number SUB_USB_HostManager_UsbFunc_0100
     * @tc.desc   hasRight input parameter ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightNoString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasRightNoString begin');
      let ret = usb.hasRight("");
      console.info(TAG, 'usb testHasRightNoString ret: ' + ret);
      expect(ret).assertFalse();
      done();
    })

    /**
     * @tc.name   testHasRightNull
     * @tc.number SUB_USB_HostManager_UsbFunc_0200
     * @tc.desc   hasRight input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasRightNull begin');
      try {
        let ret = usb.hasRight(null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_0300
     * @tc.desc   hasRight input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testHasRightUndefined begin');
      try {
        let ret = usb.hasRight(undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_0400
     * @tc.desc   requestRight input parameter ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightNoString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestRightNoString begin');
      let ret = await usb.requestRight("");
      console.info(TAG, 'usb testRequestRightNoString ret: ' + ret);
      expect(ret).assertFalse();
      done();
    })

    /**
     * @tc.name   testRequestRightNull
     * @tc.number SUB_USB_HostManager_UsbFunc_0500
     * @tc.desc   requestRight input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestRightNull begin');
      try {
        let ret = await usb.requestRight(null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_0600
     * @tc.desc   requestRight input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testRequestRightUndefined begin');
      try {
        let ret = await usb.requestRight(undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_0700
     * @tc.desc   closePipe input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClosePipeNull begin');
      try {
        let ret = usb.closePipe(null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_0800
     * @tc.desc   closePipe input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClosePipeUndefined begin');
      try {
        let ret = usb.closePipe(undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_0900
     * @tc.desc   getRawDescriptor input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetRawDescriptorNull begin');
      try {
        let ret = usb.getRawDescriptor(null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1000
     * @tc.desc   getRawDescriptor input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetRawDescriptorUndefined begin');
      try {
        let ret = usb.getRawDescriptor(undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1100
     * @tc.desc   getFileDescriptor input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetFileDescriptorNull begin');
      try {
        let ret = usb.getFileDescriptor(null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1200
     * @tc.desc   getFileDescriptor input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testGetFileDescriptorUndefined begin');
      try {
        let ret = usb.getFileDescriptor(undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1300
     * @tc.desc   connectDevice input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceNull begin');
      try {
        let ret = usb.connectDevice(null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1400
     * @tc.desc   connectDevice input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceUndefined begin');
      try {
        let ret = usb.connectDevice(undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1500
     * @tc.desc   claimInterface input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceNull begin');
      try {
        let ret = usb.claimInterface(null, null, false);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1600
     * @tc.desc   claimInterface input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceUndefined begin');
      try {
        let ret = usb.claimInterface(undefined, undefined, false);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1700
     * @tc.desc   releaseInterface input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceNull begin');
      try {
        let ret = usb.releaseInterface(null, null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1800
     * @tc.desc   releaseInterface input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceUndefined begin');
      try {
        let ret = usb.releaseInterface(undefined, undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_1900
     * @tc.desc   setConfiguration input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationNull begin');
      try {
        let ret = usb.setConfiguration(null, null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2000
     * @tc.desc   setConfiguration input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationUndefined begin');
      try {
        let ret = usb.setConfiguration(undefined, undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2100
     * @tc.desc   setInterface input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceNull begin');
      try {
        let ret = usb.setInterface(null, null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2200
     * @tc.desc   setInterface input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceUndefined begin');
      try {
        let ret = usb.setInterface(undefined, undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2300
     * @tc.desc   controlTransfer input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testControlTransferNull begin');
      try {
        let ret = usb.controlTransfer(null, null, null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2400
     * @tc.desc   controlTransfer input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransferUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testControlTransferUndefined begin');
      try {
        let ret = usb.controlTransfer(undefined, undefined, undefined);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2500
     * @tc.desc   bulkTransfer input parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testBulkTransferNull begin');
      try {
        let ret = usb.bulkTransfer(null, null, null);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2600
     * @tc.desc   bulkTransfer input parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testBulkTransferUndefined begin');
      try {
        let ret = usb.bulkTransfer(undefined, undefined, undefined);
        console.info(TAG, 'usb testBulkTransferUndefined ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testBulkTransferUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInputPara
     * @tc.number SUB_USB_HostManager_UsbFunc_2700
     * @tc.desc   connectDevice input parameter USBDeviceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara USBDeviceFeature: ' + JSON.stringify(USBDeviceFeature));
        let ret = usb.connectDevice(USBDeviceFeature);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2800
     * @tc.desc   connectDevice input parameter USBDeviceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara001 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara001 USBDeviceFeature1: ' + JSON.stringify(USBDeviceFeature1));
        let ret = usb.connectDevice(USBDeviceFeature1);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_2900
     * @tc.desc   connectDevice input parameter USBDeviceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara002 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara002 USBDeviceFeature2: ' + JSON.stringify(USBDeviceFeature2));
        let ret = usb.connectDevice(USBDeviceFeature2);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3000
     * @tc.desc   connectDevice input parameter USBDeviceFeature3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara003 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara003 USBDeviceFeature3: ' + JSON.stringify(USBDeviceFeature3));
        let ret = usb.connectDevice(USBDeviceFeature3);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3100
     * @tc.desc   connectDevice input parameter USBDeviceFeature4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testConnectDeviceInputPara004 begin');
      try {
        console.info(TAG, 'usb testConnectDeviceInputPara004 USBDeviceFeature4: ' + JSON.stringify(USBDeviceFeature4));
        let ret = usb.connectDevice(USBDeviceFeature4);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3200
     * @tc.desc   claimInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceInputPara begin');
      try {
        console.info(TAG, 'usb testClaimInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
        let ret = usb.claimInterface(null,USBInterfaceFeature);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3300
     * @tc.desc   claimInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceInputPara001 begin');
      try {
        console.info(TAG, 'usb testClaimInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
        let ret = usb.claimInterface(null,USBInterfaceFeature1);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3400
     * @tc.desc   claimInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testClaimInterfaceInputPara002 begin');
      try {
        console.info(TAG, 'usb testClaimInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
        let ret = usb.claimInterface(null,USBInterfaceFeature2);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3500
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceInputPara begin');
      try {
        console.info(TAG, 'usb testReleaseInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
        let ret = usb.releaseInterface(null,USBInterfaceFeature);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3600
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceInputPara001 begin');
      try {
        console.info(TAG, 'usb testReleaseInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
        let ret = usb.releaseInterface(null,USBInterfaceFeature1);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3700
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testReleaseInterfaceInputPara002 begin');
      try {
        console.info(TAG, 'usb testReleaseInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
        let ret = usb.releaseInterface(null,USBInterfaceFeature2);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3800
     * @tc.desc   setConfiguration input parameter USBConfigFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara USBConfigFeature: ' + JSON.stringify(USBConfigFeature));
        let ret = usb.setConfiguration(null,USBConfigFeature);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_3900
     * @tc.desc   setConfiguration input parameter USBConfigFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara001 begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara001 USBConfigFeature1: ' + JSON.stringify(USBConfigFeature1));
        let ret = usb.setConfiguration(null,USBConfigFeature1);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_4000
     * @tc.desc   setConfiguration input parameter USBConfigFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara002 begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara002 USBConfigFeature2: ' + JSON.stringify(USBConfigFeature2));
        let ret = usb.setConfiguration(null,USBConfigFeature2);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_4100
     * @tc.desc   setConfiguration input parameter USBConfigFeature3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetConfigurationInputPara003 begin');
      try {
        console.info(TAG, 'usb testSetConfigurationInputPara003 USBConfigFeature3: ' + JSON.stringify(USBConfigFeature3));
        let ret = usb.setConfiguration(null,USBConfigFeature3);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_4200
     * @tc.desc   setInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceInputPara begin');
      try {
        console.info(TAG, 'usb testSetInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
        let ret = usb.setInterface(null,USBInterfaceFeature);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_4300
     * @tc.desc   setInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceInputPara001 begin');
      try {
        console.info(TAG, 'usb testSetInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
        let ret = usb.setInterface(null,USBInterfaceFeature1);
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
     * @tc.number SUB_USB_HostManager_UsbFunc_4400
     * @tc.desc   setInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'usb testSetInterfaceInputPara002 begin');
      try {
        console.info(TAG, 'usb testSetInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
        let ret = usb.setInterface(null,USBInterfaceFeature2);
        console.info(TAG, 'usb testSetInterfaceInputPara002 ret: ' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetInterfaceInputPara002 fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })
  })
}
