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
import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';

export default function TabContentOnWillHideModifierTest() {
  describe('TabContentOnWillHideModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabContentOnWillHideModifierTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabContentOnWillHideModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContentModifier/tabContentOnWillHideModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabContentOnWillHideModifierTest state pages:" + JSON.stringify(pages));
        if (!("tabContentOnWillHideModifier" == pages.name)) {
          console.info("get TabContentOnWillHideModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabContentOnWillHideModifierTest page error:" + err);
      }
      console.info("TabContentOnWillHideModifierTest beforeEach end");
    });

    /**
     * @tc.number    TabContentOnWillHideModifierUndefinedTest_static_0100
     * @tc.name      TabContentOnWillHideModifierUndefinedTest_static_0100
     * @tc.desc      TabContentOnWillHideModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabContentOnWillHideModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabContentOnWillHideModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let changeTextTwo = await driver.findComponent(ON.id('taberTextOnWillHideModifierTwo'));
      await (changeTextTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let changeTextOne = await driver.findComponent(ON.id('taberTextOnWillHideModifierOne'));
      await (changeTextOne?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let testText = await driver.findComponent(ON.id('onWillHideModifierText'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('undefined onWillHide');
      let changeBtn = await driver.findComponent(ON.id('buttonOnWillHideModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[TabContentOnWillHideModifierUndefinedTest_static_0100] click onWillHide");
      await (changeTextTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let changeTextOneCopy = await driver.findComponent(ON.id('taberTextOnWillHideModifierOne'));
      await (changeTextOneCopy?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      testText = await driver.findComponent(ON.id('onWillHideModifierText'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('onWillHide successfully');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[TabContentOnWillHideModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
