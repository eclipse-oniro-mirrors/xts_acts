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


export default function textArea_bottom() {
  describe('textArea_bottom', () => {
    beforeEach(async (done: Function) => {
      console.info("textArea_bottom beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi11/textArea_bottom',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea_bottom state pages: " + JSON.stringify(pages));
        if (!("textArea_bottom" == pages.name)) {
          console.info("get textArea_bottom state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textArea_bottom page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea_bottom page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textArea_bottom_001
     * @tc.number SUB_ACE_TS_COMPONENT_textArea_bottom_001
     * @tc.desc   When textArea is in the bottom, clicking on the top of the input box triggers the keyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textArea_bottom_001', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_bottom_001] START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('textArea_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('textArea_bottom_text_03');
        let column_01 = CommonFunc.getComponentRect('textArea_bottom_column_01');

        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        await driver.mouseScroll({x:360, y:800}, true, 30, 2072)
        await CommonFunc.sleep(1000);

        console.log('assert  click before position')
        let textArea_01 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y1 = textArea_01.top
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45))
        );
        await CommonFunc.sleep(1000);

        console.log('assert click after position')
        let textArea_02 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y2 = textArea_02.top

        expect(y1).assertEqual(y2);
      }

      done();
    });

    /**
     * @tc.name   textArea_bottom_002
     * @tc.number SUB_ACE_TS_COMPONENT_textArea_bottom_002
     * @tc.desc   When textArea is in the bottom, clicking on the middle of the input box triggers the keyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textArea_bottom_002', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_bottom_002] START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('textArea_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('textArea_bottom_text_03');
        let column_01 = CommonFunc.getComponentRect('textArea_bottom_column_01');

        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        await driver.mouseScroll({x:360, y:640}, true, 30, 2072)
        await CommonFunc.sleep(1000);

        let textArea_01 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');

        console.log('assert position')
        let y1 = textArea_01.bottom
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /2))
        );
        await CommonFunc.sleep(1000);
        let textArea_02 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y2 = textArea_02.bottom

        expect(y1).assertEqual(y2);
      }
      done();
    });

    /**
     * @tc.name   textArea_bottom_003
     * @tc.number SUB_ACE_TS_COMPONENT_textArea_bottom_003
     * @tc.desc   When textArea is in the bottom, clicking on the bottom of the input box triggers the keyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textArea_bottom_003', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_bottom_003] START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('textArea_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('textArea_bottom_text_03');
        let column_01 = CommonFunc.getComponentRect('textArea_bottom_column_01');

        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        await driver.mouseScroll({x:360, y:640}, true, 30, 2072)
        await CommonFunc.sleep(1000);

        let textArea_01 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        console.log('assert position')
        let y1 = textArea_01.bottom
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45 *44))
        );
        await CommonFunc.sleep(1000);
        let textArea_02 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y2 = textArea_02.bottom
        expect(y1).assertEqual(y2);
      }
      done();
    });

  })
}
