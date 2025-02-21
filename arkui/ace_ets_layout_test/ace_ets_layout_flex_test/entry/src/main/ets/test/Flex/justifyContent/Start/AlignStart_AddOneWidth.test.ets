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
import router from '@system.router';
import CommonFunc from "./../../../../MainAbility/common/Common"
export default function AlignStart_AddOneWidth() {
  describe('AlignStart_AddOneWidth', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddOneWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddOneWidth state success " + JSON.stringify(pages));
        if (!("AlignStart_AddOneWidth" == pages.name)) {
          console.info("get AlignStart_AddOneWidth state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddOneWidth page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddOneWidth page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddOneWidth after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1300
     * @tc.name      testFlexAlignStartTextWidth
     * @tc.desc      The interface is displayed when you change the width of the first subcomponent
     */
    it('testFlexAlignStartTextWidth', 0, async function (done) {
      console.info('[testFlexAlignStartTextWidth] START');
      globalThis.value.message.notify({name:'OneWidth', value:160});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddOneWidth_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddOneWidth_011 = CommonFunc.getComponentRect('Start_AddOneWidth_011');
      let Start_AddOneWidth_012 = CommonFunc.getComponentRect('Start_AddOneWidth_012');
      let Start_AddOneWidth_013 = CommonFunc.getComponentRect('Start_AddOneWidth_013');
      let Start_AddOneWidth_01 = CommonFunc.getComponentRect('Start_AddOneWidth_01');
      expect(Math.abs(Start_AddOneWidth_011.top - Start_AddOneWidth_012.top) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_013.top - Start_AddOneWidth_012.top) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_011.top - Start_AddOneWidth_01.top) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_01.left - Start_AddOneWidth_011.left) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_012.left - Start_AddOneWidth_011.right) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_013.left - Start_AddOneWidth_012.right) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_011.right - Start_AddOneWidth_011.left - vp2px(160)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_012.right - Start_AddOneWidth_012.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_013.right - Start_AddOneWidth_013.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_011.bottom - Start_AddOneWidth_011.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_012.bottom - Start_AddOneWidth_012.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_013.bottom - Start_AddOneWidth_013.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddOneWidth_01.right - Start_AddOneWidth_013.right - vp2px(40)) <= 1).assertTrue()
      console.info('[testFlexAlignStartTextWidth] END');
      done();
    });
  })
}
