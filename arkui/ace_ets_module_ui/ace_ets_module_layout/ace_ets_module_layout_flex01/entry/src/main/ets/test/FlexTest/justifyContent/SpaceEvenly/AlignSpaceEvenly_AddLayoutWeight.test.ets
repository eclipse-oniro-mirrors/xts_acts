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

export default function AlignSpaceEvenly_AddLayoutWeight() {
  describe('AlignSpaceEvenly_AddLayoutWeight', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddLayoutWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddLayoutWeight state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddLayoutWeight" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddLayoutWeight state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddLayoutWeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddLayoutWeight page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddLayoutWeight after each called");
    });

    /**
     * @tc.name   testFlexAlignSpaceEvenlyLayoutWeight01
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1200
     * @tc.desc   The interface displays all subcomponents that set different layoutWeight properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignSpaceEvenlyLayoutWeight01',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignSpaceEvenlyLayoutWeight01] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight2', value: 2
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight3', value: 2
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddLayoutWeight_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddLayoutWeight_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_011');
      let SpaceEvenly_AddLayoutWeight_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_012');
      let SpaceEvenly_AddLayoutWeight_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_013');
      let SpaceEvenly_AddLayoutWeight_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_01');
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.top - SpaceEvenly_AddLayoutWeight_012.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.top - SpaceEvenly_AddLayoutWeight_012.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.top - SpaceEvenly_AddLayoutWeight_01.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.right - SpaceEvenly_AddLayoutWeight_012.left) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_012.right - SpaceEvenly_AddLayoutWeight_013.left) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.left - SpaceEvenly_AddLayoutWeight_01.left) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.right - SpaceEvenly_AddLayoutWeight_01.right) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.bottom - SpaceEvenly_AddLayoutWeight_011.top - vp2px(50)) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_012.bottom - SpaceEvenly_AddLayoutWeight_012.top - vp2px(100)) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.bottom - SpaceEvenly_AddLayoutWeight_013.top - vp2px(150)) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.right - SpaceEvenly_AddLayoutWeight_011.left - vp2px(100)) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_012.right - SpaceEvenly_AddLayoutWeight_012.left - vp2px(200)) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.right - SpaceEvenly_AddLayoutWeight_013.left - vp2px(200)) <= 1)
        .assertTrue()
      console.info('[testFlexAlignSpaceEvenlyLayoutWeight01] END');

    });
    /**
     * @tc.name   testFlexAlignSpaceEvenlyLayoutWeight02
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1300
     * @tc.desc   Some subcomponents are displayed with different layoutWeight properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignSpaceEvenlyLayoutWeight02',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignSpaceEvenlyLayoutWeight02] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight2', value: 2
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'OneLayoutWeight3', value: 0
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddLayoutWeight_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddLayoutWeight_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_011');
      let SpaceEvenly_AddLayoutWeight_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_012');
      let SpaceEvenly_AddLayoutWeight_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_013');
      let SpaceEvenly_AddLayoutWeight_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddLayoutWeight_01');
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.top - SpaceEvenly_AddLayoutWeight_012.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.top - SpaceEvenly_AddLayoutWeight_012.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.top - SpaceEvenly_AddLayoutWeight_01.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.right - SpaceEvenly_AddLayoutWeight_012.left) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_012.right - SpaceEvenly_AddLayoutWeight_013.left) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.left - SpaceEvenly_AddLayoutWeight_01.left) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.right - SpaceEvenly_AddLayoutWeight_01.right) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_011.bottom - SpaceEvenly_AddLayoutWeight_011.top - vp2px(50)) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_012.bottom - SpaceEvenly_AddLayoutWeight_012.top - vp2px(100)) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.bottom - SpaceEvenly_AddLayoutWeight_013.top - vp2px(150)) <= 1)
        .assertTrue()
      let oneWidth = Math.round(SpaceEvenly_AddLayoutWeight_011.right - SpaceEvenly_AddLayoutWeight_011.left);
      let twoWidth = Math.round(SpaceEvenly_AddLayoutWeight_012.right - SpaceEvenly_AddLayoutWeight_012.left);
      expect(Math.abs(twoWidth / oneWidth - 2) <= 1).assertTrue()

      expect(Math.abs(Math.round(twoWidth + oneWidth) - Math.round(vp2px(350))) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddLayoutWeight_013.right - SpaceEvenly_AddLayoutWeight_013.left - vp2px(150)) <= 1)
        .assertTrue()
      console.info('[testFlexAlignSpaceEvenlyLayoutWeight02] END');

    });
  })
}
