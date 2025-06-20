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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContent_FlexAlign_Start_Margin() {

  describe('AlignContent_FlexAlign_Start_Margin', () => {
    beforeEach(async () => {
      console.info("AlignContent_FlexAlign_Start_Margin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_FlexAlign_Start_Margin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_Start_Margin state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_Start_Margin" == pages.name)) {
          console.info("get AlignContent_FlexAlign_Start_Margin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_FlexAlign_Start_Margin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_Start_Margin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_FlexAlign_Start_Margin beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_Start_Margin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_START_0500
     * @tc.name testAlignContentStartFlexMarginSatisfy
     * @tc.desc Set the margin for the flex component.
     */

    it('testAlignContentStartFlexMarginSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentStartFlexMarginSatisfy START');
      let strJson = getInspectorByKey('AlignContentFlexStartMargin_flex');

      let Start_Margin_Column: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartMargin_Column');
      let AlignContentFlexStart_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartMargin_flex');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartMargin_flex_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartMargin_flex_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartMargin_flex_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartMargin_flex_4');

      console.log('AlignContentFlexStartMargin_flex rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStartMargin_flex_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStartMargin_flex_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStartMargin_flex_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStartMargin_flex_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top - vp2px(50)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top - vp2px(200)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left - vp2px(150)) <= 1)
        .assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");

      expect(Math.abs(AlignContentFlexStart_flex001.top - Start_Margin_Column.top - vp2px(15)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_1.top - Start_Margin_Column.top - vp2px(15)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_flex001.top - AlignContentFlexStart_2.top) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.top - AlignContentFlexStart_2.bottom) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_flex001.bottom - AlignContentFlexStart_4.bottom - vp2px(60)) <= 1)
        .assertTrue();
      console.info('testAlignContentStartFlexMarginSatisfy END');

    });
  })
}
