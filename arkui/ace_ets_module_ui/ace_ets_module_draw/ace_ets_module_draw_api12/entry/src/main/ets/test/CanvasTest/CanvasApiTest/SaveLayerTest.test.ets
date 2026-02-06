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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SaveLayerTest() {
  describe('SaveLayerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SaveLayerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasApiTest/SaveLayer",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SaveLayerTest state pages:" + JSON.stringify(pages));
        if (!("SaveLayer" == pages.name)) {
          console.info("get SaveLayerTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SaveLayerTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SaveLayerTest page error:" + err);
      }
      console.info("SaveLayerTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SaveLayerTest after each called");
    });

    /**
     * @tc.number    SaveLayerTest_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('SaveLayerTest_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SaveLayerTest_001] START');
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('text2');
      await CommonFunc.sleep(1000);
      expect(JSON.parse(text2).$attrs.content).assertEqual('saveLayer');
      console.info('[SaveLayerTest_001] END');
      done();
    });
  })
}
