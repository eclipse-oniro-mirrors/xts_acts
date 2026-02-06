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
   * @tc.desc   test usbManager addAllowedUsbDevices without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
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
   * @tc.name   test_add_allowed_usb_devices_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0002
   * @tc.desc   test usbManager addAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
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
   * @tc.name   test_add_allowed_usb_devices_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0003
   * @tc.desc   test usbManager addAllowedUsbDevices with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_usb_devices_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices);
      let ret: Array<usbManager.UsbDeviceId> = usbManager.getAllowedUsbDevices(SELFWANT);
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
   * @tc.name   test_add_allowed_usb_devices_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0004
   * @tc.desc   test usbManager addAllowedUsbDevices with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_usb_devices_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices1: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      let devices2: Array<usbManager.UsbDeviceId> = [
        {vendorId: 2, productId: 2},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices1);
      usbManager.addAllowedUsbDevices(SELFWANT, devices2);
      let ret: Array<usbManager.UsbDeviceId> = usbManager.getAllowedUsbDevices(SELFWANT);
      expect(ret.length == 3).assertTrue();
      usbManager.removeAllowedUsbDevices(SELFWANT, ret);
      let result: Array<usbManager.UsbDeviceId> = usbManager.getAllowedUsbDevices(SELFWANT);
      expect(result.length == 0).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

    /**
     * @tc.name   test_add_allowed_usb_devices_0005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0005
     * @tc.desc   test usbManager addAllowedUsbDevices with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_add_allowed_usb_devices_0005", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let devices: Array<usbManager.UsbDeviceId> = []
        for (let i = 0; i < 1000; i++) {
          let temp: usbManager.UsbDeviceId = {
            vendorId: 2,
            productId: i + 1
          };
          devices.push(temp);
        }
        usbManager.addAllowedUsbDevices(SELFWANT, devices);
        let ret: Array<usbManager.UsbDeviceId> = usbManager.getAllowedUsbDevices(SELFWANT);
        expect(ret.length == 1000).assertTrue();
      } catch (error) {
        expect(error == null).assertTrue();
      }

      try {
        let devices: Array<usbManager.UsbDeviceId> = [{vendorId: 22, productId: 33}]
        usbManager.addAllowedUsbDevices(SELFWANT, devices);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        let ret: Array<usbManager.UsbDeviceId> = usbManager.getAllowedUsbDevices(SELFWANT);
        usbManager.removeAllowedUsbDevices(SELFWANT, ret);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
}

function testRemoveAllowedUsbDevices() {
  /**
   * @tc.name   test_remove_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager removeAllowedUsbDevices without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
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
   * @tc.name   test_remove_allowed_usb_devices_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USB_DEVICES_JS_0002
   * @tc.desc   test usbManager removeAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
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
   * @tc.name   test_get_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager getAllowedUsbDevices without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_allowed_usb_devices_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_DEVICES_JS_0002
   * @tc.desc   test usbManager getAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_allowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_set_usb_device_access_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0001
   * @tc.desc   test usbManager setUsbStorageDeviceAccessPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_usb_device_access_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0002
   * @tc.desc   test usbManager setUsbStorageDeviceAccessPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_usb_device_access_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_set_usb_device_access_policy_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0003
   * @tc.desc   test usbManager setUsbStorageDeviceAccessPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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

  /**
   * @tc.name   test_set_usb_device_access_policy_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0004
   * @tc.desc   test usbManager setUsbStorageDeviceAccessPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_usb_device_access_policy_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(null, usbManager.UsbPolicy.READ_ONLY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetUsbStorageDeviceAccessPolicy() {
  /**
   * @tc.name   test_get_usb_device_access_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0001
   * @tc.desc   test usbManager getUsbStorageDeviceAccessPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_usb_device_access_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0002
   * @tc.desc   test usbManager getUsbStorageDeviceAccessPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_usb_device_access_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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

  /**
   * @tc.name   test_get_usb_device_access_policy_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0003
   * @tc.desc   test usbManager getUsbStorageDeviceAccessPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_usb_device_access_policy_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.getUsbStorageDeviceAccessPolicy(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddDisallowedUsbDevices() {
  /**
   * @tc.name   test_add_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager addDisallowedUsbDevices with inactive admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0002
   * @tc.desc   test usbManager addDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0003
   * @tc.desc   test usbManager addDisallowedUsbDevices with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0003", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(null, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0004
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin for multiple types
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == devices.length).assertTrue();
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret);
      let result: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(result.length == 0).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0005
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin for single type
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == devices.length).assertTrue();
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0006
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin twice with all types different
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices1: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices1);
      let ret1: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret1.length == devices1.length).assertTrue();

      let devices2: Array<usbManager.UsbDeviceType> = [
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices2);
      let ret2: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret2.length == (devices1.length + devices2.length)).assertTrue();

      usbManager.removeDisallowedUsbDevices(SELFWANT, ret1);
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret2);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0007
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin twice with part of same types
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices1: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices1);
      let ret1: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret1.length == devices1.length).assertTrue();

      let devices2: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices2);
      let ret2: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret2.length == (devices1.length + devices2.length - 1)).assertTrue();

      usbManager.removeDisallowedUsbDevices(SELFWANT, ret1);
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret2);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0008
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
        {baseClass: 255, subClass: 255, protocol: 255, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == devices.length).assertTrue();
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0009
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and baseClass out of boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: -1, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 256, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0010
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and subClass out of boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0010", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: -1, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 256, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0011
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0011
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and protocol out of boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0011", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: -1, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 256, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0012
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0012
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and size out of boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0012", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices1: Array<usbManager.UsbDeviceType> = [];
      for (let i = 0; i < DISALLOWED_USB_DEVICES_MAX_SIZE; i++) {
        let temp: usbManager.UsbDeviceType = {
          baseClass: 0,
          subClass: 0,
          protocol: i,
          descriptor: usbManager.Descriptor.INTERFACE
        };
        devices1.push(temp);
      }
      usbManager.addDisallowedUsbDevices(SELFWANT, devices1);
      let ret1: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret1.length == DISALLOWED_USB_DEVICES_MAX_SIZE).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    }
    try {
      let devices2: Array<usbManager.UsbDeviceType> =
        [{baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE}];
      usbManager.addDisallowedUsbDevices(SELFWANT, devices2);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      let ret2: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret2);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0013
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0013
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and disableUsb has been set
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0013", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, true);
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0014
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0014
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and allowedDevices has been set
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0014", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let allowedDevices: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, allowedDevices);
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0015
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0015
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and then set disableUsb
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0015", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0016
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0016
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and then set allowed devices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0016", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      let allowedDevices: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, allowedDevices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0017
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0017
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and then set storage device read only
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0017", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_ONLY);
      let result: usbManager.UsbPolicy = usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);;
      expect(result == usbManager.UsbPolicy.READ_ONLY).assertTrue();
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == 1).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0018
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0018
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and then set storage device read write
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0018", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_WRITE);
      let result: usbManager.UsbPolicy = usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);;
      expect(result == usbManager.UsbPolicy.READ_WRITE).assertTrue();
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == 1).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0019
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0019
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and then set storage device disabled
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0019", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.DISABLED);
      let result: usbManager.UsbPolicy = usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);;
      expect(result == usbManager.UsbPolicy.DISABLED).assertTrue();
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == 1).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_usb_devices_0020
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0020
   * @tc.desc   test usbManager addDisallowedUsbDevices with super admin and storage device has been set disabled
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0020", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.DISABLED);
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == 1).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveDisallowedUsbDevices() {
  /**
   * @tc.name   test_remove_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager removeDisallowedUsbDevices with inactive admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0002
   * @tc.desc   test usbManager removeDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0003
   * @tc.desc   test usbManager removeDisallowedUsbDevices with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0003", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(null, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0004
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin for multiple types
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      // add
      let addDevices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, addDevices);
      // remove
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      // get
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == (addDevices.length - devices.length)).assertTrue();
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0005
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin for single type
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      // add
      let addDevices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, addDevices);
      // remove
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      // get
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == (addDevices.length - devices.length)).assertTrue();
      usbManager.removeDisallowedUsbDevices(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0006
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin twice with all types different
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      // add
      let addDevices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, addDevices);
      // remove 1
      let devices1: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices1);
      let ret1: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret1.length == (addDevices.length - devices1.length)).assertTrue();
      // remove 2
      let devices2: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices2);
      let ret2: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret2.length == (addDevices.length - devices1.length - devices2.length)).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0007
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin twice with part of same types
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      // add
      let addDevices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, addDevices);
      // remove 1
      let devices1: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices1);
      let ret1: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret1.length == (addDevices.length - devices1.length)).assertTrue();
      // remove 2
      let devices2: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices2);
      let ret2: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret2.length == (addDevices.length - devices1.length - devices2.length + 1)).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0008
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin for removing a device not in list
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      // add
      let addDevices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, addDevices);
      // remove
      let devices1: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices1);
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == addDevices.length).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0009
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin for empty list
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices1: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 7, protocol: 6, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices1);
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == 0).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0010
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin and boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0010", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
        {baseClass: 255, subClass: 255, protocol: 255, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      let ret: Array<usbManager.UsbDeviceType> = usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(ret.length == 0).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0011
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0011
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin and baseClass out of boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0011", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: -1, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 256, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0012
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0012
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin and subClass out of boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0012", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: -1, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 256, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_usb_devices_0013
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0013
   * @tc.desc   test usbManager removeDisallowedUsbDevices with super admin and protocol out of boundary value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0013", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: -1, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 0, subClass: 0, protocol: 256, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedUsbDevices() {
  /**
   * @tc.name   test_get_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager getDisallowedUsbDevices with inactive admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_usb_devices_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_USB_DEVICES_JS_0002
   * @tc.desc   test usbManager getDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_usb_devices_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_usb_devices_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_USB_DEVICES_JS_0003
   * @tc.desc   test usbManager getDisallowedUsbDevices with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_usb_devices_0003", Level.LEVEL2, async (done: Function) => {
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.getDisallowedUsbDevices(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}
