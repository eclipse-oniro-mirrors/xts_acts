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
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignCenter_AddOneMargin() {
  describe('AlignCenter_AddOneMargin', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddOneMargin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddOneMargin state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddOneMargin" == pages.name)) {
          console.info("get AlignCenter_AddOneMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddOneMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddOneMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddOneMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1400
     * @tc.name testFlexAlignCenterTextMarginMeet
     * @tc.desc After setting margin for the first subcomponent, the layout of the parent component's spindle
     * meets the interface display of the subcomponent's layout
     */
    it('testFlexAlignCenterTextMarginMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterTextMarginMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneMargin', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddOneMargin_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddOneMargin_011: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_011');
      let Center_AddOneMargin_012: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_012');
      let Center_AddOneMargin_013: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_013');
      let Center_AddOneMargin_01: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_01');
      expect(Math.floor(Math.abs(Center_AddOneMargin_012.top - Center_AddOneMargin_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddOneMargin_013.top - Center_AddOneMargin_012.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddOneMargin_013.left - Center_AddOneMargin_012.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.left - Center_AddOneMargin_01.left) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.top - Center_AddOneMargin_01.top) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_012.left - Center_AddOneMargin_011.right) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_01.right - Center_AddOneMargin_013.right) - vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.bottom - Center_AddOneMargin_011.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_012.bottom - Center_AddOneMargin_012.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_013.bottom - Center_AddOneMargin_013.top) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.right - Center_AddOneMargin_011.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_012.right - Center_AddOneMargin_012.left) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_013.right - Center_AddOneMargin_013.left) - vp2px(150))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterTextMarginMeet] END');

    })
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1500
     * @tc.name testFlexAlignCenterTextMarginOverflow
     * @tc.desc After setting margin for the first subcomponent, the layout of the parent component's spindle does
     * not meet the interface display of the subcomponent's layout
     */
    it('testFlexAlignCenterTextMarginOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterTextMarginOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneMargin', value: 30
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddOneMargin_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddOneMargin_011: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_011');
      let Center_AddOneMargin_012: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_012');
      let Center_AddOneMargin_013: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_013');
      let Center_AddOneMargin_01: RectValue = CommonFunc.getComponentRect('Center_AddOneMargin_01');
      expect(Math.floor(Math.abs(Center_AddOneMargin_01.top - Center_AddOneMargin_012.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddOneMargin_013.top - Center_AddOneMargin_012.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.left - Center_AddOneMargin_01.left) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.top - Center_AddOneMargin_01.top) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_012.left - Center_AddOneMargin_011.right) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Center_AddOneMargin_012.right - Center_AddOneMargin_013.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.bottom - Center_AddOneMargin_011.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_012.bottom - Center_AddOneMargin_012.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_013.bottom - Center_AddOneMargin_013.top) - vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_011.right - Center_AddOneMargin_011.left) - vp2px(440 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_012.right - Center_AddOneMargin_012.left) - vp2px(440 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Center_AddOneMargin_013.right - Center_AddOneMargin_013.left) - vp2px(440 / 3))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterTextMarginOverflow] END');

    })
  })
}
