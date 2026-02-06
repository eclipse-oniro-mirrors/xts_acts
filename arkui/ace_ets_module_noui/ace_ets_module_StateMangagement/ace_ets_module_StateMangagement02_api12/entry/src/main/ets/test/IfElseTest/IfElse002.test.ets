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
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';

export default function IfElse002Test() {
  describe('IfElse002Test', () => {
    beforeEach(async (done: Function) => {
      console.info("IfElse002Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/IfElse/IfElse002',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IfElse002Test state pages: " + JSON.stringify(pages));
        if (!("IfElse002" == pages.name)) {
          console.info("get IfElse002Test state pages.name: " + JSON.stringify(pages.name));
          let result = router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IfElse002Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IfElse002Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    IfElse002
     * @tc.name      IfElse002Test_01
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('IfElse002Test_01', Level.LEVEL0, async (done: Function) => {
      console.info('[IfElse002Test_01] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let age_btn = await driver.findComponent(ON.id('age_btn'));
      let age_text_1 = await driver.findComponent(ON.id('age_text_1'));
      expect(await age_text_1.getText()).assertEqual('age: 15, It\'s a boy.');
      await age_btn.click();
      await age_btn.click();
      await age_btn.click();
      await age_btn.click();
      await age_btn.click();
      await CommonFunc.sleep(1000);
      let age_text_2 = await driver.findComponent(ON.id('age_text_2'));
      expect(await age_text_2.getText()).assertEqual('age: 20, It\'s a man.');

      console.info('[IfElse002Test_01] END');
      done();
    });
    /**
     * @tc.number    IfElse002Test_02
     * @tc.name      IfElse002Test_02
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('IfElse002Test_02', Level.LEVEL0, async (done: Function) => {
      console.info('[IfElse002Test_02] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let val_btn = await driver.findComponent(ON.id('val_btn'));
      let val_text_1: ESObject = JSON.parse(getInspectorByKey('val_text_1'));
      expect(val_text_1.$attrs.content).assertEqual('0');
      expect(val_text_1.$attrs.backgroundColor).assertEqual('#FF00AAAA');
      await val_btn.click();
      await val_btn.click();
      await CommonFunc.sleep(1000);
      let val_text_2: ESObject = JSON.parse(getInspectorByKey('val_text_2'));
      expect(val_text_2.$attrs.content).assertEqual('2');
      expect(val_text_2.$attrs.backgroundColor).assertEqual('#FFAAAAFF');
      await val_btn.click();
      await val_btn.click();
      await val_btn.click();
      await CommonFunc.sleep(1000);
      let val_text_3: ESObject = JSON.parse(getInspectorByKey('val_text_3'));
      expect(val_text_3.$attrs.content).assertEqual('5');
      expect(val_text_3.$attrs.backgroundColor).assertEqual('#FFFFAAAA');
      await val_btn.click();
      await val_btn.click();
      await val_btn.click();
      await val_btn.click();
      await val_btn.click();
      await CommonFunc.sleep(1000);
      let val_text_4: ESObject = JSON.parse(getInspectorByKey('val_text_4'));
      expect(val_text_4.$attrs.content).assertEqual('out of range!');
      await CommonFunc.sleep(1000);

      console.info('[IfElse002Test_02] END');
      done();
    });
  })
}