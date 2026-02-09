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

export default function AlignEnd_AddLayoutWeight() {
  describe('AlignEnd_AddLayoutWeight', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddLayoutWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddLayoutWeight state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddLayoutWeight" == pages.name)) {
          console.info("get AlignEnd_AddLayoutWeight state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddLayoutWeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignEnd_AddLayoutWeight page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddLayoutWeight after each called");
    });

    /**
     * @tc.name   testFlexAlignEndTextLayoutWeight01
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_1200
     * @tc.desc   The interface displays all subcomponents that set different layoutWeight properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignEndTextLayoutWeight01',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndTextLayoutWeight01] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight2', value: 2
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight3', value: 2
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddLayoutWeight_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddLayoutWeight_011: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_011');
      let End_AddLayoutWeight_012: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_012');
      let End_AddLayoutWeight_013: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_013');
      let End_AddLayoutWeight_01: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_01');
      expect(Math.abs((End_AddLayoutWeight_011.top) - (End_AddLayoutWeight_01.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_011.top) - (End_AddLayoutWeight_012.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_013.top) - (End_AddLayoutWeight_012.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_011.right) - (End_AddLayoutWeight_012.left)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_012.right) - (End_AddLayoutWeight_013.left)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_011.left) - (End_AddLayoutWeight_01.left)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_013.right) - (End_AddLayoutWeight_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddLayoutWeight_011.right - End_AddLayoutWeight_011.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddLayoutWeight_012.right - End_AddLayoutWeight_012.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddLayoutWeight_013.right - End_AddLayoutWeight_013.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddLayoutWeight_011.bottom - End_AddLayoutWeight_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddLayoutWeight_012.bottom - End_AddLayoutWeight_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddLayoutWeight_013.bottom - End_AddLayoutWeight_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndTextLayoutWeight01] END');

    });
    /**
     * @tc.name   testFlexAlignEndTextLayoutWeight02
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_1600
     * @tc.desc   Some subcomponents are displayed with different layoutWeight properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignEndTextLayoutWeight02',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndTextLayoutWeight02] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight2', value: 2
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight3', value: 0
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddLayoutWeight_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddLayoutWeight_011: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_011');
      let End_AddLayoutWeight_012: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_012');
      let End_AddLayoutWeight_013: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_013');
      let End_AddLayoutWeight_01: RectValue = CommonFunc.getComponentRect('End_AddLayoutWeight_01');
      expect(Math.abs((End_AddLayoutWeight_011.top) - (End_AddLayoutWeight_01.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_011.top) - (End_AddLayoutWeight_012.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_013.top) - (End_AddLayoutWeight_012.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_011.right) - (End_AddLayoutWeight_012.left)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_012.right) - (End_AddLayoutWeight_013.left)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_011.left) - (End_AddLayoutWeight_01.left)) <= 1).assertTrue();
      expect(Math.abs((End_AddLayoutWeight_013.right) - (End_AddLayoutWeight_01.right)) <= 1).assertTrue();
      let oneWidth = Math.round(End_AddLayoutWeight_011.right - End_AddLayoutWeight_011.left);
      let twoWidth = Math.round(End_AddLayoutWeight_012.right - End_AddLayoutWeight_012.left);
      expect(Math.abs((Math.round(twoWidth / oneWidth)) - (2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twoWidth + oneWidth) - Math.round(vp2px(350))) <= 1).assertTrue();
      expect(Math.abs(Math.round(End_AddLayoutWeight_013.right - End_AddLayoutWeight_013.left) - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(End_AddLayoutWeight_011.bottom - End_AddLayoutWeight_011.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(End_AddLayoutWeight_012.bottom - End_AddLayoutWeight_012.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(End_AddLayoutWeight_013.bottom - End_AddLayoutWeight_013.top) - Math.round(vp2px(150))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndTextLayoutWeight02] END');

    });
  })
}
