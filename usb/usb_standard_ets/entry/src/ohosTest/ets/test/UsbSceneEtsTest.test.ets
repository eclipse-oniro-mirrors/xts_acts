/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { beforeAll, afterAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import usbMgr from "@ohos.usbManager"
const TAG: string = "[UsbSceneEtsTest]";


class PARA {
  bmRequestType: number = 0;
  bRequest: number = 0;
  wValue: number = 0;
  wIndex: number = 0;
  wLength: number = 0;
  data: Uint8Array = new Uint8Array();
}
async function executeUsbRequest(
  request: PARA,
  expectResult: number = 0
): Promise<number> {
  let devicePipe: usbMgr.USBDevicePipe | undefined;
  try {
    const devicesList =usbMgr.getDevices();
    if (!devicesList || devicesList.length === 0) {
      console.info(TAG, "No USB devices connected");
      throw new Error("No devices available");
    }

    const device = devicesList[0];
    if (!usbMgr.hasRight(device.name)) {
      console.info(TAG, `Requesting permission for device: ${device.name}`);
      await usbMgr.requestRight(device.name);
    }

    devicePipe = usbMgr.connectDevice(device);
    if (!devicePipe) {
      throw new Error("Failed to connect device");
    }

    const interfaces = device.configs?.[0]?.interfaces?.[0];
    const claimResult = usbMgr.claimInterface(devicePipe, interfaces, true);
    if (claimResult !== 0) {
      throw new Error(`Failed to claim interface: ${claimResult}`);
    }

    const result = await usbMgr.usbControlTransfer(devicePipe, request);
    console.info(TAG, `Request ${request.bRequest} result: ${result}`);
    expect(result).assertEqual(expectResult);

    usbMgr.closePipe(devicePipe);
    devicePipe = undefined;
    return result;
  } catch (err) {
    console.error(TAG, `executeUsbRequest failed: ${JSON.stringify(err)}`);
    expect().assertFail();
    throw new Error(`err: ${err.code || 'Unknown'}`);
  } finally {
    if (devicePipe) {
      try {
        usbMgr.closePipe(devicePipe);
      } catch (closeErr) {
        console.warn(TAG, `failed to close pipe in finally block: ${closeErr}`);
      }
    }
  }
}

function deviceConnected(gDeviceList: Array<Readonly<usbMgr.USBDevice>>) {
  if (gDeviceList.length > 0) {
    console.info(TAG, "Test USB devices connected");
    return true;
  }
  console.info(TAG, "Test No USB devices connected");
  return false;
}


export default function UsbSceneEtsTest() {


  describe('UsbSceneEtsTest', () => {

    const TAG: string = "[UsbSceneEtsTest]";
    let isDeviceConnected: boolean = false;
    let devices: usbMgr.USBDevice;
    

    beforeAll(async () => {
      console.log('*************Usb Unit UsbSceneEtsTest Begin*************');
      let gDeviceList = usbMgr.getDevices();
      if (!gDeviceList || gDeviceList.length === 0) {
        console.info(TAG, 'No USB devices connected');
        return;
      }
      isDeviceConnected = deviceConnected(gDeviceList);
      if (isDeviceConnected) {
        devices = gDeviceList[0];
      }
    })

    afterAll( ()=> {
      console.log('*************Usb Unit UsbSceneEtsTest End*************');
    })
  
    /**
     * @tc.name   testConnectDeviceNormalApp001
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0900
     * @tc.desc   connectDevice Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testConnectDeviceNormalApp001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testConnectDeviceNormalApp001 no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        try {
          let gDeviceList = usbMgr.getDevices();
          let right = usbMgr.hasRight(gDeviceList[0].name);
          console.log(TAG, 'hasRight result:' + right);
          if (!right) {
            let devicepipe = usbMgr.connectDevice(gDeviceList[0]);
            console.log(TAG, 'connectDevice failed result:' + devicepipe);
            expect(devicepipe === null).assertTrue();
          }
        } catch (err) {
          console.info(TAG, 'usb testConnectDeviceNormalApp001 catch err code: ',err.code, ', message: ', err.message);
          expect(err.code).assertEqual(14400001);
        }
        done();
      }
    })
    
    /**
     * @tc.name   testUsbControlTransferGetStatus
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0100
     * @tc.desc   Test the GET_STATUS USB request through usbControlTransfer interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testUsbControlTransferGetStatus", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbControlTransferGetStatus no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        console.info(TAG, 'usb testUsbControlTransferGetStatus begin');
        let param: PARA = {
          bmRequestType: 0x80,
          bRequest: 0x00,
          wValue: 0x0000,
          wIndex: 0x0000,
          wLength: 0x0002,
          data: new Uint8Array(2)
        }
        await executeUsbRequest(param, 2);
        done();
      }
    })

    /**
     * @tc.name   testUsbControlTransferSetFeature
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0200
     * @tc.desc   Test the SET_FEATURE USB request through usbControlTransfer interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testUsbControlTransferSetFeature", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbControlTransferSetFeature no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        {
        console.info(TAG, 'usb SET_FEATURE begin');
        let param: PARA = {
          bmRequestType: 0x02,
          bRequest: 0x03, //SET_FEATURE
          wValue: 0x0000,
          wIndex: 0x0000,
          wLength: 0x0000,
          data: new Uint8Array(0)
        };
        try {
          let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
          if (!devicesList || devicesList.length === 0) {
            console.info(TAG, "No USB devices connected");
            throw new Error("No devices available");
          }
          await usbMgr.requestRight(devicesList?.[0]?.name);
          console.info(TAG, `SET_FEATURE name = ${devicesList?.[0]?.name}`);
          let devicePipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devicesList?.[0]);
          console.info(TAG, `SET_FEATURE devicePipe = ${JSON.stringify(devicePipe)}`);
          let interfaces: usbMgr.USBInterface = devicesList?.[0]?.configs?.[0]?.interfaces?.[0];
          console.info(TAG, `SET_FEATURE interfaces = ${JSON.stringify(interfaces)}`);
          let claim = usbMgr.claimInterface(devicePipe, interfaces, true);
          console.info(TAG, `SET_FEATURE claim = ${claim}`);
          expect(claim == 0).assertEqual(true);
          if (interfaces.endpoints.length > 0) {
            param.wIndex = interfaces.endpoints[0].address;
            let ret = await usbMgr.usbControlTransfer(devicePipe, param);
            console.info(TAG, `SET_FEATURE size = ${ret}`);
            expect(ret == 0).assertEqual(true);
            usbMgr.removeRight(devicesList[0].name);
            usbMgr.closePipe(devicePipe);
          }
          done();
        } catch (err) {
          console.info(TAG, `SET_FEATURE error`);
          console.info(TAG, `SET_FEATURE err.code = ${JSON.stringify(err)}`);
          console.info(TAG, 'SET_FEATURE end');
          expect().assertFail();
          done();
        }
        }
        {
        console.info(TAG, 'usb CLEAR_FEATURE begin');
        let param: PARA = {
          bmRequestType: 0x02, //Host to Device, Class: Standard, Recipient: Device
          bRequest: 0x01, //CLEAR_FEATURE
          wValue: 0x0000, //FEATURE_SELECTOR_REMOTE_WAKEUP
          wIndex: 0x0000,
          wLength: 0x0000,
          data: new Uint8Array(0)
        };
        let param1: PARA = {
          bmRequestType: 0x02,
          bRequest: 0x03, //SET_FEATURE
          wValue: 0x0000,
          wIndex: 0x0000,
          wLength: 0x0000,
          data: new Uint8Array(0)
        };
        try {
          let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
          await usbMgr.requestRight(devicesList[0].name);
          console.info(TAG, `CLEAR_FEATURE name = ${devicesList[0].name}`);
          let devicePipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devicesList[0]);
          console.info(TAG, `CLEAR_FEATURE devicePipe = ${JSON.stringify(devicePipe)}`);
          let interfaces: usbMgr.USBInterface = devicesList[0].configs[0].interfaces[0];
          console.info(TAG, `CLEAR_FEATURE interfaces = ${JSON.stringify(interfaces)}`);
          let claim = usbMgr.claimInterface(devicePipe, interfaces, true);
          console.info(TAG, `CLEAR_FEATURE claim = ${claim}`);
          if (interfaces.endpoints.length > 0) {
            param.wIndex = interfaces.endpoints[0].address;
            param1.wIndex = interfaces.endpoints[0].address;
            let res = await usbMgr.usbControlTransfer(devicePipe, param1);
            console.info(TAG, `CLEAR_FEATURE size = ${res}`);
            expect(res == 0).assertEqual(true);
            let ret = await usbMgr.usbControlTransfer(devicePipe, param);
            console.info(TAG, `CLEAR_FEATURE size = ${ret}`);
            expect(ret == 0).assertEqual(true);
            usbMgr.removeRight(devicesList[0].name);
            usbMgr.closePipe(devicePipe);
          }
          done();
        } catch (err) {
          console.info(TAG, `CLEAR_FEATURE error`);
          console.info(TAG, `CLEAR_FEATURE err.code = ${JSON.stringify(err)}`);
          console.info(TAG, 'CLEAR_FEATURE end');
          expect().assertFail();
          done();
        }
        }
      }
    })



    /**
     * @tc.name   testUsbControlTransferClearFeature
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0300
     * @tc.desc   Test the CLEAR_FEATURE USB request through usbControlTransfer interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testUsbControlTransferClearFeature", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbControlTransferClearFeature no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        console.info(TAG, 'usb testUsbControlTransferClearFeature begin');
        let param: PARA = {
          bmRequestType: 0x02,
          bRequest: 0x01,
          wValue: 0x0000,
          wIndex: 0x0000,
          wLength: 0x0000,
          data: new Uint8Array(0)
        }
        await executeUsbRequest(param, 0);
        done();
      }
    })


    /**
     * @tc.name   testUsbControlTransferGetDescriptor
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0400
     * @tc.desc   Test the GET_DESCRIPTOR USB request (device descriptor) via usbControlTransfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testUsbControlTransferGetDescriptor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbControlTransferGetDescriptor no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        console.info(TAG, 'usb testUsbControlTransferGetDescriptor begin');
        let param: PARA = {
          bmRequestType: 0x80,
          bRequest: 0x06,
          wValue: 0x0100, // DEVICE_DESCRIPTOR
          wIndex: 0x0000,
          wLength: 18,
          data: new Uint8Array(18)
        }
        await executeUsbRequest(param, 18);
        done();
      }
    })

    /**
     * @tc.name   testUsbControlTransferGetConfiguration
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0500
     * @tc.desc   Test the GET_CONFIGURATION USB request through usbControlTransfer interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testUsbControlTransferGetConfiguration", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbControlTransferGetConfiguration no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        console.info(TAG, 'usb testUsbControlTransferGetConfiguration begin');
        let param: PARA = {
          bmRequestType: 0x80,
          bRequest: 0x08,
          wValue: 0x0000,
          wIndex: 0x0000,
          wLength: 0x0001,
          data: new Uint8Array(1)
        }
        await executeUsbRequest(param, 1);
        done();
      }
    })
    
    /**
     * @tc.name   testUsbControlTransferGetInterface
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0600
     * @tc.desc   Test the GET_INTERFACE USB request through usbControlTransfer interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testUsbControlTransferGetInterface", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbControlTransferGetInterface no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        console.info(TAG, 'usb testUsbControlTransferGetInterface begin');
        let param: PARA = {
          bmRequestType: 0x81,
          bRequest: 0x0A,
          wValue: 0x0000,
          wIndex: 0x0000,
          wLength: 0x0001,
          data: new Uint8Array(1)
        }
        await executeUsbRequest(param, 1);
        done();
      }
    })

    /**
     * @tc.name   testUsbControlTransferSetConfiguration
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0700
     * @tc.desc   Test the SET_CONFIGURATION USB request through usbControlTransfer interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testUsbControlTransferSetConfiguration", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbControlTransferSetConfiguration no device is connected');
        expect(devices == null).assertTrue();
        done();
      } else {
        console.info(TAG, 'usb testUsbControlTransferSetConfiguration begin');
        let param: PARA = {
          bmRequestType: 0x00,
          bRequest: 0x09,
          wValue: 0x0000,
          wIndex: 0x0000,
          wLength: 0x0000,
          data: new Uint8Array(0)
        }
        await executeUsbRequest(param, 0);
        done();
      }
    })
  })
}

