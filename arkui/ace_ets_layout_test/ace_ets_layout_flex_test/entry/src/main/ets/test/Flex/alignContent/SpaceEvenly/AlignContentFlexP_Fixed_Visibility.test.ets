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
export default function AlignContentFlexP_Fixed_Visibility() {

  describe('AlignContentFlexP_Fixed_Visibility', function () {
    beforeEach(async function (done) {
      console.info("AlignContentFlexP_Fixed_Visibility beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContentFlexP_Fixed_Visibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContentFlexP_Fixed_Visibility state success " + JSON.stringify(pages));
        if (!("AlignContentFlexP_Fixed_Visibility" == pages.name)) {
          console.info("get AlignContentFlexP_Fixed_Visibility state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContentFlexP_Fixed_Visibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlexP_Fixed_Visibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContentFlexP_Fixed_Visibility beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlexP_Fixed_Visibility after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_1300
     * @tc.name      testAlignContentSpaceEvenlyFlexfixedVisibilityHidden
     * @tc.desc      Set the visibility property of the subcomponents of flex to Visibility.Hidden.
     */

    it('testAlignContentSpaceEvenlyFlexfixedVisibilityHidden', 0, async function (done) {
      console.info('testAlignContentSpaceEvenlyFlexfixedVisibilityHidden START');
      globalThis.value.message.notify({ name:'visibility', value:Visibility.Hidden })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexP_Fixed_Visibility_flex');
      let obj = JSON.parse(strJson);
      let textStrJson = getInspectorByKey('AlignContentFlexP_Fixed_Visibility_1');
      let textObj = JSON.parse(textStrJson);
      console.info('flex [getInspectorByKey] is:'+ JSON.stringify(obj));
      console.info('flex obj.$attrs.constructor is:' +  JSON.stringify(obj.$attrs.constructor));
      console.info('text1 textObj.$attrs.constructor is:' +  JSON.stringify(textObj.$attrs.constructor));
      let AlignContentFlexSpaceEvenly_flex001 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_flex');
      let AlignContentFlexSpaceEvenly_2 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_2');
      let AlignContentFlexSpaceEvenly_3 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_3');
      let AlignContentFlexSpaceEvenly_4 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_4');

      console.log('AlignContentFlexP_Fixed_Visibility_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_4));
      
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150)) <=1).assertTrue();
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");
      expect(textObj.$attrs.visibility).assertEqual("Visibility.Hidden");
      
      expect(Math.abs((AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom) - (AlignContentFlexSpaceEvenly_3.top - AlignContentFlexSpaceEvenly_flex001.top)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_3.bottom) - (AlignContentFlexSpaceEvenly_3.top - AlignContentFlexSpaceEvenly_flex001.top)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.left - AlignContentFlexSpaceEvenly_flex001.left) - vp2px(150)) <=1).assertTrue();

      console.info('testAlignContentSpaceEvenlyFlexfixedVisibilityHidden END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_1400
     * @tc.name      testAlignContentSpaceEvenlyFlexfixedVisibilityNone
     * @tc.desc      Set the visibility property of the subcomponents of flex to Visibility.None.
     */

    it('testAlignContentSpaceEvenlyFlexfixedVisibilityNone', 0, async function (done) {
      console.info('testAlignContentSpaceEvenlyFlexfixedVisibilityNone START');
      globalThis.value.message.notify({ name:'visibility', value:Visibility.None })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexP_Fixed_Visibility_flex');
      let obj = JSON.parse(strJson);
      let textStrJson = getInspectorByKey('AlignContentFlexP_Fixed_Visibility_1');
      let textObj = JSON.parse(textStrJson);
      console.info('text1 textObj.$attrs.constructor is:' +  JSON.stringify(textObj.$attrs.constructor));
      let AlignContentFlexSpaceEvenly_flex002 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_flex');
      let AlignContentFlexSpaceEvenly_2 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_2');
      let AlignContentFlexSpaceEvenly_3 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_3');
      let AlignContentFlexSpaceEvenly_4 = CommonFunc.getComponentRect('AlignContentFlexP_Fixed_Visibility_4');

      console.log('AlignContentFlexP_Fixed_Visibility_flex002 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_flex002))
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:'+
      JSON.stringify(AlignContentFlexSpaceEvenly_4));

      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexSpaceEvenly_2.top - AlignContentFlexSpaceEvenly_3.top) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_3.top) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexSpaceEvenly_2.left - AlignContentFlexSpaceEvenly_flex002.left) <=1).assertTrue();

      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.SpaceEvenly");
      expect(textObj.$attrs.visibility).assertEqual("Visibility.None");

      console.info('testAlignContentSpaceEvenlyFlexfixedVisibilityNone END');
      done();
    });
  })
}
