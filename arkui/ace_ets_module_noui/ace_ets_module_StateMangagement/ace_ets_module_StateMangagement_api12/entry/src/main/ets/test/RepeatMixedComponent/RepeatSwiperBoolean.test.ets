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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function RepeatSwiperBoolean() {
  describe('RepeatSwiperBoolean', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatSwiperBoolean beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMixedComponent/RepeatSwiperBoolean",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatSwiperBoolean state pages:" + JSON.stringify(pages));
        if (!("RepeatSwiperBoolean" == pages.name)) {
          console.info("get RepeatSwiperBoolean pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatSwiperBoolean page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatSwiperBoolean page error:" + err);
      }
      console.info("RepeatSwiperBoolean beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatSwiperBoolean after each called");
    });

    /**
     * @tc.number RepeatSwiperBoolean_001
     * @tc.name RepeatSwiperBoolean_001
     * @tc.desc Test RepeatSwiperBoolean component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatSwiperBoolean_001', 0, async (done: Function) => {
      console.info('[RepeatSwiperBoolean_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('SB_Text11');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatSwiperBoolean_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('false index:1:0');
      console.info('[RepeatSwiperBoolean_001] END');

      let strJson1 = getInspectorByKey('SB_Text21');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatSwiperBoolean_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('false index:1:0');
      console.info('[RepeatSwiperBoolean_001] END');

      let btn: Component = await driver.findComponent(ON.id('SB_Button1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('SB_Text11');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatSwiperBoolean_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('false index:1:0');
      console.info('[RepeatSwiperBoolean_001] END');

      let btn1: Component = await driver.findComponent(ON.id('SB_Button2'));
      await btn1.click();
      await btn1.click();
      await btn1.click();
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('SB_Text11');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatSwiperBoolean_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('false index:1:99');
      console.info('[RepeatSwiperBoolean_001] END');
      done();
    });
  })
}
