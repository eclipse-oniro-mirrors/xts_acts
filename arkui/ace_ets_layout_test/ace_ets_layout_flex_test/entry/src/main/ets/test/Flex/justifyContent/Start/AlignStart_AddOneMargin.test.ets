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
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignStart_AddOneMargin() {
  describe('AlignStart_AddOneMargin', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddOneMargin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddOneMargin state success " + JSON.stringify(pages));
        if (!("AlignStart_AddOneMargin" == pages.name)) {
          console.info("get AlignStart_AddOneMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddOneMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddOneMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddOneMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1400
     * @tc.name testFlexAlignStartTextMarginMeet
     * @tc.desc After setting margin for the first subcomponent, the layout of the parent component's spindle
     * meets the interface display of the subcomponent's layout
     */
    it('testFlexAlignStartTextMarginMeet', 0, async () => {
      console.info('[testFlexAlignStartTextMarginMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneMargin', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddOneMargin_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddOneMargin_011: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_011');
      let Start_AddOneMargin_012: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_012');
      let Start_AddOneMargin_013: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_013');
      let Start_AddOneMargin_01: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_01');
      expect(Math.abs(Start_AddOneMargin_013.top - Start_AddOneMargin_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddOneMargin_01.top - Start_AddOneMargin_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddOneMargin_013.left - Start_AddOneMargin_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_012.left - Start_AddOneMargin_011.right)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.top - Start_AddOneMargin_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.left - Start_AddOneMargin_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.right - Start_AddOneMargin_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_012.right - Start_AddOneMargin_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_013.right - Start_AddOneMargin_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.bottom - Start_AddOneMargin_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_012.bottom - Start_AddOneMargin_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_013.bottom - Start_AddOneMargin_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignStartTextMarginMeet] END');

    })
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1500
     * @tc.name testFlexAlignStartTextMarginOverflow
     * @tc.desc After setting margin for the first subcomponent, the layout of the parent component's spindle does
     * not meet the interface display of the subcomponent's layout
     */
    it('testFlexAlignStartTextMarginOverflow', 0, async () => {
      console.info('[testFlexAlignStartTextMarginOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneMargin', value: 30
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddOneMargin_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddOneMargin_011: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_011');
      let Start_AddOneMargin_012: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_012');
      let Start_AddOneMargin_013: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_013');
      let Start_AddOneMargin_01: RectValue = CommonFunc.getComponentRect('Start_AddOneMargin_01');
      expect(Math.abs(Start_AddOneMargin_012.top - Start_AddOneMargin_013.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddOneMargin_01.top - Start_AddOneMargin_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddOneMargin_013.left - Start_AddOneMargin_012.right) <= 1).assertTrue();
      expect(Math.abs(Start_AddOneMargin_013.right - Start_AddOneMargin_01.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_012.left - Start_AddOneMargin_011.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.top - Start_AddOneMargin_01.top)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.left - Start_AddOneMargin_01.left)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.right - Start_AddOneMargin_011.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_012.right - Start_AddOneMargin_012.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_013.right - Start_AddOneMargin_013.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_011.bottom - Start_AddOneMargin_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_012.bottom - Start_AddOneMargin_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddOneMargin_013.bottom - Start_AddOneMargin_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignStartTextMarginOverflow] END');

    })
  })
}
