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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextInputEvent() {
  describe('TextInputEvent', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputEvent beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputEvent state pages:" + JSON.stringify(pages));
        if (!("TextInputEvent" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/TextInput/TextInputEvent"})
          await CommonFunc.sleep(2000);
          console.info("push TextInputEvent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputEvent page error:" + err);
      }
      console.info("TextInputEvent foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputEvent after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0010
     * @tc.name       : TextInputEvent_001
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_001', 0, async (done: Function) => {
      console.info('[TextInputEvent_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      await text.inputText('9');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEventText')
      let strJson2 = getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('0');
      expect(obj2.$attrs.content).assertEqual('9');
      console.info('[TextInputEvent_001] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0020
     * @tc.name       : TextInputEvent_002
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_002', 0, async (done: Function) => {
      console.info('[TextInputEvent_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent2'));
      let point = await text.getBoundsCenter();
      await driver.inputText(point, '9');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEventText')
      let strJson2 = getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('9');
      console.info('[TextInputEvent_002] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0030
     * @tc.name       : TextInputEvent_003
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_003', 0, async (done: Function) => {
      console.info('[TextInputEvent_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      let point = await text.getBoundsCenter();
      await driver.inputText(point, '123');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEventText')
      let strJson2 = getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('3');
      expect(obj2.$attrs.content).assertEqual('3');
      console.info('[TextInputEvent_003] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0040
     * @tc.name       : TextInputEvent_004
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_004', 0, async (done: Function) => {
      console.info('[TextInputEvent_004] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent2'));
      let point = await text.getBoundsCenter();
      await driver.inputText(point, '3');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEventText')
      let strJson2 = getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('3');
      console.info('[TextInputEvent_004] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0090
     * @tc.name       : TextInputEvent_005
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_005', 0, async (done: Function) => {
      console.info('[TextInputEvent_005] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      await text.inputText('123');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEventText3')
      let strJson2 = getInspectorByKey('TextInputEventText4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('3');
      expect(obj2.$attrs.content).assertEqual('3');
      console.info('[TextInputEvent_005] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0110
     * @tc.name       : TextInputEvent_006
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_006', 0, async (done: Function) => {
      console.info('[TextInputEvent_006] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      await text.inputText('123');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEventText5')
      let strJson2 = getInspectorByKey('TextInputEventText6');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('1');
      console.info('[TextInputEvent_006] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0110
     * @tc.name       : TextInputEvent_007
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_007', 0, async (done: Function) => {
      console.info('[TextInputEvent_007] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent3'));
      await text.inputText('123');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEventText5')
      let strJson2 = getInspectorByKey('TextInputEventText6');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent_007] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('4');
      expect(obj2.$attrs.content).assertEqual('3');
      console.info('[TextInputEvent_007] END');
      done();

    });






  })
}
