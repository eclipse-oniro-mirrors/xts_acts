/*
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function webJavaScriptOnDoucmentEnd() {
  describe('ActsAceWebJavaScriptOnDoucmentEnd', ():void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });


    beforeEach(async () => {
      await Utils.msSleep(2000);
    })

    /**
     * @tc.name        testJavaScriptOnDocumentEndStatic001
     * @tc.number      SUB_WEB_JAVASCRIPTONDOCUMENTENd_0100
     * @tc.desc        test javaScriptOnDocumentStart
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testJavaScriptOnDocumentEndStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testJavaScriptOnDocumentEnd001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testJavaScriptOnDocumentEnd001", '"Red"', 202603201, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebJavaScriptOnDocumentEndTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testJavaScriptOnDocumentStartStatic002
     * @tc.number SUB_WEB_JAVASCRIPTONDOCUMENTENd_0200
     * @tc.desc   test javaScriptOnDocumentStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJavaScriptOnDocumentEndStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testJavaScriptOnDocumentEnd002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testJavaScriptOnDocumentEnd002", '"Red"', 202603202, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebJavaScriptOnDocumentEndTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testJavaScriptOnDocumentEndStatic003
     * @tc.number SUB_WEB_JAVASCRIPTONDOCUMENTEND_0300
     * @tc.desc   test javaScriptOnDocumentEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJavaScriptOnDocumentEndStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testJavaScriptOnDocumentEnd003", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testJavaScriptOnDocumentEnd003", true, 202603203, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebJavaScriptOnDocumentEndTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      SwitchNextPageStatic3333333
     * @tc.desc        test SwitchNextPageStatic
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(3000);
        inspector.sendEventByKey('WebJavaScriptOnDocumentEndTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
