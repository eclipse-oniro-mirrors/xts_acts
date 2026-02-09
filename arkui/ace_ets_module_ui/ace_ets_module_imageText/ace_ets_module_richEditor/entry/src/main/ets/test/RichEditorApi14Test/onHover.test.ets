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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function RichEditorOnHoverTest() {
  describe('RichEditorOnHoverTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnHoverTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi14/onHover',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnHoverTest state pages: " + JSON.stringify(pages));
        if (!("onHover" == pages.name)) {
          console.info("get RichEditorOnHoverTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorOnHoverTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnHoverTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorOnHoverTest_0010
     * @tc.number SUB_ACE_RichEditorOnHover_0010
     * @tc.desc   test onHover:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorOnHoverTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('RichEditorOnHoverTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_onHover_id'));
      let point = await RichEditor.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({x:point.x , y:point.y })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onHover_text2_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorOnHoverTest_0010] component obj is: " + JSON.stringify(obj));
      console.info("[RichEditorOnHoverTest_0010] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[RichEditorOnHoverTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorOnHoverTest_0020
     * @tc.number SUB_ACE_RichEditorOnHover_0020
     * @tc.desc   test onHover:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorOnHoverTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('RichEditorOnHoverTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_onHover_id'));
      let point = await RichEditor.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({x:point.x , y:point.y })
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.id('onHover_text2_id'));
      let point2 = await text2.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({x:point2.x , y:point2.y })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onHover_text1_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorOnHoverTest_0020] component obj is: " + JSON.stringify(obj));
      console.info("[RichEditorOnHoverTest_0020] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[RichEditorOnHoverTest_0020] END');
      done();
    });
  })
}
