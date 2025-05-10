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

export default function RepeatSwiperNumber() {
  describe('RepeatSwiperNumber', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatSwiperNumber beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMixedComponent/RepeatSwiperNumber",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatSwiperNumber state pages:" + JSON.stringify(pages));
        if (!("RepeatSwiperNumber" == pages.name)) {
          console.info("get RepeatSwiperNumber pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatSwiperNumber page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatSwiperNumber page error:" + err);
      }
      console.info("RepeatSwiperNumber beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatSwiperNumber after each called");
    });

    /**
     * @tc.number RepeatSwiperNumber_001
     * @tc.name RepeatSwiperNumber_001
     * @tc.desc Test RepeatSwiperNumber component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatSwiperNumber_001', 0, async (done: Function) => {
      console.info('[RepeatSwiperNumber_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('Text1SN1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatSwiperNumber_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('1 index:1:0');
      console.info('[RepeatSwiperNumber_001] END');

      let strJson1 = getInspectorByKey('Text2SN1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatSwiperNumber_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1 index:1:0');
      console.info('[RepeatSwiperNumber_001] END');

      let btn: Component = await driver.findComponent(ON.id('Button1_SN'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('Text1SN1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatSwiperNumber_001] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('1 index:1:0');
      console.info('[RepeatSwiperNumber_001] END');

      let btn1: Component = await driver.findComponent(ON.id('Button2_SN'));
      await btn1.click();
      await btn1.click();
      await btn1.click();
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('Text1SN1');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatSwiperNumber_001] component obj is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('1 index:1:99');
      console.info('[RepeatSwiperNumber_001] END');
      done();
    });
  })
}
