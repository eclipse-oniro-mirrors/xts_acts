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
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignSpaceEvenly_AddOffset() {
  describe('AlignSpaceEvenly_AddOffset', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddOffset state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddOffset" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddOffset state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddOffset page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddOffset page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddOffset after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0900
     * @tc.name testFlexAlignSpaceEvenlyTextOffset
     * @tc.desc The interface display of the component that sets the offset position when drawing
     */
    it('testFlexAlignSpaceEvenlyTextOffset', 0, async () => {
      console.info('[testFlexAlignSpaceEvenlyTextOffset] START');
      GlobalContext.getContext().getObject<Position>('value').message.notify({
        name: 'OneOffset', value: {
          x: 10, y: 15
        }
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddOffset_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddOffset_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOffset_011');
      let SpaceEvenly_AddOffset_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOffset_012');
      let SpaceEvenly_AddOffset_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOffset_013');
      let SpaceEvenly_AddOffset_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOffset_01');
      expect(Math.abs(SpaceEvenly_AddOffset_011.top - SpaceEvenly_AddOffset_01.top - vp2px(15)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_011.left - SpaceEvenly_AddOffset_01.left - vp2px(22.5)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_012.top - SpaceEvenly_AddOffset_013.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_012.top - SpaceEvenly_AddOffset_01.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_01.right - SpaceEvenly_AddOffset_013.right - vp2px(12.5)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_012.left - SpaceEvenly_AddOffset_011.right - vp2px(2.5)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_013.left - SpaceEvenly_AddOffset_012.right - vp2px(12.5)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_011.right - SpaceEvenly_AddOffset_011.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_012.right - SpaceEvenly_AddOffset_012.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_013.right - SpaceEvenly_AddOffset_013.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_011.bottom - SpaceEvenly_AddOffset_011.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_012.bottom - SpaceEvenly_AddOffset_012.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOffset_013.bottom - SpaceEvenly_AddOffset_013.top - vp2px(150)) <= 1).assertTrue()
      console.info('[testFlexAlignSpaceEvenlyTextOffset] END');

    });
  })
}
