'use static';
/**
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  afterAll
} from "../../../../hypium/index";
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../Util.test'

export default function showDotIndicator() {
  describe('showDotIndicator', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("showDotIndicator beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IndicatorComponent/showDotIndicator",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get showDotIndicator state pages:" + JSON.stringify(pages));
        if (!("showDotIndicator" == pages.name)) {
          console.info("get showDotIndicator pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push showDotIndicator page error:" + err);
      }
      console.info("showDotIndicator beforeEach end");
    });




    
    /**
     * @tc.number   showDotIndicator_static_0100
     * @tc.name     showDotIndicator_static_0100
     * @tc.desc     showDotIndicator_static_0100
     * @tc.level    Level.LEVEL0
     */
it('showDotIndicator_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[showDotIndicator_static_0100] START');
          await CommonFunc.sleep(1000);
          let driver = Driver.create()
          await driver.assertComponentExist(ON.text('2'));
          let btn1: Component = await driver.findComponent(ON.id('indicator_showNext')) as Component;
          await btn1.click();
          await CommonFunc.sleep(1500);
          await driver.assertComponentExist(ON.text('3'));

          let btn2: Component = await driver.findComponent(ON.id('indicator_showPrevious')) as Component;
          await btn2.click();
          await CommonFunc.sleep(1500);
          await driver.assertComponentExist(ON.text('2'));

          let btn3: Component = await driver.findComponent(ON.id('indicator_changeIndex')) as Component;
          await btn3.click();
          await CommonFunc.sleep(1500);
          await driver.assertComponentExist(ON.text('4'));

          console.info('[showDotIndicator_static_0100] END');
          done();
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
