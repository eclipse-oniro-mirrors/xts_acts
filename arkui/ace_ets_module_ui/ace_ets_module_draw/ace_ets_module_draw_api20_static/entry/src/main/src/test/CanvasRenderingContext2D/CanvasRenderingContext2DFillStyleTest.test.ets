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
import { CanvasRenderingContext2D, RenderingContextSettings } from '@ohos.arkui.component';

export default function CanvasRenderingContext2DFillStyleTest() {
  describe('CanvasRenderingContext2DFillStyleTest', () => {
    beforeAll(async () => {
      console.info("CanvasRenderingContext2DFillStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("CanvasRenderingContext2DFillStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasRenderingContext2DFillStyle",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CanvasRenderingContext2DFillStyleTest state pages:" + JSON.stringify(pages));
        if (!("CanvasRenderingContext2DFillStyle" == pages.name)) {
          console.info("get CanvasRenderingContext2DFillStyleTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CanvasRenderingContext2DFillStyleTest page error:" + err);
      }
      console.info("CanvasRenderingContext2DFillStyleTest beforeEach end");
    });

    /**
     * @tc.number    CanvasRenderingContext2DFillStyleTest_static_0100
     * @tc.name      CanvasRenderingContext2DFillStyleTest_static_0100
     * @tc.desc      Test CanvasRenderingContext2D fillStyle with value rgb(255,0,0) through Button click callback
     * @tc.level     Level.LEVEL1
     */
    it('CanvasRenderingContext2DFillStyleTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CanvasRenderingContext2DFillStyleTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('text_fillStyle_result');
      await CommonFunc.sleep(1000);
      console.info("[CanvasRenderingContext2DFillStyleTest_static_0100] Initial content: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));

      let button = await driver.findComponent(ON.id('button_fillStyle_red'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('canvas_fillStyle_blue');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[CanvasRenderingContext2DFillStyleTest_static_0100] type is: " + JSON.stringify(obj.getString('$type')))
      expect(obj.getString('$type')).assertEqual('Canvas');

      console.info('[CanvasRenderingContext2DFillStyleTest_static_0100] END');
      done();
    });

  });
}