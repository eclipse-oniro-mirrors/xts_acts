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
export default function AlignContent_FlexAlign_SpaceEvenly_padding() {

  describe('AlignContent_FlexAlign_SpaceEvenly_padding', function () {
    beforeEach(async function (done) {
      console.info("AlignContent_FlexAlign_SpaceEvenly_padding beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContent_FlexAlign_SpaceEvenly_padding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_SpaceEvenly_padding state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_SpaceEvenly_padding" == pages.name)) {
          console.info("get AlignContent_FlexAlign_SpaceEvenly_padding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContent_FlexAlign_SpaceEvenly_padding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_SpaceEvenly_padding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_FlexAlign_SpaceEvenly_padding beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_SpaceEvenly_padding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_0300
     * @tc.name      testAlignContentSpaceEvenlyFlexPaddingNoSatisfy
     * @tc.desc      Set the alignContent property of the flex component to FlexAlign.SpaceEvenly, and set the padding 
     *               of the flex component so that it does not meet the child component size requirements.
     */

    it('testAlignContentSpaceEvenlyFlexPaddingNoSatisfy', 0, async function (done) {
      console.info('testAlignContentSpaceEvenlyFlexPaddingNoSatisfy START');
      globalThis.value.message.notify({ name:'padding', value:40 })
      await CommonFunc.sleep(3000)

      let strJson = getInspectorByKey('AlignContentFlexSpaceEvenlyPadding_flex001');
      let obj = JSON.parse(strJson);
      let AlignContentFlexSpaceEvenly_flex001 = 
      CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001');
      let AlignContentFlexSpaceEvenly_1 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_1');
      let AlignContentFlexSpaceEvenly_2 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_2');
      let AlignContentFlexSpaceEvenly_3 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_3');
      let AlignContentFlexSpaceEvenly_4 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_4');

      console.log('AlignContentFlexSpaceEvenlyPadding_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));

      console.log('AlignContentFlexSpaceEvenlyPadding_flex001_1 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenlyPadding_flex001_2 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenlyPadding_flex001_3 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenlyPadding_flex001_4 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.abs((AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150)) <=1).assertTrue();

      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");
      
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top) - vp2px(40)) <=1).assertTrue();
      expect(AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom).assertLess(vp2px(40));
      expect(Math.abs(AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom) <=1).assertTrue();
      
      console.info('testAlignContentSpaceEvenlyFlexPaddingNoSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_0400
     * @tc.name      testAlignContentSpaceEvenlyFlexPaddingSatisfy
     * @tc.desc      Set the alignContent property of the flex component to FlexAlign.SpaceEvenly and the padding of the
     *               flex component to meet the child component sizing requirements.
     */
    it('testAlignContentSpaceEvenlyFlexPaddingSatisfy', 0, async function (done) {
      console.info('testAlignContentSpaceEvenlyFlexPaddingSatisfy START');
      globalThis.value.message.notify({ name:'padding', value:15 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexSpaceEvenlyPadding_flex001');
      let obj = JSON.parse(strJson);
      let AlignContentFlexSpaceEvenlyPadding_flex002 = 
      CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001');
      let AlignContentFlexSpaceEvenly_1 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_1');
      let AlignContentFlexSpaceEvenly_2 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_2');
      let AlignContentFlexSpaceEvenly_3 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_3');
      let AlignContentFlexSpaceEvenly_4 = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenlyPadding_flex001_4');

      console.log('AlignContentFlexSpaceEvenlyPadding_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenlyPadding_flex002))

      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.abs((AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150)) <=1).assertTrue();
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");
      
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom) - vp2px(10)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenlyPadding_flex002.top) - vp2px(25)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenlyPadding_flex002.bottom - AlignContentFlexSpaceEvenly_4.bottom) - vp2px(25)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100)) <=1).assertTrue();

      console.info('testAlignContentSpaceEvenlyFlexPaddingSatisfy END');
      done();
    });
  })
}
