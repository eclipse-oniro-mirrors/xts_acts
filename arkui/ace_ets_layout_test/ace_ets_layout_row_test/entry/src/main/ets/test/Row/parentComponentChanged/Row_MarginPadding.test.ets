/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from '../../../MainAbility/common/Common'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
export default function Row_MarginPadding() {

  describe('Row_MarginPadding', function () {
    beforeEach(async function (done) {
      console.info("Row_MarginPadding beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Row/parentComponentChanged/Row_MarginPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Row_MarginPadding state success " + JSON.stringify(pages));
        if (!("Row_MarginPadding" == pages.name)) {
          console.info("get Row_MarginPadding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          await CommonFunc.sleep(2000);
          console.info("push Row_MarginPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_MarginPadding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("Row_MarginPadding beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("Row_MarginPadding after each called");
    });

    /**
     * @tc.number    SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0700
     * @tc.name      testRowMarginPaddingSatisfy
     * @tc.desc      When margin and padding are set for the Row component, the width of the Row component meets the 
     *               requirements
     */

    it('testRowMarginPaddingSatisfy', 0, async function (done) {
      console.info('testRowMarginPaddingSatisfy START');
      globalThis.value.message.notify({ name: 'padding', value: 15 });
      await CommonFunc.sleep(3000);
      let Column = CommonFunc.getComponentRect('Column_Row_MarginPadding');
      let Row = CommonFunc.getComponentRect('Row_MarginPadding');
      let Text1 = CommonFunc.getComponentRect('Row_MarginPadding_Text1');
      let Text2 = CommonFunc.getComponentRect('Row_MarginPadding_Text2');
      let Text3 = CommonFunc.getComponentRect('Row_MarginPadding_Text3');

      console.log('Column rect_value is:' + JSON.stringify(Column));
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

      expect(Math.abs((Math.round(Math.round((Row.left - Column.left) * 10) / 10)) - (Math.round(vp2px(5)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Row.top - Column.top) * 10) / 10)) - (Math.round(vp2px(5)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(Text1.left - Column.left)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.top - Column.top)) - (Math.round(vp2px(80)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Text1.left - Row.left) * 10) / 10)) - (Math.round(vp2px(15)))) <= 1).assertTrue();
      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Row.right - Text3.right) * 10) / 10)) - (Math.round(vp2px(15)))) <= 1).assertTrue();

      console.info('testRowMarginPaddingSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0800
     * @tc.name      testRowMarginPaddingNoSatisfy
     * @tc.desc      The width of the Row component does not meet the requirements when margin and padding are set for 
     *               the Row component
     */

    it('testRowMarginPaddingNoSatisfy', 0, async function (done) {
      console.info('testRowMarginPaddingNoSatisfy START');
      globalThis.value.message.notify({ name: 'padding', value: 40 });
      await CommonFunc.sleep(3000)
      let Column = CommonFunc.getComponentRect('Column_Row_MarginPadding');
      let Row = CommonFunc.getComponentRect('Row_MarginPadding');
      let Text1 = CommonFunc.getComponentRect('Row_MarginPadding_Text1');
      let Text2 = CommonFunc.getComponentRect('Row_MarginPadding_Text2');
      let Text3 = CommonFunc.getComponentRect('Row_MarginPadding_Text3');

      console.log('Column rect_value is:' + JSON.stringify(Column));

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

      expect(Math.abs((Math.round(Math.round((Row.left - Column.left) * 10) / 10)) - (Math.round(vp2px(5)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Row.top - Column.top) * 10) / 10)) - (Math.round(vp2px(5)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Text1.left - Column.left) * 10) / 10)) - (Math.round(vp2px(45)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Text1.top - Column.top) * 10) / 10)) - (Math.round(vp2px(80)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(Text1.left - Row.left)) - (Math.round(vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Text3.right).assertLarger(Row.right);
      expect(Text3.top - Row.top).assertLess(vp2px(40));

      console.info('testRowMarginPaddingNoSatisfy END');
      done();
    });


  })
}
