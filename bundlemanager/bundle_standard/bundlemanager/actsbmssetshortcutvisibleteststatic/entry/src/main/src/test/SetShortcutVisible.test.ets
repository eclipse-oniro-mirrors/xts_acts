/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { BundleInfo } from 'bundleManager.BundleInfo';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import shortcutManager from '@ohos.bundle.shortcutManager';

let DOMAIN: int = 0x0000;
let tag: string = 'testTag';

export default function setShortcutVisible() {
  describe('setShortcutVisible', () => {

    /**
     * @tc.name   Sub_Bms_Framework_shortcutManager_static_001
     * @tc.number Sub_Bms_Framework_shortcutManager_static_001
     * @tc.desc   Obtain the shortcut config data through the get interface to determine if it is correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_shortcutManager_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let tag = 'Sub_Bms_Framework_shortcutManager_static_001';
        hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
        const data = await shortcutManager.getAllShortcutInfoForSelf()
        hilog.info(DOMAIN, 'getAllShortcutInfoForSelfData:', JSON.stringify(data));
        expect(data.length>0).assertTrue();
        expect(data[0].id).assertEqual("shortcut_id");
        expect(data[0].bundleName).assertEqual("ohos.acts.bms.setshortcutvisibletest.static");
        expect(data[0].moduleName).assertEqual("entry");
        expect(data[0].icon).not().assertNull();
        expect(data[0].iconId).assertEqual(0);
        expect(data[0].hostAbility).not().assertNull();
        expect(data[0].label).not().assertNull();
        expect(data[0].labelId).assertEqual(0);
        expect(data[0].appIndex).assertEqual(0);
        expect(data[0].visible).assertEqual(true);
        expect(data[0].sourceType).assertEqual(1);
        expect(data?.[0]?.wants?.[0]?.targetBundle).assertEqual("com.example.shortcuttest");
        expect(data?.[0]?.wants?.[0]?.targetModule).assertEqual("entry");
        expect(data?.[0]?.wants?.[0]?.targetAbility).assertEqual("EntryAbility");
        expect(data?.[0]?.wants?.[0]?.parameters?.[0].key).assertEqual("index");
        expect(data?.[0]?.wants?.[0]?.parameters?.[0].value).assertEqual("0");
        done();
      } catch (error) {
        hilog.error(DOMAIN, 'getAllShortcutInfoForSelfData', JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_Icon_ShortcutVisible_static_0500
     * @tc.number Sub_Bms_Framework_Icon_ShortcutVisible_static_0500
     * @tc.desc   Test setShortcutVisibleForSelf with shortcut id is nonexistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Icon_ShortcutVisible_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_static_0500 begin');
      try {
        await shortcutManager.setShortcutVisibleForSelf('not_exist', false);
        expect().assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        let msg: string = `setShortcutVisibleForSelf(not_exist,false) failed: ${JSON.stringify(error)}`;
        hilog.info(DOMAIN, 'testTag', '%{public}s', msg);
        expect(error.code).assertEqual(17700070);
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_static_0500 end');
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_Icon_ShortcutVisible_static_0600
     * @tc.number Sub_Bms_Framework_Icon_ShortcutVisible_static_0600
     * @tc.desc   Test setShortcutVisibleForSelf with shortcut id is valid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Icon_ShortcutVisible_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_static_0600 begin');
      try {
        let result = shortcutManager.setShortcutVisibleForSelf('id_test1', false);
        expect(result).not().assertNull();
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_static_0600 end');
        done();
      } catch (error) {
        let msg: string = `setShortcutVisibleForSelf(id_test1,false) failed: ${JSON.stringify(error)}`;
        hilog.info(DOMAIN, 'testTag', '%{public}s', msg);
        expect().assertFail();
        done();
      }
    })

  })
}

