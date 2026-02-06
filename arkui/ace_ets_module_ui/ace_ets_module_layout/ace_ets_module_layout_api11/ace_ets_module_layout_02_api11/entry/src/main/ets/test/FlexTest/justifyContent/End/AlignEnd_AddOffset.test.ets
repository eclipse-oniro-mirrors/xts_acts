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

export default function AlignEnd_AddOffset() {
  describe('AlignEnd_AddOffset', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddOffset state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddOffset" == pages.name)) {
          console.info("get AlignEnd_AddOffset state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddOffset page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignEnd_AddOffset page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddOffset after each called");
    });

    /**
     * @tc.name   testFlexAlignEndTextOffset
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0900
     * @tc.desc   The interface display of the component that sets the offset position when drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignEndTextOffset',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndTextOffset] START');
      GlobalContext.getContext().getObject<Position>('value').message.notify({
        name: 'OneOffset', value: {
          x: 10, y: 15
        }
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddAlign_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddOffset_011: RectValue = CommonFunc.getComponentRect('End_AddOffset_011');
      let End_AddOffset_012: RectValue = CommonFunc.getComponentRect('End_AddOffset_012');
      let End_AddOffset_013: RectValue = CommonFunc.getComponentRect('End_AddOffset_013');
      let End_AddOffset_01: RectValue = CommonFunc.getComponentRect('End_AddOffset_01');
      expect(Math.abs((Math.round((End_AddOffset_011.top - End_AddOffset_01.top) * 10) / 10) - (Math.round(vp2px(15) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_011.right - End_AddOffset_012.left)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_011.left - End_AddOffset_01.left)) - (Math.round(vp2px(60)))) <= 1)
        .assertTrue();
      expect(Math.abs((End_AddOffset_012.top) - (End_AddOffset_013.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddOffset_012.top) - (End_AddOffset_01.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddOffset_013.left) - (End_AddOffset_012.right)) <= 1).assertTrue();
      expect(Math.abs((End_AddOffset_01.right) - (End_AddOffset_013.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_011.right - End_AddOffset_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_012.right - End_AddOffset_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_013.right - End_AddOffset_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_011.bottom - End_AddOffset_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_012.bottom - End_AddOffset_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddOffset_013.bottom - End_AddOffset_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndTextOffset] END');

    });
  })
}
