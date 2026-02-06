'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../../hypium/index";
import router from "@ohos.router";
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../../Util.test';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from "@ohos.UiTest";
export default function CornerTest() {
  describe("CornerTest", () => {
    beforeAll(() => {
      console.info("CornerTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("CornerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/GraphicsApi/Corner",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CornerTest state pages: " + JSON.stringify(pages));
        if (!("Corner" == pages.name)) {
          console.info("get CornerTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push CornerTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CornerTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CornerTest after each called");
    });
    
    

    /**
     * @tc.number   CornerTest_static_001
     * @tc.name     CornerTest_static_001
     * @tc.desc     CornerTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('CornerTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info("[CornerTest_001] START");
      await CommonFunc.sleep(1000);
      let corners_x = inspector.getInspectorByKey("corners_x");
      let corners_y = inspector.getInspectorByKey("corners_y");
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(corners_x).getElement('$attrs').getString('content')).assertEqual("32");
      expect(JSON.parseJsonElement(corners_y).getElement('$attrs').getString('content')).assertEqual("32");
      console.info("[CornerTest_001] END");
      done();
    });
  })
}