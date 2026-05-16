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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignContent_End_FlexP_fixed() {

  describe('AlignContent_End_FlexP_fixed', () => {
    beforeEach(async () => {
      console.info("AlignContent_End_FlexP_fixed beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/End/AlignContent_End_FlexP_fixed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_End_FlexP_fixed state success " + JSON.stringify(pages));
        if (!("AlignContent_End_FlexP_fixed" == pages.name)) {
          console.info("get AlignContent_End_FlexP_fixed state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_End_FlexP_fixed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_End_FlexP_fixed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_End_FlexP_fixed beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_End_FlexP_fixed after each called");
    });


    /**
     * @tc.name   testAlignContentEndFlexFixedSatisfy
     * @tc.number testAlignContentEndFlexFixedSatisfy
     * @tc.desc   testAlignContentEndFlexFixedSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentEndFlexFixedSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexFixedSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 80
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEndP_fixed_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexEnd_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_4');

      console.log('AlignContentFlexEnd_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex001));

      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));

      expect(Math.abs((AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - vp2px(80)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - vp2px(150)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");

      expect(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.bottom) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_3.bottom) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_2.top - AlignContentFlexEnd_flex001.top) - vp2px(50)) <= 1).assertTrue();

      console.info('testAlignContentEndFlexFixedSatisfy END');

    });


    /**
     * @tc.name   testAlignContentEndFlexFixedNoSatisfy
     * @tc.number testAlignContentEndFlexFixedNoSatisfy
     * @tc.desc   testAlignContentEndFlexFixedNoSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentEndFlexFixedNoSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexFixedNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 300
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEndP_fixed_flex001');

      let AlignContentFlexEnd_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_4');

      console.log('AlignContentFlexEndP_fixed_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex002))

      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));

      expect(Math.abs((AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - vp2px(150)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End")

      expect(Math.abs(AlignContentFlexEnd_1.top - AlignContentFlexEnd_flex002.top) <= 1).assertTrue();
      expect(AlignContentFlexEnd_4.bottom).assertLarger(AlignContentFlexEnd_flex002.bottom);
      expect(Math.abs(AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_4.top) <= 1).assertTrue();

      console.info('testAlignContentEndFlexFixedNoSatisfy END');

    });
  })
}
