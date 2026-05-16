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
export default function canvasOnAttachNullUndefinedTest() {
  describe('canvasOnAttachNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("canvasOnAttachNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasNullUndefined/canvasOnAttachNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canvasOnAttachNullUndefined state pages: " + JSON.stringify(pages));
        if (!("canvasOnAttachNullUndefined" == pages.name)) {
          console.info("get canvasOnAttachNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push canvasOnAttachNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canvasOnAttachNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   canvasOnAttachNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_canvasOnAttachNullUndefinedTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('canvasOnAttachNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[canvasOnAttachNullUndefinedTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('canvasOnAttachNull');
      let strJson2 = getInspectorByKey('canvasOnAttachUndefined');
      
      expect(JSON.parse(strJson1).$type).assertEqual('Canvas');
      expect(JSON.parse(strJson2).$type).assertEqual('Canvas');
      
      console.info('[canvasOnAttachNullUndefinedTest_0100] END');
      done();
    });
  })
}

