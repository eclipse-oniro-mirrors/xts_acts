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
import { Driver, ON } from '@ohos.UiTest';

export default function TabsScrollableModifierTest() {
  describe('TabsScrollableModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsScrollableModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsScrollableModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabsModifier/tabsScrollableModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsScrollableModifierTest state pages:" + JSON.stringify(pages));
        if (!("tabsScrollableModifier" == pages.name)) {
          console.info("get TabsScrollableModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabsScrollableModifierTest page error:" + err);
      }
      console.info("TabsScrollableModifierTest beforeEach end");
    });

    /**
     * @tc.number    TabsScrollableModifierUndefinedTest_static_0100
     * @tc.name      TabsScrollableModifierUndefinedTest_static_0100
     * @tc.desc      TabsScrollableModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabsScrollableModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabsScrollableModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabsScrollableModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollable')))
        .assertEqual('false');
      let changeBtn = await driver.findComponent(ON.id('buttonScrollableModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[TabsScrollableModifierUndefinedTest_static_0100] click scrollable");
      strJson = inspector.getInspectorByKey('tabsScrollableModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('scrollable')))
        .assertEqual('true');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[TabsScrollableModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
