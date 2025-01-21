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

export default function AlignContent_Center_FlexP_Fixed_Visibility() {

  describe('AlignContent_Center_FlexP_Fixed_Visibility', () => {
    beforeEach(async () => {
      console.info("AlignContent_Center_FlexP_Fixed_Visibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Center/AlignContent_Center_FlexP_Fixed_Visibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);

        let pages = router.getState();
        console.info("get AlignContent_Center_FlexP_Fixed_Visibility state success " + JSON.stringify(pages));
        if (!("AlignContent_Center_FlexP_Fixed_Visibility" == pages.name)) {
          console.info("get AlignContent_Center_FlexP_Fixed_Visibility state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_Center_FlexP_Fixed_Visibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_Center_FlexP_Fixed_Visibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      console.info("AlignContent_Center_FlexP_Fixed_Visibility beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignContent_Center_FlexP_Fixed_Visibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_CENTER_1300
     * @tc.name testAlignContentCenterFlexfixedVisibilityHidden
     * @tc.desc The AlignContent property of the Flex component is set to FlexAlign. Center, and the visibility
     *               property of the sub component is set to Visibility.Hidden.
     */

    it('testAlignContentCenterFlexfixedVisibilityHidden', 0, async () => {
      console.info('testAlignContentCenterFlexfixedVisibilityHidden START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.Hidden
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_flex001');

      let textStrJson = getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_1');
      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      console.info('Text1 textObj.$attrs is:' + JSON.stringify(JSON.parse(textStrJson).$attrs));
      let AlignContentFlexCenter_flex001: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Center_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex001));

      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));

      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - vp2px(150)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");
      expect(JSON.parse(textStrJson).$attrs.visibility).assertEqual("Visibility.Hidden");

      expect(Math.abs((AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_3.top - AlignContentFlexCenter_flex001.top)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom) - vp2px(25)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_3.bottom) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.left - AlignContentFlexCenter_flex001.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.top - AlignContentFlexCenter_2.top) - vp2px(150)) <= 1).assertTrue();


      console.info('testAlignContentCenterFlexfixedVisibilityHidden END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_CENTER_1400
     * @tc.name testAlignContentCenterFlexfixedVisibilityNone
     * @tc.desc The AlignContent property of the Flex component is set to FlexAlign. Center, and the visibility
     *               property of the sub component is set to Visibility.None
     */

    it('testAlignContentCenterFlexfixedVisibilityNone', 0, async () => {
      console.info('testAlignContentCenterFlexfixedVisibilityNone START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.None
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_flex001');

      let textStrJson = getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_1');
      let AlignContentFlexCenter_flex002: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_flex001');

      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Center_FlexP_Fixed_Visibility_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex002))

      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));

      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - vp2px(150)) <= 1).assertTrue();


      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");
      expect(JSON.parse(textStrJson).$attrs.visibility).assertEqual("Visibility.None");

      expect(Math.abs((AlignContentFlexCenter_flex002.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_3.top - AlignContentFlexCenter_flex002.top)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.top - AlignContentFlexCenter_flex002.top) - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexCenter_2.top - AlignContentFlexCenter_3.top) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_3.top) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_2.left - AlignContentFlexCenter_flex002.left) <= 1).assertTrue();

      console.info('testAlignContentCenterFlexfixedVisibilityNone END');

    });
  })
}
