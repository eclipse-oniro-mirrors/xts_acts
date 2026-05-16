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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function AlignContent_FlexAlign_End_Margin() {

  describe('AlignContent_FlexAlign_End_Margin', () => {
    beforeEach(async () => {
      console.info("AlignContent_FlexAlign_End_Margin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/End/AlignContent_FlexAlign_End_Margin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_End_Margin state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_End_Margin" == pages.name)) {
          console.info("get AlignContent_FlexAlign_End_Margin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_FlexAlign_End_Margin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_End_Margin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_FlexAlign_End_Margin beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_End_Margin after each called");
    });


    /**
     * @tc.name   testAlignContentEndFlexMarginSatisfy
     * @tc.number testAlignContentEndFlexMarginSatisfy
     * @tc.desc   testAlignContentEndFlexMarginSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentEndFlexMarginSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexMarginSatisfy START');
      let strJson = getInspectorByKey('AlignContentFlexEndMargin_flex');
      console.log('AlignContentFlexEndMargin_flex direction is:' + JSON.parse(strJson).$attrs.constructor.direction);
      console.log('AlignContentFlexEndMargin_flex alignContent is:' + JSON.parse(strJson).$attrs.constructor.alignContent);

      let End_Margin_Column: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndMargin_Column');
      let AlignContentFlexEnd_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndMargin_flex');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndMargin_flex_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndMargin_flex_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndMargin_flex_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndMargin_flex_4');
      let AlignContentFlexEnd_flex001_width = AlignContentFlexEnd_flex001.right - AlignContentFlexEnd_flex001.left;
      let AlignContentFlexEnd_flex001_height = AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_flex001.top;
      let AlignContentFlexEnd_1_width = AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left;
      let AlignContentFlexEnd_1_height = AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top;
      let AlignContentFlexEnd_2_width = AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left;
      let AlignContentFlexEnd_2_height = AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top;
      let AlignContentFlexEnd_3_width = AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left;
      let AlignContentFlexEnd_3_height = AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top;
      let AlignContentFlexEnd_4_width = AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left;
      let AlignContentFlexEnd_4_height = AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top;

      console.log('End_Margin_Column rect_value is:' + JSON.stringify(End_Margin_Column));
      console.log('AlignContentFlexEndMargin_flex rect_value is:' + JSON.stringify(AlignContentFlexEnd_flex001));
      console.log('AlignContentFlexEndMargin_flex_1 rect_value is:' + JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEndMargin_flex_2 rect_value is:' + JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEndMargin_flex_3 rect_value is:' + JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEndMargin_flex_4 rect_value is:' + JSON.stringify(AlignContentFlexEnd_4));

      console.log('AlignContentFlexEnd_flex001_width is:' + AlignContentFlexEnd_flex001_width);
      console.log('AlignContentFlexEnd_flex001_height is:' + AlignContentFlexEnd_flex001_height);
      console.log('AlignContentFlexEnd_1_width is:' + AlignContentFlexEnd_1_width);
      console.log('AlignContentFlexEnd_1_height is:' + AlignContentFlexEnd_1_height);
      console.log('AlignContentFlexEnd_2_width is:' + AlignContentFlexEnd_2_width);
      console.log('AlignContentFlexEnd_2_height is:' + AlignContentFlexEnd_2_height);
      console.log('AlignContentFlexEnd_3_width is:' + AlignContentFlexEnd_3_width);
      console.log('AlignContentFlexEnd_3_height is:' + AlignContentFlexEnd_3_height);
      console.log('AlignContentFlexEnd_4_width is:' + AlignContentFlexEnd_4_width);
      console.log('AlignContentFlexEnd_4_height is:' + AlignContentFlexEnd_4_height);

      expect(Math.floor(Math.abs(AlignContentFlexEnd_1_height - AlignContentFlexEnd_flex001_height*0.2)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2_height - AlignContentFlexEnd_flex001_height*0.3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_3_height - AlignContentFlexEnd_flex001_height*0.5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4_height - AlignContentFlexEnd_flex001_height*0.6)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_1_width - AlignContentFlexEnd_flex001_width*0.4)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2_width - AlignContentFlexEnd_flex001_width*0.4)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_3_width - AlignContentFlexEnd_flex001_width*0.4)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4_width - AlignContentFlexEnd_flex001_width*0.4)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");

      expect(Math.floor(Math.abs(AlignContentFlexEnd_flex001.top - End_Margin_Column.top - vp2px(5))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(End_Margin_Column.bottom - AlignContentFlexEnd_4.bottom - vp2px(5))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_2.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.top - AlignContentFlexEnd_flex001.top - AlignContentFlexEnd_flex001_height*0.1)) <= 1).assertTrue();

      console.info('testAlignContentEndFlexMarginSatisfy END');

    });
  })
}
