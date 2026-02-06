/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function textArea_center() {
  describe('textArea_center', () => {
    beforeEach(async (done: Function) => {
      console.info("textArea_center beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textArea_center',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea_center state pages: " + JSON.stringify(pages));
        if (!("textArea_center" == pages.name)) {
          console.info("get textArea_center state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textArea_center page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea_center page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_TextArea_Center_001
    * @tc.name  : testSearch
    * @tc.desc  : When textArea is in the middle, clicking on the top of the input box triggers the keyboard
    * @tc.level : Level 2
    */
    it('textArea_center_001', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_center_001] START');
      await CommonFunc.sleep(1000);

      if (globalThis.winLeft == 0) {
        console.log('get click before  Initial value')
        let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');

        console.log('assert position')
        let y1 = textArea_01.top

        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45))
        );
        await CommonFunc.sleep(1000);

        console.log('get click after Initial value')
        let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
        let y2 = textArea_02.top
        expect(y1).assertEqual(y2);

        let btn = await driver.findComponent(ON.id('textArea_center_btn'));
        await btn.click();
        await CommonFunc.sleep(1000);
      }

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_TextArea_Center_002
    * @tc.name  : testSearch
    * @tc.desc  : When textArea is in the middle, clicking on the middle of the input box triggers the keyboard
    * @tc.level : Level 2
    */
    it('textArea_center_002', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_center_002] START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        console.log('get click before  Initial value')
        let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');

        console.log('assert position')
        let y1 = textArea_01.top

        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) * 0.7))
        );
        await CommonFunc.sleep(1000);

        console.log('get click after Initial value')
        let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
        let y2 = textArea_02.top
        expect(y2).assertLess(y1);

        let btn = await driver.findComponent(ON.id('textArea_center_btn'));
        await btn.click();
        await CommonFunc.sleep(1000);
      }

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_TextArea_Center_003
    * @tc.name  : testSearch
    * @tc.desc  : When textArea is in the middle, clicking on the bottom of the input box triggers the keyboard
    * @tc.level : Level 2
    */
    it('textArea_center_003', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_center_003] START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let btn1 = await driver.findComponent(ON.id('textArea_center_btn'));
        await btn1.click();
        await CommonFunc.sleep(1000);

        console.log('get click before  Initial value')
        let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');

        console.log('assert position')
        let y5 = textArea_01.bottom

        await CommonFunc.sleep(500);
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45 *40))
        );
        await CommonFunc.sleep(1000);

        console.log('get click after Initial value')
        let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
        let y6 = textArea_02.bottom
        expect(y6).assertLess(y5);
      }

      done();
    });


  })
}
