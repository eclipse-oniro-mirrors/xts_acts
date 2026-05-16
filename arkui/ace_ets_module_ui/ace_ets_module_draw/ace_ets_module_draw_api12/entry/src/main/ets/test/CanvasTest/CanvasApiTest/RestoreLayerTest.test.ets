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

export default function RestoreLayerTest() {
  describe('RestoreLayerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RestoreLayerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasApiTest/RestoreLayer",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RestoreLayerTest state pages:" + JSON.stringify(pages));
        if (!("RestoreLayer" == pages.name)) {
          console.info("get RestoreLayerTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RestoreLayerTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RestoreLayerTest page error:" + err);
      }
      console.info("RestoreLayerTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RestoreLayerTest after each called");
    });

    /**
     * @tc.name   RestoreLayerTest_001
     * @tc.number RestoreLayerTest_001
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RestoreLayerTest_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RestoreLayerTest_001] START');
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('text1');
      await CommonFunc.sleep(1000);
      expect(JSON.parse(text1).$attrs.content).assertEqual('restoreLayer');
      console.info('[RestoreLayerTest_001] END');
      done();
    });
  })
}
