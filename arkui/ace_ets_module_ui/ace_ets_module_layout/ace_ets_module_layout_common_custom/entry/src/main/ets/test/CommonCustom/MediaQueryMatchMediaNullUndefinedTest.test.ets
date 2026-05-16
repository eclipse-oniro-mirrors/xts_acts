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

export default function MediaQueryMatchMediaNullUndefinedTest() {
  describe('MediaQueryMatchMediaNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MediaQueryMatchMediaNullUndefinedTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/CommonCustom/MediaQueryMatchMediaNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MediaQueryMatchMediaNullUndefined state pages: " + JSON.stringify(pages));
        if (!("MediaQueryMatchMediaNullUndefined" == pages.name)) {
          console.info("get MediaQueryMatchMediaNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push   success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MediaQueryMatchMediaNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   MediaQueryMatchMediaNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_MediaQueryMatchMediaNullUndefinedTest_0100
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaQueryMatchMediaNullUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MediaQueryMatchMediaNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('MediaQueryMatchMediaNull'));
      await button1.click();
      await CommonFunc.sleep(1000);
      
      let button2 = await driver.findComponent(ON.id('MediaQueryMatchMediaUndefined'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let button3 = await driver.findComponent(ON.id('MediaQueryMatchMediaStringNull'));
      await button3.click();
      await CommonFunc.sleep(1000);
      
      let strJson1 = getInspectorByKey('MediaQueryMatchMediaNullUndefinedText');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('Portrait');
      
      console.info('[MediaQueryMatchMediaNullUndefinedTest_0100 ] END');
      done();
    });
  })
}