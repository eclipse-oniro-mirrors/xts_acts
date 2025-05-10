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
import GlobalContext from '../../../../MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContent_Center_FlexP_fixed() {

  describe('AlignContent_Center_FlexP_fixed', () => {
    beforeEach(async () => {
      console.info("AlignContent_Center_FlexP_fixed beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Center/AlignContent_Center_FlexP_fixed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);

        let pages = router.getState();
        console.info("get AlignContent_Center_FlexP_fixed state success " + JSON.stringify(pages));
        if (!("AlignContent_Center_FlexP_fixed" == pages.name)) {
          console.info("get AlignContent_Center_FlexP_fixed state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push AlignContent_Center_FlexP_fixed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_Center_FlexP_fixed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      console.info("AlignContent_Center_FlexP_fixed beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_Center_FlexP_fixed after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_CENTER_0800
     * @tc.name testAlignContentCenterFlexfixedSatisfy
     * @tc.desc Set the AlignContent property of the Flex component to FlexAlign.Center to change the height of
     *               the subcomponent so that the flex container meets the height of the subcomponent.
     */

    it('testAlignContentCenterFlexfixedSatisfy', 0, async () => {
      console.info('testAlignContentCenterFlexfixedSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 80
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexCenterP_fixed_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexCenter_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_flex001');
      let AlignContentFlexCenter_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_1');
      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_4');

      console.log('AlignContentFlexCenter_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex001));

      console.log('AlignContentFlexCenter_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));

      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - vp2px(80)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - vp2px(150)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");

      expect(Math.abs((AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex001.top)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_3.bottom) <= 1).assertTrue();

      console.info('testAlignContentCenterFlexfixedSatisfy END');
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_CENTER_0900
     * @tc.name testAlignContentCenterFlexfixedNoSatisfy
     * @tc.desc Set the AlignContent property of the Flex component to FlexAlign.Center, change the height of the
     *               subcomponent to make the flex container less than the height of the subcomponent.
     */

    it('testAlignContentCenterFlexfixedNoSatisfy', 0, async () => {
      console.info('testAlignContentCenterFlexfixedNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 300
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexCenterP_fixed_flex001');

      let AlignContentFlexCenter_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_flex001');
      let AlignContentFlexCenter_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_1');
      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterP_fixed_4');

      console.log('AlignContentFlexCenterP_fixed_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex002))

      console.log('AlignContentFlexCenter_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));

      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - vp2px(150)) <= 1).assertTrue();


      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");

      expect(Math.abs(AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex002.top) <= 1).assertTrue();
      expect(AlignContentFlexCenter_4.bottom).assertLarger(AlignContentFlexCenter_flex002.bottom);
      expect(Math.abs(AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_4.top) <= 1).assertTrue();

      console.info('testAlignContentCenterFlexfixedNoSatisfy END');
    });
  })
}
