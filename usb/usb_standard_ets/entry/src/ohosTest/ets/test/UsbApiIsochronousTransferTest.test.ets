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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import usbMgr from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';

const TAG: string = "[UsbApiIsochronousTransferTest]";
let isoPacketDescs: usbMgr.UsbIsoPacketDescriptor;
export interface gPipe {
  busNum: number;
  devAddress: number;
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

async function getPermission(gDeviceList: Array<usbMgr.USBDevice>) {
  console.info(TAG, '**************getPermission**************');
  try {
    usbMgr.requestRight(gDeviceList[0].name).then(hasRight => {
      console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
    })
  } catch (err) {
    console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
    return
  }
}

async function driveFn() {
  console.info('**************driveFn**************');
  try {
    let driver = await UiDriver.create();
    console.info(TAG, ` come in driveFn`);
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    await sleep(1000);
    let button = await driver.findComponent(BY.text('允许'));
    console.info(TAG, `button is ${JSON.stringify(button)}`);
    await sleep(1000);
    await button.click();
  } catch (err) {
    console.info(TAG, 'err is ' + err);
    return;
  }
}

function deviceConnected(gDeviceList: Array<usbMgr.USBDevice>)
{
  if (gDeviceList.length > 0) {
    console.info(TAG, "Test USB device is connected");
    return true;
  }
  console.info(TAG, "Test USB device is not connected");
  return false;
}

function getTransfersParam(gPipe: usbMgr.USBDevicePipe, flagsValue:number, endpointValue: number, typeValue: number, timeOutValue: number)
{
  let transferParams: usbMgr.UsbDataTransferParams = {
    devPipe: gPipe,
    flags: flagsValue,
    endpoint: endpointValue,
    type: typeValue,
    timeout: timeOutValue,
    length: 16,
    callback: () => {},
    userData: new Uint8Array(10),
    buffer: new Uint8Array(16),
    isoPacketCount: 1,
  };
  return transferParams;
}

interface Endpoint {
  usbInterface: usbMgr.USBInterface | undefined,
  usbEndpoint: usbMgr.USBEndpoint
}

function getEndpoint(devices: usbMgr.USBDevice, direction: number, type: number): Endpoint | undefined {
  let usbConfigs: usbMgr.USBConfiguration[] = devices.configs;
  let usbInterfaces: usbMgr.USBInterface[] = [];
  let usbInterface: usbMgr.USBInterface | undefined = undefined
  let usbEndpoints: usbMgr.USBEndpoint[] = [];
  let usbEndpoint: usbMgr.USBEndpoint | undefined = undefined
  for (let i = 0; i < usbConfigs.length; i++) {
    usbInterfaces = usbConfigs[i].interfaces;
    for (let i = 0; i < usbInterfaces.length; i++) {
      usbEndpoints = usbInterfaces[i].endpoints;
      usbEndpoint = usbEndpoints.find((value) => {
        return value.direction === direction
          && value.type === type;
      })
      if (usbEndpoint !== undefined) {
        usbInterface = usbInterfaces[i];
        break;
      }
    }
  }
  if (usbEndpoint === undefined) {
    console.error(`get usbEndpoint error`)
    return undefined;
  }

  let Endpoint: Endpoint = {
    usbInterface: usbInterface,
    usbEndpoint: usbEndpoint
  }
  return Endpoint
}

export default function UsbApiIsochronousTransferTest() {

  describe('UsbApiIsochronousTransferTest', () => {
    let isDeviceConnected:boolean = false;
    let devices: usbMgr.USBDevice;

    beforeAll( async (done: Function) => {
      console.log(TAG, '*************Usb Unit UsbApiParamErrJsunitTest Begin*************');
      let gDeviceList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
      console.info(TAG, 'usb unit begin test getDevices **********', JSON.stringify(gDeviceList));
      isDeviceConnected = deviceConnected(gDeviceList);
      console.info(TAG, 'isDeviceConnected:', isDeviceConnected);
      if (isDeviceConnected) {
        devices = gDeviceList[0];
        let hasRight: boolean = usbMgr.hasRight(devices.name);
        if (!hasRight) {
          console.info(TAG, `beforeAll: usb requestRight start`);
          await getPermission(gDeviceList);
          await sleep(1000);
          await driveFn();
          await sleep(1000);
        }
      }
      done();
    })

    afterAll( ()=> {
      console.log(TAG, '*************Usb Unit UsbApiIsochronousTransferTest End*************');
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
    })

    /**
     * @tc.name   testUsbSubmitTransfer001
     * @tc.number SUB_USB_Host_JS_usbSubmitTransfer_Func_0200
     * @tc.desc   isochronous transfer read successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSubmitTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'Isochronous testUsbSubmitTransfer001 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer001 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
      let Endpoint  = getEndpoint(devices, 128, type)
      if (Endpoint === undefined || Endpoint.usbInterface === undefined || Endpoint.usbEndpoint === undefined) {
        return
      }
      let usbInterface = Endpoint.usbInterface;
      let usbEndpoint = Endpoint.usbEndpoint;
      console.info(TAG, 'usbEndpoint.address = ' + JSON.stringify(usbEndpoint.address));

      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, usbEndpoint.address, type, 2000);
      if (usbMgr.claimInterface(gPipe, usbInterface, true) !== 0) {
        console.info(TAG, 'claimInterface error');
      }
      if (usbMgr.setInterface(gPipe, usbInterface) !== 0) {
        console.info(TAG, 'setInterface error');
      }

      try {
        transferParams.callback = (err: Error, data: usbMgr.SubmitTransferCallback) => {
          console.info(TAG, 'data = ' + JSON.stringify(data));
          console.info(TAG, 'testUsbSubmitTransfer001 transfer success, result = ' + transferParams.buffer.toString());
          isoPacketDescs = data.isoPacketDescs[0];
          expect(isoPacketDescs.status == usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
            isoPacketDescs.status == usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          usbMgr.closePipe(devices);
          done()
        }
        await usbMgr.usbSubmitTransfer(transferParams);
        console.info(TAG, 'Isochronous testUsbSubmitTransfer001 end');
      } catch (error) {
        expect().assertFail();
        console.error(TAG, 'Isochronous error:', error);
      }
    });

     /**
      * @tc.name   testUsbSubmitTransfer801Err001
      * @tc.number SUB_USB_Host_JS_usbSubmitTransfer_FuncErr_0200
      * @tc.desc   isochronous transfer read
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('testUsbSubmitTransfer801Err001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'Isochronous testUsbSubmitTransfer801Err001 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer801Err001 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
      let endpoint  = getEndpoint(devices, 128, type)
      if (endpoint === undefined || endpoint.usbInterface === undefined || endpoint.usbEndpoint === undefined) {
        return
      }
      let usbInterface = endpoint.usbInterface;
      let usbEndpoint = endpoint.usbEndpoint;
      console.info('usbEndpoint.address = ' + JSON.stringify(usbEndpoint.address));

      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, usbEndpoint.address, type, 2000);
      if (usbMgr.claimInterface(gPipe, usbInterface, true) !== 0) {
        console.info(TAG, 'claimInterface error');
      }
      try {
        if (usbMgr.setInterface(gPipe, usbInterface) !== 0) {
          console.info(TAG, 'setInterface error');
        }
        transferParams.callback = (err: Error, data: usbMgr.SubmitTransferCallback) => {
          console.info('data = ' + JSON.stringify(data));
          console.info('testUsbSubmitTransfer801Err001 transfer success, result = ' + transferParams.buffer.toString());
          expect(data.isoPacketDescs[0].status == usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
            data.isoPacketDescs[0].status == usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          usbMgr.closePipe(devices);
          done()
        }
        await usbMgr.usbSubmitTransfer(transferParams);
        console.info(TAG, 'Isochronous testUsbSubmitTransfer801Err001 end');
      } catch (error) {
        console.error('Isochronous error:', error);
        expect(error.code).assertEqual(801);
      }
    });

    /**
     * @tc.name   testUsbSubmitTransfer002
     * @tc.number SUB_USB_Host_JS_usbSubmitTransfer_Func_0100
     * @tc.desc   isochronous transfer write successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSubmitTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'Isochronous testUsbSubmitTransfer002 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer002 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
      let Endpoint  = getEndpoint(devices, 0, type)
      if (Endpoint === undefined || Endpoint.usbInterface === undefined || Endpoint.usbEndpoint === undefined) {
        return
      }
      let usbInterface = Endpoint.usbInterface;
      let usbEndpoint = Endpoint.usbEndpoint;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, usbEndpoint.address, type, 2000);
      if (usbMgr.claimInterface(gPipe, usbInterface, true) !== 0) {
        console.info(TAG, 'claimInterface error');
      }
      if (usbMgr.setInterface(gPipe, usbInterface) !== 0) {
        console.info(TAG, 'setInterface error');
      }

      try {
        transferParams.callback = (err: Error, data: usbMgr.SubmitTransferCallback) => {
          console.info(TAG, 'Isochronous testUsbSubmitTransfer002 data =' + JSON.stringify(data));
          isoPacketDescs = data.isoPacketDescs[0];
          expect(isoPacketDescs.status == usbMgr.UsbTransferStatus.TRANSFER_COMPLETED).assertTrue();
          expect(isoPacketDescs.length).assertEqual(transferParams.buffer.length);
          expect(isoPacketDescs.actualLength >= 0).assertTrue();
          usbMgr.closePipe(devices);
          done();
        }
        await usbMgr.usbSubmitTransfer(transferParams);
        console.info(TAG, 'Isochronous testUsbSubmitTransfer002 end');
      } catch (error) {
        expect().assertFail();
        console.error(TAG, 'Isochronous error:', error);
      }

    });

    /**
     * @tc.name   testUsbSubmitTransfer003
     * @tc.number SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0100
     * @tc.desc   isochronous transfer error endpoint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransfer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'Isochronous testUsbSubmitTransfer003 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer003 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, -1, type, 2000);
      usbMgr.claimInterface(gPipe, tmpInterface, true);
      try {
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'Isochronous testUsbSubmitTransfer003 end');
        console.error(TAG, 'isochronous error endpoint:', error);
        expect(error.code).assertEqual(401);
        usbMgr.closePipe(devices);
        done()
      }

    });

    /**
     * @tc.name   testUsbSubmitTransfer801Err003
     * @tc.number SUB_USB_Host_JS_usbSubmitTransfer_ErrCode801_0100
     * @tc.desc   isochronous transfer error endpoint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransfer801Err003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'Isochronous testUsbSubmitTransfer801Err003 enter');
      if (!isDeviceConnected) {
			  console.info(TAG, 'usb testUsbSubmitTransfer801Err003 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, -1, type, 2000);
      try {
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        if(error){
          console.info(TAG, 'Isochronous testUsbSubmitTransfer801Err003 end');
          console.error('isochronous error endpoint:', error);
          expect(error.code).assertEqual(401);
          usbMgr.closePipe(devices);
        }else{
          expect(error.code).assertEqual(801);
        }
        done()
      }
    });

    /**
     * @tc.name   testUsbSubmitTransfer004
     * @tc.number SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0200
     * @tc.desc   isochronous transfer claimInterface no call. IO error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransfer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'Isochronous testUsbSubmitTransfer004 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer004 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
      let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
      let Endpoint  = getEndpoint(devices, 0, type)
      if (Endpoint === undefined || Endpoint.usbInterface === undefined || Endpoint.usbEndpoint === undefined) {
        return
      }
      let usbInterface = Endpoint.usbInterface;
      let usbEndpoint = Endpoint.usbEndpoint;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, usbEndpoint.address, type, 2000);

      try {
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'Isochronous testUsbSubmitTransfer004 end');
        console.error(TAG, 'isochronous IO error:', error);
        expect(error.code).assertEqual(14400012);
        usbMgr.closePipe(devices);
        done()
      }

    });

    /**
     * @tc.name   testUsbSubmitTransfer005
     * @tc.number SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0300
     * @tc.desc   iso transfer No permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransfer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'iso testUsbSubmitTransfer005 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer005 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = {
        'busNum': 0,
        'devAddress': 0
      }

      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, 0 , 0, 0);
      try {
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'iso testUsbSubmitTransfer005 end');
        console.error(TAG, 'iso cancel error:', error);
        expect(error.code).assertEqual(14400001);
        usbMgr.closePipe(devices);
        done()
      }
    });

    /**
     * @tc.name   testUsbCancelTransfer001
     * @tc.number SUB_USB_Host_JS_usbCancelTransfer_ErrCode_0100
     * @tc.desc   isochronous transfer cancel failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbCancelTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'Isochronous testUsbCancelTransfer001 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbCancelTransfer001 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let flags: number = 0;
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 1, type, 0);
      try {
        usbMgr.usbCancelTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'Isochronous testUsbCancelTransfer001 end');
        console.error(TAG, 'isochronous cancel failed:', error);
        expect(error.code).assertEqual(14400011);
        usbMgr.closePipe(devices);
        done()
      }
    });

    /**
     * @tc.name   testUsbCancelTransfer002
     * @tc.number SUB_USB_Host_JS_UsbCancelTransfer_ErrCode_0200
     * @tc.desc   isochronous transfer No permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbCancelTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'isochronous testUsbCancelTransfer002 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbCancelTransfer002 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = {
        'busNum': 0,
        'devAddress': 0
      }

      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, 0 , 0, 0);
      try {
        usbMgr.usbCancelTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'isochronous testUsbCancelTransfer002 end');
        console.error(TAG, 'isochronous cancel error:', error);
        expect(error.code).assertEqual(14400001);
        usbMgr.closePipe(devices);
        done()
      }
    });

  })

}