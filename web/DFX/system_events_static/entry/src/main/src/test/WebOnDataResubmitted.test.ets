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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
const driver = Driver.create();
export default function webOnDataResubmitted() {
  describe('WebOnDataResubmittedTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testDataResubmissionHandlerResendStatic001
    * @tc.number       SUB_WEB_DATA_RESUBMISSION_HANDLER_RESEND_STATIC_0100
    * @tc.desc         test dataResubmissionHandler.resend
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testDataResubmissionHandlerResendStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitDataResubmissionHandlerResend', 10)
      await Utils.msSleep(3000);
      let buttonOne = await driver.findComponent(ON.id('onDataResubmittedKey'));
      Utils.registerEvent('testDataResubmissionHandlerResend001', true, 60600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnDataResubmittedTestButton', 10, '');
      if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.clickAt(point)
        console.info("buttonOne.clickAt")
      }
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testDataResubmissionHandlerCancelStatic001
    * @tc.number       SUB_WEB_DATA_RESUBMISSION_HANDLER_CANCEL_STATIC_0100
    * @tc.desc         test dataResubmissionHandler.cancel
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testDataResubmissionHandlerCancelStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitDataResubmissionHandlerCancel', 10)
      await Utils.msSleep(3000);
      let buttonOne = await driver.findComponent(ON.id('onDataResubmittedKey'));
      Utils.registerEvent('testDataResubmissionHandlerCancel001', false, 60601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnDataResubmittedTestButton', 10, '');
      if(buttonOne){
        let point = await buttonOne.getBoundsCenter()
        await driver.clickAt(point)
        console.info("buttonOne.clickAt")
      }
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         SwitchNextPageStatic
    * @tc.number       SUB_WEB_SWITCH_NEXT_PAGE123
    * @tc.desc         test SwitchNextPageStatic
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebOnDataResubmittedTestButton', 10, '');
        await Utils.msSleep(3000);
        done()
      })
  })
}