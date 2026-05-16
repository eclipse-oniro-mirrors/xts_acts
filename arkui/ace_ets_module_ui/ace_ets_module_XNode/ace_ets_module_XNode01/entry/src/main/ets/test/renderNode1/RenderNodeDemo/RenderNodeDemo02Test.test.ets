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
export default function RenderNodeDemo02Test() {
  describe('RenderNodeDemo02Test', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderNodeDemo02Test beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/renderNode1/RenderNodeDemo/RenderNodeDemo02",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeDemo02Test state pages: " + JSON.stringify(pages));
        if (!("RenderNodeDemo02" == pages.name)) {
          console.info("get RenderNodeDemo02Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeDemo02Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeDemo02Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   RenderNodeDemo02Test_0100
     * @tc.number RenderNodeDemo02Test_0100
     * @tc.desc   borderWidth_left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RenderNodeDemo02Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RenderNodeDemo02Test_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RenderNodeDemo02_Button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('RenderNodeDemo02_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RenderNodeDemo02Test_0100] component obj is: ",JSON.stringify(obj),obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[RenderNodeDemo02Test_0100] END');
      done();
    });
  })
}