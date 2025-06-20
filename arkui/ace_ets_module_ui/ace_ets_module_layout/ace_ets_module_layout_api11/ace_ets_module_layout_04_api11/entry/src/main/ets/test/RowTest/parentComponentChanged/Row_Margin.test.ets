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

export default function Row_Margin() {

  describe('Row_Margin', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_Margin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/parentComponentChanged/Row_Margin',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Row_Margin state success " + JSON.stringify(pages));
        if (!("Row_Margin" == pages.name)) {
          console.info("get Row_Margin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push Row_Margin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_Margin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("Row_Margin beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("Row_Margin after each called");
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0600
     * @tc.name testParentComponentChangedRowMargin
     * @tc.desc Setting the Margin for the Row component
     */

    it('testParentComponentChangedRowMargin',  Level.LEVEL0, async (done: Function) => {
      console.info('testParentComponentChangedRowMargin START');
      globalThis.value.message.notify({
        name: 'margin', value: 5
      });
      await CommonFunc.sleep(3000);
      let Column: RectValue = CommonFunc.getComponentRect('Column_Row_Margin');
      let Row: RectValue = CommonFunc.getComponentRect('Row_Margin_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_Margin_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_Margin_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_Margin_Text3');

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

      expect(Math.abs((Math.round(Math.round((Row.left - Column.left) * 10) / 10)) - (Math.round(vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Math.round((Row.top - Column.top) * 10) / 10)) - (Math.round(vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Math.round((Text1.left - Column.left) * 10) / 10)) - (Math.round(vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Text1.top - Column.top)) - (Math.round(vp2px(80)))) <= 1).assertTrue();
      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Row.right).assertLarger(Text3.right);

      console.info('testParentComponentChangedRowMargin END');
      done();
    });

  })
}
