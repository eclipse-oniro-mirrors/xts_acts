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
export default function AlignContent_Start_FlexP_Fixed_Margin() {

  describe('AlignContent_Start_FlexP_Fixed_Margin', function () {
    beforeEach(async function (done) {
      console.info("AlignContent_Start_FlexP_Fixed_Margin beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_Start_FlexP_Fixed_Margin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_Start_FlexP_Fixed_Margin state success " + JSON.stringify(pages));
        if (!("AlignContent_Start_FlexP_Fixed_Margin" == pages.name)) {
          console.info("get AlignContent_Start_FlexP_Fixed_Margin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContent_Start_FlexP_Fixed_Margin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_Start_FlexP_Fixed_Margin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_Start_FlexP_Fixed_Margin beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_Start_FlexP_Fixed_Margin after each called");
    });
    
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_START_1100
     * @tc.name      testAlignContentStartFlexFixedMarginSatisfy
     * @tc.desc      Change the flex component's subcomponent margin so that it does not overflow the flex component.
     */

    it('testAlignContentStartFlexFixedMarginSatisfy', 0, async function (done) {
      console.info('testAlignContentStartFlexFixedMarginSatisfy START');
      globalThis.value.message.notify({ name:'margin', value:10 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContent_Start_FlexP_Fixed_Margin_flex001');
      let obj = JSON.parse(strJson);
      console.info('flex [getInspectorByKey] is:'+ JSON.stringify(obj));
      console.info('flex obj.$attrs.constructor is:' +  JSON.stringify(obj.$attrs.constructor));
      let AlignContentFlexStart_flex001 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_flex001');
      let AlignContentFlexStart_1 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_1');
      let AlignContentFlexStart_2 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_2');
      let AlignContentFlexStart_3 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_3');
      let AlignContentFlexStart_4 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_4');

      console.log('AlignContent_Start_FlexP_Fixed_Margin_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStart_1 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs((AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - vp2px(150)) <=1).assertTrue();

      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      
      expect(Math.abs((AlignContentFlexStart_1.top - AlignContentFlexStart_flex001.top) - vp2px(10)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_1.left - AlignContentFlexStart_flex001.left) - vp2px(10)) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.top - AlignContentFlexStart_flex001.top) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.left - AlignContentFlexStart_flex001.left) - vp2px(170)) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.top - AlignContentFlexStart_3.top) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.top - AlignContentFlexStart_3.bottom) <=1).assertTrue();


      console.info('testAlignContentStartFlexFixedMarginSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_START_1200
     * @tc.name      testAlignContentStartFlexFixedMarginNoSatisfy
     * @tc.desc      Change the flex component's subcomponent margin to overflow the flex component.
     */

    it('testAlignContentStartFlexFixedMarginNoSatisfy', 0, async function (done) {
      console.info('testAlignContentStartFlexFixedMarginNoSatisfy START');
      globalThis.value.message.notify({ name:'margin', value:100 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContent_Start_FlexP_Fixed_Margin_flex001');
      let obj = JSON.parse(strJson);
      let AlignContentFlexStart_flex002 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_flex001');
      let AlignContentFlexStart_1 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_1');
      let AlignContentFlexStart_2 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_2');
      let AlignContentFlexStart_3 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_3');
      let AlignContentFlexStart_4 = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_4');

      console.log('AlignContentFlexStartP_fixed_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_flex002))
      console.log('AlignContentFlexStart_1 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs((AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - vp2px(150)) <=1).assertTrue();

      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      
      expect(AlignContentFlexStart_4.bottom).assertLarger(AlignContentFlexStart_flex002.bottom);
      expect(Math.abs((AlignContentFlexStart_3.top - AlignContentFlexStart_1.bottom) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_1.top - AlignContentFlexStart_flex002.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_1.left - AlignContentFlexStart_flex002.left) - vp2px(100)) <=1).assertTrue();


      console.info('testAlignContentStartFlexFixedMarginNoSatisfy END');
      done();
    });
  })
}
