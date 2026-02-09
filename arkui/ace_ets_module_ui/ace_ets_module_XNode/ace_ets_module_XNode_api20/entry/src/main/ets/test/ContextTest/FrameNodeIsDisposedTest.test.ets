/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function FrameNodeIsDisposedTest() {
  describe('FrameNodeIsDisposedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FrameNodeIsDisposedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/FrameNodeIsDisposedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get FrameNodeIsDisposedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get FrameNodeIsDisposedTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push FrameNodeIsDisposedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FrameNodeIsDisposedTest page error:" + err);
      }
      console.info("FrameNodeIsDisposedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FrameNodeIsDisposedTest after each called");
    });

    /**
     * @tc.name   FrameNodeIsDisposedTest_0100
     * @tc.number FrameNodeIsDisposedTest_0100
     * @tc.desc   frameNode: frameNode isDisposed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FrameNodeIsDisposedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('FrameNodeIsDisposedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_frameNode_isDisposed'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_frameNode_dispose'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('frameNodeIsDisposed1')).assertEqual(false);
      expect(AppStorage.get('frameNodeIsDisposed2')).assertEqual(true);
      AppStorage.delete('frameNodeIsDisposed1')
      AppStorage.delete('frameNodeIsDisposed2')
      console.info('[FrameNodeIsDisposedTest_0100] END');
      done();
    });
  })
}