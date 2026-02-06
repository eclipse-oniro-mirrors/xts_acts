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

export default function searchTest() {
  describe('searchTest', () => {
    beforeEach(async (done: Function) => {
      console.info("searchTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get searchTest state pages:" + JSON.stringify(pages));
        if (!("searchTest" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/SearchApi12/searchTest"})
          await CommonFunc.sleep(2000);
          console.info("push searchTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchTest page error:" + err);
      }
      console.info("searchTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchTest after each called");
    });

    /**
     * @tc.name   searchTest_001
     * @tc.number SUB_ACE_UI_COMPONENT_searchTest_001
     * @tc.desc   onEditChange Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('searchTest_001', Level.LEVEL3, async (done: Function) => {
      console.info('[searchTest_001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);      
      let text: Component = await driver.findComponent(ON.id('searchTest1'));
      await text.inputText('123')
      await CommonFunc.sleep(500);
      await driver.triggerKey(2047);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('searchTestText3');
      let strJson2 = getInspectorByKey('searchTestText1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[searchTest_001] component obj is: " + JSON.stringify(obj));
      console.info("[searchTest_001] component obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('true');

      console.info('[searchTest_001] END');
      done();
    });


    /**
     * @tc.name   searchTest_002
     * @tc.number searchTest_002
     * @tc.desc   searchTest_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('searchTest_002', Level.LEVEL3, async (done: Function) => {
      console.info('[searchTest_002] START');

      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let text: Component = await driver.findComponent(ON.id('searchTest1'));
      let button: Component = await driver.findComponent(ON.id('searchTestBt'));
      await text.click()
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('searchTestText3');
      let strJson2 = getInspectorByKey('searchTestText1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[searchTest_002] component obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('false');

      console.info('[searchTest_002] END');
      done();
    })

    /**
     * @tc.name   searchTest_003
     * @tc.number SUB_ACE_UI_COMPONENT_searchTest_003
     * @tc.desc   onEditChange Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('searchTest_003', Level.LEVEL3, async (done: Function) => {
      console.info('[searchTest_003] START');

      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('searchTestBt2'));
      let text: Component = await driver.findComponent(ON.id('searchTest1'));
      let text2: Component = await driver.findComponent(ON.id('searchTest2'));
      await button.click()
      await CommonFunc.sleep(1000);
      await text.longClick();
      await CommonFunc.sleep(2000);
      let text1 = await driver.findComponent(ON.text('全选'));
      await text1.click();
      await CommonFunc.sleep(1000);

      await text.dragTo(text2);
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('searchTestText2');
      await CommonFunc.sleep(200);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[searchTest_002] component obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('false');

      console.info('[searchTest_003] END');
      done();
    });
  })
}
