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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import { usbManager } from '@kit.MDMKit';
import restrictions from '@ohos.enterprise.restrictions';

const DISALLOWED_USB_DEVICES_MAX_SIZE = 200;
const LABEL_USB = 'usb';

export default function usbManagerTest() {
  describe('usbManager_test', () => {
    testAddAllowedUsbDevices();
    testRemoveAllowedUsbDevices();
    testGetAllowedUsbDevices();
    testSetUsbStorageDeviceAccessPolicy();
    testGetUsbStorageDeviceAccessPolicy();
    testAddDisallowedUsbDevices();
    testRemoveDisallowedUsbDevices();
    testGetDisallowedUsbDevices();
  })
}

function testAddAllowedUsbDevices() {
  /**
   * @tc.name   test_add_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager addAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveAllowedUsbDevices() {
  /**
   * @tc.name   test_remove_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager removeAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.removeAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetAllowedUsbDevices() {
  /**
   * @tc.name   test_get_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager getAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getAllowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetUsbStorageDeviceAccessPolicy() {
  /**
   * @tc.name   test_set_usb_device_access_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0001
   * @tc.desc   test usbManager setUsbStorageDeviceAccessPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_usb_device_access_policy_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_ONLY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetUsbStorageDeviceAccessPolicy() {
  /**
   * @tc.name   test_get_usb_device_access_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0002
   * @tc.desc   test usbManager getUsbStorageDeviceAccessPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_usb_device_access_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddDisallowedUsbDevices() {
  /**
   * @tc.name   test_add_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager addDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveDisallowedUsbDevices() {
  /**
   * @tc.name   test_remove_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager removeDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedUsbDevices() {
  /**
   * @tc.name   test_get_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager getDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}