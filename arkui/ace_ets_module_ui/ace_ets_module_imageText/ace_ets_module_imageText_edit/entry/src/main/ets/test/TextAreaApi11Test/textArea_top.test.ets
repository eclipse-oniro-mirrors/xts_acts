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


export default function textArea_top() {
  describe('textArea_top', () => {
    beforeEach(async (done: Function) => {
      console.info("textArea_top beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi11/textArea_top',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea_top state pages: " + JSON.stringify(pages));
        if (!("textArea_top" == pages.name)) {
          console.info("get textArea_top state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textArea_top page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea_top page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textArea_top_001
     * @tc.number SUB_ACE_TS_COMPONENT_TextArea_Top_001
     * @tc.desc   When textArea is at the top, clicking on the top of the input box triggers the keyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textArea_top_001', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_top_001] START');
      await CommonFunc.sleep(1000);

      if (globalThis.winLeft == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_top_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_top_text_01');
        let textArea_01 = CommonFunc.getComponentRect('textArea_top_textArea_01');
        let column_01 = CommonFunc.getComponentRect('textArea_top_column_01');

        console.log('assert position')
        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)

        let driver = await UiDriver.create();
        await driver.click(
          // vp2px(100),vp2px(10)
          Math.round((textArea_01.left + (textArea_01.right - textArea_01.left) /2)),Math.round((textArea_01.top + (textArea_01.bottom - textArea_01.top) /45))
        );
        await CommonFunc.sleep(1000);

        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)
      }

      done();
    });
    /**
     * @tc.name   textArea_top_002
     * @tc.number SUB_ACE_TS_COMPONENT_TextArea_Top_002
     * @tc.desc   When textArea is at the top, clicking on the middle of the input box triggers the keyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textArea_top_002', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_top_002] START');
      await CommonFunc.sleep(1000);

      if (globalThis.winLeft == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_top_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_top_text_01');
        let textArea_01 = CommonFunc.getComponentRect('textArea_top_textArea_01');
        let column_01 = CommonFunc.getComponentRect('textArea_top_column_01');

        console.log('assert position')
        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)

        let driver = await Driver.create();
        await driver.click(
          Math.round(vp2px(100)),Math.round(vp2px(200))
          // (textArea_01.left + (textArea_01.right - textArea_01.left) /2),(textArea_01.top + (textArea_01.bottom - textArea_01.top) /2)
        );
        await CommonFunc.sleep(1000);

        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)
      }

      done();
    });

    /**
     * @tc.name   textArea_top_003
     * @tc.number SUB_ACE_TS_COMPONENT_TextArea_Top_003
     * @tc.desc   When textArea is at the top, clicking on the bottom of the input box triggers the keyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textArea_top_003', Level.LEVEL2, async (done: Function) => {

      console.info('[textArea_top_003] START');
      await CommonFunc.sleep(1000);

      if (globalThis.winLeft == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_top_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_top_text_01');
        let textArea_01 = CommonFunc.getComponentRect('textArea_top_textArea_01');
        let column_01 = CommonFunc.getComponentRect('textArea_top_column_01');

        console.log('assert position')
        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)

        let driver = await Driver.create();
        await CommonFunc.sleep(500);
        await driver.click(
          Math.round((textArea_01.left + (textArea_01.right - textArea_01.left) /2)),Math.round((textArea_01.top + (textArea_01.bottom - textArea_01.top) /45 * 44))
        );
        await CommonFunc.sleep(1000);

        let text_02 = CommonFunc.getComponentRect('textArea_top_text_02');
      }

      done();
    });

  })
}
