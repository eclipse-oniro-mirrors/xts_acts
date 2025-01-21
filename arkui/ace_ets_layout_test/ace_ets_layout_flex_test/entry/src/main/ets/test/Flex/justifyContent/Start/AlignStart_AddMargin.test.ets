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
export default function AlignStart_AddMargin() {
  describe('AlignStart_AddMargin', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddMargin'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddMargin state success " + JSON.stringify(pages));
        if (!("AlignStart_AddMargin" == pages.name)) {
          console.info("get AlignStart_AddMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0500
     * @tc.name      testFlexAlignStartFlexMargin
     * @tc.desc      The interface display where the child component is offset by the margin setting of the parent
     * component
     */
    it('testFlexAlignStartFlexMargin', 0, async function (done) {
      console.info('[testFlexAlignStartFlexMargin] START');
      globalThis.value.message.notify({name:'DadMargin', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddMargin_011 = CommonFunc.getComponentRect('Start_AddMargin_011');
      let Start_AddMargin_012 = CommonFunc.getComponentRect('Start_AddMargin_012');
      let Start_AddMargin_013 = CommonFunc.getComponentRect('Start_AddMargin_013');
      let Start_AddMargin_01 = CommonFunc.getComponentRect('Start_AddMargin_01');
      let Start_AddMargin_01_Box = CommonFunc.getComponentRect('Start_AddMargin_01_Box');
      expect(Math.abs(Start_AddMargin_011.top - Start_AddMargin_012.top) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_013.top - Start_AddMargin_012.top) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_011.top - Start_AddMargin_01.top) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_012.left - Start_AddMargin_011.right) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_013.left - Start_AddMargin_012.right) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_011.left - Start_AddMargin_01.left) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_01.top - Start_AddMargin_01_Box.top - vp2px(20)) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_01.left - Start_AddMargin_01_Box.left - vp2px(20)) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_011.bottom - Start_AddMargin_011.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_012.bottom - Start_AddMargin_012.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_013.bottom - Start_AddMargin_013.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_011.right - Start_AddMargin_011.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_012.right - Start_AddMargin_012.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(Start_AddMargin_013.right - Start_AddMargin_013.left - vp2px(150)) <= 1).assertTrue()
      console.info('[testFlexAlignStartFlexMargin] END');
      done();
    });
  })
}
