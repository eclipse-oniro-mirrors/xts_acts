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

export default function WebSchemeHandlerRequest() {
  describe('webSchemeHandlerRequest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
    * @tc.name        testWebSchemeHandlerRequestStatic0100
    * @tc.number      SUB_WEB_SCHEMEHANDLERREQUEST_0100
    * @tc.desc        test webSchemeHandlerRequest
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebSchemeHandlerRequestStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("webSchemeHandlerRequest0100", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("webSchemeHandlerRequest_getRequestUrl", true, 142120, done);
      Utils.registerEvent("webSchemeHandlerRequest_getRequestMethod", true, 142130, done);
      Utils.registerEvent("webSchemeHandlerRequest_getReferrer", true, 142140, done);
      Utils.registerEvent("webSchemeHandlerRequest_isMainFrame", true, 142150, done);
      Utils.registerEvent("webSchemeHandlerRequest_hasGesture", true, 142160, done);
      Utils.registerEvent("webSchemeHandlerRequest_getRequestResourceType", true, 142161, done);
      Utils.registerEvent("webSchemeHandlerRequest_getHeader", true, 142110, done);
      Utils.registerEvent("webSchemeHandlerRequest_didFail", true, 142190, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSchemeHandlerRequest', 10, '');
      await Utils.msSleep(6000);
      done();
    })


    /**
    * @tc.name        emitOnSwitchNextPageStatic04
    * @tc.number      emitOnSwitchNextPageStatic04
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitOnSwitchNextPageStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webSchemeHandlerRequest', 10, '');
        await Utils.msSleep(2000);
        done();
      })

  })
}