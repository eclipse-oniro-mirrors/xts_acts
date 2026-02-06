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

export default function Row_VerticalAlign() {

  describe('Row_VerticalAlign', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_VerticalAlign beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/parentComponentChanged/Row_VerticalAlign',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_VerticalAlign state success " + JSON.stringify(pages));
        if (!("Row_VerticalAlign" == pages.name)) {
          console.info("get Row_VerticalAlign state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push Row_VerticalAlign page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_VerticalAlign page error " + JSON.stringify(err));
      }
      console.info("Row_VerticalAlign beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("Row_VerticalAlign after each called");
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0900
     * @tc.name testRowAlignItemsVerticalAlignTop
     * @tc.desc Set the AlignItems property of the Row component to VerticalAlign.Top
     */

    it('testRowAlignItemsVerticalAlignTop',  Level.LEVEL0, async (done: Function) => {
      console.info('testRowAlignItemsVerticalAlignTop START');
      globalThis.value.message.notify({
        name: 'alignItems', value: VerticalAlign.Top
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Row_VerticalAlign_Row');

      console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parse(strJson).$attrs));
      let Row: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Text3');

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

      expect(JSON.parse(strJson).$attrs.alignItems).assertEqual("VerticalAlign.Top");

      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Text1.top - Row.top) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Row.right).assertLarger(Text3.right);

      console.info('testRowAlignItemsVerticalAlignTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_1000
     * @tc.name testRowAlignItemsVerticalAlignBottom
     * @tc.desc Set the AlignItems property of the Row component to VerticalAlign.Bottom
     */

    it('testRowAlignItemsVerticalAlignBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('testRowAlignItemsVerticalAlignBottom START');
      globalThis.value.message.notify({
        name: 'alignItems', value: VerticalAlign.Bottom
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Row_VerticalAlign_Row');

      console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parse(strJson).$attrs));
      let Row: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_VerticalAlign_Text3');

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

      expect(JSON.parse(strJson).$attrs.alignItems).assertEqual("VerticalAlign.Bottom");

      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Text1.bottom - Row.bottom) <= 1).assertTrue();
      expect(Math.abs(Text2.bottom - Row.bottom) <= 1).assertTrue();
      expect(Math.abs(Text3.bottom - Row.bottom) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Row.right).assertLarger(Text3.right);

      console.info('testRowAlignItemsVerticalAlignBottom END');
      done();
    });
  })
}
