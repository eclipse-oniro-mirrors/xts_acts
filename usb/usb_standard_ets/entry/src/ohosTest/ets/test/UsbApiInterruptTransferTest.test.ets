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

const TAG: string = "[UsbApiInterruptTransferTest]";
export interface gPipe {
  busNum: number;
  devAddress: number;
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

async function getPermission(gDeviceList: Array<usbMgr.USBDevice>) {
  console.info('**************getPermission**************');
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

function deviceConnected(gDeviceList: Array<usbMgr.USBDevice>) {
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
    length: 10,
    callback: () => {},
    userData: new Uint8Array(10),
    buffer: new Uint8Array(10),
    isoPacketCount: 0,
  };
  return transferParams;
}

export default function UsbApiInterruptTransferTest() {

  describe('UsbApiInterruptTransferTest', () => {
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
        console.info(TAG, `beforeAll: usb requestRight start`);
        if (!hasRight) {
          console.info(TAG, `beforeAll: usb requestRight start`);
          await getPermission(gDeviceList);
          await sleep(3000);
          await driveFn();
          await sleep(1000);
        }
      }
      done();
    })

    afterAll( ()=> {
      usbMgr.removeRight(devices.name);
      console.log('*************Usb Unit UsbApiInterruptTransferTest End*************');
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
    })

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0100
     * @tc.name     : testUsbSubmitTransfer001
     * @tc.desc     : interrupt transfer error endpoint.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'interrupt testUsbSubmitTransfer001 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer001 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, -1, type, 2000);
      usbMgr.claimInterface(gPipe, tmpInterface, true);
      try {
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'interrupt testUsbSubmitTransfer001 end');
        console.error('interrupt error:', error);
        expect(error.code).assertEqual(14400012);
        usbMgr.closePipe(devices);
        done()
      }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0200
     * @tc.name     : testUsbSubmitTransfer002
     * @tc.desc     : interrupt transfer. claimInterface no call. IO error.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'interrupt testUsbSubmitTransfer002 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer002 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
      let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 1, type, 2000);
      try {
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'interrupt testUsbSubmitTransfer002 end');
        console.error('interrupt IO error:', error);
        expect(error.code).assertEqual(14400012);
        usbMgr.closePipe(devices);
        done()
      }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0100
     * @tc.name     : testUsbSubmitTransfer003
     * @tc.desc     : interrupt transfer read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'interrupt testUsbSubmitTransfer003 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbSubmitTransfer003 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
      let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
      usbMgr.claimInterface(gPipe, tmpInterface, true);
      try {
        transferParams.callback = (err: Error, callBackData: usbMgr.SubmitTransferCallback) => {
          console.info('callBackData = ' + JSON.stringify(callBackData));
          console.info('testUsbSubmitTransfer003 transfer success, result = ' + transferParams.buffer.toString());
          expect(callBackData.status).assertEqual(usbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT);
          usbMgr.closePipe(devices);
          console.info(TAG, 'interrupt testUsbSubmitTransfer003 end');
          done()
        }
        await usbMgr.usbSubmitTransfer(transferParams);
      } catch (error) {
        console.error('interrupt error:', error);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_Func_0100
     * @tc.name     : testUsbCancelTransfer001
     * @tc.desc     : interrupt transfer cancel successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbCancelTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'interrupt testUsbCancelTransfer001 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbCancelTransfer001 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 2, 129, type, 2000);
      usbMgr.claimInterface(gPipe, tmpInterface, true);
      console.info(TAG, 'interrupt usbSubmitTransfer start');
      usbMgr.usbSubmitTransfer(transferParams);
      try {
        console.info(TAG, 'interrupt usbCancelTransfer start');
        usbMgr.usbCancelTransfer(transferParams);
        usbMgr.closePipe(devices);
        done()
      }catch (error) {
        console.error('interrupt error:', error);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_ErrCode_0100
     * @tc.name     : testUsbCancelTransfer002
     * @tc.desc     : interrupt transfer cancel failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbCancelTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'interrupt testUsbCancelTransfer002 enter');
      if (!isDeviceConnected) {
        console.info(TAG, 'usb testUsbCancelTransfer002 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done()
        return
      }
      let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
      let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
      let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
      let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 2, 129, type, 2000);
      try {
        usbMgr.usbCancelTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, 'interrupt testUsbCancelTransfer002 end');
        console.error('interrupt cancel failed:', error);
        expect(error.code).assertEqual(14400011);
        usbMgr.closePipe(devices);
        done()
      }
    });
  })
}