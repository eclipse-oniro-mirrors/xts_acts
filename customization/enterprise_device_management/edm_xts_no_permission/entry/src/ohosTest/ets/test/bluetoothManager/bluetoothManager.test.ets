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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE } from '../commom.ets';

import bluetoothManager from '@ohos.enterprise.bluetoothManager';
import adminManager from '@ohos.enterprise.adminManager';

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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        bluetoothManager.getAllowedBluetoothDevices(SELFWANT);
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeAllowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        bluetoothManager.getDisallowedBluetoothDevices(SELFWANT);
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT,deviceIds);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_turnon_bluetooth_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_BLUETOOTH_0100
     * @tc.desc   test turnOnBluetooth method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnon_bluetooth_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        bluetoothManager.turnOnBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_turnoff_bluetooth_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_BLUETOOTH_0100
     * @tc.desc   test turnOnBluetooth method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_turnoff_bluetooth_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        bluetoothManager.turnOffBluetooth(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_add_disallowed_bluetooth_protocols_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_PROTOCOLS_0100
     * @tc.desc   test addDisallowedBluetoothProtocols method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_protocols_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_protocols_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_PROTOCOLS_0100
     * @tc.desc   test removeDisallowedBluetoothProtocols method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_protocols_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_get_disallowed_bluetooth_protocols_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_BLUETOOTH_PROTOCOLS_0100
     * @tc.desc   test getDisallowedBluetoothProtocols method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_disallowed_bluetooth_protocols_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let accountId: number = 100;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })
  })
}
