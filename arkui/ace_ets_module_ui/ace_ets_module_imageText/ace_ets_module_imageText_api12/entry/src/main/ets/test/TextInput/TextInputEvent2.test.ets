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

export default function TextInputEvent2() {
  describe('TextInputEvent2', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputEvent2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputEvent2 state pages:" + JSON.stringify(pages));
        if (!("TextInputEvent2" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/TextInput/TextInputEvent2"})
          await CommonFunc.sleep(2000);
          console.info("push TextInputEvent2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputEvent2 page error:" + err);
      }
      console.info("TextInputEvent2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputEvent2 after each called");
    });


    /**
     * @tc.name   TextInputEvent2_001
     * @tc.number TextInputEvent2_001
     * @tc.desc   TextInputEvent2_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEvent2_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputEvent2_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput2Event'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEvent2Text')
      let strJson2 = getInspectorByKey('TextInputEvent2Text2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent2_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('0123');
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[TextInputEvent2_001] END');
      done();

    });


    /**
     * @tc.name   TextInputEvent2_002
     * @tc.number TextInputEvent2_002
     * @tc.desc   TextInputEvent2_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEvent2_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputEvent2_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput2Event2'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEvent2Text')
      let strJson2 = getInspectorByKey('TextInputEvent2Text2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent2_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('');
      expect(obj2.$attrs.content).assertEqual('01');
      console.info('[TextInputEvent2_002] END');
      done();

    });


    /**
     * @tc.name   TextInputEvent2_003
     * @tc.number TextInputEvent2_003
     * @tc.desc   TextInputEvent2_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEvent2_003',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputEvent2_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput2Event3'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEvent2Text3')
      let strJson2 = getInspectorByKey('TextInputEvent2Text4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent2_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('01');
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[TextInputEvent2_003] END');
      done();

    });


    /**
     * @tc.name   TextInputEvent2_004
     * @tc.number TextInputEvent2_004
     * @tc.desc   TextInputEvent2_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEvent2_004',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputEvent2_004] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput2Event4'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEvent2Text3')
      let strJson2 = getInspectorByKey('TextInputEvent2Text4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputEvent2_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('0');
      expect(obj2.$attrs.content).assertEqual('0');
      console.info('[TextInputEvent2_004] END');
      done();

    });


    /**
     * @tc.name   TextInputEvent2_005
     * @tc.number TextInputEvent2_005
     * @tc.desc   TextInputEvent2_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEvent2_005',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputEvent2_005] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput2Event5'));
      let button = await driver.findComponent(ON.id('TextInput2EventBt'));
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEvent2Text5')
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputEvent2_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onWillInsert');
      console.info('[TextInputEvent2_005] END');
      done();

    });


    /**
     * @tc.name   TextInputEvent2_006
     * @tc.number TextInputEvent2_006
     * @tc.desc   TextInputEvent2_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEvent2_006',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputEvent2_006] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput2Event5'));
      let button = await driver.findComponent(ON.id('TextInput2EventBt2'));
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEvent2Text5')
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputEvent2_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onWillInsert');
      console.info('[TextInputEvent2_006] END');
      done();

    });


    /**
     * @tc.name   TextInputEvent2_007
     * @tc.number TextInputEvent2_007
     * @tc.desc   TextInputEvent2_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEvent2_007',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputEvent2_007] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput2Event6'));
      await text.inputText('1');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await text.clearText();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputEvent2Text5')
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputEvent2_007] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onWillInsert');
      console.info('[TextInputEvent2_007] END');
      done();
    });
  })
}
