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
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContent_FlexAlign_End_padding() {

  describe('AlignContent_FlexAlign_End_padding', () => {
    beforeEach(async () => {
      console.info("AlignContent_FlexAlign_End_padding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/End/AlignContent_FlexAlign_End_padding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_End_padding state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_End_padding" == pages.name)) {
          console.info("get AlignContent_FlexAlign_End_padding state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_FlexAlign_End_padding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_End_padding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_FlexAlign_End_padding beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_End_padding after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_END_0300
     * @tc.name testAlignContentEndFlexPaddingNoSatisfy
     * @tc.desc The AlignContent property of the Flex component is set to FlexAlign.End, and the padding setting
     *               for the Flex component does not meet the height requirements of the subcomponent.
     */

    it('testAlignContentEndFlexPaddingNoSatisfy', 0, async () => {
      console.info('testAlignContentEndFlexPaddingNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 40
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEndPadding_flex001');

      let AlignContentFlexEnd_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_4');

      console.log('AlignContentFlexEndPadding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex001));

      console.log('AlignContentFlexEndPadding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEndPadding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEndPadding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEndPadding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));

      expect(Math.abs(Math.round(AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      expect(Math.abs(Math.round(AlignContentFlexEnd_1.top - AlignContentFlexEnd_flex001.top) - Math.round(vp2px(40))) <= 1).assertTrue();
      expect(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.bottom).assertLess(vp2px(40));
      expect(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_2.bottom) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");

      console.info('testAlignContentEndFlexPaddingNoSatisfy END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_END_0400
     * @tc.name testAlignContentEndFlexPaddingSatisfy
     * @tc.desc Set the AlignContent property of the Flex component to FlexAlign.End, and set padding for the
     *               Flex component to meet the height requirements of the subcomponen.
     */

    it('testAlignContentEndFlexPaddingSatisfy', 0, async () => {
      console.info('testAlignContentEndFlexPaddingSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 15
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEndPadding_flex001');

      let AlignContentFlexEndPadding_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndPadding_flex001_4');

      console.log('AlignContentFlexEndPadding_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexEndPadding_flex002))
      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));

      expect(Math.abs(Math.round(AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.top) - Math.round(AlignContentFlexEnd_2.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((AlignContentFlexEnd_1.top - AlignContentFlexEndPadding_flex002.top) * 10) / 10 - vp2px(45)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((AlignContentFlexEndPadding_flex002.bottom - AlignContentFlexEnd_4.bottom) * 10) / 10 - vp2px(15)) <= 1)
        .assertTrue();


      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");

      console.info('testAlignContentEndFlexPaddingSatisfy END');

    });
  })
}
