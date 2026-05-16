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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import usbMgr from '@ohos.usbManager';
import { BusinessError } from '@ohos.base';

const domain: int = 0x0000;
const tag: string = 'testTag';
const CAPACITY_NOT_SUPPORT_CODE: number = 801;
const USB_REQUEST_DIR_TO_DEVICE_STR: string = '0';
const USB_REQUEST_DIR_FROM_DEVICE_STR: string = '128';

export default function UsbManagerNormalHapTest() {
  describe("UsbManagerNormalHapTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll called');
    })

    /**
     * @tc.name   getDevicesTest001
     * @tc.number SUB_USB_HostManager_JS_Func_Static_0100
     * @tc.desc   Test usb API getDevices functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getDevicesTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '----------------------getDevicesTest001---------------------------');
      try {
        const devices: usbMgr.USBDevice[] = usbMgr.getDevices();
        hilog.info(domain, tag, JSON.stringify(devices));
        for (let i = 0; i < devices.length; i++) {
          const device: usbMgr.USBDevice = devices[i];
          hilog.info(domain, tag, "Device Information:");
          hilog.info(domain, tag, `  Bus Number: ${device.busNum}`);
          expect(typeof(device.busNum)).assertEqual('int');
          hilog.info(domain, tag, `  Device Address: ${device.devAddress}`);
          expect(typeof(device.devAddress)).assertEqual('int');
          hilog.info(domain, tag, `  Serial: ${device.serial}`);
          expect(typeof(device.serial)).assertEqual('string');
          hilog.info(domain, tag, `  Name: ${device.name}`);
          expect(typeof(device.name)).assertEqual('string');
          hilog.info(domain, tag, `  Manufacturer: ${device.manufacturerName}`);
          expect(typeof(device.manufacturerName)).assertEqual('string');
          hilog.info(domain, tag, `  Product Name: ${device.productName}`);
          expect(typeof(device.productName)).assertEqual('string');
          hilog.info(domain, tag, `  Version: ${device.version}`);
          expect(typeof(device.version)).assertEqual('string');
          hilog.info(domain, tag, `  Vendor ID: ${device.vendorId}`);
          expect(typeof(device.vendorId)).assertEqual('int');
          hilog.info(domain, tag, `  Product ID: ${device.productId}`);
          expect(typeof(device.productId)).assertEqual('int');
          hilog.info(domain, tag, `  Class: ${device.clazz}`);
          expect(typeof(device.clazz)).assertEqual('int');
          hilog.info(domain, tag, `  Subclass: ${device.subClass}`);
          expect(typeof(device.subClass)).assertEqual('int');
          hilog.info(domain, tag, `  Protocol: ${device.protocol}`);
          expect(typeof(device.protocol)).assertEqual('int');

          device.configs.forEach((config, configIndex) => {
            hilog.info(domain, tag, `\n  Configuration ${configIndex + 1}:`);
            hilog.info(domain, tag, `    ID: ${config.id}`);
            expect(typeof(config.id)).assertEqual('int');
            hilog.info(domain, tag, `    Attributes: ${config.attributes}`);
            expect(typeof(config.attributes)).assertEqual('int');
            hilog.info(domain, tag, `    Max Power: ${config.maxPower}`);
            expect(typeof(config.maxPower)).assertEqual('int');
            hilog.info(domain, tag, `    Name: ${config.name}`);
            expect(typeof(config.name)).assertEqual('string');
            hilog.info(domain, tag, `    Remote Wakeup: ${config.isRemoteWakeup}`);
            expect(typeof(config.isRemoteWakeup)).assertEqual('boolean');
            hilog.info(domain, tag, `    Self Powered: ${config.isSelfPowered}`);
            expect(typeof(config.isSelfPowered)).assertEqual('boolean');

            config.interfaces.forEach((iface, ifaceIndex) => {
              hilog.info(domain, tag, `\n    Interface ${ifaceIndex + 1}:`);
              hilog.info(domain, tag, `      ID: ${iface.id}`);
              expect(typeof(iface.id)).assertEqual('int');
              hilog.info(domain, tag, `      Protocol: ${iface.protocol}`);
              expect(typeof(iface.protocol)).assertEqual('int');
              hilog.info(domain, tag, `      Class: ${iface.clazz}`);
              expect(typeof(iface.clazz)).assertEqual('int');
              hilog.info(domain, tag, `      Subclass: ${iface.subClass}`);
              expect(typeof(iface.subClass)).assertEqual('int');
              hilog.info(domain, tag, `      Alternate Setting: ${iface.alternateSetting}`);
              expect(typeof(iface.alternateSetting)).assertEqual('int');
              hilog.info(domain, tag, `      Name: ${iface.name}`);
              expect(typeof(iface.name)).assertEqual('string');

              iface.endpoints.forEach((endpoint, endpointIndex) => {
                hilog.info(domain, tag, `\n      Endpoint ${endpointIndex + 1}:`);
                hilog.info(domain, tag, `        Address: ${endpoint.address}`);
                expect(typeof(endpoint.address)).assertEqual('int');
                hilog.info(domain, tag, `        Attributes: ${endpoint.attributes}`);
                expect(typeof(endpoint.attributes)).assertEqual('int');
                hilog.info(domain, tag, `        Interval: ${endpoint.interval}`);
                expect(typeof(endpoint.interval)).assertEqual('int');
                hilog.info(domain, tag, `        Max Packet Size: ${endpoint.maxPacketSize}`);
                expect(typeof(endpoint.maxPacketSize)).assertEqual('int');
                hilog.info(domain, tag, `        Direction: ${endpoint.direction}`);
                expect(typeof(endpoint.direction)).assertEqual('int');
                hilog.info(domain, tag, `        Endpoint Number: ${endpoint.endpointAddr}`);
                expect(typeof(endpoint.endpointAddr)).assertEqual('int');
                hilog.info(domain, tag, `        Type: ${endpoint.type}`);
                expect(typeof(endpoint.type)).assertEqual('int');
                hilog.info(domain, tag, `        Interface ID: ${endpoint.interfaceId}`);
                expect(typeof(endpoint.interfaceId)).assertEqual('int');
              });
            });
          });
        }
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', JSON.stringify(err));
        expect(err?.code).assertEqual(CAPACITY_NOT_SUPPORT_CODE);
      }
      done()
      hilog.info(domain, tag, '%{public}s', 'getDevicesTest001 end');
    })

    /**
     * @tc.name   usbEnumTest001
     * @tc.number SUB_USB_HostManager_JS_Func_Static_0200
     * @tc.desc   Test usb enumeration coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("usbEnumTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '----------------------usbEnumTest001---------------------------');
      hilog.info(domain, tag, `USB_REQUEST_DIR_TO_DEVICE: ${usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE}`);
      expect(typeof(usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE)).assertEqual('int');
      expect(usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE.toString()).assertEqual(USB_REQUEST_DIR_TO_DEVICE_STR);
      hilog.info(domain, tag, `USB_REQUEST_DIR_FROM_DEVICE: ${usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE}`);
      expect(typeof(usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE)).assertEqual('int');
      expect(usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE.toString()).assertEqual(USB_REQUEST_DIR_FROM_DEVICE_STR);
      done()
      hilog.info(domain, tag, '%{public}s', 'usbEnumTest001 end');
    })
  })
}