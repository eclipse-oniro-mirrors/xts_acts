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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function RenderNodeDemo04Test() {
  describe('RenderNodeDemo04Test', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderNodeDemo04Test beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/renderNode1/RenderNodeDemo/RenderNodeDemo04",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeDemo04Test state pages: " + JSON.stringify(pages));
        if (!("RenderNodeDemo04" == pages.name)) {
          console.info("get RenderNodeDemo04Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeDemo04Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeDemo04Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   RenderNodeDemo04Test_0100
     * @tc.number RenderNodeDemo04Test_0100
     * @tc.desc   borderWidth_left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RenderNodeDemo04Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RenderNodeDemo04Test_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RenderNodeDemo04_Button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('RenderNodeDemo04_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RenderNodeDemo04Test_0100] component obj is: ",JSON.stringify(obj),obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[RenderNodeDemo04Test_0100] END');
      done();
    });
  })
}