/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect } from "@ohos/hypium"
import usbDdk from 'libusbddkndk.so'

export default function usbDdkTest() {
  describe('UsbDdkTest', () => {

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_3500
     * @tc.name       : testUsbInit001
     * @tc.desc       : OH_Usb_Init Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbInit001', 0, async (done: Function) => {
      let data = usbDdk.usbInit();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_3600
     * @tc.name       : testUsbRelease001
     * @tc.desc       : OH_Usb_Release Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbRelease001', 0, async (done: Function) => {
      let data = usbDdk.usbRelease();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_3700
     * @tc.name       : testUsbGetDeviceDescriptor001
     * @tc.desc       : OH_Usb_GetDeviceDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetDeviceDescriptor001', 0, async (done: Function) => {
      let data = usbDdk.usbGetDeviceDescriptorOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_3800
     * @tc.name       : testUsbGetDeviceDescriptor002
     * @tc.desc       : OH_Usb_GetDeviceDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbGetDeviceDescriptor002', 0, async (done: Function) => {
      let data = usbDdk.usbGetDeviceDescriptorTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_3900
     * @tc.name       : testUsbGetConfigDescriptor001
     * @tc.desc       : OH_Usb_GetConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetConfigDescriptor001', 0, async (done: Function) => {
      let data = usbDdk.usbGetConfigDescriptorOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4000
     * @tc.name       : testUsbGetConfigDescriptor002
     * @tc.desc       : OH_Usb_GetConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbGetConfigDescriptor002', 0, async (done: Function) => {
      let data = usbDdk.usbGetConfigDescriptorTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4100
     * @tc.name       : testUsbGetConfigDescriptor003
     * @tc.desc       : OH_Usb_GetConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbGetConfigDescriptor003', 0, async (done: Function) => {
      let data = usbDdk.usbGetConfigDescriptorThree();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4200
     * @tc.name       : testUsbFreeConfigDescriptor001
     * @tc.desc       : OH_Usb_FreeConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbFreeConfigDescriptor001', 0, async (done: Function) => {
      let data = usbDdk.usbFreeConfigDescriptor();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4300
     * @tc.name       : testUsbClaimInterface001
     * @tc.desc       : OH_Usb_ClaimInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbClaimInterface001', 0, async (done: Function) => {
      let data = usbDdk.usbClaimInterfaceOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4400
     * @tc.name       : testUsbClaimInterface002
     * @tc.desc       : OH_Usb_ClaimInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbClaimInterface002', 0, async (done: Function) => {
      let data = usbDdk.usbClaimInterfaceTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4500
     * @tc.name       : testUsbClaimInterface003
     * @tc.desc       : OH_Usb_ClaimInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbClaimInterface003', 0, async (done: Function) => {
      let data = usbDdk.usbClaimInterfaceThree();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4600
     * @tc.name       : testUsbReleaseInterface001
     * @tc.desc       : OH_Usb_ReleaseInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbReleaseInterface001', 0, async (done: Function) => {
      let data = usbDdk.usbReleaseInterface();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4700
     * @tc.name       : testUsbSelectInterfaceSetting001
     * @tc.desc       : OH_Usb_SelectInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSelectInterfaceSetting001', 0, async (done: Function) => {
      let data = usbDdk.usbSelectInterfaceSettingOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4800
     * @tc.name       : testUsbSelectInterfaceSetting002
     * @tc.desc       : OH_Usb_SelectInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbSelectInterfaceSetting002', 0, async (done: Function) => {
      let data = usbDdk.usbSelectInterfaceSettingTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-4);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_4900
     * @tc.name       : testUsbGetCurrentInterfaceSetting001
     * @tc.desc       : OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetCurrentInterfaceSetting001', 0, async (done: Function) => {
      let data = usbDdk.usbGetCurrentInterfaceSettingOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5000
     * @tc.name       : testUsbGetCurrentInterfaceSetting002
     * @tc.desc       : OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetCurrentInterfaceSetting002', 0, async (done: Function) => {
      let data = usbDdk.usbGetCurrentInterfaceSettingTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-4);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5100
     * @tc.name       : testUsbGetCurrentInterfaceSetting003
     * @tc.desc       : OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbGetCurrentInterfaceSetting003', 0, async (done: Function) => {
      let data = usbDdk.usbGetCurrentInterfaceSettingThree();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5200
     * @tc.name       : testUsbSendControlReadRequest001
     * @tc.desc       : OH_Usb_SendControlReadRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendControlReadRequest001', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlReadRequestOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5300
     * @tc.name       : testUsbSendControlReadRequest002
     * @tc.desc       : OH_Usb_SendControlReadRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbSendControlReadRequest002', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlReadRequestTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-4);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5400
     * @tc.name       : testUsbSendControlReadRequest003
     * @tc.desc       : OH_Usb_SendControlReadRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbSendControlReadRequest003', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlReadRequestThree();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5500
     * @tc.name       : testUsbSendControlReadRequest004
     * @tc.desc       : OH_Usb_SendControlReadRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbSendControlReadRequest004', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlReadRequestFour();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5600
     * @tc.name       : testUsbSendControlReadRequest005
     * @tc.desc       : OH_Usb_SendControlReadRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbSendControlReadRequest005', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlReadRequestFive();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_5900
     * @tc.name       : testUsbSendControlWriteRequest001
     * @tc.desc       : OH_Usb_SendControlWriteRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendControlWriteRequest001', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlWriteRequestOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6000
     * @tc.name       : testUsbSendControlWriteRequest002
     * @tc.desc       : OH_Usb_SendControlWriteRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbSendControlWriteRequest002', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlWriteRequestTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-4);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6100
     * @tc.name       : testUsbSendControlWriteRequest003
     * @tc.desc       : OH_Usb_SendControlWriteRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbSendControlWriteRequest003', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlWriteRequestThree();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6200
     * @tc.name       : testUsbSendControlWriteRequest004
     * @tc.desc       : OH_Usb_SendControlWriteRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendControlWriteRequest004', 0, async (done: Function) => {
      let data = usbDdk.usbSendControlWriteRequestFour();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6300
     * @tc.name       : testUsbSendPipeRequest001
     * @tc.desc       : OH_Usb_SendPipeRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequest001', 0, async (done: Function) => {
      let data = usbDdk.usbSendPipeRequestOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6400
     * @tc.name       : testUsbSendPipeRequest002
     * @tc.desc       : OH_Usb_SendPipeRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequest002', 0, async (done: Function) => {
      let data = usbDdk.usbSendPipeRequestTwo();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-4);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6500
     * @tc.name       : testUsbSendPipeRequest003
     * @tc.desc       : OH_Usb_SendPipeRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequest003', 0, async (done: Function) => {
      let data = usbDdk.usbSendPipeRequestThree();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6600
     * @tc.name       : testUsbSendPipeRequest004
     * @tc.desc       : OH_Usb_SendPipeRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequest004', 0, async (done: Function) => {
      let data = usbDdk.usbSendPipeRequestFour();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6700
     * @tc.name       : testUsbCreateDeviceMemMap001
     * @tc.desc       : OH_Usb_CreateDeviceMemMap Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbCreateDeviceMemMap001', 0, async (done: Function) => {
      let data = usbDdk.usbCreateDeviceMemMapOne();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6800
     * @tc.name       : testUsbCreateDeviceMemMap002
     * @tc.desc       : OH_Usb_CreateDeviceMemMap Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbCreateDeviceMemMap002', 0, async (done: Function) => {
      let data = usbDdk.usbCreateDeviceMemMapTow();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(-2);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_USBDDK_6900
     * @tc.name       : testUsbDestroyDeviceMemMap001
     * @tc.desc       : OH_Usb_DestroyDeviceMemMap Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbDestroyDeviceMemMap001', 0, async (done: Function) => {
      let data = usbDdk.usbDestroyDeviceMemMap();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(1);
      done()
    });

  })

}

