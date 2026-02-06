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
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function IfElse004Test() {
  describe('IfElse004Test', () => {
    beforeEach(async (done: Function) => {
      console.info("IfElse004Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/IfElse/IfElse004',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IfElse004Test state pages: " + JSON.stringify(pages));
        if (!("IfElse004" == pages.name)) {
          console.info("get IfElse004Test state pages.name: " + JSON.stringify(pages.name));
          let result = router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IfElse004Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IfElse004Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   IfElse004Test_01
     * @tc.number IfElse004Test_01
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IfElse004Test_01', Level.LEVEL0, async (done: Function) => {
      console.info('[IfElse004Test_01] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text_11: ESObject = JSON.parse(getInspectorByKey('text_11'));
      expect(text_11.$attrs.content).assertEqual('0');
      expect(text_11.$attrs.backgroundColor).assertEqual('#FF00AAAA');
      let btn_1 = await driver.findComponent(ON.id('btn_1'));
      
      await btn_1.click();
      await btn_1.click();
      await CommonFunc.sleep(1000);
      let text_12: ESObject = JSON.parse(getInspectorByKey('text_12'));
      expect(text_12.$attrs.content).assertEqual('2');
      expect(text_12.$attrs.backgroundColor).assertEqual('#FFAAAAFF');

      await btn_1.click();
      await btn_1.click();
      await btn_1.click();
      await CommonFunc.sleep(1000);
      let text_13: ESObject = JSON.parse(getInspectorByKey('text_13'));
      expect(text_13.$attrs.content).assertEqual('5');
      expect(text_13.$attrs.backgroundColor).assertEqual('#FFFFAAAA');

      await btn_1.click();
      await btn_1.click();
      await btn_1.click();
      await btn_1.click();
      await btn_1.click();
      await CommonFunc.sleep(1000);
      let text_14: ESObject = JSON.parse(getInspectorByKey('text_14'));
      expect(text_14.$attrs.content).assertEqual('out of range!');
      await CommonFunc.sleep(1000);

      console.info('[IfElse004Test_01] END');
      done();
    });
    /**
     * @tc.name   IfElse004Test_02
     * @tc.number IfElse004Test_02
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IfElse004Test_02', Level.LEVEL0, async (done: Function) => {
      console.info('[IfElse004Test_02] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text_21: ESObject = JSON.parse(getInspectorByKey('text_21'));
      expect(text_21.$attrs.content).assertEqual('0');
      expect(text_21.$attrs.backgroundColor).assertEqual('#FF00AAAA');
      let btn_2 = await driver.findComponent(ON.id('btn_2'));
      
      await btn_2.click();
      await btn_2.click();
      await CommonFunc.sleep(1000);
      let text_22: ESObject = JSON.parse(getInspectorByKey('text_22'));
      expect(text_22.$attrs.content).assertEqual('2');
      expect(text_22.$attrs.backgroundColor).assertEqual('#FFAAAAFF');

      await btn_2.click();
      await btn_2.click();
      await btn_2.click();
      await CommonFunc.sleep(1000);
      let text_23: ESObject = JSON.parse(getInspectorByKey('text_23'));
      expect(text_23.$attrs.content).assertEqual('5');
      expect(text_23.$attrs.backgroundColor).assertEqual('#FFFFAAAA');

      await btn_2.click();
      await btn_2.click();
      await btn_2.click();
      await btn_2.click();
      await btn_2.click();
      await CommonFunc.sleep(1000);
      let text_24: ESObject = JSON.parse(getInspectorByKey('text_24'));
      expect(text_24.$attrs.content).assertEqual('out of range!');
      await CommonFunc.sleep(1000);

      console.info('[IfElse004Test_02] END');
      done();
    });
  })
}