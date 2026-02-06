/*
* Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import UsbMgr from '@ohos.usbManager';
import bundleManager from '@ohos.bundle.bundleManager';

let domain: int = 0x0000;
let tag: string = 'testTag';

function getTransfersParam(gPipe: UsbMgr.USBDevicePipe, flagsValue: UsbMgr.UsbTransferFlags,
  endpointValue: int, typeValue: UsbMgr.UsbEndpointTransferType, timeOutValue: int) {
  let transferParams: UsbMgr.UsbDataTransferParams = {
    devPipe: gPipe,
    flags: flagsValue,
    endpoint: endpointValue,
    type: typeValue,
    timeout: timeOutValue,
    length: 1000,
    callback: () => {
    },
    userData: new Uint8Array(1000),
    buffer: new Uint8Array(1000),
    isoPacketCount: 1,
  };
  return transferParams;
}

function deviceConnected(gDeviceList: Array<Readonly<UsbMgr.USBDevice>>) {
  if (gDeviceList.length > 0) {
    hilog.info(domain, tag, "Test USB device is connected");
    return true;
  }
  hilog.info(domain, tag, "Test USB device is not connected");
  return false;
}

function getPipe(testCaseName: string) {
    let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
    let devices: UsbMgr.USBDevice = gDeviceList[0];
    let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
    hilog.info(domain, tag, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
    expect(gPipe !== null).assertTrue();
}

function toClosePipe(testCaseName: string) {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  let devices: UsbMgr.USBDevice = gDeviceList[0];
  let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
  let isPipClose = UsbMgr.closePipe(gPipe);
  console.info(domain, tag, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
  expect(isPipClose).assertEqual(0);
}


export default function UsbManagerEnumTest() {

  describe("UsbManagerEnumTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    let isDeviceConnected: boolean = false;
    let devices: UsbMgr.USBDevice;
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');

      let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
      isDeviceConnected = deviceConnected(gDeviceList);
      if (isDeviceConnected) {
        devices = gDeviceList[0];
        hilog.info(domain, tag, '获取设备信息: %{public}s', JSON.stringify(gDeviceList));
        let hasRight = UsbMgr.hasRight(devices.name);
        if (!hasRight) {
          hilog.info(domain, tag, `beforeAll: usb requestRight start`);
        }
      }
      hilog.info(domain, tag, 'devices empty');
    })

    /**
     * @tc.name   testUsbSubmitTransfer001
     * @tc.number SUB_USB_HostMgr_JS_enum_0100
     * @tc.desc   enum UsbTransferStatus and UsbTransferFlags.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testUsbSubmitTransfer001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer001 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = devicesList[0];
          await UsbMgr.requestRight(devices.name);
          let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
          let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
          let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
          let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
          let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
          UsbMgr.claimInterface(gPipe, tmpInterface, true);
          try {
            transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined) => {
              hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
              hilog.info(domain, tag,
                'testUsbSubmitTransfer001 transfer success, result = ' + transferParams.buffer.toString());
              hilog.info(domain, tag, 'status = ' + callBackData?.status);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_COMPLETED).assertEqual(false);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_ERROR).assertEqual(false);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_CANCELED).assertEqual(false);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_STALL).assertEqual(false);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_NO_DEVICE).assertEqual(false);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertEqual(false);
              const descs = callBackData?.isoPacketDescs;
              if (descs && descs.length) {
                for (let j = 0; j < descs.length; j++) {
                  const i = descs[j];
                  hilog.info(domain, tag, 'isoPacketDescs length = ' + i.length);
                  hilog.info(domain, tag, 'isoPacketDescs actualLength = ' + i.actualLength);
                  hilog.info(domain, tag, 'isoPacketDescs status = ' + i.status);
                }
              }
              UsbMgr.closePipe(gPipe);
              hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer001 end');
              expect(flags!= UsbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK).assertEqual(true);
              expect(flags!= UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_TRANSFER).assertEqual(true);
              expect(flags!= UsbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET).assertEqual(true);
              done()
            }
            UsbMgr.usbSubmitTransfer(transferParams);
          } catch (error) {
            let err: BusinessError = error as BusinessError;
            hilog.info(domain, tag, 'interrupt error:', err.code);
            UsbMgr.closePipe(gPipe);
            done()
          }
        }
      })

    /**
     * @tc.name   testUsbSubmitTransfer002
     * @tc.number SUB_USB_HostMgr_JS_enum_0200
     * @tc.desc   enum TRANSFER_TYPE_ISOCHRONOUS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testUsbSubmitTransfer002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer002 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer002 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = devicesList[0];
          UsbMgr.requestRight(devices.name);
          hilog.info(domain, tag, 'interrupt connectDevice enter');
          let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
          hilog.info(domain, tag, 'interrupt connectDevice end');
          let tmpInterface: UsbMgr.USBInterface | undefined;
          let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK;
          let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
          let endpoint: UsbMgr.USBEndpoint | undefined;
          for (const config of devices.configs) {
            for (const intf of config.interfaces) {
              for (const ep of intf.endpoints) {
                if (ep && ep.address) {
                  endpoint = ep;
                  tmpInterface = intf;
                  break;
                }
              }
              if (endpoint) break;
            }
            if (endpoint) break;
          }
          if (endpoint) {
            hilog.info(domain, tag, 'UsbMgr.USBEndpoint = %{public}s', JSON.stringify(endpoint));
          } else {
            hilog.info(domain, tag, "没有有效的endpoint");
          }
          let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, endpoint!.address, type, 2000);
          UsbMgr.claimInterface(gPipe, tmpInterface!, true);
          try {
            transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined)=> {
              hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
              hilog.info(domain, tag,
                'testUsbSubmitTransfer002 transfer success, result = ' + transferParams.buffer.toString());
              hilog.info(domain, tag, 'status = ' + callBackData?.status);
              expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
              UsbMgr.closePipe(gPipe);
              hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer002 end');
              done()
            }
            hilog.info(domain, tag, 'interrupt usbSubmitTransfer enter');

            hilog.info(domain, tag, 'transferParams = ' + JSON.stringify(transferParams));
            UsbMgr.usbSubmitTransfer(transferParams);
            hilog.info(domain, tag, 'interrupt usbSubmitTransfer end');
          } catch (error) {
            let err: BusinessError = error as BusinessError;
            hilog.info(domain, tag, 'interrupt error:', err.code);
            UsbMgr.closePipe(gPipe);
            expect(err.code).assertEqual(14400012);
            done()
          }
        }
      })
  })
}