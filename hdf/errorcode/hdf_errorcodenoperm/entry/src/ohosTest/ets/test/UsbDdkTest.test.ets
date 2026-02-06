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
import baskddkerror from 'libbaskddkerrorcodenoperm.so'
import { deviceManager } from '@kit.DriverDevelopmentKit';

const Success = 0
const TAG: string = "[HidEmitEventTest]";
export default function UsbDDkNoPermTest() {
  let deviceId: number = -1;
  describe('UsbDDkNoPermTest', () => {
    beforeAll(async () => {
      console.log(TAG, '*************hid Unit HidEmitEventTest start*************');
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_Release_0100
     * @tc.name     testOH_Usb_Release_0100
     * @tc.desc     Test OH_Usb_Release interface USB_DDK_INVALID_OPERATION(27400002)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_Release_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_Release_0100 sta`rt====");
        let result:number = baskddkerror.ReleaseTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_Release_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_Release_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_ReleaseResource_0100
     * @tc.name     testOH_Usb_ReleaseResource_0100
     * @tc.desc     Test OH_Usb_ReleaseResource interface USB_DDK_INVALID_OPERATION(27400002)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_ReleaseResource_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_ReleaseResource_0100 sta`rt====");
        let result:number = baskddkerror.ReleaseResourceTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_ReleaseResource_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_ReleaseResource_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_ReleaseResource_0200
     * @tc.name     testOH_Usb_ReleaseResource_0200
     * @tc.desc     Test OH_Usb_ReleaseResource interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_ReleaseResource_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_ReleaseResource_0200 sta`rt====");
        let result:number = baskddkerror.ReleaseResourceTest_002();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_ReleaseResource_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_ReleaseResource_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_GetDeviceDescriptor_0100
     * @tc.name     testOH_Usb_GetDeviceDescriptor_0100
     * @tc.desc     Test OH_Usb_GetDeviceDescriptor interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_GetDeviceDescriptor_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_GetDeviceDescriptor_0100 sta`rt====");
        let result:number = baskddkerror.GetDeviceDescriptorTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_GetDeviceDescriptor_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_GetDeviceDescriptor_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_GetConfigDescriptor_0100
     * @tc.name     testOH_Usb_GetConfigDescriptor_0100
     * @tc.desc     Test OH_Usb_GetConfigDescriptor interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_GetConfigDescriptor_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_GetConfigDescriptor_0100 sta`rt====");
        let result:number = baskddkerror.GetConfigDescriptorTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_GetConfigDescriptor_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_GetConfigDescriptor_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_FreeConfigDescriptor_0100
     * @tc.name     testOH_Usb_FreeConfigDescriptor_0100
     * @tc.desc     Test OH_Usb_FreeConfigDescriptor interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_FreeConfigDescriptor_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_FreeConfigDescriptor_0100 sta`rt====");
        let result:number = baskddkerror.FreeConfigDescriptorTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_FreeConfigDescriptor_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_FreeConfigDescriptor_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_ClaimInterface_0100
     * @tc.name     testOH_Usb_ClaimInterface_0100
     * @tc.desc     Test OH_Usb_ClaimInterface interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_ClaimInterface_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_ClaimInterface_0100 sta`rt====");
        let result:number = baskddkerror.ClaimInterfaceTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_ClaimInterface_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_ClaimInterface_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_ReleaseInterface_0100
     * @tc.name     testOH_Usb_ReleaseInterface_0100
     * @tc.desc     Test OH_Usb_ReleaseInterface interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_ReleaseInterface_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_ReleaseInterface_0100 sta`rt====");
        let result:number = baskddkerror.ReleaseInterfaceTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_ReleaseInterface_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_ReleaseInterface_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_SelectInterfaceSetting_0100
     * @tc.name     testOH_Usb_SelectInterfaceSetting_0100
     * @tc.desc     Test OH_Usb_SelectInterfaceSetting interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_SelectInterfaceSetting_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_SelectInterfaceSetting_0100 sta`rt====");
        let result:number = baskddkerror.SelectInterfaceSettingTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_SelectInterfaceSetting_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_SelectInterfaceSetting_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_GetCurrentInterfaceSetting_0100
     * @tc.name     testOH_Usb_GetCurrentInterfaceSetting_0100
     * @tc.desc     Test OH_Usb_GetCurrentInterfaceSetting interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_GetCurrentInterfaceSetting_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_GetCurrentInterfaceSetting_0100 sta`rt====");
        let result:number = baskddkerror.GetCurrentInterfaceSettingTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_GetCurrentInterfaceSetting_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_GetCurrentInterfaceSetting_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_SendControlReadRequest_0100
     * @tc.name     testOH_Usb_SendControlReadRequest_0100
     * @tc.desc     Test OH_Usb_SendControlReadRequest interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_SendControlReadRequest_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_SendControlReadRequest_0100 sta`rt====");
        let result:number = baskddkerror.SendControlReadRequestTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_SendControlReadRequest_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_SendControlReadRequest_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_SendControlWriteRequest_0100
     * @tc.name     testOH_Usb_SendControlWriteRequest_0100
     * @tc.desc     Test OH_Usb_SendControlWriteRequest interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_SendControlWriteRequest_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_SendControlWriteRequest_0100 sta`rt====");
        let result:number = baskddkerror.SendControlWriteRequestTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_SendControlWriteRequest_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_SendControlWriteRequest_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_CreateDeviceMemMap_0100
     * @tc.name     testOH_Usb_CreateDeviceMemMap_0100
     * @tc.desc     Test OH_Usb_CreateDeviceMemMap interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_CreateDeviceMemMap_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_CreateDeviceMemMap_0100 sta`rt====");
        let result:number = baskddkerror.CreateDeviceMemMapTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_CreateDeviceMemMap_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_CreateDeviceMemMap_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_DestroyDeviceMemMap_0100
     * @tc.name     testOH_Usb_DestroyDeviceMemMap_0100
     * @tc.desc     Test OH_Usb_DestroyDeviceMemMap interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_DestroyDeviceMemMap_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_DestroyDeviceMemMap_0100 sta`rt====");
        let result:number = baskddkerror.DestroyDeviceMemMapTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_DestroyDeviceMemMap_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_DestroyDeviceMemMap_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_OH_Usb_GetDevices_0100
     * @tc.name     testOH_Usb_GetDevices_0100
     * @tc.desc     Test OH_Usb_GetDevices interface USB_DDK_NO_PERM(201)
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testOH_Usb_GetDevices_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOH_Usb_GetDevices_0100 sta`rt====");
        let result:number = baskddkerror.GetDevicesTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testOH_Usb_GetDevices_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testOH_Usb_GetDevices_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_USB_DDK_INVALID_OPERATION_0100
     * @tc.name     testUSB_DDK_INVALID_OPERATION_0100
     * @tc.desc     Test UsbDdkErrCode interface USB_DDK_INVALID_OPERATION
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testUSB_DDK_INVALID_OPERATION_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUSB_DDK_INVALID_OPERATION_0100 sta`rt====");
        let result:number = baskddkerror.UsbDdkErrCodeTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testUSB_DDK_INVALID_OPERATION_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUSB_DDK_INVALID_OPERATION_0100 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}
