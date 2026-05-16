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
import common from '@ohos.app.ability.common';
import { Driver, ON, Rect } from '@ohos.UiTest';

export default function TabsOnGestureSwipeModifierTest() {
  describe('TabsOnGestureSwipeModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsOnGestureSwipeModifierTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsOnGestureSwipeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabsModifier/tabsOnGestureSwipeModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsOnGestureSwipeModifierTest state pages:" + JSON.stringify(pages));
        if (!("tabsOnGestureSwipeModifier" == pages.name)) {
          console.info("get TabsOnGestureSwipeModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabsOnGestureSwipeModifierTest page error:" + err);
      }
      console.info("TabsOnGestureSwipeModifierTest beforeEach end");
    });

    /**
     * @tc.number    TabsOnGestureSwipeModifierUndefinedTest_static_0100
     * @tc.name      TabsOnGestureSwipeModifierUndefinedTest_static_0100
     * @tc.desc      TabsOnGestureSwipeModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabsOnGestureSwipeModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabsOnGestureSwipeModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let tabs = await driver.findComponent(ON.id('tabsOnGestureSwipeModifier'));
      let rect = await (tabs?.getBounds() as Promise<Rect>);
      let startX1 = rect?.right as Int;
      let startY1 = rect?.bottom as Int;
      let endX1 = rect?.left as Int;
      let endY1 = rect?.top as Int;
      driver.swipe(startX1 - 100, startY1 - 100, endX1, endY1, 5000);
      await CommonFunc.sleep(3000);
      let testText = await driver.findComponent(ON.id('textOnGestureSwipeModifier'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('undefined onGestureSwipe');
      let changeBtn = await driver.findComponent(ON.id('buttonOnGestureSwipeModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[TabsOnGestureSwipeModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
