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

const TAG: string = "[UsbApiBulkTransferTest]";
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
        isoPacketCount: 2,
    };
    return transferParams;
}

export default function UsbApiBulkTransferTest() {
  
    describe('UsbApiBulkTransferTest', () => {
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
        usbMgr.removeRight(devices.name);
        console.log('*************Usb Unit UsbApiBulkTransferTest End*************');
    })

    beforeEach(() => {
        console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
    })

     /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0100
     * @tc.name     : testUsbSubmitTransfer001
     * @tc.desc     : bulk transfer write successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbSubmitTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer001 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK;
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 1, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            transferParams.callback = (err: Error, callBackData: usbMgr.SubmitTransferCallback) => {
                console.info('callBackData = ' + JSON.stringify(callBackData));
                console.info('testUsbSubmitTransfer001 transfer success, result = ' + transferParams.buffer.toString());
                expect(callBackData.status == usbMgr.UsbTransferStatus.TRANSFER_COMPLETED).assertTrue();
                expect(callBackData.actualLength).assertEqual(transferParams.buffer.length);
                usbMgr.closePipe(devices);
                done()
            }
            await usbMgr.usbSubmitTransfer(transferParams);
            console.info(TAG, 'bulk testUsbSubmitTransfer001 end');
        } catch (error) {
            expect().assertFail();
            console.error('bulk write error:', error);
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0200
     * @tc.name     : testUsbSubmitTransfer002
     * @tc.desc     : bulk transfer read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbSubmitTransfer002 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer002 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            transferParams.callback = (err: Error, callBackData: usbMgr.SubmitTransferCallback) => {
                console.info('callBackData = ' + JSON.stringify(callBackData));
                console.info('testUsbSubmitTransfer002 transfer success, result = ' + transferParams.buffer.toString());
                expect(callBackData.status == usbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertTrue();
                usbMgr.closePipe(devices);
                done()
            }
            await usbMgr.usbSubmitTransfer(transferParams);
            console.info(TAG, 'bulk testUsbSubmitTransfer002 end');
        } catch (error) {
            expect().assertFail();
            console.error('bulk error:', error);
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0100
     * @tc.name     : testUsbSubmitTransfer003
     * @tc.desc     : bulk transfer error endpoint. IO error.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info(TAG, 'bulk testUsbSubmitTransfer003 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer003 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_TRANSFER;
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, -1, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'bulk testUsbSubmitTransfer003 end');
            console.error('bulk transfer error endpoint:', error);
            expect(error.code).assertEqual(14400012);
            usbMgr.closePipe(devices);
            done();
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0300
     * @tc.name     : testUsbSubmitTransfer004
     * @tc.desc     : bulk transfer claimInterface no call. connectDevice no call.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info(TAG, 'bulk testUsbSubmitTransfer004 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer004 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        let gPipe: usbMgr.USBDevicePipe = {
            'busNum': 0,
            'devAddress': 0
        }
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        try {
            await usbMgr.usbSubmitTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'bulk testUsbSubmitTransfer004 end');
            console.error('bulk failed:', error);
            expect(error.code).assertEqual(14400001);
            usbMgr.closePipe(devices);
            done();
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_UsbCancelTransfer_Func_0100
     * @tc.name     : testUsbCancelTransfer001
     * @tc.desc     : bulk transfer cancel successfully. 
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbCancelTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbCancelTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbCancelTransfer001 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 0);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            usbMgr.usbCancelTransfer(transferParams);
            console.info(TAG, 'bulk testUsbCancelTransfer001 end');
            usbMgr.closePipe(devices);
            done();
        } catch (error) {
            expect().assertFail();
            console.error('bulk cancel error:', error);
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_UsbCancelTransfer_ErrCode_0100
     * @tc.name     : testUsbCancelTransfer002
     * @tc.desc     : bulk transfer cancel failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbCancelTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info(TAG, 'bulk testUsbCancelTransfer002 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbCancelTransfer002 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 1, type, 500);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'bulk testUsbCancelTransfer002 end');
            console.error('bulk cancel error:', error);
            usbMgr.closePipe(devices);
            expect(error.code).assertEqual(14400011);
            done();
        }
    });

  })
}
