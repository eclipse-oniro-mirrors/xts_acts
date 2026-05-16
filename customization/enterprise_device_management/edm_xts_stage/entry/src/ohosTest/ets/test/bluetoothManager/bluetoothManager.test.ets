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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE, INVALID_WANT, DEFAULT_USER_ID } from '../commom.ets';

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
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
     })

    /**
      * @tc.name   test_get_bluetooth_info_0310
      * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_INFO_0310
      * @tc.desc   test getBluetoothInfo method with undefined admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('test_get_bluetooth_info_0310', Level.LEVEL2, async (done: Function) => {
       try {
         let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(undefined);
         expect(false).assertTrue();
       } catch(error) {
         expect(Number(error.code) === 401).assertTrue();
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
         expect(result.name != null).assertTrue();
         expect(result.state != null).assertTrue();
         expect(result.connectionState != null).assertTrue();
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
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
     })

    /**
      * @tc.name   test_add_allowed_bluetooth_devices_0310
      * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0310
      * @tc.desc   test addallowedbluetoothdevices method with undefined admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('test_add_allowed_bluetooth_devices_0310', Level.LEVEL2, async (done: Function) => {
       try {
         let deviceIds: Array<string>  = ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"];
         bluetoothManager.addAllowedBluetoothDevices(undefined,deviceIds);
         expect(false).assertTrue();
       } catch(error) {
         expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_add_allowed_bluetooth_devices_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_BLUETOOTH_DEVICES_0700
     * @tc.desc   test addallowedbluetoothdevices method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_allowed_bluetooth_devices_0700', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = [];
        bluetoothManager.addAllowedBluetoothDevices(SELFWANT, deviceIds);
      } catch(error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_remove_allowed_bluetooth_devices_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.desc   test removeAllowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_allowed_bluetooth_devices_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = [];
        bluetoothManager.removeAllowedBluetoothDevices(SELFWANT, deviceIds);
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_add_disallowed_bluetooth_devices_0901
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_DEVICES_0901
     * @tc.desc   test adddisallowedbluetoothdevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_devices_0901', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = [];
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, deviceIds);
      } catch(error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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

    /**
     * @tc.name   test_remove_disallowed_bluetooth_devices_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_DEVICES_0500
     * @tc.desc   test removeDisallowedBluetoothDevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_devices_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceIds: Array<string>  = [];
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT, deviceIds);
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_add_disallowed_bluetooth_protocols_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_BLUETOOTH_PROTOCOLS_0500
     * @tc.desc   test adddisallowedbluetoothdevices method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_disallowed_bluetooth_protocols_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        console.info(' --- test_add_disallowed_bluetooth_protocols_0500 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_disallowed_bluetooth_protocols_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_BLUETOOTH_PROTOCOLS_0400
     * @tc.desc   test removeDisallowedBluetoothProtocols method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_disallowed_bluetooth_protocols_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [];
        bluetoothManager.removeDisallowedBluetoothProtocols(null, accountId, protocols);
        expect(false).assertTrue();
      } catch(error) {
        console.info(' --- test_remove_disallowed_bluetooth_protocols_0400 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0100
     * @tc.desc   test addDisallowedBluetoothProtocols method with policy parameter and unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0200
     * @tc.desc   test addDisallowedBluetoothProtocols method with policy parameter and normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0300
     * @tc.desc   test addDisallowedBluetoothProtocols method with policy parameter and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(null, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0400
     * @tc.desc   test addDisallowedBluetoothProtocols method with policy parameter and super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP, bluetoothManager.Protocol.OPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        let ret: Array<bluetoothManager.Protocol> =
          bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(ret.length > 0).assertTrue();
        expect(ret.length == 3).assertTrue();
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        ret = bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(ret.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0500
     * @tc.desc   test addDisallowedBluetoothProtocols method with policy parameter, empty protocols and super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        console.info(' --- test_add_disallowed_bluetooth_protocols_with_policy_0500 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0100
     * @tc.desc   test removeDisallowedBluetoothProtocols method with policy parameter and unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0200
     * @tc.desc   test removeDisallowedBluetoothProtocols method with policy parameter and normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0300
     * @tc.desc   test removeDisallowedBluetoothProtocols method with policy parameter and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(null, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0400
     * @tc.desc   test removeDisallowedBluetoothProtocols method with policy parameter and super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        let ret1: Array<bluetoothManager.Protocol> =
          bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(ret1.length == 2).assertTrue();
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        let ret2: Array<bluetoothManager.Protocol> =
          bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(ret2.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0100
     * @tc.desc   test getDisallowedBluetoothProtocols method with policy parameter and unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0200
     * @tc.desc   test getDisallowedBluetoothProtocols method with policy parameter and normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0300
     * @tc.desc   test getDisallowedBluetoothProtocols method with policy parameter and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0300', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.getDisallowedBluetoothProtocols(null, accountId, policy);
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0400
     * @tc.desc   test getDisallowedBluetoothProtocols method with policy parameter and super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        let res1: Array<bluetoothManager.Protocol> =
          bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(res1.length > 0).assertTrue();
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        let res2: Array<bluetoothManager.Protocol> =
          bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(res2.length == 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_1200
     * @tc.desc   test getDisallowedBluetoothProtocols method with policy parameter and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_1200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_ONLY;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
      } catch(error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_send_only_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_SEND_ONLY_0100
     * @tc.desc   test addDisallowedBluetoothProtocols with SEND_ONLY policy and super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_send_only_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.SEND_ONLY;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        let ret: Array<bluetoothManager.Protocol> =
          bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(ret.length == 1).assertTrue();
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0600
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0600', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(null, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0700
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0700', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(undefined, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0800
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and (null) accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0800', Level.LEVEL2, async (done: Function) => {
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, null, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0900
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_0900', Level.LEVEL2, async (done: Function) => {
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, undefined, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_1000
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and null protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_1000', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, null, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_1100
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and undefined protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_1100', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, undefined, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_1200
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and undefined protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_1200', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, null);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0500
     * @tc.desc   test removeDisallowedBluetoothProtocols with policy parameter and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0500', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(null, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0600
     * @tc.desc   test removeDisallowedBluetoothProtocols with policy parameter and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0600', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(undefined, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0700
     * @tc.desc   test removeDisallowedBluetoothProtocols with policy parameter and null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0700', Level.LEVEL2, async (done: Function) => {
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, null, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0800
     * @tc.desc   test removeDisallowedBluetoothProtocols with policy parameter and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0800', Level.LEVEL2, async (done: Function) => {
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, undefined, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0900
     * @tc.desc   test removeDisallowedBluetoothProtocols with policy parameter and null protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_0900', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, null, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_1000
     * @tc.desc   test removeDisallowedBluetoothProtocols with policy parameter and undefined protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_1000', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_ONLY;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, undefined, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0500
     * @tc.desc   test getDisallowedBluetoothProtocols with policy parameter and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0500', Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_ONLY;
        let ret = bluetoothManager.getDisallowedBluetoothProtocols(null, accountId, policy);
        expect(ret.length === 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0600
     * @tc.desc   test getDisallowedBluetoothProtocols with policy parameter and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0600', Level.LEVEL2, async (done: Function) => {
      try {
        let accountId: number = 100;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.getDisallowedBluetoothProtocols(undefined, accountId, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0700
     * @tc.desc   test getDisallowedBluetoothProtocols with policy parameter and null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0700', Level.LEVEL2, async (done: Function) => {
      try {
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, null, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0800
     * @tc.desc   test getDisallowedBluetoothProtocols with policy parameter and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0800', Level.LEVEL2, async (done: Function) => {
      try {
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, undefined, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   getBluetoothInfo_test_001
     * @tc.number getBluetoothInfo_test_001
     * @tc.desc   getBluetoothInfo with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getBluetoothInfo_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getBluetoothInfo_test_001  -------- START --------');
      try {
        bluetoothManager.getBluetoothInfo(null);
        console.info(' --- getBluetoothInfo_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getBluetoothInfo_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getBluetoothInfo_test_001  -------- END --------');
    })


    /**
     * @tc.name   getBluetoothInfo_test_002
     * @tc.number getBluetoothInfo_test_002
     * @tc.desc   getBluetoothInfo with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getBluetoothInfo_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getBluetoothInfo_test_002  -------- START --------');
      try {
        bluetoothManager.getBluetoothInfo(undefined);
        console.info(' --- getBluetoothInfo_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getBluetoothInfo_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getBluetoothInfo_test_002  -------- END --------');
    })


    /**
     * @tc.name   addAllowedBluetoothDevices_test_001
     * @tc.number addAllowedBluetoothDevices_test_001
     * @tc.desc   addAllowedBluetoothDevices with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedBluetoothDevices_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedBluetoothDevices_test_001  -------- START --------');
      try {
        bluetoothManager.addAllowedBluetoothDevices(null, ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"]);
        console.info(' --- addAllowedBluetoothDevices_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedBluetoothDevices_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedBluetoothDevices_test_001  -------- END --------');
    })


    /**
     * @tc.name   addAllowedBluetoothDevices_test_002
     * @tc.number addAllowedBluetoothDevices_test_002
     * @tc.desc   addAllowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedBluetoothDevices_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedBluetoothDevices_test_002  -------- START --------');
      try {
        bluetoothManager.addAllowedBluetoothDevices(undefined, ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"]);
        console.info(' --- addAllowedBluetoothDevices_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedBluetoothDevices_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedBluetoothDevices_test_002  -------- END --------');
    })


    /**
     * @tc.name   addAllowedBluetoothDevices_test_003
     * @tc.number addAllowedBluetoothDevices_test_003
     * @tc.desc   addAllowedBluetoothDevices with null parameter deviceIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("addAllowedBluetoothDevices_test_003", Level.LEVEL2, async (done: Function) => {
       console.info(' --- addAllowedBluetoothDevices_test_003  -------- START --------');
       try {
         bluetoothManager.addAllowedBluetoothDevices(SELFWANT, null);
         console.info(' --- addAllowedBluetoothDevices_test_003 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- addAllowedBluetoothDevices_test_003 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- addAllowedBluetoothDevices_test_003  -------- END --------');
     })

    /**
      * @tc.name   addAllowedBluetoothDevices_test_004
      * @tc.number addAllowedBluetoothDevices_test_004
      * @tc.desc   addAllowedBluetoothDevices with undefined parameter deviceIds
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it("addAllowedBluetoothDevices_test_004", Level.LEVEL2, async (done: Function) => {
       console.info(' --- addAllowedBluetoothDevices_test_004  -------- START --------');
       try {
         bluetoothManager.addAllowedBluetoothDevices(SELFWANT, undefined);
         console.info(' --- addAllowedBluetoothDevices_test_004 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- addAllowedBluetoothDevices_test_004 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- addAllowedBluetoothDevices_test_004  -------- END --------');
     })

    /**
      * @tc.name   addAllowedBluetoothDevices_test_005
      * @tc.number addAllowedBluetoothDevices_test_005
      * @tc.desc   addAllowedBluetoothDevices with undefined admin and null deviceIds
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it("addAllowedBluetoothDevices_test_005", Level.LEVEL2, async (done: Function) => {
       console.info(' --- addAllowedBluetoothDevices_test_005  -------- START --------');
       try {
         bluetoothManager.addAllowedBluetoothDevices(undefined, null);
         console.info(' --- addAllowedBluetoothDevices_test_005 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- addAllowedBluetoothDevices_test_005 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- addAllowedBluetoothDevices_test_005  -------- END --------');
     })

    /**
      * @tc.name   addAllowedBluetoothDevices_test_006
      * @tc.number addAllowedBluetoothDevices_test_006
      * @tc.desc   addAllowedBluetoothDevices with undefined admin and undefined deviceIds
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it("addAllowedBluetoothDevices_test_006", Level.LEVEL2, async (done: Function) => {
       console.info(' --- addAllowedBluetoothDevices_test_006  -------- START --------');
       try {
         bluetoothManager.addAllowedBluetoothDevices(undefined, undefined);
         console.info(' --- addAllowedBluetoothDevices_test_006 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- addAllowedBluetoothDevices_test_006 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- addAllowedBluetoothDevices_test_006  -------- END --------');
     })

    /**
     * @tc.name   removeAllowedBluetoothDevices_test_001
     * @tc.number removeAllowedBluetoothDevices_test_001
     * @tc.desc   removeAllowedBluetoothDevices with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedBluetoothDevices_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedBluetoothDevices_test_001  -------- START --------');
      try {
        bluetoothManager.removeAllowedBluetoothDevices(null, ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"]);
        console.info(' --- removeAllowedBluetoothDevices_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedBluetoothDevices_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedBluetoothDevices_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedBluetoothDevices_test_002
     * @tc.number removeAllowedBluetoothDevices_test_002
     * @tc.desc   removeAllowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedBluetoothDevices_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedBluetoothDevices_test_002  -------- START --------');
      try {
        bluetoothManager.removeAllowedBluetoothDevices(undefined, ["00:1A:2B:3C:4D:5E","AA:BB:CC:DD:EE:FF"]);
        console.info(' --- removeAllowedBluetoothDevices_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedBluetoothDevices_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedBluetoothDevices_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedBluetoothDevices_test_003
     * @tc.number removeAllowedBluetoothDevices_test_003
     * @tc.desc   removeAllowedBluetoothDevices with null parameter deviceIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedBluetoothDevices_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedBluetoothDevices_test_003  -------- START --------');
      try {
        bluetoothManager.removeAllowedBluetoothDevices(SELFWANT, null);
        console.info(' --- removeAllowedBluetoothDevices_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedBluetoothDevices_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedBluetoothDevices_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedBluetoothDevices_test_004
     * @tc.number removeAllowedBluetoothDevices_test_004
     * @tc.desc   removeAllowedBluetoothDevices with undefined parameter deviceIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("removeAllowedBluetoothDevices_test_004", Level.LEVEL2, async (done: Function) => {
       console.info(' --- removeAllowedBluetoothDevices_test_004  -------- START --------');
       try {
         bluetoothManager.removeAllowedBluetoothDevices(SELFWANT, undefined);
         console.info(' --- removeAllowedBluetoothDevices_test_004 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- removeAllowedBluetoothDevices_test_004 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- removeAllowedBluetoothDevices_test_004  -------- END --------');
     })

    /**
      * @tc.name   removeAllowedBluetoothDevices_test_005
      * @tc.number removeAllowedBluetoothDevices_test_005
      * @tc.desc   removeAllowedBluetoothDevices with undefined admin and null deviceIds
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it("removeAllowedBluetoothDevices_test_005", Level.LEVEL2, async (done: Function) => {
       console.info(' --- removeAllowedBluetoothDevices_test_005  -------- START --------');
       try {
         bluetoothManager.removeAllowedBluetoothDevices(SELFWANT, null);
         console.info(' --- removeAllowedBluetoothDevices_test_005 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- removeAllowedBluetoothDevices_test_005 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- removeAllowedBluetoothDevices_test_005  -------- END --------');
     })

    /**
      * @tc.name   removeAllowedBluetoothDevices_test_006
      * @tc.number removeAllowedBluetoothDevices_test_006
      * @tc.desc   removeAllowedBluetoothDevices with undefined admin and undefined deviceIds
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it("removeAllowedBluetoothDevices_test_006", Level.LEVEL2, async (done: Function) => {
       console.info(' --- removeAllowedBluetoothDevices_test_006  -------- START --------');
       try {
         bluetoothManager.removeAllowedBluetoothDevices(SELFWANT, undefined);
         console.info(' --- removeAllowedBluetoothDevices_test_006 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- removeAllowedBluetoothDevices_test_006 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- removeAllowedBluetoothDevices_test_006  -------- END --------');
     })

    /**
     * @tc.name   getAllowedBluetoothDevices_test_002
     * @tc.number getAllowedBluetoothDevices_test_002
     * @tc.desc   getAllowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedBluetoothDevices_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedBluetoothDevices_test_002  -------- START --------');
      try {
        bluetoothManager.getAllowedBluetoothDevices(undefined);
        console.info(' --- getAllowedBluetoothDevices_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedBluetoothDevices_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedBluetoothDevices_test_002  -------- END --------');
    })


    /**
     * @tc.name   turnOnBluetooth_test_001
     * @tc.number turnOnBluetooth_test_001
     * @tc.desc   turnOnBluetooth with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOnBluetooth_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOnBluetooth_test_001  -------- START --------');
      try {
        bluetoothManager.turnOnBluetooth(null);
        console.info(' --- turnOnBluetooth_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOnBluetooth_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOnBluetooth_test_001  -------- END --------');
    })


    /**
     * @tc.name   turnOnBluetooth_test_002
     * @tc.number turnOnBluetooth_test_002
     * @tc.desc   turnOnBluetooth with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOnBluetooth_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOnBluetooth_test_002  -------- START --------');
      try {
        bluetoothManager.turnOnBluetooth(undefined);
        console.info(' --- turnOnBluetooth_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOnBluetooth_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOnBluetooth_test_002  -------- END --------');
    })


    /**
     * @tc.name   turnOffBluetooth_test_001
     * @tc.number turnOffBluetooth_test_001
     * @tc.desc   turnOffBluetooth with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOffBluetooth_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOffBluetooth_test_001  -------- START --------');
      try {
        bluetoothManager.turnOffBluetooth(null);
        console.info(' --- turnOffBluetooth_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOffBluetooth_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOffBluetooth_test_001  -------- END --------');
    })


    /**
     * @tc.name   turnOffBluetooth_test_002
     * @tc.number turnOffBluetooth_test_002
     * @tc.desc   turnOffBluetooth with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOffBluetooth_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOffBluetooth_test_002  -------- START --------');
      try {
        bluetoothManager.turnOffBluetooth(undefined);
        console.info(' --- turnOffBluetooth_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOffBluetooth_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOffBluetooth_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothDevices_test_001
     * @tc.number addDisallowedBluetoothDevices_test_001
     * @tc.desc   addDisallowedBluetoothDevices with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothDevices_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothDevices_test_001  -------- START --------');
      try {
        bluetoothManager.addDisallowedBluetoothDevices(null, ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"]);
        console.info(' --- addDisallowedBluetoothDevices_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothDevices_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothDevices_test_001  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothDevices_test_002
     * @tc.number addDisallowedBluetoothDevices_test_002
     * @tc.desc   addDisallowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothDevices_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothDevices_test_002  -------- START --------');
      try {
        bluetoothManager.addDisallowedBluetoothDevices(undefined, ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"]);
        console.info(' --- addDisallowedBluetoothDevices_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothDevices_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothDevices_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothDevices_test_003
     * @tc.number addDisallowedBluetoothDevices_test_003
     * @tc.desc   addDisallowedBluetoothDevices with null parameter deviceIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothDevices_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothDevices_test_003  -------- START --------');
      try {
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, null);
        console.info(' --- addDisallowedBluetoothDevices_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothDevices_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothDevices_test_003  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothDevices_test_004
     * @tc.number addDisallowedBluetoothDevices_test_004
     * @tc.desc   addDisallowedBluetoothDevices with undefined parameter deviceIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothDevices_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothDevices_test_004  -------- START --------');
      try {
        bluetoothManager.addDisallowedBluetoothDevices(SELFWANT, undefined);
        console.info(' --- addDisallowedBluetoothDevices_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothDevices_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothDevices_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothDevices_test_001
     * @tc.number removeDisallowedBluetoothDevices_test_001
     * @tc.desc   removeDisallowedBluetoothDevices with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothDevices_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothDevices_test_001  -------- START --------');
      try {
        bluetoothManager.removeDisallowedBluetoothDevices(null, ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"]);
        console.info(' --- removeDisallowedBluetoothDevices_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothDevices_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothDevices_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothDevices_test_002
     * @tc.number removeDisallowedBluetoothDevices_test_002
     * @tc.desc   removeDisallowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothDevices_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothDevices_test_002  -------- START --------');
      try {
        bluetoothManager.removeDisallowedBluetoothDevices(undefined, ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"]);
        console.info(' --- removeDisallowedBluetoothDevices_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothDevices_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothDevices_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothDevices_test_003
     * @tc.number removeDisallowedBluetoothDevices_test_003
     * @tc.desc   removeDisallowedBluetoothDevices with null parameter deviceIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothDevices_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothDevices_test_003  -------- START --------');
      try {
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT, null);
        console.info(' --- removeDisallowedBluetoothDevices_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothDevices_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothDevices_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothDevices_test_004
     * @tc.number removeDisallowedBluetoothDevices_test_004
     * @tc.desc   removeDisallowedBluetoothDevices with undefined parameter deviceIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothDevices_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothDevices_test_004  -------- START --------');
      try {
        bluetoothManager.removeDisallowedBluetoothDevices(SELFWANT, undefined);
        console.info(' --- removeDisallowedBluetoothDevices_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothDevices_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothDevices_test_004  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothDevices_test_002
     * @tc.number getDisallowedBluetoothDevices_test_002
     * @tc.desc   getDisallowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothDevices_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothDevices_test_002  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothDevices(undefined);
        console.info(' --- getDisallowedBluetoothDevices_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothDevices_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothDevices_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothProtocols_test_001
     * @tc.number addDisallowedBluetoothProtocols_test_001
     * @tc.desc   addDisallowedBluetoothProtocols with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothProtocols_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothProtocols_test_001  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP, bluetoothManager.Protocol.OPP];
        bluetoothManager.addDisallowedBluetoothProtocols(null, DEFAULT_USER_ID, protocols);
        console.info(' --- addDisallowedBluetoothProtocols_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothProtocols_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothProtocols_test_001  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothProtocols_test_002
     * @tc.number addDisallowedBluetoothProtocols_test_002
     * @tc.desc   addDisallowedBluetoothProtocols with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothProtocols_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothProtocols_test_002  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP, bluetoothManager.Protocol.OPP];
        bluetoothManager.addDisallowedBluetoothProtocols(undefined, DEFAULT_USER_ID, protocols);
        console.info(' --- addDisallowedBluetoothProtocols_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothProtocols_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothProtocols_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothProtocols_test_003
     * @tc.number addDisallowedBluetoothProtocols_test_003
     * @tc.desc   addDisallowedBluetoothProtocols with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothProtocols_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothProtocols_test_003  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP, bluetoothManager.Protocol.OPP];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, null, protocols);
        console.info(' --- addDisallowedBluetoothProtocols_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothProtocols_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothProtocols_test_003  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothProtocols_test_004
     * @tc.number addDisallowedBluetoothProtocols_test_004
     * @tc.desc   addDisallowedBluetoothProtocols with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothProtocols_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothProtocols_test_004  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP, bluetoothManager.Protocol.OPP];
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, undefined, protocols);
        console.info(' --- addDisallowedBluetoothProtocols_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothProtocols_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothProtocols_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothProtocols_test_005
     * @tc.number addDisallowedBluetoothProtocols_test_005
     * @tc.desc   addDisallowedBluetoothProtocols with null parameter protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothProtocols_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothProtocols_test_005  -------- START --------');
      try {
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, DEFAULT_USER_ID, null);
        console.info(' --- addDisallowedBluetoothProtocols_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothProtocols_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothProtocols_test_005  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedBluetoothProtocols_test_006
     * @tc.number addDisallowedBluetoothProtocols_test_006
     * @tc.desc   addDisallowedBluetoothProtocols with undefined parameter protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedBluetoothProtocols_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedBluetoothProtocols_test_006  -------- START --------');
      try {
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, DEFAULT_USER_ID, undefined);
        console.info(' --- addDisallowedBluetoothProtocols_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedBluetoothProtocols_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedBluetoothProtocols_test_006  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothProtocols_test_001
     * @tc.number removeDisallowedBluetoothProtocols_test_001
     * @tc.desc   removeDisallowedBluetoothProtocols with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothProtocols_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothProtocols_test_001  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(null, DEFAULT_USER_ID, protocols);
        console.info(' --- removeDisallowedBluetoothProtocols_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothProtocols_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothProtocols_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothProtocols_test_002
     * @tc.number removeDisallowedBluetoothProtocols_test_002
     * @tc.desc   removeDisallowedBluetoothProtocols with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothProtocols_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothProtocols_test_002  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(undefined, DEFAULT_USER_ID, protocols);
        console.info(' --- removeDisallowedBluetoothProtocols_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothProtocols_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothProtocols_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothProtocols_test_003
     * @tc.number removeDisallowedBluetoothProtocols_test_003
     * @tc.desc   removeDisallowedBluetoothProtocols with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothProtocols_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothProtocols_test_003  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, null, protocols);
        console.info(' --- removeDisallowedBluetoothProtocols_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothProtocols_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothProtocols_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothProtocols_test_004
     * @tc.number removeDisallowedBluetoothProtocols_test_004
     * @tc.desc   removeDisallowedBluetoothProtocols with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothProtocols_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothProtocols_test_004  -------- START --------');
      try {
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, undefined, protocols);
        console.info(' --- removeDisallowedBluetoothProtocols_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothProtocols_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothProtocols_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothProtocols_test_005
     * @tc.number removeDisallowedBluetoothProtocols_test_005
     * @tc.desc   removeDisallowedBluetoothProtocols with null parameter protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothProtocols_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothProtocols_test_005  -------- START --------');
      try {
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, DEFAULT_USER_ID, null);
        console.info(' --- removeDisallowedBluetoothProtocols_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothProtocols_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothProtocols_test_005  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedBluetoothProtocols_test_006
     * @tc.number removeDisallowedBluetoothProtocols_test_006
     * @tc.desc   removeDisallowedBluetoothProtocols with undefined parameter protocols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedBluetoothProtocols_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedBluetoothProtocols_test_006  -------- START --------');
      try {
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, DEFAULT_USER_ID, undefined);
        console.info(' --- removeDisallowedBluetoothProtocols_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedBluetoothProtocols_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedBluetoothProtocols_test_006  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_001
     * @tc.number getDisallowedBluetoothProtocols_test_001
     * @tc.desc   getDisallowedBluetoothProtocols with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_001  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(null, DEFAULT_USER_ID);
        console.info(' --- getDisallowedBluetoothProtocols_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_001  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_002
     * @tc.number getDisallowedBluetoothProtocols_test_002
     * @tc.desc   getDisallowedBluetoothProtocols with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_002  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(undefined, DEFAULT_USER_ID);
        console.info(' --- getDisallowedBluetoothProtocols_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_002  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_003
     * @tc.number getDisallowedBluetoothProtocols_test_003
     * @tc.desc   getDisallowedBluetoothProtocols with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_003  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, null);
        console.info(' --- getDisallowedBluetoothProtocols_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_003  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_004
     * @tc.number getDisallowedBluetoothProtocols_test_004
     * @tc.desc   getDisallowedBluetoothProtocols with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_004  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, undefined);
        console.info(' --- getDisallowedBluetoothProtocols_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_004  -------- END --------');
    })

    /**
     * @tc.name   getBluetoothInfo_test_015
     * @tc.number getBluetoothInfo_test_015
     * @tc.desc   getBluetoothInfo with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getBluetoothInfo_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getBluetoothInfo_test_015  -------- START --------');
      try {
        bluetoothManager.getBluetoothInfo(null);
        console.info(' --- getBluetoothInfo_test_015 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getBluetoothInfo_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getBluetoothInfo_test_015  -------- END --------');
    })


    /**
     * @tc.name   getBluetoothInfo_test_016
     * @tc.number getBluetoothInfo_test_016
     * @tc.desc   getBluetoothInfo with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getBluetoothInfo_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getBluetoothInfo_test_016  -------- START --------');
      try {
        bluetoothManager.getBluetoothInfo(undefined);
        console.info(' --- getBluetoothInfo_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getBluetoothInfo_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getBluetoothInfo_test_016  -------- END --------');
    })


    /**
     * @tc.name   getAllowedBluetoothDevices_test_016
     * @tc.number getAllowedBluetoothDevices_test_016
     * @tc.desc   getAllowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("getAllowedBluetoothDevices_test_016", Level.LEVEL2, async (done: Function) => {
       console.info(' --- getAllowedBluetoothDevices_test_016  -------- START --------');
       try {
         bluetoothManager.getAllowedBluetoothDevices(undefined);
         console.info(' --- getAllowedBluetoothDevices_test_016 error is expected, but it done.');
         expect(false).assertTrue();
       } catch (error) {
         console.info(' --- getAllowedBluetoothDevices_test_016 error 401 is expected, actually catch: ' + error.code);
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
       console.info(' --- getAllowedBluetoothDevices_test_016  -------- END --------');
     })



    /**
     * @tc.name   turnOnBluetooth_test_015
     * @tc.number turnOnBluetooth_test_015
     * @tc.desc   turnOnBluetooth with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOnBluetooth_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOnBluetooth_test_015  -------- START --------');
      try {
        bluetoothManager.turnOnBluetooth(null);
        console.info(' --- turnOnBluetooth_test_015 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOnBluetooth_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOnBluetooth_test_015  -------- END --------');
    })


    /**
     * @tc.name   turnOnBluetooth_test_016
     * @tc.number turnOnBluetooth_test_016
     * @tc.desc   turnOnBluetooth with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOnBluetooth_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOnBluetooth_test_016  -------- START --------');
      try {
        bluetoothManager.turnOnBluetooth(undefined);
        console.info(' --- turnOnBluetooth_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOnBluetooth_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOnBluetooth_test_016  -------- END --------');
    })


    /**
     * @tc.name   turnOffBluetooth_test_015
     * @tc.number turnOffBluetooth_test_015
     * @tc.desc   turnOffBluetooth with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOffBluetooth_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOffBluetooth_test_015  -------- START --------');
      try {
        bluetoothManager.turnOffBluetooth(null);
        console.info(' --- turnOffBluetooth_test_015 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOffBluetooth_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOffBluetooth_test_015  -------- END --------');
    })


    /**
     * @tc.name   turnOffBluetooth_test_016
     * @tc.number turnOffBluetooth_test_016
     * @tc.desc   turnOffBluetooth with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("turnOffBluetooth_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- turnOffBluetooth_test_016  -------- START --------');
      try {
        bluetoothManager.turnOffBluetooth(undefined);
        console.info(' --- turnOffBluetooth_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- turnOffBluetooth_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- turnOffBluetooth_test_016  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothDevices_test_016
     * @tc.number getDisallowedBluetoothDevices_test_016
     * @tc.desc   getDisallowedBluetoothDevices with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothDevices_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothDevices_test_016  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothDevices(undefined);
        console.info(' --- getDisallowedBluetoothDevices_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothDevices_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothDevices_test_016  -------- END --------');
    })

    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_029
     * @tc.number getDisallowedBluetoothProtocols_test_029
     * @tc.desc   getDisallowedBluetoothProtocols with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_029  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(null, DEFAULT_USER_ID);
        console.info(' --- getDisallowedBluetoothProtocols_test_029 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_029  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_030
     * @tc.number getDisallowedBluetoothProtocols_test_030
     * @tc.desc   getDisallowedBluetoothProtocols with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_030  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(undefined, DEFAULT_USER_ID);
        console.info(' --- getDisallowedBluetoothProtocols_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_030  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_031
     * @tc.number getDisallowedBluetoothProtocols_test_031
     * @tc.desc   getDisallowedBluetoothProtocols with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_031  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, null);
        console.info(' --- getDisallowedBluetoothProtocols_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_031  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedBluetoothProtocols_test_032
     * @tc.number getDisallowedBluetoothProtocols_test_032
     * @tc.desc   getDisallowedBluetoothProtocols with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedBluetoothProtocols_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedBluetoothProtocols_test_032  -------- START --------');
      try {
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, undefined);
        console.info(' --- getDisallowedBluetoothProtocols_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedBluetoothProtocols_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedBluetoothProtocols_test_032  -------- END --------');
    })

    /**
     * @tc.name   test_adddisallowedbluetoothprotocolswithpolicy_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_1300
     * @tc.desc   test addDisallowedBluetoothProtocols with policy parameter and accountId=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_adddisallowedbluetoothprotocolswithpolicy_1300', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = -1;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.addDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getdisallowedbluetoothprotocolswithpolicy_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_0900
     * @tc.desc   test getDisallowedBluetoothProtocols with policy parameter and accountId=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getdisallowedbluetoothprotocolswithpolicy_0900', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = -1;
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.getDisallowedBluetoothProtocols(SELFWANT, accountId, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removedisallowedbluetoothprotocolswithpolicy_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDBLUETOOTHPROTOCOLSWITHPOLICY_1100
     * @tc.desc   test removeDisallowedBluetoothProtocols with policy parameter and accountId=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_removedisallowedbluetoothprotocolswithpolicy_1100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let accountId: number = -1;
        let protocols: Array<bluetoothManager.Protocol> = [bluetoothManager.Protocol.GATT,
          bluetoothManager.Protocol.SPP];
        let policy: bluetoothManager.TransferPolicy = bluetoothManager.TransferPolicy.RECEIVE_SEND;
        bluetoothManager.removeDisallowedBluetoothProtocols(SELFWANT, accountId, protocols, policy);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}
