/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();
let testAbilityContext:common.UIAbilityContext;

export default function webSslErrorTest() {

    describe('WebSslErrorTest', (): void => {
      beforeAll(async (): Promise<void> => {
        console.log('App start')
        let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName:'entry',
          onAbilityCreate: (abilitys : UIAbility) : void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err : BusinessError| null) : void => {
          if (err != null ) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.websitecertificatetwotest.static')
        await Utils.msSleep(3000)
        console.log('beforeAll end,%s', 'Succeed!')
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('web beforeEach start');
      })
    /**
     * @tc.name   testSslErrorInvalidStatic001
     * @tc.number SUB_WEB_SSL_ERRORDATEINVALID_0100
     * @tc.desc   test SslError DateInvalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSslErrorInvalidStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitSslErrorInvalid", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSslErrorInvalidStatic001", 0, 202699, done);
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(6000);
        done();
      })
    /**
     * @tc.name   testSslErrorDateInvalidStatic001
     * @tc.number SUB_WEB_SSLERROR_DATEINVALID_0100
     * @tc.desc   test SslError DateInvalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSslErrorDateInvalidStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitSslErrorDateInvalid", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSslErrorDateInvalid001", 2, 202700, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testSslErrorUntrustedStatic001
     * @tc.number SUB_WEB_SSL_ERRORUNTRUSTED_0100
     * @tc.desc   test SslError Untrusted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSslErrorUntrustedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitSslErrorUntrusted", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSslErrorUntrusted001", 3, 202710, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testSslErrorHandlerStatic001
     * @tc.number SUB_WEB_SSL_ERRORHANDLER_0100
     * @tc.desc   test SslError Handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSslErrorHandlerStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitSslErrorHostMismatch", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSslErrorHandler001", 1, 202730, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testSslErrorHostMismatchStatic001
     * @tc.number SUB_WEB_SSL_ERRORHOSTMISMATCH_0100
     * @tc.desc   test SslError HostMismatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSslErrorHostMismatchStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitSslErrorHandler", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitSslErrorHandler", 117, 202740, done);
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(6000);
        done();
      })
    /**
     * @tc.name   testLoadUrlStatic005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0500
     * @tc.desc   test loadUrl with headers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testLoadUrl005", 10);
      Utils.registerEvent("testLoadUrl005", 17100002, 201120, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testLoadUrlStatic006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0600
     * @tc.desc   test loadUrl with headers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testLoadUrl006", 10);
      Utils.registerEvent("testLoadUrl006", "index", 201130, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testLoadUrlStatic008
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0800
     * @tc.desc   test loadUrl with headers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testLoadUrl008", 10);
      Utils.registerEvent("testLoadUrl008", "index", 201150, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testLoadUrlStatic009
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0900
     * @tc.desc   test loadUrl with 170001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic009', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testLoadUrl009", 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testLoadUrl009", 17100001, 201151, done);
      await Utils.msSleep(2000)
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testLoadUrlStatic010
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADURL_1000
     * @tc.desc   test loadUrl with 170001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic010', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testLoadUrl010", 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testLoadUrl010", 17100002, 201152, done);
      await Utils.msSleep(2000)
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testLoadUrlStatic011
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADURL_1100
     * @tc.desc   test loadUrl with 170001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic011', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testLoadUrl011", 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testLoadUrl010", 17100003, 201153, done);
      await Utils.msSleep(2000)
      let button = await driver.findComponent(ON.id('WebSslErrorTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      SUB_WEB_Switch_NextPageStatic_1100
     * @tc.desc        test PAGE_REDIRECT
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebSslErrorTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
