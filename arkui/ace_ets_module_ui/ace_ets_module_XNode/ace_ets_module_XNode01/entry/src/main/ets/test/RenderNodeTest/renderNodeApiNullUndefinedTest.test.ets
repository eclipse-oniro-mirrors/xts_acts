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

export default function renderNodeApiNullUndefinedest() {
  describe('renderNodeApiNullUndefinedest', () => {
    beforeEach(async (done: Function) => {
      console.info("renderNodeApiNullUndefinedest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/RenderNode/renderNodeApiNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get renderNodeApiNullUndefined state pages: " + JSON.stringify(pages));
        if (!("renderNodeApiNullUndefined" == pages.name)) {
          console.info("get renderNodeApiNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push renderNodeApiNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push renderNodeApiNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   renderNodeApiNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_renderNodeApiNullUndefinedTest_0100
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('renderNodeApiNullUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('renderNodeApiNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('renderNodeGetChildNull'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let button2 = await driver.findComponent(ON.id('renderNodeGetChildUndefined'));
      await button2.click();
      await CommonFunc.sleep(1000);
 
      let strJson1 = getInspectorByKey('renderNodeApiNullUndefined');
      expect(JSON.parse(strJson1).$type).assertEqual('NodeContainer');
      
      console.info('[renderNodeApiNullUndefinedTest_0100 ] END');
      done();
    });
  })
}