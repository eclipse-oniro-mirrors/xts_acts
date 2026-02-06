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
import text from "@ohos.graphics.text"

export default function RichEditorAddApi() {
  describe('RichEditorAddApi', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorAddApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorAddApi state pages:" + JSON.stringify(pages));
        if (!("RichEditorAddApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RichEditor/RichEditorAddApi"})
          await CommonFunc.sleep(2000);
          console.info("push RichEditorAddApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorAddApi page error:" + err);
      }
      console.info("RichEditorAddApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorAddApi after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_RichEditor_0010
     * @tc.name       : RichEditorAddApi_001
     * @tc.desc       : RichEditor Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('RichEditorAddApi_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[RichEditorAddApi_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('RichEditorAddApiBt'));
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditorAddApi');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorAddApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('true');
      console.info('[RichEditorAddApi_001] END');
      done();
    });







  })
}
