/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE, INVALID_WANT } from '../commom.ets';

import bluetoothManager from '@ohos.enterprise.bluetoothManager';
import adminManager from '@ohos.enterprise.adminManager';
import restrictions from '@ohos.enterprise.restrictions';

export default function bluetoothManagerTest() {

  describe('bluetoothManager_test', () => {
    /**
     * @tc.name   test_get_bluetooth_info_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0100
     * @tc.desc   test getBluetoothInfo method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_bluetooth_info_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_get_bluetooth_info_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0200
     * @tc.desc   test getBluetoothInfo method with unActiveadmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_bluetooth_info_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_bluetooth_info_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0300
     * @tc.desc   test getBluetoothInfo method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_bluetooth_info_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(null);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_bluetooth_info_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0400
     * @tc.desc   test getBluetoothInfo method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_bluetooth_info_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        expect(result != null).assertTrue();
        console.log('result.name:' + result.name + ' result.state:' +
          result.state + ' result.connectionState:' + result.connectionState);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
    
    /**
     * @tc.name   test_add_allowed_bluetooth_devices_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.desc   test addallowedbluetoothdevices method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_allowed_bluetooth_devices_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_add_allowed_bluetooth_devices_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.desc   test addallowedbluetoothdevices method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_allowed_bluetooth_devices_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_allowed_bluetooth_devices_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.desc   test addallowedbluetoothdevices method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_allowed_bluetooth_devices_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addAllowedBluetoothDevices(null,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_allowed_bluetooth_devices_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.desc   test addallowedbluetoothdevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_allowed_bluetooth_devices_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT, deviceIds);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_allowed_bluetooth_devices_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.desc   test addallowedbluetoothdevices method add 1001 devices with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_allowed_bluetooth_devices_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: string[] = [];
        for (let i = 0; i < 1001; i++) {
          deviceIds.push(i.toString().padStart(3, '0'));
        }
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_allowed_bluetooth_devices_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0600
     * @tc.desc   test addallowedbluetoothdevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_allowed_bluetooth_devices_0600', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        const LABEL_BLUETOOTH = "bluetooth";
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, true);
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT, deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_allowed_bluetooth_devices_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.desc   test getAllowedBluetoothDevices method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_allowed_bluetooth_devices_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        bluetoothManager.getAllowedBluetoothDevices(SELFWANT);
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_get_allowed_bluetooth_devices_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.desc   test getAllowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_allowed_bluetooth_devices_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string> = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT, deviceIds);
        let res1: Array<string> = bluetoothManager.getAllowedBluetoothDevices(SELFWANT);
        expect(res1.length > 0).assertTrue();
        bluetoothManager.removeAllowedBluetoothDevices(SELFWANT, deviceIds);
        let res2: Array<string> = bluetoothManager.getAllowedBluetoothDevices(SELFWANT);
        expect(res2.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_allowed_bluetooth_devices_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.desc   test getAllowedBluetoothDevices method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_allowed_bluetooth_devices_0300', Level.LEVEL2, async (done: Function) => {
      try {
        bluetoothManager.getAllowedBluetoothDevices(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_allowed_bluetooth_devices_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.desc   test getAllowedBluetoothDevices method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_allowed_bluetooth_devices_0400', Level.LEVEL2, async (done: Function) => {
      try {
        bluetoothManager.getAllowedBluetoothDevices(null);
      } catch(error) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_allowed_bluetooth_devices_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.desc   test getAllowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_allowed_bluetooth_devices_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bluetoothManager.getAllowedBluetoothDevices(null);
      } catch(error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_remove_allowed_bluetooth_devices_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.desc   test removeAllowedBluetoothDevices method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_allowed_bluetooth_devices_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeAllowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_remove_allowed_bluetooth_devices_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.desc   test removeAllowedBluetoothDevices method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_allowed_bluetooth_devices_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeAllowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_allowed_bluetooth_devices_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.desc   test removeAllowedBluetoothDevices method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_allowed_bluetooth_devices_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeAllowedBluetoothDevices(null,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_allowed_bluetooth_devices_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.desc   test removeAllowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_allowed_bluetooth_devices_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeAllowedBluetoothDevices(SELFWANT,deviceIds);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.desc   test adddisallowedbluetoothdevices method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.desc   test adddisallowedbluetoothdevices method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.desc   test adddisallowedbluetoothdevices method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(null,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.desc   test adddisallowedbluetoothdevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, deviceIds);
        let ret: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
        expect(ret.length == 2).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.desc   test adddisallowedbluetoothdevices method add 1001 devices with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: string[] = [];
        for (let i = 0; i < 1001; i++) {
          deviceIds.push(i.toString().padStart(3, '0'));
        }
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0600
     * @tc.desc   test adddisallowedbluetoothdevices bluetooth is disallowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0600', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        const LABEL_BLUETOOTH = "bluetooth";
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, true);
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0700
     * @tc.desc   test adddisallowedbluetoothdevices when it has allowedbluetoothdevices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0700', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT, deviceIds);
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0800
     * @tc.desc   test adddisallowedbluetoothdevices method add 1000 devices with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0800', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: string[] = [];
        while (deviceIds.length < 1000) {
          const hexOctet = () => Math.floor(Math.random() * 256).toString(16).padStart(2, '0');
          let macAddress: string = [0, 1, 2, 3, 4, 5].map((): string => hexOctet()).join(':');
          deviceIds.push(macAddress);
        }
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT,deviceIds);
        let ret: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
        expect(ret.length == 1000).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_devices_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0900
     * @tc.desc   test addallowedbluetoothdevices when it has disallowedbluetoothdevices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0900', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, deviceIds);
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT, deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_devices_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.desc   test getDisallowedBluetoothDevices method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_devices_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_devices_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.desc   test getDisallowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_devices_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string> = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, deviceIds);
        let res1: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
        expect(res1.length > 0).assertTrue();
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT, deviceIds);
        let res2: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
        expect(res2.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_devices_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.desc   test getDisallowedBluetoothDevices method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_devices_0300', Level.LEVEL2, async (done: Function) => {
      try {
        bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_devices_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.desc   test getDisallowedBluetoothDevices method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_devices_0400', Level.LEVEL2, async (done: Function) => {
      try {
        let ret: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(null);
        expect(ret.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_devices_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.desc   test getDisallowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_devices_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(null);
        expect(ret.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_devices_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.desc   test removeDisallowedBluetoothDevices method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_devices_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_devices_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.desc   test removeDisallowedBluetoothDevices method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_devices_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_devices_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.desc   test removeDisallowedBluetoothDevices method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_devices_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeDisallowedBluetoothDevices(null,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_devices_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.desc   test removeDisallowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_devices_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, deviceIds);
        let ret1: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
        expect(ret1.length == 2).assertTrue();
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT,deviceIds);
        let ret2: Array<string> = bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
        expect(ret2.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    let sleep = (timeout: number): Promise<ESObject> => {
      return new Promise(resolve => {
        const st =setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.name   test_turnon_bluetooth_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_BLUETOOTH_0100
     * @tc.desc   test turnOnBluetooth method with unActiveadmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnon_bluetooth_0100', Level.LEVEL2, async (done: Function) => {
      try {
        bluetoothManager.turnOnBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_turnon_bluetooth_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_BLUETOOTH_0200
     * @tc.desc   test turnOnBluetooth method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnon_bluetooth_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        bluetoothManager.turnOnBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_turnon_bluetooth_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_BLUETOOTH_0300
     * @tc.desc   test turnOnBluetooth method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnon_bluetooth_0300', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bluetoothManager.turnOnBluetooth(SELFWANT);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_turnon_bluetooth_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_BLUETOOTH_0400
     * @tc.desc   test turnOnBluetooth method with super admin && disablebluetooth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnon_bluetooth_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      const LABEL_BLUETOOTH = "bluetooth";
      try {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, true);
        await sleep(12000);
        bluetoothManager.turnOnBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 203).assertTrue();
      } finally {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_turnon_bluetooth_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_BLUETOOTH_0500
     * @tc.desc   test turnOnBluetooth method with error param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnon_bluetooth_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bluetoothManager.turnOnBluetooth(INVALID_WANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_turnoff_bluetooth_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_BLUETOOTH_0100
     * @tc.desc   test turnOffBluetooth method with unActiveadmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnoff_bluetooth_0100', Level.LEVEL2, async (done: Function) => {
      try {
        bluetoothManager.turnOffBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_turnoff_bluetooth_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_BLUETOOTH_0200
     * @tc.desc   test turnOffBluetooth method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnoff_bluetooth_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        bluetoothManager.turnOffBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_turnoff_bluetooth_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_BLUETOOTH_0300
     * @tc.desc   test turnOffBluetooth method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnoff_bluetooth_0300', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bluetoothManager.turnOffBluetooth(SELFWANT);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        bluetoothManager.turnOnBluetooth(SELFWANT);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_turnoff_bluetooth_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_BLUETOOTH_0400
     * @tc.desc   test turnOffBluetooth method with super admin  && disablebluetooth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnoff_bluetooth_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      const LABEL_BLUETOOTH = "bluetooth";
      try {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, true);
        await sleep(12000);
        bluetoothManager.turnOffBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 203).assertTrue();
      } finally {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_turnoff_bluetooth_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_BLUETOOTH_0500
     * @tc.desc   test turnOffBluetooth method with error param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnoff_bluetooth_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bluetoothManager.turnOffBluetooth(INVALID_WANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_protocols_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_PROTOCOLS_0100
     * @tc.desc   test addDisallowedBluetoothProtocols method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_protocols_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_protocols_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_PROTOCOLS_0200
     * @tc.desc   test addDisallowedBluetoothProtocols method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_protocols_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_protocols_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_PROTOCOLS_0300
     * @tc.desc   test addDisallowedBluetoothProtocols method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_protocols_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.addDisallowedBluetoothProtocols(null, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_protocols_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_PROTOCOLS_0400
     * @tc.desc   test adddisallowedbluetoothdevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_protocols_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP, bluetoothManager.Protocol.OPP];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        let ret: Array<bluetoothManager.Protocol> =
          bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId);
        expect(ret.length > 0).assertTrue();
        expect(ret.length == 3).assertTrue();
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        ret = bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId);
        expect(ret.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_protocols_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_PROTOCOLS_0100
     * @tc.desc   test removeDisallowedBluetoothProtocols method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_protocols_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_protocols_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_PROTOCOLS_0200
     * @tc.desc   test removeDisallowedBluetoothProtocols method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_protocols_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_protocols_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_PROTOCOLS_0300
     * @tc.desc   test removeDisallowedBluetoothProtocols method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_protocols_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(null, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_protocols_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_PROTOCOLS_0100
     * @tc.desc   test getDisallowedBluetoothProtocols method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_protocols_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_protocols_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_PROTOCOLS_0200
     * @tc.desc   test getDisallowedBluetoothProtocols method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_protocols_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let accountId: number = 100;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId);
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_protocols_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_PROTOCOLS_0300
     * @tc.desc   test getDisallowedBluetoothProtocols method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_protocols_0300', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        bluetoothManager.getDisallowedBluetoothProtocols(null, accountId);
      } catch(error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}
