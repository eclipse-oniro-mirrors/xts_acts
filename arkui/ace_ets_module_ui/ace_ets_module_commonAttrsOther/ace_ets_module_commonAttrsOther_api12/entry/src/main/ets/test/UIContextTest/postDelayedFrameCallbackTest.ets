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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function postDelayedFrameCallbackTest() {
  describe('postDelayedFrameCallbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("postDelayedFrameCallbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/postDelayedFrameCallback",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get postDelayedFrameCallback state pages: " + JSON.stringify(pages));
        if (!("postDelayedFrameCallback" == pages.name)) {
          console.info("get postDelayedFrameCallback state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push postDelayedFrameCallback success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push postDelayedFrameCallback page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    postDelayedFrameCallbackTest_0100
     * @tc.name      postDelayedFrameCallbackTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('postDelayedFrameCallbackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('postDelayedFrameCallbackTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn2'));
      let postDelayedFrameCallback: Component = await driver.findComponent(ON.id('postDelayedFrameCallback'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let content = await postDelayedFrameCallback.getText()
      console.info("[postDelayedFrameCallbackTest_0100] getText is: " + JSON.stringify(content));
      expect(content).assertEqual('postDelayedFrameCallback');
      console.info('[postDelayedFrameCallbackTest_0100] END');
      done();
    });
    /**
     * @tc.number    postDelayedFrameCallbackTest_0200
     * @tc.name      postDelayedFrameCallbackTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('postDelayedFrameCallbackTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('postDelayedFrameCallbackTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn2'));
      let horizontalSplitRatio: Component = await driver.findComponent(ON.id('horizontalSplitRatio'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let content = await horizontalSplitRatio.getText()
      console.info("[postDelayedFrameCallbackTest_0200] getText is: " + JSON.stringify(content));
      expect(content).assertEqual('horizontalSplitRatio');
      console.info('[postDelayedFrameCallbackTest_0200] END');
      done();
    });
    /**
     * @tc.number    postDelayedFrameCallbackTest_0300
     * @tc.name      postDelayedFrameCallbackTest_0300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('postDelayedFrameCallbackTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('postDelayedFrameCallbackTest_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn2'));
      let verticalSplitRatio: Component = await driver.findComponent(ON.id('verticalSplitRatio'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let content = await verticalSplitRatio.getText()
      console.info("[postDelayedFrameCallbackTest_0300] getText is: " + JSON.stringify(content));
      expect(content).assertEqual('verticalSplitRatio');
      console.info('[postDelayedFrameCallbackTest_0300] END');
      done();
    });
  })
}