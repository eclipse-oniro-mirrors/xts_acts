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

import { describe, expect, it } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE } from '../commom.ets';

import bluetoothManager from '@ohos.enterprise.bluetoothManager';
import adminManager from '@ohos.enterprise.adminManager';
import restrictions from '@ohos.enterprise.restrictions';

export default function bluetoothManagerTest() {

  describe('bluetoothManager_test', () => {
    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0100
     * @tc.name test_get_bluetooth_info_0100
     * @tc.desc test getBluetoothInfo method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_bluetooth_info_0100', 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0200
     * @tc.name test_get_bluetooth_info_0200
     * @tc.desc test getBluetoothInfo method with unActiveadmin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_bluetooth_info_0200', 0, async (done: Function) => {
      try {
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0300
     * @tc.name test_get_bluetooth_info_0300
     * @tc.desc test getBluetoothInfo method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_bluetooth_info_0300', 0, async (done: Function) => {
      try {
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(null);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0400
     * @tc.name test_get_bluetooth_info_0400
     * @tc.desc test getBluetoothInfo method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_bluetooth_info_0400', 0, async (done: Function) => {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.name      : test_add_allowed_bluetooth_devices_0100
     * @tc.desc      : test addallowedbluetoothdevices method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_allowed_bluetooth_devices_0100', 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.name test_add_allowed_bluetooth_devices_0200
     * @tc.desc test addallowedbluetoothdevices method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_allowed_bluetooth_devices_0200', 0, async (done: Function) => {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.name test_add_allowed_bluetooth_devices_0300
     * @tc.desc test addallowedbluetoothdevices method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_allowed_bluetooth_devices_0300', 0, async (done: Function) => {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.name test_add_allowed_bluetooth_devices_0400
     * @tc.desc test addallowedbluetoothdevices method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_allowed_bluetooth_devices_0400', 0, async (done: Function) => {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.name test_add_allowed_bluetooth_devices_0500
     * @tc.desc test addallowedbluetoothdevices method add 1001 devices with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_allowed_bluetooth_devices_0500', 0, async (done: Function) => {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0600
     * @tc.name      : test_add_allowed_bluetooth_devices_0600
     * @tc.desc      : test addallowedbluetoothdevices method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_allowed_bluetooth_devices_0600', 0, async (done: Function) => {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.name test_get_allowed_bluetooth_devices_0100
     * @tc.desc test getAllowedBluetoothDevices method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_allowed_bluetooth_devices_0100', 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.name test_get_allowed_bluetooth_devices_0200
     * @tc.desc test getAllowedBluetoothDevices method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_allowed_bluetooth_devices_0200', 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bluetoothManager.getAllowedBluetoothDevices(SELFWANT);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.name test_get_allowed_bluetooth_devices_0300
     * @tc.desc test getAllowedBluetoothDevices method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_allowed_bluetooth_devices_0300', 0, async (done: Function) => {
      try {
        bluetoothManager.getAllowedBluetoothDevices(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.name test_get_allowed_bluetooth_devices_0400
     * @tc.desc test getAllowedBluetoothDevices method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_allowed_bluetooth_devices_0400', 0, async (done: Function) => {
      try {
        bluetoothManager.getAllowedBluetoothDevices(null);
      } catch(error) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.name test_get_allowed_bluetooth_devices_0500
     * @tc.desc test getAllowedBluetoothDevices method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_allowed_bluetooth_devices_0500', 0, async (done: Function) => {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0100
     * @tc.name test_remove_allowed_bluetooth_devices_0100
     * @tc.desc test removeAllowedBluetoothDevices method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_allowed_bluetooth_devices_0100', 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0200
     * @tc.name test_remove_allowed_bluetooth_devices_0200
     * @tc.desc test removeAllowedBluetoothDevices method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_allowed_bluetooth_devices_0200', 0, async (done: Function) => {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0300
     * @tc.name test_remove_allowed_bluetooth_devices_0300
     * @tc.desc test removeAllowedBluetoothDevices method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_allowed_bluetooth_devices_0300', 0, async (done: Function) => {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0400
     * @tc.name test_remove_allowed_bluetooth_devices_0400
     * @tc.desc test removeAllowedBluetoothDevices method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_allowed_bluetooth_devices_0400', 0, async (done: Function) => {
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
  })
}
