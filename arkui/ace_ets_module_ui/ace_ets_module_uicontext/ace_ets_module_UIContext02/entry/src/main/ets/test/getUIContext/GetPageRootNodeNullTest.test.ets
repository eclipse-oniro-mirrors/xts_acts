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

export default function GetPageRootNodeNullTest() {
  describe('GetPageRootNodeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetPageRootNodeNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/GetPageRootNodeNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetPageRootNodeNullTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetPageRootNodeNullTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push GetPageRootNodeNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetPageRootNodeNullTest page error:" + err);
      }
      console.info("GetPageRootNodeNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetPageRootNodeNullTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_UICONTEXT_GetPageRootNodeNullTest_1000
     * @tc.number SUB_ARKUI_UICONTEXT_GetPageRootNodeNullTest_1000
     * @tc.desc   getPageRootNode null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_UICONTEXT_GetPageRootNodeNullTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_UICONTEXT_GetPageRootNodeNullTest_1000 START');
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('GetPageRootNodeNullValue')).assertEqual(null);
      AppStorage.delete('GetPageRootNodeNullValue');
      console.info('[SUB_ARKUI_UICONTEXT_GetPageRootNodeNullTest_1000] END');
      done();
    });

  })
}