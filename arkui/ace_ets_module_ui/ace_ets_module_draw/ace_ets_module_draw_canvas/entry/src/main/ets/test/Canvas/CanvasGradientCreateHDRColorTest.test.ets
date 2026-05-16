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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CanvasGradientCreateHDRColorTest() {
  describe('CanvasGradientCreateHDRColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasGradientCreateHDRColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasGradientCreateHDRColor",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasGradientCreateHDRColor state pages: " + JSON.stringify(pages));
        if (!("CanvasGradientCreateHDRColor" == pages.name)) {
          console.info("get CanvasGradientCreateHDRColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CanvasGradientCreateHDRColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasGradientCreateHDRColor page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CanvasGradientCreateHDRColorTest_0100
     * @tc.number SUB_ARKUI_API_CanvasGradientCreateHDRColorTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CanvasGradientCreateHDRColorTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[CanvasGradientCreateHDRColorTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('ChangeCanvasColorRed'));
      await button1.click();
      await Utils.sleep(2000)
      let button2 = await driver.findComponent(ON.id('ChangeCanvasColorGreen'));
      await button2.click();
      await Utils.sleep(2000)
      let button3 = await driver.findComponent(ON.id('ChangeCanvasColorBlue'));
      await button3.click();
      await Utils.sleep(2000)
      let button4 = await driver.findComponent(ON.id('ChangeCanvasColorWhite'));
      await button4.click();
      await Utils.sleep(2000)  
      let button5 = await driver.findComponent(ON.id('ChangeCanvasColorReduce'));
      await button5.click();
      await Utils.sleep(2000) 
      let button6 = await driver.findComponent(ON.id('ChangeCanvasColorAdd'));
      await button6.click();
      await Utils.sleep(2000)

      let strJson: string = getInspectorByKey('CanvasGradientCreateHDRColor')
      expect(JSON.parse(strJson).$type).assertEqual('Canvas') 
     
      console.info('[CanvasGradientCreateHDRColorTest_0100] END');
      done();
    });
  })
}

