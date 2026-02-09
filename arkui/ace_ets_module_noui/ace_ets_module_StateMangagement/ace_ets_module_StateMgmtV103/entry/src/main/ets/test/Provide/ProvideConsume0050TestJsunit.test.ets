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


export default function ProvideConsume0050TestJsunit() {
  describe('ProvideConsume0050TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideConsume0050TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Provide/ProvideConsume0050",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideConsume0050TestJsunit state pages:" + JSON.stringify(pages));
        if (!("ProvideConsume0050" == pages.name)) {
          console.info("get ProvideConsume0050TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProvideConsume0050TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideConsume0050TestJsunit page error:" + err);
      }
      console.info("ProvideConsume0050TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProvideConsume0050TestJsunit after each called");
    });
    /**
     * @tc.name   ProvideConsume0050Test_001
     * @tc.number ProvideConsume0050Test_001
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProvideConsume0050Test_001', Level.LEVEL1, async () => {
      await CommonFunc.sleep(1000);
      console.info('[ProvideConsume0050Test_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("click"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("change"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('childText'))
      await CommonFunc.sleep(1000);
      console.info("[ProvideConsume0050Test_001] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('world')
      await driver.pressBack()

      let btn2: Component = await driver.findComponent(ON.id("parent_change"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('parentText'))
      await CommonFunc.sleep(1000);
      console.info("[ProvideConsume0050Test_001] component obj2 is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('hello world')
      console.info('[ProvideConsume0050Test_001] END');
      await driver.pressBack()

    })
  })
}