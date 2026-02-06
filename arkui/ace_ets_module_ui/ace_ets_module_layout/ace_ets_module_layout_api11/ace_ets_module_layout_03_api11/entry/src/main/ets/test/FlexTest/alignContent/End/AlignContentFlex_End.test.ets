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
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContentFlex_End() {

  describe('AlignContentFlex_End', () => {
    beforeEach(async () => {
      console.info("AlignContentFlex_End beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/End/AlignContentFlex_End',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContentFlex_End state success " + JSON.stringify(pages));
        if (!("AlignContentFlex_End" == pages.name)) {
          console.info("get AlignContentFlex_End state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContentFlex_End page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlex_End page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContentFlex_End beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlex_End after each called");
    });


    /**
     * @tc.name   testAlignContentEndFlexHeightSatisfy
     * @tc.number testAlignContentEndFlexHeightSatisfy
     * @tc.desc   testAlignContentEndFlexHeightSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentEndFlexHeightSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexHeightSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 360
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEnd_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexEnd_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_4');

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

      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.bottom)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.top - AlignContentFlexEnd_flex001.top) - vp2px(60))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_2.bottom)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");

      console.info('testAlignContentEndFlexHeightSatisfy END');

    });


    /**
     * @tc.name   testAlignContentEndFlexHeightNoSatisfy
     * @tc.number testAlignContentEndFlexHeightNoSatisfy
     * @tc.desc   testAlignContentEndFlexHeightNoSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentEndFlexHeightNoSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexHeightNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 250
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEnd_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexEnd_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_4');

      console.log('AlignContentFlexEnd_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex002))

      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));

      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - vp2px(150))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(AlignContentFlexEnd_1.top - AlignContentFlexEnd_flex002.top)) <= 1).assertTrue();
      expect(AlignContentFlexEnd_4.bottom).assertLarger(AlignContentFlexEnd_flex002.bottom);
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_4.top)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");

      console.info('testAlignContentEndFlexHeightNoSatisfy END');

    });
  })
}
