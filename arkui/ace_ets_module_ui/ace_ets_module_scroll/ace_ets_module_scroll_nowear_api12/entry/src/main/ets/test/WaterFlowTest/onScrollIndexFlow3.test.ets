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
import CommonFunc from '../../MainAbility/utils/Common';

export default function onScrollIndexFlow3() {
  describe('onScrollIndexFlow3', () => {
    beforeEach(async (done: Function) => {
      console.info("onScrollIndexFlow3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/onScrollIndexFlow3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onScrollIndexFlow3 state pages:" + JSON.stringify(pages));
        if (!("onScrollIndexFlow3" == pages.name)) {
          console.info("get onScrollIndexFlow3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onScrollIndexFlow3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onScrollIndexFlow3 page error:" + err);
      }
      console.info("onScrollIndexFlow3 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onScrollIndexFlow3 after each called");
    });

    /**
     * @tc.number    onScrollIndexFlow3_001
     * @tc.name      onScrollIndexFlow3_001
     * @tc.desc      Slide FlowItem through the controller
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('onScrollIndexFlow3_0100', 0, async (done: Function) => {
      console.info('[onScrollIndexFlow3_0100] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('onScrollIndex_scroller'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('onScrollIndex_flow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onScrollIndexFlow3_0100] component obj is: " + JSON.stringify(obj));
      console.info("[onScrollIndexFlow3_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onScrollIndex:succ5');
      console.info('[onScrollIndexFlow3_0100] END');
      done();
    });
  })
}
