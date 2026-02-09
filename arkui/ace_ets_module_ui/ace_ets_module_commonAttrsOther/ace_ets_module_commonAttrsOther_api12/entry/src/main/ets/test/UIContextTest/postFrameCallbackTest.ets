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
export default function postFrameCallbackTest() {
  describe('postFrameCallbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("postFrameCallbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/postFrameCallback",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get postFrameCallback state pages: " + JSON.stringify(pages));
        if (!("postFrameCallback" == pages.name)) {
          console.info("get postFrameCallback state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push postFrameCallback success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push postFrameCallback page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   postFrameCallbackTest_0100
     * @tc.number postFrameCallbackTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postFrameCallbackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('postFrameCallbackTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn1'));
      let postFrameCallback: Component = await driver.findComponent(ON.id('postFrameCallback'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let content = await postFrameCallback.getText()
      console.info("[postFrameCallbackTest_0100] getText is: " + JSON.stringify(content));
      expect(content).assertEqual('postFrameCallback');
      console.info('[postFrameCallbackTest_0100] END');
      done();
    });
    /**
     * @tc.name   postFrameCallbackTest_0200
     * @tc.number postFrameCallbackTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postFrameCallbackTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('postFrameCallbackTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn1'));
      let isExtraRegionPerpendicular: Component = await driver.findComponent(ON.id('isExtraRegionPerpendicular'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let content = await isExtraRegionPerpendicular.getText()
      console.info("[postFrameCallbackTest_0200] getText is: " + JSON.stringify(content));
      expect(content).assertEqual('false');
      console.info('[postFrameCallbackTest_0200] END');
      done();
    });
  })
}