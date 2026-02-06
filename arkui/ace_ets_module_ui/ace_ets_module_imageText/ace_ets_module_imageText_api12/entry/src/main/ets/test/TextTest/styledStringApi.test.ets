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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function styledStringApi() {
  describe('styledStringApi', () => {
    beforeEach(async (done: Function) => {
      console.info("styledStringApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get styledStringApi state pages:" + JSON.stringify(pages));
        if (!("styledStringApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Text/styledStringApi"})
          await CommonFunc.sleep(2000);
          console.info("push styledStringApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push styledStringApi page error:" + err);
      }
      console.info("styledStringApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("styledStringApi after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Styled_String_001
     * @tc.desc      appendStyledString test of Styled_String
     * @tc.level     Level 3
     * @tc.type
     */

    it('styledStringApi_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[styledStringApi_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('styledStringBt1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('styledStringBt3'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('styledStringText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[styledStringApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('tring');
      console.info('[styledStringApi_001] END');
      done();

    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Styled_String_002
     * @tc.desc      insertStyledString test of Styled_String
     * @tc.level     Level 3
     * @tc.type
     */

    it('styledStringApi_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[styledStringApi_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('styledStringBt2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('styledStringBt3'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('styledStringText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[styledStringApi_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('string');
      console.info('[styledStringApi_002] END');
      done();

    });





  })
}
