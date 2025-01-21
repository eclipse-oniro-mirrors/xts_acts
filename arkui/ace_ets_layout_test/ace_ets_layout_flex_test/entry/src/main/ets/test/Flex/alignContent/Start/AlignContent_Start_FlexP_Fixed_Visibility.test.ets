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
import GlobalContext from '../../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContent_Start_FlexP_Fixed_Visibility() {

  describe('AlignContent_Start_FlexP_Fixed_Visibility', () => {
    beforeEach(async () => {
      console.info("AlignContent_Start_FlexP_Fixed_Visibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_Start_FlexP_Fixed_Visibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_Start_FlexP_Fixed_Visibility state success " + JSON.stringify(pages));
        if (!("AlignContent_Start_FlexP_Fixed_Visibility" == pages.name)) {
          console.info("get AlignContent_Start_FlexP_Fixed_Visibility state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_Start_FlexP_Fixed_Visibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_Start_FlexP_Fixed_Visibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_Start_FlexP_Fixed_Visibility beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_Start_FlexP_Fixed_Visibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_START_1300
     * @tc.name testAlignContentStartFlexfixedVisibilityHidden
     * @tc.desc Set the visibility property of the child component to Visibility.Hidden.
     */

    it('testAlignContentStartFlexfixedVisibilityHidden', 0, async () => {
      console.info('testAlignContentStartFlexfixedVisibilityHidden START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.Hidden
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_flex001');

      let textStrJson = getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_1');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexStart_flex001: RectValue =
      CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Start_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      expect(JSON.parse(textStrJson).$attrs.visibility).assertEqual("Visibility.Hidden");

      expect(Math.abs(Math.round(AlignContentFlexStart_2.top) - Math.round(AlignContentFlexStart_3.top)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_2.top) - Math.round(AlignContentFlexStart_flex001.top)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(AlignContentFlexStart_2.left - AlignContentFlexStart_flex001.left) - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_4.top - AlignContentFlexStart_flex001.top) - Math.round(vp2px(150))) <= 1)
        .assertTrue();


      console.info('testAlignContentStartFlexfixedVisibilityHidden END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_START_1400
     * @tc.name testAlignContentStartFlexfixedVisibilityNone
     * @tc.desc Set the visibility property of the child component to Visibility.None.
     */

    it('testAlignContentStartFlexfixedVisibilityNone', 0, async () => {
      console.info('testAlignContentStartFlexfixedVisibilityNone START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.None
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_flex001');

      let textStrJson = getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_1');

      let AlignContentFlexStart_flex002: RectValue =
      CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Start_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex002))
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      expect(JSON.parse(textStrJson).$attrs.visibility).assertEqual("Visibility.None");

      expect(AlignContentFlexStart_2.top).assertEqual(AlignContentFlexStart_3.top);
      expect(AlignContentFlexStart_4.top).assertEqual(AlignContentFlexStart_3.top);
      expect(AlignContentFlexStart_2.top).assertEqual(AlignContentFlexStart_flex002.top);
      expect(AlignContentFlexStart_2.left).assertEqual(AlignContentFlexStart_flex002.left);

      console.info('testAlignContentStartFlexfixedVisibilityNone END');

    });
  })
}
