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

export default function AlignContentFlexJsunit() {

  describe('AlignContentFlexJsunitTest', () => {
    beforeEach(async () => {
      console.info("AlignContentFlexJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContentFlex',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContentFlex state success " + JSON.stringify(pages));
        if (!("AlignContentFlex" == pages.name)) {
          console.info("get AlignContentFlex state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContentFlex page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlex page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContentFlexJsunit beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlexJsunit after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_0100
     * @tc.name testAlignContentSpaceEvenlyFlexHeightSatisfy
     * @tc.desc Set the alignContent property of the flex component to FlexAlign.SpaceEvenly and set the height of
     *               the flex component so that it meets the subcomponent size requirements.
     */

    it('testAlignContentSpaceEvenlyFlexHeightSatisfy', 0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexHeightSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 360
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexSpaceEvenly_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexSpaceEvenly_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_4');

      console.log('AlignContentFlexSpaceEvenly_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));

      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");

      expect(Math.abs((AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom) - (AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();

      expect(Math.abs((AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom) - (AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();

      console.info('testAlignContentSpaceEvenlyFlexHeightSatisfy END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_0200
     * @tc.name testAlignContentSpaceEvenlyFlexHeightNoSatisfy
     * @tc.desc Set the alignContent property of the flex component to FlexAlign.SpaceEvenly and set the height of
     *               the flex component so that it does not meet the subcomponent size requirements.
     */

    it('testAlignContentSpaceEvenlyFlexHeightNoSatisfy', 0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexHeightNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 250
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexSpaceEvenly_flex001');

      let AlignContentFlexSpaceEvenly_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_4');

      console.log('AlignContentFlexSpaceEvenly_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex002))

      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");


      expect(Math.abs(AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex002.top) <= 1).assertTrue();
      expect(AlignContentFlexSpaceEvenly_4.bottom).assertLarger(AlignContentFlexSpaceEvenly_flex002.bottom);
      expect(Math.abs(AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_4.top) <= 1).assertTrue();
    
      console.info('testAlignContentSpaceEvenlyFlexHeightNoSatisfy END');

    });
  })
}
