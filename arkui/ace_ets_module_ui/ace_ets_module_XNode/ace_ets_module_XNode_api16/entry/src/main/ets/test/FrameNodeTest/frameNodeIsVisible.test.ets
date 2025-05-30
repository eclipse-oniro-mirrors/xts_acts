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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function frameNodeIsVisibleTest() {
  describe('frameNodeIsVisibleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("frameNodeIsVisibleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeIsVisibleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeIsVisibleTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get frameNodeIsVisibleTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push frameNodeIsVisibleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeIsVisibleTest page error:" + err);
      }
      console.info("frameNodeIsVisibleTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeIsVisibleTest after each called");
    });

    /**
     * @tc.number    frameNodeIsVisibleTest_0100
     * @tc.name      frameNodeIsVisibleTest_0100
     * @tc.desc      frameNode: UINode isVisible is false
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeIsVisibleTest_0100', 0, async (done: Function) => {
      console.info('frameNodeIsVisibleTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('print_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('columnNodeIsVisible');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[frameNodeIsVisibleTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[frameNodeIsVisibleTest_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[frameNodeIsVisibleTest_0100] END');
      done();
    });

  })
}