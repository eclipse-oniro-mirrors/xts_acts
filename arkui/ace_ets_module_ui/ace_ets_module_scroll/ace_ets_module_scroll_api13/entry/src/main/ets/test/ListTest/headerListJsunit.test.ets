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
export default function headerListJsunit() {
  describe('headerListJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("headerListJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/headerList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get headerListJsunit state pages:" + JSON.stringify(pages));
        if (!("headerList" == pages.name)) {
          console.info("get headerListJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push headerListJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push headerListJsunit page error:" + err);
      }
      console.info("headerListJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("headerListJsunit after each called");
    });

    /**
     * @tc.number    headerListJsunit_001
     * @tc.name      headerListJsunit_001
     * @tc.desc      Set Header/Footer through ComponentContent.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('headerListJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[headerListJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('list_header'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let text01 = await driver.findComponent(ON.text("美术"))
      let texContent = await text01.getText();
      expect(texContent).assertEqual("美术");

      let strJson = getInspectorByKey('list_title');
      console.info("[headerListJsunit_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[headerListJsunit_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('title: Monday');
      console.info('[headerListJsunit_0100] END');
      done();
    });
  })
}
