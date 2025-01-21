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
import CommonFunc from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection,
  WindowMode, PointerMatrix, UiDirection, MouseButton } from '@ohos.UiTest';

export default function List_Margin() {

  describe('List_Margin', function () {
    beforeEach(async function (done) {
      console.info("text beforeEach start");
      let options = {
        uri: 'MainAbility/pages/List/List_Space/ListChange/List_Margin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_Margin state pages:" + JSON.stringify(pages));
        if (!("List_Margin" == pages.name)) {
          console.info("get List_Margin state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push List_Margin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_Margin page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("List_Margin after each called");
    });

    /**
     * @tc.number    SUB_ACE_LIST_List_Margin_TEST_0100
     * @tc.name      testListMargin
     * @tc.desc      List parent component binding margin property
     */
    it('testListMargin', 0, async function (done) {
      console.info('testListMargin START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_Margin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let List_Margin_011 = CommonFunc.getComponentRect('List_Margin_011');
      let List_Margin_012 = CommonFunc.getComponentRect('List_Margin_012');
      let List_Margin_013 = CommonFunc.getComponentRect('List_Margin_013');
      let List_Margin_014 = CommonFunc.getComponentRect('List_Margin_014');
      let List_Margin_01 = CommonFunc.getComponentRect('List_Margin_01');
      let List_Margin_01_B0x = CommonFunc.getComponentRect('List_Margin_01_B0x');

      expect(Math.abs(List_Margin_011.left - List_Margin_01.left) <= 1).assertTrue();
      expect(Math.abs(List_Margin_012.left - List_Margin_01.left) <= 1).assertTrue();
      expect(Math.abs(List_Margin_013.left - List_Margin_01.left) <= 1).assertTrue();
      expect(Math.abs(List_Margin_014.left - List_Margin_01.left) <= 1).assertTrue();
      expect(Math.abs(List_Margin_011.top - List_Margin_01.top) <= 1).assertTrue();

      expect(Math.round(List_Margin_012.top - List_Margin_011.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Margin_013.top - List_Margin_012.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Margin_014.top - List_Margin_013.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Margin_01.top - List_Margin_01_B0x.top)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(List_Margin_01.left - List_Margin_01_B0x.left)).assertEqual(Math.round(vp2px(10)));

      expect(Math.round(List_Margin_011.right - List_Margin_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_Margin_012.right - List_Margin_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_Margin_013.right - List_Margin_013.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_Margin_014.right - List_Margin_014.left)).assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_Margin_011.bottom - List_Margin_011.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_Margin_012.bottom - List_Margin_012.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_Margin_013.bottom - List_Margin_013.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_Margin_014.bottom - List_Margin_014.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(List_Margin_01.bottom - List_Margin_01.top)).assertEqual(Math.round(vp2px(520)));
      expect(Math.round(List_Margin_01.right - List_Margin_01.left)).assertEqual(Math.round(vp2px(350)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let List_Margin_014Again = CommonFunc.getComponentRect('List_Margin_014');
      expect(Math.abs(List_Margin_014.top - List_Margin_014Again.top) <= 1).assertTrue();
      console.info('testListMargin END');
      done();
    });
  })
}