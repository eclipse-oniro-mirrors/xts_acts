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

let testAbilityContext:common.UIAbilityContext;
export default function webViewSrollableJsunit() {
  describe('scrollTest',  () =>{
    beforeAll(async  (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info('scroll beforeEach start');
    })

    /**
     * @tc.name   scrollStatic01
     * @tc.number SUB_ACE_BASIC_ETS_SCROLL_API_001
     * @tc.desc   test blurMode01 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('scrollStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('scroll01', 10)
      let driver = Driver.create()
      await Utils.msSleep(2000);
      let button1 = await driver.findComponent(ON.id('scrollToButton'));
      button1?.click();
      await Utils.msSleep(1000);
      Utils.registerEvent('scroll01',50,20241225,done);
      await Utils.msSleep(2000);
      let button2 = await driver.findComponent(ON.id('scrollEvent01'));
      await Utils.msSleep(1000);
      button2?.click();
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   scrollStatic02
     * @tc.number SUB_ACE_BASIC_ETS_SCROLL_API_002
     * @tc.desc   test blurMode02 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('scrollStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent('scroll02', 10)
      await Utils.msSleep(2000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('scrollByButton'));
      button?.click();
      await Utils.msSleep(1000);
      Utils.registerEvent('scroll02',80,20241226,done);
      await Utils.msSleep(1000);
      let button2 = await driver.findComponent(ON.id('scrollEvent01'));
      button2?.click();
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number emitonSwitchNextPage
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage2', 10)
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('scrollEvent01'));
        await Utils.msSleep(1000);
        button?.click();
        await Utils.msSleep(5000)
        done()
      })
  })
}
