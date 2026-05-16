/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it ,afterEach} from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;


let emitKey = 'emitRefreshOnfirstcontentfulpaintWebc';

export default function webOnFirstContFour() {
  describe('ActsAceWebDevWebOnFirstContFourTest', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(3000);
      console.log('App start')
    });


    beforeEach(async () => {
      console.info('webOnFirstContFour beforeEach start');
    })

    /**
     * @tc.name   testOnfirstcontentfulpaintrefreshWebcStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBPATR5_API_0400
     * @tc.desc   onfirstcontentfulpaint with web refresh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnfirstcontentfulpaintrefreshWebcStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent('emitRefreshOnfirstcontentfulpaintWebc', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnfirstcontentfulpaintrefreshWebc', true, 428, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webOnFirstContFour', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_ACE_BASIC_ETS_WEBPATR5_API_0500
     * @tc.desc   PAGE_REDIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webOnFirstContFour'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(10000);
        done();
      })
  })
}
