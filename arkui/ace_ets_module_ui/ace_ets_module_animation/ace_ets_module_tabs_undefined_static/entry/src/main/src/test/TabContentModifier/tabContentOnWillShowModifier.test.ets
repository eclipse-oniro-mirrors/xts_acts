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

export default function TabContentOnWillShowModifierTest() {
  describe('TabContentOnWillShowModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabContentOnWillShowModifierTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabContentOnWillShowModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContentModifier/tabContentOnWillShowModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabContentOnWillShowModifierTest state pages:" + JSON.stringify(pages));
        if (!("tabContentOnWillShowModifier" == pages.name)) {
          console.info("get TabContentOnWillShowModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabContentOnWillShowModifierTest page error:" + err);
      }
      console.info("TabContentOnWillShowModifierTest beforeEach end");
    });

    /**
     * @tc.number    TabContentOnWillShowModifierUndefinedTest_static_0100
     * @tc.name      TabContentOnWillShowModifierUndefinedTest_static_0100
     * @tc.desc      TabContentOnWillShowModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabContentOnWillShowModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabContentOnWillShowModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let changeTextTwo = await driver.findComponent(ON.id('taberTextOnWillShowModifierTwo'));
      await (changeTextTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let changeTextOne = await driver.findComponent(ON.id('taberTextOnWillShowModifierOne'));
      await (changeTextOne?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let testText = await driver.findComponent(ON.id('textOnWillShowModifier'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('undefined onWillShow');
      let changeBtn = await driver.findComponent(ON.id('ButtonOnWillShowModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeTextTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let changeTextCopy = await driver.findComponent(ON.id('taberTextOnWillShowModifierOne'));
      await (changeTextCopy?.click() as Promise<void>);
      console.info("[TabContentOnWillShowModifierUndefinedTest_static_0100] click onWillShow");
      testText = await driver.findComponent(ON.id('textOnWillShowModifier'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('onWillShow successfully');
      await CommonFunc.sleep(1000);
      changeBtn = await driver.findComponent(ON.id('ButtonOnWillShowModifier'));
      await (changeBtn?.click() as Promise<void>);
      console.info('[TabContentOnWillShowModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
