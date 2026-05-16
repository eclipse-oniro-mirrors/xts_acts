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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function webClearAllCookiesSyncCharacter() {

  describe('webClearAllCookiesSyncCharacterTestSuite', () => {
      beforeAll(async (): Promise<void> => {
        await Utils.msSleep(2000)
        console.log("App start")
      });

      beforeEach(async () => {
        await Utils.msSleep(3000);
        console.info("web beforeEach start");
      })

    /**
     * @tc.name   testClearAllCookiesSyncCharacterStatic
     * @tc.number SUB_WEB_CLEARALLCOOKIESSYNC_CHARACTER_0100
     * @tc.desc   test clearAllCookiesSync \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAllCookiesSyncCharacterStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClearAllCookiesSyncCharacter', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testClearAllCookiesSyncCharacter', 'success', 133410, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webClearAllCookiesSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testClearAllCookiesSyncCharacterIncognitoStatic
     * @tc.number SUB_WEB_CLEARALLCOOKIESSYNC_CHARACTER_0200
     * @tc.desc   test clearAllCookiesSync incognito \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAllCookiesSyncCharacterIncognitoStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClearAllCookiesSyncCharacterIncognito', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testClearAllCookiesSyncCharacterIncognito', 'success', 133420, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webClearAllCookiesSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name       : SwitchNextPageStatic
     * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_02
     * @tc.desc       : test PAGE_REDIRECT
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webClearAllCookiesSyncCharacterButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
