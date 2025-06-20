/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function tabsApi1() {
  describe('tabsApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabs/tabsApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsApi1 state pages:" + JSON.stringify(pages));
        if (!("tabsApi1" == pages.name)) {
          console.info("get tabsApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsApi1 page error:" + err);
      }
      console.info("tabsApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsApi1 after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_tabsApi1_0100
     * @tc.name      testRichEditor
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.sizeace_ets_module_scroll/ace_ets_module_scroll_api11/entry/src/main/ets/test/ScrollTest/Scroll.test.ets:61:11
     */
    it('tabsApi1_0100', 0, async (done: Function) => {
      console.info('[tabsApi1_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);

      let btn1 = await driver.findComponent(ON.id('tabsApi1_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('tabsApi1_text1');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('222');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
