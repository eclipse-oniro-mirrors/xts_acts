/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function nodeContentApiNullUndefinedTest() {
  describe('nodeContentApiNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("nodeContentApiNullUndefinedTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/NodeContent/nodeContentApiNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nodeContentApiNullUndefined state pages: " + JSON.stringify(pages));
        if (!("nodeContentApiNullUndefined" == pages.name)) {
          console.info("get nodeContentApiNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push nodeContentApiNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nodeContentApiNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   nodeContentApiNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_nodeContentApiNullUndefinedTest_0100
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nodeContentApiNullUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('nodeContentApiNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('nodeContentAddToSlot'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('nodeContentApiNullUndefinedText');

      let button2 = await driver.findComponent(ON.id('nodeContentRemoveBack'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('nodeContentApiNullUndefinedText');

      let button3 = await driver.findComponent(ON.id('nodeContentRemoveFront'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('nodeContentApiNullUndefinedText');
 
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('addFrameNode');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('removeFrameNode');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('removeFrameNode');
      
      console.info('[nodeContentApiNullUndefinedTest_0100 ] END');
      done();
    });
  })
}