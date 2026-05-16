'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

export default function TabsOnAnimationStartModifierTest() {
  describe('TabsOnAnimationStartModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsOnAnimationStartModifierTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsOnAnimationStartModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabsModifier/tabsOnAnimationStartModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsOnAnimationStartModifierTest state pages:" + JSON.stringify(pages));
        if (!("tabsOnAnimationStartModifier" == pages.name)) {
          console.info("get TabsOnAnimationStartModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabsOnAnimationStartModifierTest page error:" + err);
      }
      console.info("TabsOnAnimationStartModifierTest beforeEach end");

    });

    /**
     * @tc.number    TabsOnAnimationStartModifierUndefinedTest_static_0100
     * @tc.name      TabsOnAnimationStartModifierUndefinedTest_static_0100
     * @tc.desc      TabsOnAnimationStartModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabsOnAnimationStartModifierUndefinedTest_static_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('[TabsOnAnimationStartModifierUndefinedTest_static_0100] START');
        let driver: Driver = Driver.create()
        await CommonFunc.sleep(1000);
        let tabBarTwo = await driver.findComponent(ON.text('blue'));
        await (tabBarTwo?.click() as Promise<void>);
        let tabBarThree = await driver.findComponent(ON.text('yellow'));
        await (tabBarThree?.click() as Promise<void>);
        let tabBarFour = await driver.findComponent(ON.text('pink'));
        await (tabBarFour?.click() as Promise<void>);
        let tabBarOne = await driver.findComponent(ON.text('green'));
        await (tabBarOne?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let testText = await driver.findComponent(ON.id('textOnAnimationStartModifier'));
        expect(await (testText?.getText() as Promise<string>)).assertEqual('undefined onAnimationStart');
        let changeBtn = await driver.findComponent(ON.id('buttonOnAnimationStartModifier'));
        await (changeBtn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info("[TabsOnAnimationStartModifierUndefinedTest_static_0100] click onAnimationStart");
        await (tabBarTwo?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        testText = await driver.findComponent(ON.id('textOnAnimationStartModifier'));
        expect(await (testText?.getText() as Promise<string>)).assertEqual('onAnimationStart successfully');
        await CommonFunc.sleep(1000);
        await (changeBtn?.click() as Promise<void>);
        console.info('[TabsOnAnimationStartModifierUndefinedTest_static_0100] END');
        done();
      });
  })
}
