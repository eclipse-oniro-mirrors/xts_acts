/**
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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import native from 'libnativerender.so';

export default function NodeContentTest() {
  describe('NodeContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NodeContentTest beforeEach start");

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/NodeContentPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NodeContentPage state pages:" + JSON.stringify(pages));
        if (!("NodeContentPage" == pages.name)) {
          console.info("get NodeContentPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NodeContentPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NodeContentPage page error:" + err);
      }
      console.info("NodeContentPage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NodeContentTest after each called");
    });

    /**
     * @tc.name   NodeContentTest_0100
     * @tc.number NodeContentTest_0100
     * @tc.desc   Test OH_ArkUI_NodeContentEvent_GetEventType return value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeContentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeContentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(native.NodeContentEventGetEventType()).assertEqual(0)
      await CommonFunc.sleep(1000);

      console.info('[NodeContentTest_0100] click XComponentNodeContentPage_btn');
      let button = await driver.findComponent(ON.id("XComponentNodeContentPage_btn"));
      await button.click();
      await CommonFunc.sleep(1000)

      expect(native.NodeContentEventGetEventType()).assertEqual(1)

      console.info('[NodeContentTest_0100] END');
      done();
    });

  })
}