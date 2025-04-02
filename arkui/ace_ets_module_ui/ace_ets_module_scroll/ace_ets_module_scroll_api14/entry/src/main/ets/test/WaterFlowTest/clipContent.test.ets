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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function clipContent() {
  describe('clipContent', () => {
    beforeEach(async (done: Function) => {
      console.info("clipContent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/clipContent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get clipContent state pages:" + JSON.stringify(pages));
        if (!("clipContent" == pages.name)) {
          console.info("get clipContent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push clipContent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push clipContent page error:" + err);
      }
      console.info("clipContent beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("clipContent after each called");
    });

    /**
     * @tc.number    clipContent_001
     * @tc.name      clipContent_0100
     * @tc.desc      Clip to content rect inside margin & padding.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('clipContent_0100', 0, async (done: Function) => {
      console.info('[clipContent_0100] START');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('common_clipContent_water');
      console.info("[clipContent_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[clipContent_0100] clipContent1: " + JSON.stringify(JSON.parse(strJson1).$attrs.clipContent));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson1).$attrs.clipContent).assertEqual("ContentClipMode.CONTENT_ONLY");
      console.info('[focusedList_0100] ContentClipMode.CONTENT_ONLY END');
      done();
    });

    /**
     * @tc.number    clipContent_002
     * @tc.name      clipContent_0200
     * @tc.desc      Clip to scrollable's outer rect, including padding but inside margin.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('clipContent_0200', 0, async (done: Function) => {
      console.info('[clipContent_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn2: Component = await driver.findComponent(ON.id('clipContent_water_boundary'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('common_clipContent_water');
      console.info("[clipContent_0200] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[clipContent_0200] clipContent2: " + JSON.stringify(JSON.parse(strJson2).$attrs.clipContent));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson2).$attrs.clipContent).assertEqual("ContentClipMode.BOUNDARY");
      console.info('[clipContent_0200] ContentClipMode.BOUNDARY END');
      done();
    });

    /**
     * @tc.number    clipContent_003
     * @tc.name      clipContent_0300
     * @tc.desc      Clip to the safeArea of scrollable container.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('clipContent_0300', 0, async (done: Function) => {
      console.info('[clipContent_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn3: Component = await driver.findComponent(ON.id('clipContent_water_safearea'));
      await btn3.click();
      await CommonFunc.sleep(2000);
      let strJson3 = getInspectorByKey('common_clipContent_water');
      console.info("[clipContent_0300] component obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[clipContent_0300] clipContent3: " + JSON.stringify(JSON.parse(strJson3).$attrs.clipContent));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson3).$attrs.clipContent).assertEqual("ContentClipMode.SAFE_AREA");
      console.info('[focusedList_0300] ContentClipMode.SAFE_AREA END');
      done();
    });
  })
}