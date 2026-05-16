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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function setCursorTest() {
  describe('setCursorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setCursorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/cursorControl/setCursor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setCursorTest state pages: " + JSON.stringify(pages));
        if (!("setCursor" == pages.name)) {
          console.info("get setCursorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setCursorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setCursorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   setCursorTest_0100
     * @tc.number setCursorTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setCursorTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('setCursorTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setCursor_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('setCursor_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setCursor_1');
      console.info("[setCursorTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[setCursorTest_0100] component obj.$attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[setCursorTest_0100] text: " + JSON.stringify(JSON.parse(strJson).$attrs.label));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('setCursor枚举值：3');
      console.info('[setCursorTest_0100] END');
      done();
    });
    /**
     * @tc.name   setCursorTest_0200
     * @tc.number setCursorTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setCursorTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('setCursorTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setCursor_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('setCursor_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setCursor_1');
      console.info("[setCursorTest_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[setCursorTest_0200] component obj.$attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[setCursorTest_0200] text: " + JSON.stringify(JSON.parse(strJson).$attrs.label));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('setCursor枚举值：0');
      console.info('[setCursorTest_0100] END');
      done();
    });
  })
}

