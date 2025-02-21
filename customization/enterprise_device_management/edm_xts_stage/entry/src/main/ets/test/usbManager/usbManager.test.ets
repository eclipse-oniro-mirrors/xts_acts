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
import usbManager from '@ohos.enterprise.usbManager';

export default function usbManagerTest() {
  describe('usbManager_test', () => {
    testAddAllowedUsbDevices();
    testRemoveAllowedUsbDevices();
    testGetAllowedUsbDevices();
    testSetUsbStorageDeviceAccessPolicy();
    testGetUsbStorageDeviceAccessPolicy();
  })
}

function testAddAllowedUsbDevices() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0001
   * @tc.name      : test_add_allowed_usb_devices_0001
   * @tc.desc      : test usbManager addAllowedUsbDevices without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceIds> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0002
   * @tc.name      : test_add_allowed_usb_devices_0002
   * @tc.desc      : test usbManager addAllowedUsbDevices with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_allowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceIds> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0003
   * @tc.name      : test_add_allowed_usb_devices_0003
   * @tc.desc      : test usbManager addAllowedUsbDevices with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_allowed_usb_devices_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceIds> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices);
      let ret: Array<usbManager.UsbDeviceIds> = usbManager.getAllowedUsbDevices(SELFWANT);
      expect(ret.length == devices.length).assertTrue();
      usbManager.removeAllowedUsbDevices(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0004
   * @tc.name      : test_add_allowed_usb_devices_0004
   * @tc.desc      : test usbManager addAllowedUsbDevices with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_allowed_usb_devices_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices1: Array<usbManager.UsbDeviceIds> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      let devices2: Array<usbManager.UsbDeviceIds> = [
        {vendorId: 2, productId: 2},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices1);
      usbManager.addAllowedUsbDevices(SELFWANT, devices2);
      let ret: Array<usbManager.UsbDeviceIds> = usbManager.getAllowedUsbDevices(SELFWANT);
      expect(ret.length == 3).assertTrue();
      usbManager.removeAllowedUsbDevices(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0005
   * @tc.name      : test_add_allowed_usb_devices_0005
   * @tc.desc      : test usbManager addAllowedUsbDevices with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
    it("test_add_allowed_usb_devices_0005", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let devices: Array<usbManager.UsbDeviceIds> = []
        for (let i = 0; i < 1000; i++) {
          let temp: usbManager.UsbDeviceIds = {
            vendorId: 2,
            productId: i + 1
          };
          devices.push(temp);
        }
        usbManager.addAllowedUsbDevices(SELFWANT, devices);
        let ret: Array<usbManager.UsbDeviceIds> = usbManager.getAllowedUsbDevices(SELFWANT);
        expect(ret.length == 1000).assertTrue();
      } catch (error) {
        expect(error == null).assertTrue();
      }

      try {
        let devices: Array<usbManager.UsbDeviceIds> = [{vendorId: 22, productId: 33}]
        usbManager.addAllowedUsbDevices(SELFWANT, devices);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        let ret: Array<usbManager.UsbDeviceIds> = usbManager.getAllowedUsbDevices(SELFWANT);
        usbManager.removeAllowedUsbDevices(SELFWANT, ret);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
}

function testRemoveAllowedUsbDevices() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_USB_DEVICES_JS_0001
   * @tc.name      : test_remove_allowed_usb_devices_0001
   * @tc.desc      : test usbManager removeAllowedUsbDevices without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceIds> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.removeAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_USB_DEVICES_JS_0002
   * @tc.name      : test_remove_allowed_usb_devices_0002
   * @tc.desc      : test usbManager removeAllowedUsbDevices with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_allowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceIds> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.removeAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetAllowedUsbDevices() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_USB_DEVICES_JS_0001
   * @tc.name      : test_get_allowed_usb_devices_0001
   * @tc.desc      : test usbManager getAllowedUsbDevices without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.getAllowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_USB_DEVICES_JS_0002
   * @tc.name      : test_get_allowed_usb_devices_0002
   * @tc.desc      : test usbManager getAllowedUsbDevices with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_allowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getAllowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetUsbStorageDeviceAccessPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0001
   * @tc.name      : test_set_usb_device_access_policy_0001
   * @tc.desc      : test usbManager setUsbStorageDeviceAccessPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_usb_device_access_policy_0001", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_WRITE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0002
   * @tc.name      : test_set_usb_device_access_policy_0002
   * @tc.desc      : test usbManager setUsbStorageDeviceAccessPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_usb_device_access_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_ONLY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0003
   * @tc.name      : test_set_usb_device_access_policy_0003
   * @tc.desc      : test usbManager setUsbStorageDeviceAccessPolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_usb_device_access_policy_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.DISABLED);
      let getPolicy: usbManager.UsbPolicy = usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);;
      expect(getPolicy == usbManager.UsbPolicy.DISABLED).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetUsbStorageDeviceAccessPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0001
   * @tc.name      : test_get_usb_device_access_policy_0001
   * @tc.desc      : test usbManager getUsbStorageDeviceAccessPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_usb_device_access_policy_0001", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0002
   * @tc.name      : test_get_usb_device_access_policy_0002
   * @tc.desc      : test usbManager getUsbStorageDeviceAccessPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_usb_device_access_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}