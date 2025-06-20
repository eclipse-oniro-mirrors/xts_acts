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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function customPropertyTest() {
  describe('customPropertyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("customPropertyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/customProperty/customProperty",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get customPropertyTest state pages: " + JSON.stringify(pages));
        if (!("customProperty" == pages.name)) {
          console.info("get customPropertyTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push customPropertyTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customPropertyTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    customPropertyTest_0010
     * @tc.name      customPropertyTest_0010
     * @tc.desc      commonMethed: customProperty
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('customPropertyTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('customPropertyTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('CustomProperty1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('CustomProperty1_button');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[customPropertyTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('{"number":10,"string":"this is a string","bool":true,"object":{"name":"name","value":100}}');
      console.info('[customPropertyTest_0010] END');
      done();
    }); 
  })
}

