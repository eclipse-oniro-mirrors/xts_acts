'use static'
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON } from '@ohos.UiTest'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function CanvasRenderingContext2DFontTest() {
  describe('CanvasRenderingContext2DFontTest', () => {
    beforeAll(async () => {
      console.info("CanvasRenderingContext2DFontTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("CanvasRenderingContext2DFontTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasRenderingContext2DFont",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CanvasRenderingContext2DFontTest state pages:" + JSON.stringify(pages));
        if (!("CanvasRenderingContext2DFont" == pages.name)) {
          console.info("get CanvasRenderingContext2DFontTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CanvasRenderingContext2DFontTest page error:" + err);
      }
      console.info("CanvasRenderingContext2DFontTest beforeEach end");
    });

    /**
     * @tc.number    CanvasRenderingContext2DFontTest_static_0100
     * @tc.name      CanvasRenderingContext2DFontTest_static_0100
     * @tc.desc      Test CanvasRenderingContext2D font with value '20px' through Button click callback
     * @tc.level     Level.LEVEL1
     */
    it('CanvasRenderingContext2DFontTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CanvasRenderingContext2DFontTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('text_font_result');
      await CommonFunc.sleep(1000);
      console.info("[CanvasRenderingContext2DFontTest_static_0100] Initial content: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));

      let button = await driver.findComponent(ON.id('button_font'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('text_font_result');
      await CommonFunc.sleep(1000);
      console.info("[CanvasRenderingContext2DFontTest_static_0100] Result after click: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('content')))
        .assertEqual('"Result: font set to 20px"');

      console.info('[CanvasRenderingContext2DFontTest_static_0100] END');
      done();
    });

  });
}