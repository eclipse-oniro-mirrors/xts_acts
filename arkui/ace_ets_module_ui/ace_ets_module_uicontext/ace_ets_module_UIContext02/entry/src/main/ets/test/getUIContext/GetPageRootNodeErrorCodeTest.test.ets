/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { ResolveStrategy } from '@ohos.arkui.UIContext';

export default function GetPageRootNodeErrorCodeTest() {
  describe('GetPageRootNodeErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetPageRootNodeErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/GetPageRootNodeErrorCodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetPageRootNodeErrorCodeTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetPageRootNodeErrorCodeTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push GetPageRootNodeErrorCodeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetPageRootNodeErrorCodeTest page error:" + err);
      }
      console.info("GetPageRootNodeErrorCodeTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetPageRootNodeErrorCodeTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_UICONTEXT_GetPageRootNodeErrorCodeTest_1000
     * @tc.number SUB_ARKUI_UICONTEXT_GetPageRootNodeErrorCodeTest_1000
     * @tc.desc   postDelayedFrameCallback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_UICONTEXT_GetPageRootNodeErrorCodeTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_UICONTEXT_GetPageRootNodeErrorCodeTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_getPageRootNode_code'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_getPageRootNode_id'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('GetPageRootNodeErrorCodeValue')).assertEqual(120007);
      expect(AppStorage.get('GetPageRootNodeTypeValue')).assertEqual('Column');
      AppStorage.delete('GetPageRootNodeErrorCodeValue');
      AppStorage.delete('GetPageRootNodeTypeValue');
      console.info('[SUB_ARKUI_UICONTEXT_GetPageRootNodeErrorCodeTest_1000] END');
      done();
    });

  })
}