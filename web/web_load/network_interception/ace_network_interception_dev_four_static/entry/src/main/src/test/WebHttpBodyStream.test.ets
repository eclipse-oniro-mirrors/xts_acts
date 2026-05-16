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

let testAbilityContext:common.UIAbilityContext;

export default function WebHttpBodyStream() {
  describe('WebHttpBodyStream', (): void => {
        beforeAll(async (): Promise<void> => {
          console.log('App start')
        });
        beforeEach(async () => {
          await Utils.msSleep(2000);
          console.info('web beforeEach start');
        })

    /**
    * @tc.name        testWebHttpBodyStreamStatic0100
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_100
    * @tc.desc        test WebHttpBodyStream
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebHttpBodyStreamStatic0100',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("WebHttpBodyStream0100", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("WebHttpBodyStream0100", true, 8820, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_onRequestStart", true, 1418, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getHttpBodyStream", true, 1419, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_initialize", true, 1420, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getSize", 66, 1421, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getPosition", 0, 1422, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isChunked", false, 1423, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isOF", false, 1424, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isInMemory", true, 1425, done);
      Utils.registerEvent("testWebViewSdkSchemeHandler_read", true, 1426, done);
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebHttpBodyStream', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
    * @tc.name        emitOnSwitchNextPageStatic02
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_200
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitOnSwitchNextPageStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHttpBodyStream', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
