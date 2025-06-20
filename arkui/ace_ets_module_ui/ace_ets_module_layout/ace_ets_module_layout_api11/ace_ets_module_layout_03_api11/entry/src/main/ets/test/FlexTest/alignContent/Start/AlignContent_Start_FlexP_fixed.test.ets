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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContent_Start_FlexP_fixed() {

  describe('AlignContent_Start_FlexP_fixed', () => {
    beforeEach(async () => {
      console.info("AlignContent_Start_FlexP_fixed beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_Start_FlexP_fixed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_Start_FlexP_fixed state success " + JSON.stringify(pages));
        if (!("AlignContent_Start_FlexP_fixed" == pages.name)) {
          console.info("get AlignContent_Start_FlexP_fixed state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_Start_FlexP_fixed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_Start_FlexP_fixed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_Start_FlexP_fixed beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_Start_FlexP_fixed after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_START_0800
     * @tc.name testAlignContentStartFlexFixedSatisfy
     * @tc.desc Change the height of the child component of the flex component to meet the height requirements of
     *               the flex component.
     */

    it('testAlignContentStartFlexFixedSatisfy', 0, async () => {
      console.info('testAlignContentStartFlexFixedSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 80
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexStartP_fixed_flex');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexStart_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_flex');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_4');

      console.log('AlignContentFlexStart_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStart_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs((AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - vp2px(80)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - vp2px(150)) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");

      expect(Math.abs(AlignContentFlexStart_flex001.top - AlignContentFlexStart_1.top) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.top - AlignContentFlexStart_3.bottom) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexStart_flex001.bottom - AlignContentFlexStart_4.bottom) - vp2px(50)) <= 1)
        .assertTrue();

      console.info('testAlignContentStartFlexFixedSatisfy END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_START_0900
     * @tc.name testAlignContentStartFlexFixedNoSatisfy
     * @tc.desc Change the height of the child component of the flex component to overflow the flex component.
     */

    it('testAlignContentStartFlexFixedNoSatisfy', 0, async () => {
      console.info('testAlignContentStartFlexFixedNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 300
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexStartP_fixed_flex');

      let AlignContentFlexStart_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_flex');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartP_fixed_4');

      console.log('AlignContentFlexStartP_fixed_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex002))
      console.log('AlignContentFlexStart_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs((AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - vp2px(300)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - vp2px(100)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - vp2px(200)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - vp2px(150)) <= 1)
        .assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");

      expect(Math.abs(AlignContentFlexStart_1.top - AlignContentFlexStart_flex002.top) <= 1).assertTrue();
      expect(AlignContentFlexStart_4.bottom).assertLarger(AlignContentFlexStart_flex002.bottom);
      expect(Math.abs(AlignContentFlexStart_1.bottom - AlignContentFlexStart_4.top) <= 1).assertTrue();

      console.info('testAlignContentStartFlexFixedNoSatisfy END');

    });
  })
}
