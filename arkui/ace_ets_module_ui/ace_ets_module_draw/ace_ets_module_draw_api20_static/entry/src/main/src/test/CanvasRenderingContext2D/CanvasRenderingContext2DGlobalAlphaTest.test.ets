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

export default function CanvasRenderingContext2DGlobalAlphaTest() {
  describe('CanvasRenderingContext2DGlobalAlphaTest', () => {
    beforeAll(async () => {
      console.info("CanvasRenderingContext2DGlobalAlphaTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("CanvasRenderingContext2DGlobalAlphaTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasRenderingContext2DGlobalAlpha",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CanvasRenderingContext2DGlobalAlphaTest state pages:" + JSON.stringify(pages));
        if (!("CanvasRenderingContext2DGlobalAlpha" == pages.name)) {
          console.info("get CanvasRenderingContext2DGlobalAlphaTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CanvasRenderingContext2DGlobalAlphaTest page error:" + err);
      }
      console.info("CanvasRenderingContext2DGlobalAlphaTest beforeEach end");
    });

    /**
     * @tc.number    CanvasRenderingContext2DGlobalAlphaTest_static_0100
     * @tc.name      CanvasRenderingContext2DGlobalAlphaTest_static_0100
     * @tc.desc      Test CanvasRenderingContext2D globalAlpha with value 0.6 through Button click callback
     * @tc.level     Level.LEVEL1
     */
    it('CanvasRenderingContext2DGlobalAlphaTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CanvasRenderingContext2DGlobalAlphaTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('text_globalAlpha_06_result');
      await CommonFunc.sleep(1000);
      console.info("[CanvasRenderingContext2DGlobalAlphaTest_static_0100] Initial content: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));

      let button = await driver.findComponent(ON.id('button_globalAlpha_06'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('text_globalAlpha_06_result');
      await CommonFunc.sleep(1000);
      console.info("[CanvasRenderingContext2DGlobalAlphaTest_static_0100] Result after click: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('content')))
        .assertEqual('"Result: globalAlpha set to 0.6"');

      console.info('[CanvasRenderingContext2DGlobalAlphaTest_static_0100] END');
      done();
    });

  });
}