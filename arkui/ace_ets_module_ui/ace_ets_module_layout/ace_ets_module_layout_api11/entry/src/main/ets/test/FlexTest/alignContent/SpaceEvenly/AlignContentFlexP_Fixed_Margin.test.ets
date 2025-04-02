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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContentFlexP_Fixed_Margin() {

  describe('AlignContentFlexP_Fixed_Margin', () => {
    beforeEach(async () => {
      console.info("AlignContentFlexP_Fixed_Margin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContentFlexP_Fixed_Margin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContentFlexP_Fixed_Margin state success " + JSON.stringify(pages));
        if (!("AlignContentFlexP_Fixed_Margin" == pages.name)) {
          console.info("get AlignContentFlexP_Fixed_Margin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContentFlexP_Fixed_Margin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlexP_Fixed_Margin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContentFlexP_Fixed_Margin beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlexP_Fixed_Margin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_1100
     * @tc.name testAlignContentSpaceEvenlyFlexFixedMarginSatisfy
     * @tc.desc Set the margin for the flex subcomponents to meet the size of flex.
     */

    it('testAlignContentSpaceEvenlyFlexFixedMarginSatisfy', 0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexFixedMarginSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 10
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexP_fixed_Margin_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexSpaceEvenly_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_4');

      console.log('AlignContentFlexP_fixed_Margin_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));

      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.abs((AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - vp2px(50)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150)) <= 1)
        .assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");

      expect(Math.abs((AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom) - (AlignContentFlexSpaceEvenly_2.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_3.bottom) - (AlignContentFlexSpaceEvenly_2.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.left - AlignContentFlexSpaceEvenly_flex001.left) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top) - (vp2px(50 / 3) + vp2px(10))) <= 1)
        .assertTrue();


      console.info('testAlignContentSpaceEvenlyFlexFixedMarginSatisfy END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_1200
     * @tc.name testAlignContentSpaceEvenlyFlexfixedMarginNOSatisfy
     * @tc.desc Set a margin for a flex subcomponent that does not fit the flex size.
     */

    it('testAlignContentSpaceEvenlyFlexfixedMarginNOSatisfy', 0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexfixedMarginNOSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 100
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexP_fixed_Margin_flex001');

      let AlignContentFlexSpaceEvenly_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Margin_flex001_4');

      console.log('AlignContentFlexSpaceEvenlyP_fixed_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex002))
      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.abs((AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - vp2px(50)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150)) <= 1)
        .assertTrue();


      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");

      expect(AlignContentFlexSpaceEvenly_4.bottom).assertLarger(AlignContentFlexSpaceEvenly_flex002.bottom);
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.top - AlignContentFlexSpaceEvenly_1.bottom) - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex002.top) - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.left - AlignContentFlexSpaceEvenly_flex002.left) - vp2px(100)) <= 1)
        .assertTrue();

      console.info('testAlignContentSpaceEvenlyFlexfixedMarginNOSatisfy END');

    });
  })
}
