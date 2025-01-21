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
export default function AlignContentFlex_Start() {

  describe('AlignContentFlex_Start', function () {
    beforeEach(async function (done) {
      console.info("AlignContentFlex_Start beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/Start/AlignContentFlex_Start',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContentFlex_Start state success " + JSON.stringify(pages));
        if (!("AlignContentFlex_Start" == pages.name)) {
          console.info("get AlignContentFlex_Start state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContentFlex_Start page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlex_Start page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContentFlex_Start beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlex_Start after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_START_0100
     * @tc.name      testAlignContentStartFlexHeightSatisfy
     * @tc.desc      Change the height of the flex component so that its subcomponents do not overflow.
     */

    it('testAlignContentStartFlexHeightSatisfy', 0, async function (done) {
      console.info('testAlignContentStartFlexHeightSatisfy START');
      globalThis.value.message.notify({ name:'height', value:360 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlex_Start_flex001');
      let obj = JSON.parse(strJson);
      console.info('flex [getInspectorByKey] is:'+ JSON.stringify(obj));
      console.info('flex obj.$attrs.constructor is:' +  JSON.stringify(obj.$attrs.constructor));
      let AlignContentFlexStart_flex001 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001');
      let AlignContentFlexStart_1 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_1');
      let AlignContentFlexStart_2 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_2');
      let AlignContentFlexStart_3 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_3');
      let AlignContentFlexStart_4 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_4');

      console.log('AlignContentFlex_Start_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStart_1 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_4));
      
      expect(Math.round(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left)).assertEqual(Math.round(vp2px(150)));
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      
      expect(AlignContentFlexStart_2.top).assertEqual(AlignContentFlexStart_flex001.top);
      expect(AlignContentFlexStart_4.top).assertEqual(AlignContentFlexStart_2.bottom);
      expect(Math.round(AlignContentFlexStart_flex001.bottom - AlignContentFlexStart_4.bottom)).assertEqual(Math.round(vp2px(60)));

      console.info('testAlignContentStartFlexHeightSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_START_0200
     * @tc.name      testAlignContentStartFlexHeightNoSatisfy
     * @tc.desc      Change the height of the flex component to overflow its subcomponents
     */

    it('testAlignContentStartFlexHeightNoSatisfy', 0, async function (done) {
      console.info('testAlignContentStartFlexHeightNoSatisfy START');
      globalThis.value.message.notify({ name:'height', value:250 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlex_Start_flex001');
      let obj = JSON.parse(strJson);
      let AlignContentFlexStart_flex002 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001');
      let AlignContentFlexStart_1 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_1');
      let AlignContentFlexStart_2 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_2');
      let AlignContentFlexStart_3 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_3');
      let AlignContentFlexStart_4 = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_4');
      
      console.log('AlignContentFlexStart_flex002 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_flex002))
      console.log('AlignContentFlexStart_1 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:'+
      JSON.stringify(AlignContentFlexStart_4));
      
      expect(Math.round(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left)).assertEqual(Math.round(vp2px(150)));
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      
      expect(AlignContentFlexStart_1.top).assertEqual(AlignContentFlexStart_flex002.top);
      expect(AlignContentFlexStart_4.bottom).assertLarger(AlignContentFlexStart_flex002.bottom);
      expect(AlignContentFlexStart_2.bottom).assertEqual(AlignContentFlexStart_4.top);
      
      console.info('testAlignContentStartFlexHeightNoSatisfy END');
      done();
    });
  })
}
