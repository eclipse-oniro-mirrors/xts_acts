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
import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
export default function APICanvasSizeTest() {
  describe('APICanvasSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APICanvasSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/APICanvasSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APICanvasSizeTest state pages: " + JSON.stringify(pages));
        if (!("APICanvasSize" == pages.name)) {
          console.info("get APICanvasSizeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push APICanvasSizeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APICanvasSizeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      APICanvasSizeTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('APICanvasSizeTest_0100', 0, async (done: Function) => {
      console.info('APICanvasSizeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let rectParent = Utils.getComponentRect('APICanvasSizeFlex');
      let widthParent = rectParent.right - rectParent.left
      let heightParent =  rectParent.bottom - rectParent.top
      console.info("[APICanvasSizeTest_0100] widthParent is: " + widthParent);
      console.info("[APICanvasSizeTest_0100] heightParent is: " + heightParent);

      let button1 = await driver.findComponent(ON.id('APICanvasSizeButton1'));
      await button1.click();
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('APICanvasSizeText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APICanvasSizeTest_0100] text1 content is: " + JSON.stringify(obj.$attrs.content));
      console.info("[APICanvasSizeTest_0100] canvas width is: " + JSON.stringify(vp2px(Number(obj.$attrs.content))));
      expect(Math.abs(Math.floor(vp2px(Number(obj.$attrs.content))-widthParent*0.8))<=1).assertTrue();
      console.info('[APICanvasSizeTest_0100] END');
      done();
    });
    /**
     * @tc.number
    * @tc.name      APICanvasSizeTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('APICanvasSizeTest_0200', 0, async (done: Function) => {
      console.info('APICanvasSizeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let rectParent = Utils.getComponentRect('APICanvasSizeFlex');
      let widthParent = rectParent.right - rectParent.left
      let heightParent =  rectParent.bottom - rectParent.top
      console.info("[APICanvasSizeTest_0200] widthParent is: " + widthParent);
      console.info("[APICanvasSizeTest_0200] heightParent is: " + heightParent);

      let button1 = await driver.findComponent(ON.id('APICanvasSizeButton2'));
      await button1.click();
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('APICanvasSizeText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APICanvasSizeTest_0200] text2 content is: " + JSON.stringify(obj.$attrs.content));
      console.info("[APICanvasSizeTest_0200] canvas height is: " + JSON.stringify(vp2px(Number(obj.$attrs.content))));
      expect(Math.abs(Math.floor(vp2px(Number(obj.$attrs.content))-heightParent*0.5))<=1).assertTrue();
      console.info('[APICanvasSizeTest_0200] END');
      done();
    });
  })
}

