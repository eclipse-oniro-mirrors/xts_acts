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
import router from '@system.router';
import CommonFunc from '../../../../MainAbility/common/Common'
import { MessageManager,Callback } from '../../../../MainAbility/common/MessageManager';
export default function AlignContent_FlexAlign_SpaceEvenly_Margin() {

  describe('AlignContent_FlexAlign_SpaceEvenly_Margin', function () {
    beforeEach(async function (done) {
      console.info("AlignContent_FlexAlign_SpaceEvenly_Margin beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContent_FlexAlign_SpaceEvenly_Margin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_SpaceEvenly_Margin state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_SpaceEvenly_Margin" == pages.name)) {
          console.info("get AlignContent_FlexAlign_SpaceEvenly_Margin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContent_FlexAlign_SpaceEvenly_Margin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_SpaceEvenly_Margin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_FlexAlign_SpaceEvenly_Margin beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_SpaceEvenly_Margin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_0500
     * @tc.name      testAlignContentSpaceEvenlyFlexMarginSatisfy
     * @tc.desc      Set the alignContent property of the flex component to FlexAlign.SpaceEvenly 
     *               and the flex component to margin.
     */

    it('testAlignContentSpaceEvenlyFlexMarginSatisfy', 0, async function (done) {
      console.info('testAlignContentSpaceEvenlyFlexMarginSatisfy START');
      let strJson = getInspectorByKey('AlignContentFlexSpaceEvenlyMargin_flex');
      let obj = JSON.parse(strJson);
      let SpaceEvenly_Margin_Column = CommonFunc.getComponentRect('SpaceEvenly_Margin_Column');
      let AlignContentFlexSpaceEvenly_flex001 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyMargin_flex');
      let AlignContentFlexSpaceEvenly_1 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyMargin_flex_1');
      let AlignContentFlexSpaceEvenly_2 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyMargin_flex_2');
      let AlignContentFlexSpaceEvenly_3 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyMargin_flex_3');
      let AlignContentFlexSpaceEvenly_4 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyMargin_flex_4');

      console.log('AlignContentFlexSpaceEvenlyMargin_flex rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));

      console.log('AlignContentFlexSpaceEvenlyMargin_flex_1 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenlyMargin_flex_2 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenlyMargin_flex_3 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenlyMargin_flex_4 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.round(AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top))
      .assertEqual(Math.round(vp2px(50)));
      expect(Math.round(AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top))
      .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top))
      .assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top))
      .assertEqual(Math.round(vp2px(200)));
      expect(Math.round(AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left))
      .assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left))
      .assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left))
      .assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left))
      .assertEqual(Math.round(vp2px(150)));
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");
      
      expect(Math.round(AlignContentFlexSpaceEvenly_flex001.top - SpaceEvenly_Margin_Column.top))
      .assertEqual(Math.round(vp2px(15))) 
      expect(Math.round(AlignContentFlexSpaceEvenly_1.top - SpaceEvenly_Margin_Column.top))
      .assertEqual(Math.round(vp2px(35))) 
      
      expect(AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom)
      .assertEqual(AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top);
      
      expect(AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom)
      .assertEqual(AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top);
      
      expect(Math.round(AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom))
      .assertEqual(Math.round(vp2px(20)));
      
      console.info('testAlignContentSpaceEvenlyFlexMarginSatisfy END');
      done();
    });
  })
}
