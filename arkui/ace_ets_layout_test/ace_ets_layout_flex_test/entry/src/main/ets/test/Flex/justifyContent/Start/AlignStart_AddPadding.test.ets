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

export default function AlignStart_AddPadding() {
  describe('AlignStart_AddPadding', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddPadding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddPadding state success " + JSON.stringify(pages));
        if (!("AlignStart_AddPadding" == pages.name)) {
          console.info("get AlignStart_AddPadding state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddPadding page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddPadding after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0300
     * @tc.name testFlexAlignStartFlexPadOverflow
     * @tc.desc After subtracting the padding from the parent component layout space, the interface display
     * that does not meet the spindle layout of the child component
     */
    it('testFlexAlignStartFlexPadOverflow', 0, async () => {
      console.info('[testFlexAlignStartFlexPadOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddPadding_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddPadding_011: RectValue = CommonFunc.getComponentRect('Start_AddPadding_011');
      let Start_AddPadding_012: RectValue = CommonFunc.getComponentRect('Start_AddPadding_012');
      let Start_AddPadding_013: RectValue = CommonFunc.getComponentRect('Start_AddPadding_013');
      let Start_AddPadding_01: RectValue = CommonFunc.getComponentRect('Start_AddPadding_01');
      expect(Math.abs(Start_AddPadding_011.top - Start_AddPadding_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.top - Start_AddPadding_013.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.left - Start_AddPadding_011.right) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_013.left - Start_AddPadding_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.left - Start_AddPadding_01.left)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_01.right - Start_AddPadding_013.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.top - Start_AddPadding_01.top)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.right - Start_AddPadding_011.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_012.right - Start_AddPadding_012.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.right - Start_AddPadding_013.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.bottom - Start_AddPadding_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Start_AddPadding_012.bottom - Start_AddPadding_012.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.bottom - Start_AddPadding_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignStartFlexPadOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0400
     * @tc.name testFlexAlignStartFlexPadMeet
     * @tc.desc After subtracting the padding from the parent component layout space, the interface that
     * satisfies the spindle layout of the child component is displayed
     */
    it('testFlexAlignStartFlexPadMeet', 0, async () => {
      console.info('[testFlexAlignStartFlexPadMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddPadding_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddPadding_011: RectValue = CommonFunc.getComponentRect('Start_AddPadding_011')
      let Start_AddPadding_012: RectValue = CommonFunc.getComponentRect('Start_AddPadding_012')
      let Start_AddPadding_013: RectValue = CommonFunc.getComponentRect('Start_AddPadding_013')
      let Start_AddPadding_01: RectValue = CommonFunc.getComponentRect('Start_AddPadding_01')
      expect(Math.abs(Start_AddPadding_011.top - Start_AddPadding_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.top - Start_AddPadding_013.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.left - Start_AddPadding_011.right) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_013.left - Start_AddPadding_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.left - Start_AddPadding_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_01.right - Start_AddPadding_013.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.top - Start_AddPadding_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.right - Start_AddPadding_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_012.right - Start_AddPadding_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.right - Start_AddPadding_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.bottom - Start_AddPadding_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Start_AddPadding_012.bottom - Start_AddPadding_012.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.bottom - Start_AddPadding_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignStartFlexPadMeet] END');

    });
  })
}
