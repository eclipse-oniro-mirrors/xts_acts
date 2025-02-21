/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it } from '@ohos/hypium'
import connection from '@ohos.net.connection';

export default function netSyncTest() {
  describe('netSyncTest', function () {

    /*
     * @tc.number  Telephony_NetManagerSync_getDefaultSync_0100
     * @tc.name   Whether the getAllNetsSync method is called successfully with WIFI
     * @tc.desc    Function test
     */
    it('Telephony_NetManagerSync_getAllNetsSync_0100', 0, async function (done) {
      let nethandles = connection.getAllNetsSync();
      expect(nethandles.length >= 0).assertTrue();
      done();
    });

    /*
     * @tc.number  Telephony_NetManagerSync_getConnectionPropertiesSync_0100
     * @tc.name   Whether the getConnectionPropertiesSync_ method is called successfully with WIFI
     * @tc.desc    Function test
     */
    it('Telephony_NetManagerSync_getConnectionPropertiesSync_0100', 0, async function (done) {
      let nethandle = connection.getDefaultNetSync();
      let nethandles = connection.getConnectionPropertiesSync(nethandle);
      expect(nethandles.linkAddresses.length >= 0).assertTrue();
      done();
    });

    /*
     * @tc.number  Telephony_NetManagerSync_getNetCapabilitiesSync_0100
     * @tc.name   Whether the getNetCapabilitiesSync method is called successfully with WIFI
     * @tc.desc    Function test
     */
    it('Telephony_NetManagerSync_getNetCapabilitiesSync_0100', 0, async function (done) {
      let nethandle = connection.getDefaultNetSync();
      let caps = connection.getNetCapabilitiesSync(nethandle);
      expect(caps.networkCap.length > 0).assertTrue();
      done();
    });

    /*
     * @tc.number  Telephony_NetManagerSync_isDefaultNetMeteredSync_0100
     * @tc.name   Whether the isDefaultNetMeteredSync method is called successfully with WIFI
     * @tc.desc    Function test
     */
    it('Telephony_NetManagerSync_isDefaultNetMeteredSync_0100', 0, async function (done) {
      let caps = connection.isDefaultNetMeteredSync();
      expect(caps == true).assertTrue();
      done();
    });

    /*
     * @tc.number  Telephony_NetManagerSync_hasDefaultNetSync_0100
     * @tc.name   Whether the hasDefaultNetSync method is called successfully with WIFI
     * @tc.desc    Function test
     */
    it('Telephony_NetManagerSync_hasDefaultNetSync_0100', 0, async function (done) {
      let has = connection.hasDefaultNetSync();
      expect(has == true).assertTrue();
      done();
    });

    /*
     * @tc.number  Telephony_NetManagerSync_getAppNetSync_0100
     * @tc.name   Whether the getAppNetSync method is called successfully with WIFI
     * @tc.desc    Function test
     */
    it('Telephony_NetManagerSync_getAppNetSync_0100', 0, async function (done) {
      let has = connection.getAppNetSync();
      expect(has.netId == 0).assertTrue();
      done();
    });

});
}