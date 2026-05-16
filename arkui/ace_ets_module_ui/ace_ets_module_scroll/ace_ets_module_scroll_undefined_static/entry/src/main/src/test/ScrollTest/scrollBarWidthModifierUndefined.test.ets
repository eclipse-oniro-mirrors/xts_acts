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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function scrollBarWidthModifierUndefinedTest() {
  describe('scrollBarWidthModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("scrollBarWidthModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollBarWidthModifierUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get scrollBarWidthModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("scrollBarWidthModifierUndefined" == pages.name)) {
          console.info("get scrollBarWidthModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollBarWidthModifierUndefinedTest page error:" + err);
      }
      console.info("scrollBarWidthModifierUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    scrollBarWidthModifierUndefinedTest_static_0100
     * @tc.name      scrollBarWidthModifierUndefinedTest_static_0100
     * @tc.desc      scrollBarWidthModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('scrollBarWidthModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[scrollBarWidthModifierUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('common_scrollBarWidthModifier');
      let scrollBarWidthValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollBarWidth');
      console.info('$scrollBarWidth: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('scrollBarWidth')));
      expect(scrollBarWidthValue1.asString()).assertEqual('20.00vp');

      let driver2 = Driver.create();
      let btn1 = await driver2.findComponent(ON.id('changeButton')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('common_scrollBarWidthModifier');
      let scrollBarWidthValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('scrollBarWidth');
      console.info('$scrollBarWidth: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('scrollBarWidth')));
      expect(scrollBarWidthValue2.asString()).assertEqual('4.00vp');

      console.info('[scrollBarWidthUndefinedTest_static_0100] END');
      done();
    });
  })
}