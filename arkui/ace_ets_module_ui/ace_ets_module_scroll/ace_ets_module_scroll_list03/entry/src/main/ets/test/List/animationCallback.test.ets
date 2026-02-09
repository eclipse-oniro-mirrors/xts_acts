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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
export default function animationCallback() {
  describe('animationCallback', () => {
    beforeEach(async (done: Function) => {
      console.info("animationCallback beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/animationCallback",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animationCallback state pages:" + JSON.stringify(pages));
        if (!("animationCallback" == pages.name)) {
          console.info("get animationCallback pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push animationCallback page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animationCallback page error:" + err);
      }
      console.info("animationCallback beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("animationCallback after each called");
    });

    /**
     * @tc.name   animationCallback_0100
     * @tc.number animationCallback_001
     * @tc.desc   When the animation parameter is true, trigger the callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('animationCallback_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[animationCallback_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('list_animation_true'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('animate_callback_text');
      console.info("[animationCallback_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[animationCallback_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('List: onReachStart-onScrollStart-onReachEnd-onDidScroll-onScrollStop');
      console.info('[animationCallback_0100] END');
      done();
    });
  })
}
