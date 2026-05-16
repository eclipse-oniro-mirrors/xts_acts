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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { ResolveStrategy } from '@ohos.arkui.UIContext';

export default function PostDelayedFrameCallbackParamTest() {
  describe('PostDelayedFrameCallbackParamTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PostDelayedFrameCallbackParamTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/PostDelayedFrameCallbackParamTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PostDelayedFrameCallbackParamTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get PostDelayedFrameCallbackParamTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push PostDelayedFrameCallbackParamTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PostDelayedFrameCallbackParamTest page error:" + err);
      }
      console.info("PostDelayedFrameCallbackParamTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PostDelayedFrameCallbackParamTest after each called");
    });

    /**
     * @tc.name   PostDelayedFrameCallbackParamTest_1000
     * @tc.number SUB_ARKUI_UICONTEXT_PostDelayedFrameCallback_1000
     * @tc.desc   postDelayedFrameCallback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PostDelayedFrameCallbackParamTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('PostDelayedFrameCallbackParamTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('postDelayedFrameCallback_id1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('postDelayedFrameCallback_id2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('postDelayedFrameCallback_id3'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('postDelayedFrameCallback_id4'));
      await button4.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('postDelayedFrameCallback1')).assertEqual('success');
      expect(AppStorage.get('postDelayedFrameCallback2')).assertEqual('success');
      expect(AppStorage.get('postDelayedFrameCallback3')).assertEqual('success');
      expect(AppStorage.get('postDelayedFrameCallback4')).assertEqual('success');
      AppStorage.delete('postDelayedFrameCallback1');
      AppStorage.delete('postDelayedFrameCallback2');
      AppStorage.delete('postDelayedFrameCallback3');
      AppStorage.delete('postDelayedFrameCallback4');
      console.info('[PostDelayedFrameCallbackParamTest_1000] END');
      done();
    });

  })
}