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

export default function onReachStartModifierUndefinedTest() {
  describe('onReachStartModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("onReachStartModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/onReachStartModifierUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onReachStartModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("onReachStartModifierUndefined" == pages.name)) {
          console.info("get onReachStartModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onReachStartModifierUndefinedTest page error:" + err);
      }
      console.info("onReachStartModifierUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    onReachStartModifierUndefinedTest_static_0100
     * @tc.name      onReachStartModifierUndefinedTest_static_0100
     * @tc.desc      onReachStartModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('onReachStartModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onReachStartModifierUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('common_onReachStartModifier');
      let onReachStartValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      console.info('$onReachStart: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      expect(onReachStartValue1.asString()).assertEqual('Count2');

      let driver = Driver.create();
      let scrollItem2 = await driver.findComponent(ON.id('scrollItem2')) as Component;
      await CommonFunc.sleep(500);
      let scrollItem1 = await driver.findComponent(ON.id('scrollItem1')) as Component;
      await CommonFunc.sleep(500);
      await (scrollItem2?.dragTo(scrollItem1) as Promise<void>);

      let driver2 = Driver.create();
      let btn1 = await driver2.findComponent(ON.id('changeButton')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);
      await (scrollItem1?.dragTo(scrollItem2) as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('common_onReachStartModifier');
      let onReachStartValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content');
      console.info('$onReachStart: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content')));
      expect(onReachStartValue2.asString()).assertEqual('Count2');

      console.info('[onReachStartUndefinedTest_static_0100] END');
      done();
    });
  })
}