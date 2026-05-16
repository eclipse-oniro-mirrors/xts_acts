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

export default function TabsOnTabBarClickTest() {
  describe('TabsOnTabBarClickTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsOnTabBarClickTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsOnTabBarClickTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsOnTabBarClick',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsOnTabBarClickTest state pages:" + JSON.stringify(pages));
        if (!("tabsOnTabBarClick" == pages.name)) {
          console.info("get TabsOnTabBarClickTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabsOnTabBarClickTest page error:" + err);
      }
      console.info("TabsOnTabBarClickTest beforeEach end");

    });

    /**
     * @tc.number    TabsOnTabBarClickUndefinedTest_static_0100
     * @tc.name      TabsOnTabBarClickUndefinedTest_static_0100
     * @tc.desc      TabsOnTabBarClickUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabsOnTabBarClickUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabsOnTabBarClickUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let tabBarTwo = await driver.findComponent(ON.text('yellow'));
      await (tabBarTwo?.click() as Promise<void>);
      let tabBarOne = await driver.findComponent(ON.text('pink'));
      await (tabBarOne?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let testText = await driver.findComponent(ON.id('textOnTabBarClick'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('undefined onTabBarClick');
      let changeBtn = await driver.findComponent(ON.id('buttonOnTabBarClick'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[TabsOnTabBarClickUndefinedTest_static_0100] click onTabBarClick");
      await (tabBarTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      testText = await driver.findComponent(ON.id('textOnTabBarClick'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('onTabBarClick successfully');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[TabsOnTabBarClickUndefinedTest_static_0100] END');
      done();
    });
  })
}
