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

export default function AlignCenter_AddPadding() {
  describe('AlignCenter_AddPadding', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddPadding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddPadding state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddPadding" == pages.name)) {
          console.info("get AlignCenter_AddPadding state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddPadding page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddPadding after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_0300
     * @tc.name testFlexAlignCenterFlexPadOverflow
     * @tc.desc After subtracting the padding from the parent component layout space, the interface
     * display that does not meet the spindle layout of the child component
     */
    it('testFlexAlignCenterFlexPadOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterFlexPadOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddPadding_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddPadding_011: RectValue = CommonFunc.getComponentRect('Center_AddPadding_011');
      let Center_AddPadding_012: RectValue = CommonFunc.getComponentRect('Center_AddPadding_012');
      let Center_AddPadding_013: RectValue = CommonFunc.getComponentRect('Center_AddPadding_013');
      let Center_AddPadding_01: RectValue = CommonFunc.getComponentRect('Center_AddPadding_01');
      expect(Math.abs(Center_AddPadding_011.top - Center_AddPadding_012.top) <= 1).assertTrue();
      expect(Math.abs(Center_AddPadding_012.top - Center_AddPadding_013.top) <= 1).assertTrue();
      expect(Math.abs(Center_AddPadding_012.left - Center_AddPadding_011.right) <= 1).assertTrue();
      expect(Math.abs(Center_AddPadding_013.left - Center_AddPadding_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_011.left - Center_AddPadding_01.left)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_01.right - Center_AddPadding_013.right)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_011.top - Center_AddPadding_01.top)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_011.bottom - Center_AddPadding_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_012.bottom - Center_AddPadding_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_013.bottom - Center_AddPadding_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_011.right - Center_AddPadding_011.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_012.right - Center_AddPadding_012.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_013.right - Center_AddPadding_013.left)) - (Math.round(vp2px(440 / 3)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterFlexPadOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_0400
     * @tc.name testFlexAlignCenterFlexPadMeet
     * @tc.desc After subtracting the padding from the parent component layout space, the interface that
     * satisfies the spindle layout of the child component is displayed
     */
    it('testFlexAlignCenterFlexPadMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterFlexPadMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddPadding_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddPadding_011: RectValue = CommonFunc.getComponentRect('Center_AddPadding_011');
      let Center_AddPadding_012: RectValue = CommonFunc.getComponentRect('Center_AddPadding_012');
      let Center_AddPadding_013: RectValue = CommonFunc.getComponentRect('Center_AddPadding_013');
      let Center_AddPadding_01: RectValue = CommonFunc.getComponentRect('Center_AddPadding_01');
      expect(Math.abs(Center_AddPadding_011.top - Center_AddPadding_012.top) <= 1).assertTrue();
      expect(Math.abs(Center_AddPadding_012.top - Center_AddPadding_013.top) <= 1).assertTrue();
      expect(Math.abs(Center_AddPadding_012.left - Center_AddPadding_011.right) <= 1).assertTrue();
      expect(Math.abs(Center_AddPadding_013.left - Center_AddPadding_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_011.top - Center_AddPadding_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_AddPadding_011.left - Center_AddPadding_01.left) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_AddPadding_01.right - Center_AddPadding_013.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_011.right - Center_AddPadding_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_012.right - Center_AddPadding_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_013.right - Center_AddPadding_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_011.bottom - Center_AddPadding_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_012.bottom - Center_AddPadding_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddPadding_013.bottom - Center_AddPadding_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterFlexPadMeet] END');

    });
  })
}
