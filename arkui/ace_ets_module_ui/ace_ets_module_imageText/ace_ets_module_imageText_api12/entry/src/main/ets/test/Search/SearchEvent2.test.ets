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

export default function SearchEvent2() {
  describe('SearchEvent2', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchEvent2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchEvent2 state pages:" + JSON.stringify(pages));
        if (!("SearchEvent2" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Search/SearchEvent2"})
          await CommonFunc.sleep(2000);
          console.info("push SearchEvent2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchEvent2 page error:" + err);
      }
      console.info("SearchEvent2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SearchEvent2 after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0170
     * @tc.name       : SearchEvent2_001
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('SearchEvent2_001', 0, async (done: Function) => {
      console.info('[SearchEvent2_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search2Event'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchEvent2Text')
      let strJson2 = getInspectorByKey('SearchEvent2Text2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SearchEvent2_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('0123');
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[SearchEvent2_001] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0180
     * @tc.name       : SearchEvent2_002
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('SearchEvent2_002', 0, async (done: Function) => {
      console.info('[SearchEvent2_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search2Event2'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchEvent2Text')
      let strJson2 = getInspectorByKey('SearchEvent2Text2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SearchEvent2_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('');
      expect(obj2.$attrs.content).assertEqual('01');
      console.info('[SearchEvent2_002] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0190
     * @tc.name       : SearchEvent2_003
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('SearchEvent2_003', 0, async (done: Function) => {
      console.info('[SearchEvent2_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search2Event3'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchEvent2Text3')
      let strJson2 = getInspectorByKey('SearchEvent2Text4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SearchEvent2_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('01');
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[SearchEvent2_003] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0200
     * @tc.name       : SearchEvent2_004
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('SearchEvent2_004', 0, async (done: Function) => {
      console.info('[SearchEvent2_004] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search2Event4'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchEvent2Text3')
      let strJson2 = getInspectorByKey('SearchEvent2Text4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SearchEvent2_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('0');
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[SearchEvent2_004] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0210
     * @tc.name       : SearchEvent2_005
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('SearchEvent2_005', 0, async (done: Function) => {
      console.info('[SearchEvent2_005] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search2Event5'));
      let button = await driver.findComponent(ON.id('Search2EventBt'));
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchEvent2Text5')
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchEvent2_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onWillInsert');
      console.info('[SearchEvent2_005] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0230
     * @tc.name       : SearchEvent2_006
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('SearchEvent2_006', 0, async (done: Function) => {
      console.info('[SearchEvent2_006] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search2Event5'));
      let button = await driver.findComponent(ON.id('Search2EventBt2'));
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchEvent2Text5')
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchEvent2_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onWillInsert');
      console.info('[SearchEvent2_006] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0250
     * @tc.name       : SearchEvent2_007
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('SearchEvent2_007', 0, async (done: Function) => {
      console.info('[SearchEvent2_007] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('Search2Event6'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchEvent2Text5')
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchEvent2_007] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onWillInsert');
      console.info('[SearchEvent2_007] END');
      done();

    });






  })
}
