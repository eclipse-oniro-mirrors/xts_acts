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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
export default function groupAnimation() {
  describe('groupAnimation', () => {
    beforeEach(async (done: Function) => {
      console.info("groupAnimation beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/groupAnimation",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get groupAnimation state pages:" + JSON.stringify(pages));
        if (!("groupAnimation" == pages.name)) {
          console.info("get groupAnimation pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push groupAnimation page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push groupAnimation page error:" + err);
      }
      console.info("groupAnimation beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("groupAnimation after each called");
    });

    /**
     * @tc.number    groupAnimation_001
     * @tc.name      groupAnimation_0100
     * @tc.desc      When the animation parameter is true, trigger the onScrollVisibleContentChange callback.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('groupAnimation_0100', 0, async (done: Function) => {
      console.info('[groupAnimation_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('group_animation_true'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('group_change_mess');
      console.info("[groupAnimation_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[groupAnimation_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onScrollVisibleContentChange: 1');
      console.info('[groupAnimation_0100] END');
      done();
    });
  })
}
