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

export default function AlignContent_FlexAlign_SpaceEvenly_Margin_padding() {

  describe('AlignContent_FlexAlign_SpaceEvenly_Margin_padding', () => {
    beforeEach(async () => {
      console.info("AlignContent_FlexAlign_SpaceEvenly_Margin_padding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContent_FlexAlign_SpaceEvenly_Margin_padding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_SpaceEvenly_Margin_padding state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_SpaceEvenly_Margin_padding" == pages.name)) {
          console.info("get AlignContent_FlexAlign_SpaceEvenly_Margin_padding state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_FlexAlign_SpaceEvenly_Margin_padding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_SpaceEvenly_Margin_padding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_FlexAlign_SpaceEvenly_Margin_padding beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_SpaceEvenly_Margin_padding after each called");
    });


    /**
     * @tc.name   testAlignContentSpaceEvenlyFlexMarginAndPaddingNOSatisfy
     * @tc.number testAlignContentSpaceEvenlyFlexMarginAndPaddingNOSatisfy
     * @tc.desc   testAlignContentSpaceEvenlyFlexMarginAndPaddingNOSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentSpaceEvenlyFlexMarginAndPaddingNOSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexMarginAndPaddingNOSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 40
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexSpaceEvenlyMargin&padding_flex001');

      let SpaceEvenly_Margin_Column_1: RectValue =
      CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyMargin&paddingColumn_1');
      let AlignContentFlexSpaceEvenly_flex001: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_4');

      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_flex001.top - SpaceEvenly_Margin_Column_1.top) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_1.top - SpaceEvenly_Margin_Column_1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom)) <= 1).assertTrue();
      expect(AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom).assertLess(vp2px(40));

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");

      console.info('testAlignContentSpaceEvenlyFlexMarginAndPaddingNOSatisfy END');

    });


    /**
     * @tc.name   testAlignContentSpaceEvenlyFlexMarginAndPaddingSatisfy
     * @tc.number testAlignContentSpaceEvenlyFlexMarginAndPaddingSatisfy
     * @tc.desc   testAlignContentSpaceEvenlyFlexMarginAndPaddingSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentSpaceEvenlyFlexMarginAndPaddingSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexMarginAndPaddingSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 15
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexSpaceEvenlyMargin&padding_flex001');

      let SpaceEvenly_Margin_Column_2: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&paddingColumn_1');
      let AlignContentFlexSpaceEvenly_flex002: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexSpaceEvenlyMargin&padding_flex001_4');

      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex002));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenlyMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150))) <= 1)
        .assertTrue();


      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");

      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_flex002.top - SpaceEvenly_Margin_Column_2.top) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_1.top - SpaceEvenly_Margin_Column_2.top) - vp2px(35))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_flex002.bottom - AlignContentFlexSpaceEvenly_4.bottom) - (AlignContentFlexSpaceEvenly_2.top - AlignContentFlexSpaceEvenly_flex002.top))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex002.top) - vp2px(25))) <= 1)
        .assertTrue();

      console.info('testAlignContentSpaceEvenlyFlexMarginAndPaddingSatisfy END')

    });
  })
}
