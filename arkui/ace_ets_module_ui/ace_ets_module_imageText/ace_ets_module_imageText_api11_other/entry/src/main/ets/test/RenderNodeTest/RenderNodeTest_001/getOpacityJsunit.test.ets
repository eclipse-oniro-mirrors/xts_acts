/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, UiDirection, MouseButton, UIElementInfo, UIEventObserver} from '@ohos.UiTest';
export default function getOpacityJsunit() {
  describe('getOpacityJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("getOpacityJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RenderNode/renderNode001/getOpacity",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getOpacityJsunit state pages:" + JSON.stringify(pages));
        if (!("getOpacity" == pages.name)) {
          console.info("get getClipToFrame pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getOpacityJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getOpacityJsunit page error:" + err);
      }
      console.info("getOpacityJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getOpacityJsunit after each called");
    });
    
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_getOpacityJsunit_001
     * @tc.name      getOpacityJsunit
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('getOpacityJsunit_001', Level.LEVEL2, async (done: Function) => {
      console.info('[getOpacityJsunit_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getOpacity');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[getOpacityJsunit_001] component obj is: " + JSON.stringify(obj));
      console.info("[getOpacityJsunit_001] component content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("getOpacityStatus:1");
      console.info('[getOpacityJsunit_001] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
