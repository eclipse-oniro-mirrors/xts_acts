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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'

export default function shadowOffsetJsunit() {
  describe('shadowOffsetJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("shadowOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/shadowOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shadowOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("shadowOffset" == pages.name)) {
          console.info("get shadowOffsetJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push shadowOffsetJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shadowOffsetJsunit page error:" + err);
      }
      done()
    });


    /**
     * @tc.name   shadowOffsetJsunit_0100
     * @tc.number shadowOffsetJsunit_0100
     * @tc.desc   shadowOffsetJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('shadowOffsetJsunit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[shadowOffsetJsunit_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('get_shadowOffset'));
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('getX');
      let strJson2 = getInspectorByKey('getY');
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[shadowOffsetJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[shadowOffsetJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[shadowOffsetJsunit_0100] component content1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[shadowOffsetJsunit_0100] component content2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("getOffset_X:10");
      expect(obj2.$attrs.content).assertEqual("getOffset_Y:10");
      console.info('[shadowOffsetJsunit_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}