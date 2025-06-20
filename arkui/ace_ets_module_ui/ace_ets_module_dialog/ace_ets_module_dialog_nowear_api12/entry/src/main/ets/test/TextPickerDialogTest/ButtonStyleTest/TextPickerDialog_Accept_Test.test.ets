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
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

export default function TextPickerDialog_Accept_Test() {
  describe('TextPickerDialog_Accept_Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextPickerDialog_Accept_Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextPickerDialog/ButtonStyle/Text_accept",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextPickerDialog_Accept_Test state pages:" + JSON.stringify(pages));
        if (!("Text_accept" == pages.name)) {
          console.info("get TextPickerDialog_Accept_Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextPickerDialog_Accept_Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPickerDialog_Accept_Test page error:" + err);
      }
      console.info("TextPickerDialog_Accept_Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextPickerDialog_Accept_Test after each called");
    });

    /**
     * @tc.number    TextPickerDialog_Accept_Test
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('TextPickerDialog_Accept_Test_001', Level.LEVEL3, async (done: Function) => {
      console.info('[TextPickerDialog_Accept_Test_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.text('确定'))
      await row.click();
      await CommonFunc.sleep(2000);
      let acceptButtonStyle_Text = getInspectorByKey('acceptButtonStyle_Text');
      console.info('acceptButtonStyle_Text attrs-----' + JSON.parse(acceptButtonStyle_Text).$attrs);
      expect(JSON.parse(acceptButtonStyle_Text).$attrs.content).assertEqual('acceptButtonStyle_Text');
      console.info('[TextPickerDialog_Accept_Test_001] END');
      done();
    });
  })
}
