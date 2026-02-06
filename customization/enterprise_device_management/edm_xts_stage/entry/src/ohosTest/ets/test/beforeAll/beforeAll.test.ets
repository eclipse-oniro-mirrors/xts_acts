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
 
import { describe, expect, it, Level } from '@ohos/hypium';
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  BLUETOOTH_STATE,
  WIFI_STATE,
  setBluetoothState,
  setWifiState
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bluetoothManager from '@ohos.enterprise.bluetoothManager';
import wifiManager from '@ohos.enterprise.wifiManager';

export default function beforeAllTest() {
  describe('beforeAll_test', () => {
    /**
     * @tc.name   test_get_bluetooth_state_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_STATE_0100
     * @tc.desc   test getBluetoothState with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_bluetooth_state_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bluetoothInfo: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        setBluetoothState(bluetoothInfo.state);
        expect(bluetoothInfo != null).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_wifi_state_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_WIFI_STATE_0200
     * @tc.desc   test isWifiActiveSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_wifi_state_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let wifiState: boolean = wifiManager.isWifiActiveSync(SELFWANT);
        setWifiState(wifiState);
        expect(wifiState !== undefined).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  })
}