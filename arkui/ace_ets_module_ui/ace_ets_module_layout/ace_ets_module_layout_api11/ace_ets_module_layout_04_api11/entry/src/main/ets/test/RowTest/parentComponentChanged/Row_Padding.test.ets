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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function Row_Padding() {

  describe('Row_Padding', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_Padding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/parentComponentChanged/Row_Padding',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Row_Padding state success " + JSON.stringify(pages));
        if (!("Row_Padding" == pages.name)) {
          console.info("get Row_Padding state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_Padding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_Padding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("Row_Padding beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("Row_Padding after each called");
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0400
     * @tc.name testRowPaddingSatisfy
     * @tc.desc Set padding for the row component. The width of the row component meets the requirements
     */

    it('testRowPaddingSatisfy',  Level.LEVEL0, async (done: Function) => {
      console.info('testRowPaddingSatisfy START');
      globalThis.value.message.notify({
        name: 'padding', value: 15
      });
      await CommonFunc.sleep(3000);
      let Row: RectValue = CommonFunc.getComponentRect('Row_Padding_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_Padding_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_Padding_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_Padding_Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));

      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(Math.round((Text1.left - Row.left) * 10) / 10)) - (Math.round(vp2px(15)))) <= 1)
        .assertTrue();

      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(Math.round((Row.right - Text3.right) * 10) / 10)) - (Math.round(vp2px(15)))) <= 1)
        .assertTrue();
      console.info('testRowPaddingSatisfy END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0500
     * @tc.name testRowPaddingNOSatisfy
     * @tc.desc Padding is configured for the row component. The width of the row component does not meet the
     *               requirements
     */

    it('testRowPaddingNOSatisfy',  Level.LEVEL0, async (done: Function) => {
      console.info('testRowPaddingNOSatisfy START');
      globalThis.value.message.notify({
        name: 'padding', value: 40
      });
      await CommonFunc.sleep(3000)
      let Row: RectValue = CommonFunc.getComponentRect('Row_Padding_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_Padding_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_Padding_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_Padding_Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(Text1.left - Row.left)) - (Math.round(vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Text3.right).assertLarger(Row.right);
      expect(Text3.top - Row.top).assertLess(vp2px(40));

      console.info('testRowPaddingNOSatisfy END');
      done();
    });


  })
}
