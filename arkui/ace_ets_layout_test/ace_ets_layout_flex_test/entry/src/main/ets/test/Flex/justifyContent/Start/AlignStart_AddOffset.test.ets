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

export default function AlignStart_AddOffset() {
  describe('AlignStart_AddOffset', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddOffset'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddOffset state success " + JSON.stringify(pages));
        if (!("AlignStart_AddOffset" == pages.name)) {
          console.info("get AlignStart_AddOffset state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddOffset page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddOffset page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddOffset after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0900
     * @tc.name testFlexAlignStartTextOffset
     * @tc.desc The interface display of the component that sets the offset position when drawing
     */
    it('testFlexAlignStartTextOffset', 0, async () => {
      console.info('[testFlexAlignStartTextOffset] START');
      GlobalContext.getContext().getObject<Position>('value').message.notify({
        name: 'OneOffset', value: {
          x: 10, y: 15
        }
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddOffset_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddOffset_011: RectValue = CommonFunc.getComponentRect('Start_AddOffset_011');
      let Start_AddOffset_012: RectValue = CommonFunc.getComponentRect('Start_AddOffset_012');
      let Start_AddOffset_013: RectValue = CommonFunc.getComponentRect('Start_AddOffset_013');
      let Start_AddOffset_01: RectValue = CommonFunc.getComponentRect('Start_AddOffset_01');
      expect(Math.abs(Start_AddOffset_011.top - Start_AddOffset_01.top - vp2px(15)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_011.left - Start_AddOffset_01.left - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_012.top - Start_AddOffset_013.top) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_013.left - Start_AddOffset_012.right) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_01.right - Start_AddOffset_013.right - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_011.right - Start_AddOffset_011.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_012.right - Start_AddOffset_012.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_013.right - Start_AddOffset_013.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_011.bottom - Start_AddOffset_011.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_012.bottom - Start_AddOffset_012.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOffset_013.bottom - Start_AddOffset_013.top - vp2px(150)) <= 1).assertTrue()
      console.info('[testFlexAlignStartTextOffset] END');

    });
  })
}
