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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
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

export default function TabsOnAnimationEndTest() {
  describe('TabsOnAnimationEndTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsOnAnimationEndTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsOnAnimationEndTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsOnAnimationEnd',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsOnAnimationEndTest state pages:" + JSON.stringify(pages));
        if (!("tabsOnAnimationEnd" == pages.name)) {
          console.info("get TabsOnAnimationEndTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabsOnAnimationEndTest page error:" + err);
      }
      console.info("TabsOnAnimationEndTest beforeEach end");

    });

    /**
     * @tc.number    TabsOnAnimationEndUndefinedTest_static_0100
     * @tc.name      TabsOnAnimationEndUndefinedTest_static_0100
     * @tc.desc      TabsOnAnimationEndUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabsOnAnimationEndUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabsOnAnimationEndUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let tabBarTwo = await driver.findComponent(ON.text('yellow'));
      await (tabBarTwo?.click() as Promise<void>);
      let tabBarOne = await driver.findComponent(ON.text('pink'));
      await (tabBarOne?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let testText = await driver.findComponent(ON.id('textOnAnimationEnd'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('undefined onAnimationEnd');
      let changeBtn = await driver.findComponent(ON.id('buttonOnAnimationEnd'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (tabBarTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      testText = await driver.findComponent(ON.id('textOnAnimationEnd'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('onAnimationEnd successfully');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[TabsOnAnimationEndUndefinedTest_static_0100] END');
      done();
    });
  })
}
