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
export default function AlignContent_FlexAlign_Center_Margin_padding() {

  describe('AlignContent_FlexAlign_Center_Margin_padding', function () {
    beforeEach(async function (done) {
    console.info("AlignContent_FlexAlign_Center_Margin_padding beforeEach start")
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/Center/AlignContent_FlexAlign_Center_Margin_padding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);

        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_Center_Margin_padding state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_Center_Margin_padding" == pages.name)) {
          console.info("get AlignContent_FlexAlign_Center_Margin_padding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContent_FlexAlign_Center_Margin_padding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_Center_Margin_padding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
    console.info("AlignContent_FlexAlign_Center_Margin_padding beforeEach end")
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)

      console.info("AlignContent_FlexAlign_Center_Margin_padding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_CENTER_0600
     * @tc.name      testAlignContentCenterFlexMargin&PaddingNOSatisfy
     * @tc.desc      The AlignContent property of the Flex component is set to FlexAlign.Center, while the margin and
     *               padding settings of the flex component do not meet the size requirements of the subcomponent.
     */

    it('testAlignContentCenterFlexMargin&PaddingNOSatisfy', 0, async function (done) {
      console.info('testAlignContentCenterFlexMargin&PaddingNOSatisfy START');
      globalThis.value.message.notify({ name:'padding', value:40 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexCenterMargin&padding_flex001');
      let obj = JSON.parse(strJson);
      let Center_Margin_Column_1 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_Column_1');
      let AlignContentFlexCenter_flex001 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001');
      let AlignContentFlexCenter_1 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_1');
      let AlignContentFlexCenter_2 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_2');
      let AlignContentFlexCenter_3 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_3');
      let AlignContentFlexCenter_4 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_4');

      console.log('AlignContentFlexCenterMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex001));
      console.log('AlignContentFlexCenterMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenterMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenterMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenterMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));

      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - vp2px(150)) <=1).assertTrue();

      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");

      expect(Math.abs((AlignContentFlexCenter_flex001.top - Center_Margin_Column_1.top) - vp2px(10)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.top - Center_Margin_Column_1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_2.bottom) <=1).assertTrue();
      expect(AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom).assertLess(vp2px(40));

      console.info('testAlignContentCenterFlexMargin&PaddingNOSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_CENTER_0700
     * @tc.name      testAlignContentCenterFlexMargin&PaddingSatisfy
     * @tc.desc      Set the AlignContent property of the Flex component to FlexAlign.Center, and set the margin and
     *               padding for the flex component to meet the size requirements of the subcomponent.
     */

    it('testAlignContentCenterFlexMargin&PaddingSatisfy', 0, async function (done) {
      console.info('testAlignContentCenterFlexMargin&PaddingSatisfy START');
      globalThis.value.message.notify({ name:'padding', value:15 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexCenterMargin&padding_flex001');
      let obj = JSON.parse(strJson);
      let Center_Margin_Column_2 = CommonFunc
      .getComponentRect('AlignContentFlexCenterMargin&padding_Column_1');
      let AlignContentFlexCenter_flex002 = CommonFunc
      .getComponentRect('AlignContentFlexCenterMargin&padding_flex001');
      let AlignContentFlexCenter_1 = CommonFunc
      .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_1');
      let AlignContentFlexCenter_2 = CommonFunc
      .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_2');
      let AlignContentFlexCenter_3 = CommonFunc
      .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_3');
      let AlignContentFlexCenter_4 = CommonFunc
      .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_4');

      console.log('AlignContentFlexCenterMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex002));
      console.log('AlignContentFlexCenterMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenterMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenterMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenterMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));

      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - vp2px(200)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - vp2px(150)) <=1).assertTrue();

      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");

      expect(Math.abs((AlignContentFlexCenter_flex002.top - Center_Margin_Column_2.top) - vp2px(10)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.top - Center_Margin_Column_2.top) - vp2px(40)) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_flex002.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex002.top)) <=1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_2.bottom) <=1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex002.top) - vp2px(30)) <=1).assertTrue();

      console.info('testAlignContentCenterFlexMargin&PaddingSatisfy END')
      done();
    });

  })
}
