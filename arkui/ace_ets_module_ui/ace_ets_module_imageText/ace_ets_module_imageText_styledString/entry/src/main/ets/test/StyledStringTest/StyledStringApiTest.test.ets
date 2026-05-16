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

export default function StyledStringApiTest() {
  describe('StyledStringApiTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringApi state pages:" + JSON.stringify(pages));
        if (!("StyledStringApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/StyledString/StyledStringApi"})
          await CommonFunc.sleep(2000);
          console.info("push StyledStringApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringApi page error:" + err);
      }
      console.info("StyledStringApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StyledStringApi after each called");
    });


    /**
     * @tc.name   styledStringApi_001
     * @tc.number styledStringApi_001
     * @tc.desc   styledStringApi_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('styledStringApi_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[styledStringApi_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('styledStringApiTestBt1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('styledStringApiTestBt3'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('styledStringTextStyledStringApiTest');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[styledStringApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('tring');
      console.info('[styledStringApi_001] END');
      done();

    });


    /**
     * @tc.name   styledStringApi_002
     * @tc.number styledStringApi_002
     * @tc.desc   styledStringApi_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('styledStringApi_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[styledStringApi_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('styledStringApiTestBt2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('styledStringApiTestBt3'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('styledStringTextStyledStringApiTest');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[styledStringApi_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('string');
      console.info('[styledStringApi_002] END');
      done();

    });





  })
}
