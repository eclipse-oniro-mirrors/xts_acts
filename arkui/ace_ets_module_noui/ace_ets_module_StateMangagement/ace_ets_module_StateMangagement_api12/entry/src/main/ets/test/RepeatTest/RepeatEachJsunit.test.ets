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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function RepeatEachJsunit() {
  describe('RepeatEachJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatEachJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Repeat/RepeatEach',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatEachJsunit state pages: " + JSON.stringify(pages));
        if (!("RepeatEach" == pages.name)) {
          console.info("get RepeatEachJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatEachJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatEachJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let init = await driver.findComponent(ON.id('init_repeat'));
      await init.click();
      console.info(" RepeatEachJsunit after each called");
    });

    /* *
    * @tc.number: SUB_ACE_SWIPER_RepeatEachJsunit_0100
    * @tc.name  : RepeatEachJsunit_0100
    * @tc.desc  : The Repeat component modifies the value of the third array item.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('RepeatEachJsunit_0100', 0, async (done: Function) => {
      console.info('RepeatEachJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_modify'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_0100] repeat_modify success");

      let strJson = getInspectorByKey('mess_repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatEachJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('message: new three');
      console.info('[RepeatEachJsunit_0100] END');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_SWIPER_RepeatEachJsunit_0200
    * @tc.name  : RepeatEachJsunit_0200
    * @tc.desc  : Click to add value.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('RepeatEachJsunit_0200', 0, async (done: Function) => {
      console.info('RepeatEachJsunit_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('length_repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatEachJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("length: 4");
      console.info('[RepeatEachJsunit_0200] END');
      done();
    });
	
    /* *
    * @tc.number: SUB_ACE_SWIPER_RepeatEachJsunit_0300
    * @tc.name  : RepeatEachJsunit_0300
    * @tc.desc  : Swap array items.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('RepeatEachJsunit_0300', 0, async (done: Function) => {
      console.info('RepeatEachJsunit_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('mess_repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatEachJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("message: two");
      console.info('[RepeatEachJsunit_0300] END');
      done();
    });
	
    /* *
    * @tc.number: SUB_ACE_SWIPER_RepeatEachJsunit_0400
    * @tc.name  : RepeatEachJsunit_0400
    * @tc.desc  : Click to delete the value of the third array item.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('RepeatEachJsunit_0400', 0, async (done: Function) => {
      console.info('RepeatEachJsunit_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_3'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('length_repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatEachJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("length: 2");
      console.info('[RepeatEachJsunit_0400] END');
      done();
    });
	
    /* *
    * @tc.number: SUB_ACE_SWIPER_RepeatEachJsunit_0500
    * @tc.name  : RepeatEachJsunit_0500
    * @tc.desc  : Click to add data and delete values.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('RepeatEachJsunit_0500', 0, async (done: Function) => {
      console.info('RepeatEachJsunit_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_4'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('length_repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatEachJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_0500] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("length: 3");

      let strJson2 = getInspectorByKey('mess_repeat');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatEachJsunit_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[RepeatEachJsunit_0500] text2: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("message: 我");

      console.info('[RepeatEachJsunit_0500] END');
      done();
    });
	
    /* *
    * @tc.number: SUB_ACE_SWIPER_RepeatEachJsunit_0600
    * @tc.name  : RepeatEachJsunit_0600
    * @tc.desc  : Click to add two data items and delete the second value.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('RepeatEachJsunit_0600', 0, async (done: Function) => {
      console.info('RepeatEachJsunit_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_5'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('length_repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatEachJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_0600] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("length: 4");

      let strJson2 = getInspectorByKey('mess_repeat');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatEachJsunit_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[RepeatEachJsunit_0600] text2: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("message: 你");

      console.info('[RepeatEachJsunit_0600] END');
      done();
    });

  })
}

