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

export default function AlignCenter_AddOneWidth() {
  describe('AlignCenter_AddOneWidth', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddOneWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddOneWidth state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddOneWidth" == pages.name)) {
          console.info("get AlignCenter_AddOneWidth state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddOneWidth page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddOneWidth page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_ChangeOneWidth after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1300
     * @tc.name testFlexAlignCenterTextWidth
     * @tc.desc The interface is displayed when you change the width of the first subcomponent
     */
    it('testFlexAlignCenterTextWidth',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterTextWidth] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneWidth', value: 160
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddOneWidth_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddOneWidth_011: RectValue = CommonFunc.getComponentRect('Center_AddOneWidth_011');
      let Center_AddOneWidth_012: RectValue = CommonFunc.getComponentRect('Center_AddOneWidth_012');
      let Center_AddOneWidth_013: RectValue = CommonFunc.getComponentRect('Center_AddOneWidth_013');
      let Center_AddOneWidth_01: RectValue = CommonFunc.getComponentRect('Center_AddOneWidth_01');
      expect(Math.abs(Center_AddOneWidth_011.top - Center_AddOneWidth_012.top) <= 1).assertTrue();
      expect(Math.abs(Center_AddOneWidth_013.top - Center_AddOneWidth_012.top) <= 1).assertTrue();
      expect(Math.abs(Center_AddOneWidth_011.top - Center_AddOneWidth_01.top) <= 1).assertTrue();
      expect(Math.abs(Center_AddOneWidth_011.right - Center_AddOneWidth_012.left) <= 1).assertTrue();
      expect(Math.abs(Center_AddOneWidth_012.right - Center_AddOneWidth_013.left) <= 1).assertTrue();

      expect(Math.abs(Center_AddOneWidth_011.left - Center_AddOneWidth_01.left - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_AddOneWidth_01.right - Center_AddOneWidth_013.right - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_AddOneWidth_011.right - Center_AddOneWidth_011.left - Math.round(vp2px(160))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_AddOneWidth_012.right - Center_AddOneWidth_012.left - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_AddOneWidth_013.right - Center_AddOneWidth_013.left - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_AddOneWidth_011.bottom - Center_AddOneWidth_011.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_AddOneWidth_012.bottom - Center_AddOneWidth_012.top - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_AddOneWidth_013.bottom - Center_AddOneWidth_013.top - Math.round(vp2px(150))) <= 1)
        .assertTrue();

      console.info('[testFlexAlignCenterTextWidth] END');

    });
  })
}
