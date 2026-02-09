/**
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import UsbMgr from '@ohos.usbManager';

let domain: int = 0x0000;
let tag: string = 'testTag';

let USBDeviceFeature:UsbMgr.USBDevice;
let USBDeviceFeature1:UsbMgr.USBDevice;
let USBDeviceFeature2:UsbMgr.USBDevice;
let USBDeviceFeature3:UsbMgr.USBDevice;
let USBDeviceFeature4:UsbMgr.USBDevice;
let USBConfigurationFeature:UsbMgr.USBConfiguration;
let USBConfigurationFeature1:UsbMgr.USBConfiguration;
let USBConfigurationFeature2:UsbMgr.USBConfiguration;
let USBConfigurationFeature3:UsbMgr.USBConfiguration;
let USBInterfaceFeature:UsbMgr.USBInterface;
let USBInterfaceFeature1:UsbMgr.USBInterface;
let USBInterfaceFeature2:UsbMgr.USBInterface;
let USBEndpointFeature:UsbMgr.USBEndpoint;
let USBEndpointFeature1:UsbMgr.USBEndpoint;

let pip: UsbMgr.USBDevicePipe = {
  devAddress: 1,
  busNum: 2,
};

let accessInfoTest: UsbMgr.USBAccessory = {
  manufacturer: "",
  product: "",
  description: "",
  version: "",
  serialNumber: ""
}

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
  direction: UsbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE,
  endpointAddr: 0,
  type: 0,
  interfaceId: 0,
}

USBEndpointFeature1 = {
  address: 2,
  attributes: 3,
  interval: 0,
  maxPacketSize: 0,
  direction: UsbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE,
  endpointAddr: 0,
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

function deviceConnected(gDeviceList: Array<Readonly<UsbMgr.USBDevice>>) {
  if (gDeviceList.length > 0) {
    hilog.info(domain, tag, "Test USB devices connected");
    return true;
  }
  hilog.info(domain, tag, "Test No USB devices connected");
  return false;
}

function devAccessoryFunc(accList:Array<UsbMgr.USBAccessory>) {
  if (accList.length > 0) {
    hilog.info(domain, tag, "Test Accessory devices connected");
    return true;
  }
  hilog.info(domain, tag, "Test No Accessory devices connected");
  return false;
}

export default function UsbRetValueTest() {

  describe("UsbRetValueTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    let isDeviceConnected: boolean = false;
    let isDevAccessoryFunc: boolean = false;
    let devices: UsbMgr.USBDevice;
    let accessInfo:UsbMgr.USBAccessory;
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
      hilog.info(domain, tag, 'getDevices: %{public}s', JSON.stringify(gDeviceList));
      isDeviceConnected = deviceConnected(gDeviceList);
      if (isDeviceConnected) {
        devices = gDeviceList[0];
      }

      let accList:Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
      hilog.info(domain, tag, 'getAccessoryList: %{public}s', JSON.stringify(accList));
      isDevAccessoryFunc = devAccessoryFunc(accList);
      if (isDevAccessoryFunc) {
        accessInfo = accList[0];
      }
      hilog.info(domain, tag, 'devices empty');
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })
    /**
     * @tc.name   testGetDevices002
     * @tc.number SUB_USB_HostManager_RetValue_Func_0100
     * @tc.desc   getDevices return value is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDevices002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB testGetDevices002 begin');
        if (!isDeviceConnected) {
          try{
            let res: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
            hilog.info(domain, tag, 'usb case getDevices ret length: ' + res.length);
            expect(res.length).assertEqual(0);
            done();
          } catch(error) {
            hilog.info(domain, tag, 'testGetDevices002 catch err code:%{public}s', JSON.stringify(error));
            done();
          }
        } else {
          done();
        }
        hilog.info(domain, tag, 'USB testGetDevices002 end');
      })

    /**
     * @tc.name   testRequestRightFalse
     * @tc.number SUB_USB_HostManager_RetValue_Func_0200
     * @tc.desc   Positive test: requestRight false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRequestRightFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testRequestRightFalse begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testRequestRightFalse No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let isHasRight = await UsbMgr.requestRight(devices.name);
            hilog.info(domain, tag, 'usb case requestRight ret : ' + isHasRight);
            expect(isHasRight).assertFalse();
            done();
          } catch (error) {
            hilog.info(domain, tag, 'testRequestRightFalse catch err code: ' + JSON.stringify(error));
          }
          done();
        }
        hilog.info(domain, tag, 'testRequestRightFalse end');
      })

    /**
     * @tc.name   testRemoveRightFalse
     * @tc.number SUB_USB_HostManager_RetValue_Func_0300
     * @tc.desc   Positive test: removeRight false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveRightFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testRemoveRightFalse begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testRemoveRight001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let remRight = UsbMgr.removeRight(devices.name);
            hilog.info(domain, tag, 'usb case removeRight ret : ' + remRight);
            expect(remRight).assertFalse();
          } catch (error) {
            hilog.info(domain, tag, 'testRemoveRightFalse catch err code: ' + JSON.stringify(error));
          }
          done();
        }
        hilog.info(domain, tag, 'testRemoveRightFalse end');
      })

    /**
     * @tc.name   getAccessoryList002
     * @tc.number SUB_USB_HostManager_RetValue_Func_0400
     * @tc.desc   Positive test: getAccessoryList is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getAccessoryList002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB getAccessoryList002 begin');
        if (!isDevAccessoryFunc) {
          hilog.info(domain, tag, 'usb getAccessoryList002 No Accessory is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let res = UsbMgr.getAccessoryList();
            hilog.info(domain, tag, 'usb case getAccessoryList ret length: ' + res.length);
            expect(res.length > 0).assertTrue();
            done();
          } catch (error) {
            hilog.info(domain, tag, 'getAccessoryList002 catch err : ' + JSON.stringify(error));
            done();
          }
        }
        hilog.info(domain, tag, 'USB getAccessoryList002 end');
      })

    /**
     * @tc.name   getAccessoryList003
     * @tc.number SUB_USB_HostManager_RetValue_Func_0500
     * @tc.desc   Positive test: getAccessoryList is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getAccessoryList003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB getAccessoryList003 begin');
        if (!isDevAccessoryFunc) {
          try {
            let res = UsbMgr.getAccessoryList();
            hilog.info(domain, tag, 'usb case getAccessoryList ret length: ' + res.length);
            expect(res.length).assertEqual(0);
            done();
          } catch (error) {
            hilog.info(domain, tag, 'getAccessoryList003 catch err : ' + JSON.stringify(error));
            done();
          }
        } else {
          done();
        }
        hilog.info(domain, tag, 'USB getAccessoryList003 end');
      })

    /**
     * @tc.name   requestAccessoryRight
     * @tc.number SUB_USB_HostManager_RetValue_Func_0600
     * @tc.desc   Positive test: requestAccessoryRight true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("requestAccessoryRight", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB requestAccessoryRight begin');
        try {
          let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
          if (accList && accList.length > 0) {
            let res = await UsbMgr.requestAccessoryRight(accList[0]);
            hilog.info(domain, tag, 'usb case requestAccessoryRight ret: ' + res);
            expect(res).assertTrue();
            UsbMgr.cancelAccessoryRight(accList[0]);
            done();
          } else {
            hilog.info(domain, tag, 'no accessory');
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, 'requestAccessoryRight catch err : ' + JSON.stringify(error));
          done();
        }
        hilog.info(domain, tag, 'USB requestAccessoryRight end');
      })

    /**
     * @tc.name   requestAccessoryRightFalse
     * @tc.number SUB_USB_HostManager_RetValue_Func_0700
     * @tc.desc   Positive test: requestAccessoryRight false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("requestAccessoryRightFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB requestAccessoryRightFalse begin');
        try {
          let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
          if (accList && accList.length > 0) {
            let res = await UsbMgr.requestAccessoryRight(accList[0]);
            hilog.info(domain, tag, 'usb case requestAccessoryRight ret: ' + res);
            expect(res).assertFalse();
            done();
          } else {
            hilog.info(domain, tag, 'no accessory');
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, 'requestAccessoryRightFalse catch err : ' + JSON.stringify(error));
          done();
        }
        hilog.info(domain, tag, 'USB requestAccessoryRightFalse end');
      })

    /**
     * @tc.name   testConnectDeviceInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_0800
     * @tc.desc   connectDevice input parameter USBDeviceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara begin');
        try {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara USBDeviceFeature: ' + JSON.stringify(USBDeviceFeature));
          let ret = UsbMgr.connectDevice(USBDeviceFeature);
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara ret: ' + JSON.stringify(ret));
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara end');
    })

    /**
     * @tc.name   testConnectDeviceInputPara001
     * @tc.number SUB_USB_HostManager_RetValue_Func_0900
     * @tc.desc   connectDevice input parameter USBDeviceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara001 begin');
        try {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara001 USBDeviceFeature1: ' + JSON.stringify(USBDeviceFeature1));
          let ret = UsbMgr.connectDevice(USBDeviceFeature1);
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara001 ret: ' + JSON.stringify(ret));
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara001 fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara001 end');
    })

    /**
     * @tc.name   testConnectDeviceInputPara002
     * @tc.number SUB_USB_HostManager_RetValue_Func_1000
     * @tc.desc   connectDevice input parameter USBDeviceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara002 begin');
        try {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara002 USBDeviceFeature2: ' + JSON.stringify(USBDeviceFeature2));
          let ret = UsbMgr.connectDevice(USBDeviceFeature2);
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara002 ret: ' + JSON.stringify(ret));
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara002 fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara002 end');
    })

    /**
     * @tc.name   testConnectDeviceInputPara003
     * @tc.number SUB_USB_HostManager_RetValue_Func_1100
     * @tc.desc   connectDevice input parameter USBDeviceFeature3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara003 begin');
        try {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara003 USBDeviceFeature3: ' + JSON.stringify(USBDeviceFeature3));
          let ret = UsbMgr.connectDevice(USBDeviceFeature3);
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara003 ret: ' + JSON.stringify(ret));
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara003 fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara003 end');
    })

    /**
     * @tc.name   testConnectDeviceInputPara004
     * @tc.number SUB_USB_HostManager_RetValue_Func_1200
     * @tc.desc   connectDevice input parameter USBDeviceFeature4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInputPara004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara004 begin');
        try {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara004 USBDeviceFeature4: ' + JSON.stringify(USBDeviceFeature4));
          let ret = UsbMgr.connectDevice(USBDeviceFeature4);
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara004 ret: ' + JSON.stringify(ret));
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testConnectDeviceInputPara004 fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testConnectDeviceInputPara004 end');
    })

    /**
     * @tc.name   testClaimInterfaceInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_1300
     * @tc.desc   claimInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testClaimInterfaceInputPara begin');
        try {
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
          let ret = UsbMgr.claimInterface(pip,USBInterfaceFeature);
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara ret: ' + ret);
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara ret: ' + typeof(ret));
          expect(typeof(ret)).assertEqual("int");
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testClaimInterfaceInputPara end');
    })

    /**
     * @tc.name   testClaimInterfaceInputPara001
     * @tc.number SUB_USB_HostManager_RetValue_Func_1400
     * @tc.desc   claimInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testClaimInterfaceInputPara001 begin');
        try {
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
          let ret = UsbMgr.claimInterface(pip,USBInterfaceFeature1);
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara001 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara001 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testClaimInterfaceInputPara001 end');
    })

    /**
     * @tc.name   testClaimInterfaceInputPara002
     * @tc.number SUB_USB_HostManager_RetValue_Func_1500
     * @tc.desc   claimInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testClaimInterfaceInputPara002 begin');
        try {
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
          let ret = UsbMgr.claimInterface(pip,USBInterfaceFeature2);
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara002 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testClaimInterfaceInputPara002 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testClaimInterfaceInputPara002 end');
    })

    /**
     * @tc.name   testReleaseInterfaceInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_1600
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara begin');
        try {
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
          let ret = UsbMgr.releaseInterface(pip,USBInterfaceFeature);
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara ret: ' + ret);
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara ret: ' + typeof(ret));
          expect(typeof(ret)).assertEqual("int");
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara end');
    })

    /**
     * @tc.name   testReleaseInterfaceInputPara001
     * @tc.number SUB_USB_HostManager_RetValue_Func_1700
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara001 begin');
        try {
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
          let ret = UsbMgr.releaseInterface(pip,USBInterfaceFeature1);
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara001 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara001 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara001 end');
    })

    /**
     * @tc.name   testReleaseInterfaceInputPara002
     * @tc.number SUB_USB_HostManager_RetValue_Func_1800
     * @tc.desc   releaseInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara002 begin');
        try {
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
          let ret = UsbMgr.releaseInterface(pip,USBInterfaceFeature2);
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara002 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara002 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testReleaseInterfaceInputPara002 end');
    })

    /**
     * @tc.name   testSetConfigurationInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_1900
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara begin');
        try {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara USBConfigurationFeature: ' + JSON.stringify(USBConfigurationFeature));
          let ret = UsbMgr.setConfiguration(pip,USBConfigurationFeature);
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara ret: ' + ret);
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara ret: ' + typeof(ret));
          expect(typeof(ret)).assertEqual("int");
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara end');
    })

    /**
     * @tc.name   testSetConfigurationInputPara001
     * @tc.number SUB_USB_HostManager_RetValue_Func_2000
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara001 begin');
        try {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara001 USBConfigurationFeature1: ' + JSON.stringify(USBConfigurationFeature1));
          let ret = UsbMgr.setConfiguration(pip,USBConfigurationFeature1);
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara001 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara001 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara001 end');
    })

    /**
     * @tc.name   testSetConfigurationInputPara002
     * @tc.number SUB_USB_HostManager_RetValue_Func_2100
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara002 begin');
        try {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara002 USBConfigurationFeature2: ' + JSON.stringify(USBConfigurationFeature2));
          let ret = UsbMgr.setConfiguration(pip,USBConfigurationFeature2);
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara002 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara002 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara002 end');
    })

    /**
     * @tc.name   testSetConfigurationInputPara003
     * @tc.number SUB_USB_HostManager_RetValue_Func_2200
     * @tc.desc   setConfiguration input parameter USBConfigurationFeature3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara003 begin');
        try {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara003 USBConfigurationFeature3: ' + JSON.stringify(USBConfigurationFeature3));
          let ret = UsbMgr.setConfiguration(pip,USBConfigurationFeature3);
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara003 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testSetConfigurationInputPara003 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testSetConfigurationInputPara003 end');
    })

    /**
     * @tc.name   testSetInterfaceInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_2300
     * @tc.desc   setInterface input parameter USBInterfaceFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testSetInterfaceInputPara begin');
        try {
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara USBInterfaceFeature: ' + JSON.stringify(USBInterfaceFeature));
          let ret = UsbMgr.setInterface(pip,USBInterfaceFeature);
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara ret: ' + ret);
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara ret: ' + typeof(ret));
          expect(typeof(ret)).assertEqual("int");
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testSetInterfaceInputPara end');
    })

    /**
     * @tc.name   testSetInterfaceInputPara001
     * @tc.number SUB_USB_HostManager_RetValue_Func_2400
     * @tc.desc   setInterface input parameter USBInterfaceFeature1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testSetInterfaceInputPara001 begin');
        try {
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara001 USBInterfaceFeature1: ' + JSON.stringify(USBInterfaceFeature1));
          let ret = UsbMgr.setInterface(pip,USBInterfaceFeature1);
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara001 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara001 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testSetInterfaceInputPara001 end');
    })

    /**
     * @tc.name   testSetInterfaceInputPara002
     * @tc.number SUB_USB_HostManager_RetValue_Func_2500
     * @tc.desc   setInterface input parameter USBInterfaceFeature2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testSetInterfaceInputPara002 begin');
        try {
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara002 USBInterfaceFeature2: ' + JSON.stringify(USBInterfaceFeature2));
          let ret = UsbMgr.setInterface(pip,USBInterfaceFeature2);
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara002 ret: ' + ret);
          expect(ret).assertEqual(88080488);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testSetInterfaceInputPara002 fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testSetInterfaceInputPara002 end');
    })

    /**
     * @tc.name   testUsbTransferInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_2600
     * @tc.desc   usbSubmitTransfer/usbCancelTransfer input parameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testUsbTransferInputPara begin');
        try {
          let transferParams: UsbMgr.UsbDataTransferParams = {
            devPipe: pip,
            flags: UsbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK,
            endpoint: 1,
            type: UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK,
            timeout: 2000,
            length: 10,
            callback: () => {},
            userData: new Uint8Array(10),
            buffer: new Uint8Array(10),
            isoPacketCount: 0,
          };
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testUsbTransferInputPara fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testUsbTransferInputPara end');
    })

    /**
     * @tc.name   testUsbTransferInputPara001
     * @tc.number SUB_USB_HostManager_RetValue_Func_2700
     * @tc.desc   usbSubmitTransfer/usbCancelTransfer input parameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testUsbTransferInputPara001 begin');
        try {
          let transferParams: UsbMgr.UsbDataTransferParams = {
            devPipe: pip,
            flags: UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER,
            endpoint: 1,
            type: UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT,
            timeout: 2000,
            length: 10,
            callback: () => {},
            userData: new Uint8Array(10),
            buffer: new Uint8Array(10),
            isoPacketCount: 1,
          };
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testUsbTransferInputPara001 fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testUsbTransferInputPara001 end');
    })

    /**
     * @tc.name   testUsbTransferInputPara002
     * @tc.number SUB_USB_HostManager_RetValue_Func_2800
     * @tc.desc   usbSubmitTransfer/usbCancelTransfer input parameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testUsbTransferInputPara002 begin');
        try {
          let transferParams: UsbMgr.UsbDataTransferParams = {
            devPipe: pip,
            flags: UsbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET,
            endpoint: 1,
            type: UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS,
            timeout: 2000,
            length: 10,
            callback: () => {},
            userData: new Uint8Array(10),
            buffer: new Uint8Array(10),
            isoPacketCount: 2,
          };
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testUsbTransferInputPara002 fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testUsbTransferInputPara002 end');
    })

    /**
     * @tc.name   testUsbTransferInputPara003
     * @tc.number SUB_USB_HostManager_RetValue_Func_2900
     * @tc.desc   usbSubmitTransfer/usbCancelTransfer input parameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbTransferInputPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testUsbTransferInputPara003 begin');
        try {
          let transferParams: UsbMgr.UsbDataTransferParams = {
            devPipe: pip,
            flags: UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_TRANSFER,
            endpoint: 1,
            type: UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK,
            timeout: 2000,
            length: 10,
            callback: () => {},
            userData: new Uint8Array(10),
            buffer: new Uint8Array(10),
            isoPacketCount: 1,
          };
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testUsbTransferInputPara003 fail:' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
        hilog.info(domain, tag, 'usb testUsbTransferInputPara003 end');
    })

    /**
     * @tc.name   testHasRightInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_3000
     * @tc.desc   hasRight input parameter ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testHasRightInputPara begin');
        try {
          let ret = UsbMgr.hasRight("");
          hilog.info(domain, tag, 'usb testHasRightInputPara ret: ' + ret);
          expect(ret).assertFalse();
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testHasRightInputPara fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testHasRightInputPara end');
    })

    /**
     * @tc.name   testRequestRightInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_3100
     * @tc.desc   requestRight input parameter ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testRequestRightInputPara begin');
        try {
          let ret = await UsbMgr.requestRight("");
          hilog.info(domain, tag, 'usb testRequestRightInputPara ret: ' + ret);
          expect(ret).assertFalse();
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testRequestRightInputPara fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testRequestRightInputPara end');
    })

    /**
     * @tc.name   testRemoveRightInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_3200
     * @tc.desc   removeRight input parameter ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveRightInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testRemoveRightInputPara begin');
        try {
          let ret = UsbMgr.removeRight("");
          hilog.info(domain, tag, 'usb testRemoveRightInputPara ret: ' + ret);
          expect(ret).assertFalse();
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testRemoveRightInputPara fail:' + JSON.stringify(err));
          done();
        }
        hilog.info(domain, tag, 'usb testRemoveRightInputPara end');
    })

    /**
     * @tc.name   testRequestAccessoryRightInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_3300
     * @tc.desc   requestAccessoryRight input accessInfoTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestAccessoryRightInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testRequestAccessoryRightInputPara begin');
        try {
          let ret = await UsbMgr.requestAccessoryRight(accessInfoTest);
          hilog.info(domain, tag, 'usb testRequestAccessoryRightInputPara ret: ' + ret);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testRequestAccessoryRightInputPara fail:' + err);
          expect(err.code).assertEqual(14401001);
          done();
        }
        hilog.info(domain, tag, 'usb testRequestAccessoryRightInputPara end');
    })

    /**
     * @tc.name   testCancelAccessoryRightInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_3400
     * @tc.desc   cancelAccessoryRight input accessInfoTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelAccessoryRightInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testCancelAccessoryRightInputPara begin');
        try {
          UsbMgr.cancelAccessoryRight(accessInfoTest);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testCancelAccessoryRightInputPara fail:' + err);
          expect(err.code).assertEqual(14401001);
          done();
        }
        hilog.info(domain, tag, 'usb testCancelAccessoryRightInputPara end');
    })

    /**
     * @tc.name   testOpenAccessoryInputPara
     * @tc.number SUB_USB_HostManager_RetValue_Func_3500
     * @tc.desc   openAccessory input accessInfoTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpenAccessoryInputPara', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testOpenAccessoryInputPara begin');
        try {
          let ret = UsbMgr.openAccessory(accessInfoTest);
          hilog.info(domain, tag, 'usb testOpenAccessoryInputPara ret: ' + ret);
          done();
        } catch (err) {
          hilog.info(domain, tag, 'usb testOpenAccessoryInputPara fail:' + err);
          expect(err.code).assertEqual(14401001);
          done();
        }
        hilog.info(domain, tag, 'usb testOpenAccessoryInputPara end');
    })
  })
}