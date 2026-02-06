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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium'
import baskddkerror from 'libbaskddkerrorcode.so'
import { deviceManager } from '@kit.DriverDevelopmentKit';

export default function UsbTest() {
  let dev: number = -1;
  describe('UsbTest', () => {
    beforeAll(async () => {
      try {
        let devices: Array<deviceManager.Device> = deviceManager.queryDevices(deviceManager.BusType.USB);
        for (let item of devices) {
          let device: deviceManager.USBDevice = item as deviceManager.USBDevice;
          dev = device.deviceId;
          console.info(`Device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
    })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBDDKCONFIGDESCRIPTOR_EXTRA_0100
     * @tc.name     TestUsbDdkConfigDescriptor0100
     * @tc.desc     Test UsbDdkConfigDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbDdkConfigDescriptor0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbDdkConfigDescriptor0100 start====");
          let result: number = baskddkerror.UsbDdkConfigDescriptor0100(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbDdkConfigDescriptor0100 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbDdkConfigDescriptor0100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBDDKCONFIGDESCRIPTOR_EXTRALENGTH_0200
     * @tc.name     TestUsbDdkConfigDescriptor0200
     * @tc.desc     Test UsbDdkConfigDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbDdkConfigDescriptor0200', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbDdkConfigDescriptor0200 start====");
          let result: number = baskddkerror.UsbDdkConfigDescriptor0200(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbDdkConfigDescriptor0200 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbDdkConfigDescriptor0200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBDDKINTERFACEDESCRIPTOR_EXTRA_0100
     * @tc.name     TestUsbDdkInterfaceDescriptor0100
     * @tc.desc     Test UsbDdkInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbDdkInterfaceDescriptor0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbDdkInterfaceDescriptor0100 start====");
          let result: number = baskddkerror.UsbDdkInterfaceDescriptor0100(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbDdkInterfaceDescriptor0100 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbDdkInterfaceDescriptor0100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBDDKINTERFACEDESCRIPTOR_EXTRALENGTH_0200
     * @tc.name     TestUsbDdkInterfaceDescriptor0200
     * @tc.desc     Test UsbDdkInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbDdkInterfaceDescriptor0200', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbDdkInterfaceDescriptor0200 start====");
          let result: number = baskddkerror.UsbDdkInterfaceDescriptor0200(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbDdkInterfaceDescriptor0200 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbDdkInterfaceDescriptor0200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_UsbDdkEndpointDescriptor_EXTRA_0100
     * @tc.name     TestUsbDdkEndpointDescriptor0100
     * @tc.desc     Test UsbDdkEndpointDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbDdkEndpointDescriptor0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbDdkEndpointDescriptor0100 start====");
          let result: number = baskddkerror.UsbDdkEndpointDescriptor0100(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbDdkEndpointDescriptor0100 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbDdkEndpointDescriptor0100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBDDKENDPOINTDESCRIPTOR_EXTRALENGTH_0200
     * @tc.name     TestUsbDdkEndpointDescriptor0200
     * @tc.desc     Test UsbDdkEndpointDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbDdkEndpointDescriptor0200', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbDdkEndpointDescriptor0200 start====");
          let result: number = baskddkerror.UsbDdkEndpointDescriptor0200(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbDdkEndpointDescriptor0200 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbDdkEndpointDescriptor0200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBENDPOINTDESCRIPTOR_BLENGTH_0100
     * @tc.name     TestUsbEndpointDescriptor0100
     * @tc.desc     Test UsbEndpointDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbEndpointDescriptor0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbEndpointDescriptor0100 start====");
          let result: number = baskddkerror.UsbEndpointDescriptor0100(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbEndpointDescriptor0100 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbEndpointDescriptor0100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBENDPOINTDESCRIPTOR_BDESCRIPTORTYPE_0200
     * @tc.name     TestUsbEndpointDescriptor0200
     * @tc.desc     Test UsbEndpointDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbEndpointDescriptor0200', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbEndpointDescriptor0200 start====");
          let result: number = baskddkerror.UsbEndpointDescriptor0200(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbEndpointDescriptor0200 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbEndpointDescriptor0200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBENDPOINTDESCRIPTOR_BINTERVAL_0300
     * @tc.name     TestUsbEndpointDescriptor0300
     * @tc.desc     Test UsbEndpointDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbEndpointDescriptor0300', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbEndpointDescriptor0300 start====");
          let result: number = baskddkerror.UsbEndpointDescriptor0300(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbEndpointDescriptor0300 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbEndpointDescriptor0300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBENDPOINTDESCRIPTOR_BREFRESH_0400
     * @tc.name     TestUsbEndpointDescriptor0400
     * @tc.desc     Test UsbEndpointDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbEndpointDescriptor0400', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbEndpointDescriptor0400 start====");
          let result: number = baskddkerror.UsbEndpointDescriptor0400(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbEndpointDescriptor0400 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbEndpointDescriptor0400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBENDPOINTDESCRIPTOR_BSYNCHADDRESS_0500
     * @tc.name     TestUsbEndpointDescriptor0500
     * @tc.desc     Test UsbEndpointDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbEndpointDescriptor0500', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbEndpointDescriptor0500 start====");
          let result: number = baskddkerror.UsbEndpointDescriptor0500(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbEndpointDescriptor0500 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbEndpointDescriptor0500 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBINTERFACEDESCRIPTOR_BLENGTH_0100
     * @tc.name     TestUsbInterfaceDescriptor0100
     * @tc.desc     Test UsbInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbInterfaceDescriptor0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbInterfaceDescriptor0100 start====");
          let result: number = baskddkerror.UsbInterfaceDescriptor0100(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbInterfaceDescriptor0100 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbInterfaceDescriptor0100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBINTERFACEDESCRIPTOR_BDESCRIPTORTYPE_0200
     * @tc.name     TestUsbInterfaceDescriptor0200
     * @tc.desc     Test UsbInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbInterfaceDescriptor0200', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbInterfaceDescriptor0200 start====");
          let result: number = baskddkerror.UsbInterfaceDescriptor0200(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbInterfaceDescriptor0200 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbInterfaceDescriptor0200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBINTERFACEDESCRIPTOR_BALTERNATESETTING_0300
     * @tc.name     TestUsbInterfaceDescriptor0300
     * @tc.desc     Test UsbInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbInterfaceDescriptor0300', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbInterfaceDescriptor0300 start====");
          let result: number = baskddkerror.UsbInterfaceDescriptor0300(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbInterfaceDescriptor0300 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbInterfaceDescriptor0300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBINTERFACEDESCRIPTOR_BINTERFACECLASS_0400
     * @tc.name     TestUsbInterfaceDescriptor0400
     * @tc.desc     Test UsbInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbInterfaceDescriptor0400', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbInterfaceDescriptor0400 start====");
          let result: number = baskddkerror.UsbInterfaceDescriptor0400(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbInterfaceDescriptor0400 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbInterfaceDescriptor0400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBINTERFACEDESCRIPTOR_BINTERFACESUBCLASS_0500
     * @tc.name     TestUsbInterfaceDescriptor0500
     * @tc.desc     Test UsbInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbInterfaceDescriptor0500', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbInterfaceDescriptor0500 start====");
          let result: number = baskddkerror.UsbInterfaceDescriptor0500(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbInterfaceDescriptor0500 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbInterfaceDescriptor0500 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBINTERFACEDESCRIPTOR_BINTERFACEPROTOCOL_0600
     * @tc.name     TestUsbInterfaceDescriptor0600
     * @tc.desc     Test UsbInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbInterfaceDescriptor0600', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbInterfaceDescriptor0600 start====");
          let result: number = baskddkerror.UsbInterfaceDescriptor0600(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbInterfaceDescriptor0600 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbInterfaceDescriptor0600 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_DRIVER_EXT_USBINTERFACEDESCRIPTOR_IINTERFACE_0700
     * @tc.name     TestUsbInterfaceDescriptor0700
     * @tc.desc     Test UsbInterfaceDescriptor.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbInterfaceDescriptor0700', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbInterfaceDescriptor0700 start====");
          let result: number = baskddkerror.UsbInterfaceDescriptor0700(dev);
          if (dev == -1) {
            expect(result).assertEqual(0);
          }
          console.info("====>TestUsbInterfaceDescriptor0700 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbInterfaceDescriptor0700 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   TestUsbAddress0800
     * @tc.name     TestUsbAddress0800
     * @tc.desc     Test UsbAddress0800.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbAddress0800', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbAddress0800 start====");
          let result: number = baskddkerror.UsbAddress0800(dev);
          expect(result).assertEqual(0);
          console.info("====>TestUsbAddress0800 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbAddress0800 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   TestUsbOffset0900
     * @tc.name     TestUsbOffset0900
     * @tc.desc     Test UsbOffset0900.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbOffset0900', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbOffset0900 start====");
          let result: number = baskddkerror.UsbOffset0900(dev);
          expect(result).assertEqual(0);
          console.info("====>TestUsbOffset0900 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbOffset0900 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   TestUsbSize1000
     * @tc.name     TestUsbSize1000
     * @tc.desc     Test UsbSize1000.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbSize1000', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbSize1000 start====");
          let result: number = baskddkerror.UsbSize1000(dev);
          expect(result).assertEqual(0);
          console.info("====>TestUsbSize1000 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbSize1000 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   TestUsbBufferLength1100
     * @tc.name     TestUsbBufferLength1100
     * @tc.desc     Test UsbBufferLength1100.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbBufferLength1100', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbBufferLength1100 start====");
          let result: number = baskddkerror.UsbBufferLength1100(dev);
          expect(result).assertEqual(0);
          console.info("====>TestUsbBufferLength1100 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbBufferLength1100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number   TestUsbTransferedLength1200
     * @tc.name     TestUsbTransferedLength1200
     * @tc.desc     Test UsbTransferedLength1200.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('TestUsbTransferedLength1200', Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>TestUsbTransferedLength1200 start====");
          let result: number = baskddkerror.UsbTransferedLength1200(dev);
          expect(result).assertEqual(0);
          console.info("====>TestUsbTransferedLength1200 result: " + result);
          done()
        } catch (err) {
          console.error("====>TestUsbTransferedLength1200 catch err: " + err);
          expect().assertFail();
        }
      })

  })
}