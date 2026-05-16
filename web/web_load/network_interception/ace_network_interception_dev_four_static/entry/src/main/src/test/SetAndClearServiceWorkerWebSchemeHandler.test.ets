/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function SetAndClearServiceWorkerWebSchemeHandler() {
  describe('SetAndClearServiceWorkerWebSchemeHandler', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /**
    * @tc.name        testSetAndClearServiceWorkerWebSchemeHandlerStatic0100
    * @tc.number      SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0100
    * @tc.desc        test setAndClearServiceWorkerWebSchemeHandler
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testSetAndClearServiceWorkerWebSchemeHandlerStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("setAndClearServiceWorkerWebSchemeHandler0100", 10)
      Utils.registerEvent("setAndClearServiceWorkerWebSchemeHandler0100", "GET", 8854, done);
      Utils.registerEvent("setAndClearServiceWorkerWebSchemeHandler0100", false, 8860, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
    * @tc.name        testSetAndClearServiceWorkerWebSchemeHandlerStatic0200
    * @tc.number      SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0200
    * @tc.desc        test setAndClearServiceWorkerWebSchemeHandler
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testSetAndClearServiceWorkerWebSchemeHandlerStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("setAndClearServiceWorkerWebSchemeHandler0200", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("setAndClearServiceWorkerWebSchemeHandler0200", "lock", 8862, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testCustomizeSchemesStatic001
     * @tc.number SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0300
     * @tc.desc   test customizeSchemes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testCustomizeSchemes001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testCustomizeSchemes001", 17100020, 148350, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testCustomizeSchemesStatic002
     * @tc.number SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0400
     * @tc.desc   test customizeSchemes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testCustomizeSchemes002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testCustomizeSchemes002", true, 148351, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrueStatic
     * @tc.number SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0500
     * @tc.desc   test customizeSchemesLazyInitWebEngine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitCustomizeSchemesLazyInitWebEngineTrue", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("emitCustomizeSchemesLazyInitWebEngineTrue", 17100020, 148353, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testCustomizeSchemesLazyInitWebEngineFalseStatic
     * @tc.number SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0600
     * @tc.desc   test customizeSchemesLazyInitWebEngine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomizeSchemesLazyInitWebEngineFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitCustomizeSchemesLazyInitWebEngineFalse", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("emitCustomizeSchemesLazyInitWebEngineFalse", 17100020, 148354, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testWebSchemeHandlerEmptyStatic
     * @tc.number SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0700
     * @tc.desc   test webSchemeHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSchemeHandlerEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("setWebSchemeHandlerEmpty", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("setWebSchemeHandlerEmpty", true, 148352, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testSetServiceWorkerWebSchemeHandlerEmptyStatic
     * @tc.number SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0800
     * @tc.desc   test setServiceWorkerWebSchemeHandlerEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetServiceWorkerWebSchemeHandlerEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("setServiceWorkerWebSchemeHandlerEmpty", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("setServiceWorkerWebSchemeHandlerEmpty", true, 1483521, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
    * @tc.name        emitOnSwitchNextPageStatic03
    * @tc.number      emitOnSwitchNextPageStatic03
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitOnSwitchNextPageStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
