/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { shortcutManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0x0000;

export default function setShortcutVisible() {
  describe('setShortcutVisible', () => {
    /**
     * @tc.name   Sub_Bms_Framework_Icon_ShortcutVisible_0200
     * @tc.number Sub_Bms_Framework_Icon_ShortcutVisible_0200
     * @tc.desc   Test setShortcutVisibleForSelf with shortcut id is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Icon_ShortcutVisible_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0200 begin');
        try {
          await shortcutManager.setShortcutVisibleForSelf(null, false);
          expect().assertFail();
          done();
        } catch (error) {
          let msg: string = `setShortcutVisibleForSelf(null,false) failed: ${JSON.stringify(error)}`;
          hilog.info(DOMAIN, 'testTag', '%{public}s', msg);
          expect(error.code).assertEqual(401);
          hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0200 end');
          done();
        }
    })

    /**
     * @tc.name   Sub_Bms_Framework_Icon_ShortcutVisible_0300
     * @tc.number Sub_Bms_Framework_Icon_ShortcutVisible_0300
     * @tc.desc   Test setShortcutVisibleForSelf with shortcut id is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Icon_ShortcutVisible_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0300 begin');
        try {
          await shortcutManager.setShortcutVisibleForSelf("", false);
          expect().assertFail();
          done();
        } catch (error) {
          let msg: string = `setShortcutVisibleForSelf("",false) failed: ${JSON.stringify(error)}`;
          hilog.info(DOMAIN, 'testTag', '%{public}s', msg);
          expect(error.code).assertEqual(17700070);
          hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0300 end');
          done();
        }
    })

    /**
     * @tc.name   Sub_Bms_Framework_Icon_ShortcutVisible_0400
     * @tc.number Sub_Bms_Framework_Icon_ShortcutVisible_0400
     * @tc.desc   Test setShortcutVisibleForSelf with shortcut id is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Icon_ShortcutVisible_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0400 begin');
        try {
          await shortcutManager.setShortcutVisibleForSelf(undefined, false);
          expect().assertFail();
          done();
        } catch (error) {
          let msg: string = `setShortcutVisibleForSelf(undefined,false) failed: ${JSON.stringify(error)}`;
          hilog.info(DOMAIN, 'testTag', '%{public}s', msg);
          expect(error.code).assertEqual(401);
          hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0400 end');
          done();
        }
    })

    /**
     * @tc.name   Sub_Bms_Framework_Icon_ShortcutVisible_0500
     * @tc.number Sub_Bms_Framework_Icon_ShortcutVisible_0500
     * @tc.desc   Test setShortcutVisibleForSelf with shortcut id is nonexistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Icon_ShortcutVisible_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0500 begin');
        try {
          await shortcutManager.setShortcutVisibleForSelf('not_exist', false);
          expect().assertFail();
          done();
        } catch (error) {
          let msg: string = `setShortcutVisibleForSelf(not_exist,false) failed: ${JSON.stringify(error)}`;
          hilog.info(DOMAIN, 'testTag', '%{public}s', msg);
          expect(error.code).assertEqual(17700070);
          hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0500 end');
          done();
        }
    })

    /**
     * @tc.name   Sub_Bms_Framework_Icon_ShortcutVisible_0600
     * @tc.number Sub_Bms_Framework_Icon_ShortcutVisible_0600
     * @tc.desc   Test setShortcutVisibleForSelf with shortcut id is valid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Icon_ShortcutVisible_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0600 begin');
        try {
          let result = await shortcutManager.setShortcutVisibleForSelf('id_test1', false);
          expect(result).assertNull();
          hilog.info(DOMAIN, 'testTag', '%{public}s', 'Sub_Bms_Framework_Icon_ShortcutVisible_0600 end');
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