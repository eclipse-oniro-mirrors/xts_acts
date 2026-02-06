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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import{ BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;
export default function webCookieManager() {
  describe('WebCookieManagerTestSuite', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.info("webCookieManager beforeAll start");
    })

    /**
     * @tc.name   testSaveCookieSyncStatic001
     * @tc.number SUB_WEB_SAVECOOKIESYNC_0100
     * @tc.desc   test saveCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSaveCookieSyncStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(6000);
      Utils.emitEvent('testSaveCookieSync001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testSaveCookieSync001', 'success', 202502180, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testRemoveAllCacheStatic001
     * @tc.number SUB_WEB_REMOVEALLCACHE_0100
     * @tc.desc   test removeAllCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllCacheStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('testRemoveAllCache001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRemoveAllCache001', 'success', 202502211, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
