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
import CommonFunc from '../../../MainAbility/common/Common';

export default function appendChildTest() {
  describe('appendChildTest', () => {
    beforeEach(async (done: Function) => {
      console.info("appendChildTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode/appendChild',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get appendChildTest state pages: " + JSON.stringify(pages));
        if (!("appendChild" == pages.name)) {
          console.info("get appendChildTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push appendChildTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push appendChildTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   appendChildTest_0100
     * @tc.number appendChildTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('appendChildTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('appendChildTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('appendChild_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('appendChild_width1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[appendChildTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('width1: 50');
      console.info('[appendChildTest_0100] END');
      done();
    });

    /**
     * @tc.name   appendChildTest_0200
     * @tc.number appendChildTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('appendChildTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('appendChildTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('insertChildAfter_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('appendChild_width1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[appendChildTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('width1: 0');
      console.info('[appendChildTest_0200] END');
      done();
    });

    /**
     * @tc.name   appendChildTest_0300
     * @tc.number appendChildTest_0300
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('appendChildTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('appendChildTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('removeChild_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('appendChild_width1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[appendChildTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('width1: 0');
      console.info('[appendChildTest_0300] END');
      done();
    });

    /**
     * @tc.name   appendChildTest_0400
     * @tc.number appendChildTest_0400
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('appendChildTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('appendChildTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('clearChild_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('appendChild_width1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[appendChildTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('width1: 130');
      console.info('[appendChildTest_0400] END');
      done();
    });
  })
}

