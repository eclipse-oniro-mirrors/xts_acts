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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function RenderNodeDemo03Test() {
  describe('RenderNodeDemo03Test', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderNodeDemo03Test beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/renderNode/RenderNodeDemo/RenderNodeDemo03",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeDemo03Test state pages: " + JSON.stringify(pages));
        if (!("RenderNodeDemo03" == pages.name)) {
          console.info("get RenderNodeDemo03Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeDemo03Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeDemo03Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    api
     * @tc.name      RenderNodeDemo03Test_0100
     * @tc.desc      borderWidth_left
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RenderNodeDemo03Test_0100', 0, async (done: Function) => {
      console.info('RenderNodeDemo03Test_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('RenderNodeDemo03_Button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('RenderNodeDemo03_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RenderNodeDemo03Test_0100] component obj is: ",JSON.stringify(obj),obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[RenderNodeDemo03Test_0100] END');
      done();
    });

  })
}

