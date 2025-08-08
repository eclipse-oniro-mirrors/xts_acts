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

export default function AlignCenter_AddOffset() {
  describe('AlignCenter_AddOffset', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddOffset'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddOffset state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddOffset" == pages.name)) {
          console.info("get AlignCenter_AddOffset state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddOffset page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddOffset page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddOffset after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_0900
     * @tc.name testFlexAlignCenterTextOffset
     * @tc.desc the offset of fist subcomponent set to "{ x: 10, y: 15 }"
     */
    it('testFlexAlignCenterTextOffset',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterTextOffset] START');
      GlobalContext.getContext().getObject<Position>('value').message.notify({
        name: 'OneOffset', value: {
          x: 10, y: 15
        }
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddAlign_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddOffset_011: RectValue = CommonFunc.getComponentRect('Center_AddOffset_011');
      let Center_AddOffset_012: RectValue = CommonFunc.getComponentRect('Center_AddOffset_012');
      let Center_AddOffset_013: RectValue = CommonFunc.getComponentRect('Center_AddOffset_013');
      let Center_AddOffset_01: RectValue = CommonFunc.getComponentRect('Center_AddOffset_01');
      expect(Math.abs((Math.round((Center_AddOffset_011.top - Center_AddOffset_01.top) * 10) / 10) - (Math.round(vp2px(15) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_AddOffset_011.left - Center_AddOffset_01.left) * 10) / 10) - (Math.round(vp2px(35) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_AddOffset_01.right - Center_AddOffset_013.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Center_AddOffset_012.top) - (Center_AddOffset_013.top)) <= 1).assertTrue();
      expect(Math.abs((Center_AddOffset_012.top) - (Center_AddOffset_01.top)) <= 1).assertTrue();
      expect(Math.abs((Center_AddOffset_013.left) - (Center_AddOffset_012.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_011.right - Center_AddOffset_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_012.right - Center_AddOffset_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_013.right - Center_AddOffset_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_011.bottom - Center_AddOffset_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_012.bottom - Center_AddOffset_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_013.bottom - Center_AddOffset_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterTextOffset] END');

    });
  })
}
