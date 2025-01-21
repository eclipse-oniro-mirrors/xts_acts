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
export default function AlignContentFlex_End() {

  describe('AlignContentFlex_End', function () {
    beforeEach(async function (done) {
	  console.info("AlignContentFlex_End beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/End/AlignContentFlex_End',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContentFlex_End state success " + JSON.stringify(pages));
        if (!("AlignContentFlex_End" == pages.name)) {
          console.info("get AlignContentFlex_End state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContentFlex_End page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlex_End page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
	  console.info("AlignContentFlex_End beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlex_End after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_END_0100
     * @tc.name      testAlignContentEndFlexHeightSatisfy
     * @tc.desc      Set the AlignContent property of the Flex component to FlexAlign.End to set the height of the 
     *               Flex component to meet the height requirements of the subcomponent.
     */

    it('testAlignContentEndFlexHeightSatisfy', 0, async function (done) {
      console.info('testAlignContentEndFlexHeightSatisfy START');
      globalThis.value.message.notify({ name:'height', value:360 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEnd_flex001');
      let obj = JSON.parse(strJson);
      console.info('flex [getInspectorByKey] is:'+ JSON.stringify(obj));
      console.info('flex obj.$attrs.constructor is:' +  JSON.stringify(obj.$attrs.constructor));
      let AlignContentFlexEnd_flex001 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001');
      let AlignContentFlexEnd_1 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_1');
      let AlignContentFlexEnd_2 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_2');
      let AlignContentFlexEnd_3 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_3');
      let AlignContentFlexEnd_4 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_4');

      console.log('AlignContentFlexEnd_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_flex001));
      console.log('AlignContentFlexEnd_1 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_4));

      expect(Math.abs(Math.round(AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) -Math.round(vp2px(50))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) -Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) -Math.round(vp2px(150))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) -Math.round(vp2px(200))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) -Math.round(vp2px(150))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) -Math.round(vp2px(150))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) -Math.round(vp2px(150))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) -Math.round(vp2px(150))) <=1 ).assertTrue();
      expect(AlignContentFlexEnd_flex001.bottom ).assertEqual(AlignContentFlexEnd_4.bottom);

      expect(Math.abs(Math.round(AlignContentFlexEnd_2.top - AlignContentFlexEnd_flex001.top) -Math.round(vp2px(60))) <=1 ).assertTrue();
      
      expect(AlignContentFlexEnd_4.top).assertEqual(AlignContentFlexEnd_2.bottom);
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.End");
	  
      console.info('testAlignContentEndFlexHeightSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_END_0200
     * @tc.name      testAlignContentEndFlexHeightNoSatisfy
     * @tc.desc      Set the AlignContent property of the Flex component to FlexAlign.End to set the height of the Flex
     *               component to meet the height requirements of the subcomponent.
     */

    it('testAlignContentEndFlexHeightNoSatisfy', 0, async function (done) {
      console.info('testAlignContentEndFlexHeightNoSatisfy START');
      globalThis.value.message.notify({ name:'height', value:250 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEnd_flex001');
      let obj = JSON.parse(strJson);
      console.info('flex [getInspectorByKey] is:'+ JSON.stringify(obj));
      console.info('flex obj.$attrs.constructor is:' +  JSON.stringify(obj.$attrs.constructor));
      let AlignContentFlexEnd_flex002 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001');
      let AlignContentFlexEnd_1 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_1');
      let AlignContentFlexEnd_2 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_2');
      let AlignContentFlexEnd_3 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_3');
      let AlignContentFlexEnd_4 = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_4');

      console.log('AlignContentFlexEnd_flex002 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_flex002))

      console.log('AlignContentFlexEnd_1 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_4));
      
      expect(Math.abs(Math.round(AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - Math.round(vp2px(150))) <= 1).assertTrue(); 
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - Math.round(vp2px(150))) <= 1).assertTrue(); 
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - Math.round(vp2px(150))) <= 1).assertTrue(); 
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - Math.round(vp2px(150))) <= 1).assertTrue(); 
 
   
      
      expect(AlignContentFlexEnd_1.top).assertEqual(AlignContentFlexEnd_flex002.top);
      expect(AlignContentFlexEnd_4.bottom).assertLarger(AlignContentFlexEnd_flex002.bottom);
      expect(AlignContentFlexEnd_2.bottom).assertEqual(AlignContentFlexEnd_4.top);
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.End");
	  
      console.info('testAlignContentEndFlexHeightNoSatisfy END');
      done();
    });
  })
}
