/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitFetchCookieSync";

export default function webViewControllerJsunit1() {
  describe('ActsAceWebDevWebViewControllerTest1',  () => {
    beforeAll(async (): Promise<void> => {
      try {
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testFetchCookieSyncIncognitoErrorStatic006
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0600
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoErrorStatic006',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieSyncIncognitoError006", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('testFetchCookieSyncIncognitoError006', 'ccs=bbc', 123215, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncIncognitoErrorStatic005
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0500
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoErrorStatic005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieSyncIncognitoError005", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('testFetchCookieSyncIncognitoError005', 'no error happened', 123214, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncIncognitoErrorStatic004
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0400
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoErrorStatic004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieSyncIncognitoError004", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('testFetchCookieSyncIncognitoError004', '17100002URL error. No valid cookie found for the specified URL.', 123213, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncIncognitoErrorStatic003
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0300
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoErrorStatic003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieSyncIncognitoError003", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent("testFetchCookieSyncIncognitoError003",'no error happened', 123212, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncIncognitoErrorStatic002
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0200
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoErrorStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieSyncIncognitoError002", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent("testFetchCookieSyncIncognitoError002",'', 123211, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncIncognitoErrorStatic001
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0100
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoErrorStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieSyncIncognitoError001", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('testFetchCookieSyncIncognitoError001', '17100002URL error. No valid cookie found for the specified URL.', 123210, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testExistCookieStatic012
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1200
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExistCookieStatic012',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testExistCookie012', 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testExistCookie012', false, 100312, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testWebViewClearAllCookiesSyncIncognitoStatic
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0005
     * @tc.desc   test clearAllCookiesSync incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewClearAllCookiesSyncIncognitoStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewIncognitoMode05', 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('emitWebViewIncognitoMode05', 'success', 134210, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      testWebViewWindowFeatures0091
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done()
      })
  })
}
