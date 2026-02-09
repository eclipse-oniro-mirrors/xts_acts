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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function PromptActionToastErrorCodeTest() {
  describe('PromptActionToastErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PromptActionToastErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/promptAction/PromptActionToastErrorCode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PromptActionToastErrorCode state pages: " + JSON.stringify(pages));
        if (!("PromptActionToastErrorCode" == pages.name)) {
          console.info("get PromptActionToastErrorCode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PromptActionToastErrorCode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PromptActionToastErrorCode page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number PromptActionToastErrorCodeTest_0100
     * @tc.name PromptActionToastErrorCodeTest_0100
     * @tc.desc To test that the promptAction.openToastTest parameter is an abnormal value(0,undefined,null).
     * @tc.level: Level 2
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
     */
    it('PromptActionToastErrorCodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[PromptActionToastErrorCodeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('OpenToastErrorCodeFirst'));
      await button1.click();
      await Utils.sleep(1000)
      let strJson1 = getInspectorByKey('ToastErrorCodeThree');
      console.info("[PromptActionToastErrorCodeTest_0100] PromptActionToastErrorCode1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('401');

      let button2 = await driver.findComponent(ON.id('CloseToastErrorCodeSecond'));
      await button2.click();
      await Utils.sleep(1000)
      let strJson2 = getInspectorByKey('ToastErrorCodeThree');
      console.info("[PromptActionToastErrorCodeTest_0100] PromptActionToastErrorCode2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('103401');

      let button3 = await driver.findComponent(ON.id('CloseToastErrorCodeThird'));
      await button3.click();
      await Utils.sleep(1000)
      let strJson3 = getInspectorByKey('ToastErrorCodeThree');
      console.info("[PromptActionToastErrorCodeTest_0100] PromptActionToastErrorCode3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('401');

      console.info('[PromptActionToastErrorCodeTest_0100] END');
      done();
    });
  })
}

