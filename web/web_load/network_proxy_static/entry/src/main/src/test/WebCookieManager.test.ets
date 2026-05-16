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

    /**
     * @tc.name   testRemoveAllCacheStatic002
     * @tc.number SUB_WEB_REMOVEALLCACHE_0200
     * @tc.desc   test removeAllCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllCacheStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('testRemoveAllCache002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRemoveAllCache002', 'success', 202502212, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic001
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0100
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_NONE', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_NONE', 0, 202502213, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic002
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0200
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_LAX', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_LAX', 1, 202502214, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic003
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0300
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_STRICT', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_STRICT', 2, 202502215, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic004
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0400
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_samesitePolicy', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_samesitePolicy', true, 202502216, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic005
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0500
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_name', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_name', true, 202502217, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic006
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0600
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_isSessionCookie', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_isSessionCookie', true, 202502218, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic007
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0700
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_value', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_value', true, 202502219, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic008
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0800
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_path', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_path', true, 202502220, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic009
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_0900
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_isHttpOnly', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_isHttpOnly', true, 202502221, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic010
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_1000
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_isSecure', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_isSecure', true, 202502222, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebHttpCookieSameSitePolicyStatic011
     * @tc.number SUB_WEB_WEBHTTPCOOKIESAMESITEPOLICY_1100
     * @tc.desc   test webHttpCookieSameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHttpCookieSameSitePolicyStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent('WebHttpCookieSameSitePolicy_domain', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebHttpCookieSameSitePolicy_domain', true, 202502223, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCookieManagerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOnSwitchNextPageStatic
     * @tc.number emitonSwitchNextPage1111111
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
