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

export default function List_divider() {

  describe('List_divider', function () {
    beforeEach(async function (done) {
      console.info("List_divider beforeEach start");
      let options = {
        uri: 'MainAbility/pages/List/List_Space/ListChange/List_divider',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_divider state pages:" + JSON.stringify(pages));
        if (!("List_divider" == pages.name)) {
          console.info("get List_divider state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push List_divider page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_divider page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_divider beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("List_divider after each called");
    });

    /**
     * @tc.number    SUB_ACE_LIST_LIST_DIVIDER_TEST_0100
     * @tc.name      testListDividerStrokeWidthToTen
     * @tc.desc      List parent component binding divider property and strokeWidth set to 10
     */
    it('testListDividerStrokeWidthToTen', 0, async function (done) {
      console.info('testListDividerStrokeWidthToTen START');
      globalThis.value.message.notify({name:'strokeWidth', value:10})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('List_divider_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let List_divider_011 = CommonFunc.getComponentRect('List_divider_011');
      let List_divider_012 = CommonFunc.getComponentRect('List_divider_012');
      let List_divider_013 = CommonFunc.getComponentRect('List_divider_013');
      let List_divider_014 = CommonFunc.getComponentRect('List_divider_014');
      let List_divider_01 = CommonFunc.getComponentRect('List_divider_01');
      expect(Math.round(List_divider_011.right - List_divider_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_divider_012.right - List_divider_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_divider_013.right - List_divider_013.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_divider_014.right - List_divider_014.left)).assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_divider_011.bottom - List_divider_011.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_divider_012.bottom - List_divider_012.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_divider_013.bottom - List_divider_013.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_divider_014.bottom - List_divider_014.top)).assertEqual(Math.round(vp2px(100)));

      expect(List_divider_011.left).assertEqual(List_divider_01.left);
      expect(List_divider_012.left).assertEqual(List_divider_01.left);
      expect(List_divider_013.left).assertEqual(List_divider_01.left);
      expect(List_divider_014.left).assertEqual(List_divider_01.left);
      expect(List_divider_011.top).assertEqual(List_divider_01.top);
      expect(Math.round(List_divider_012.top - List_divider_011.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_divider_013.top - List_divider_012.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_divider_014.top - List_divider_013.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_divider_01.bottom - List_divider_014.bottom)).assertEqual(Math.round(vp2px(40)));
      expect(Math.round(List_divider_01.bottom - List_divider_01.top)).assertEqual(Math.round(vp2px(500)));
      expect(Math.round(List_divider_01.right - List_divider_01.left)).assertEqual(Math.round(vp2px(350)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      await CommonFunc.sleep(3000);
      let List_divider_014Again = CommonFunc.getComponentRect('List_divider_014');
      expect(List_divider_014.top).assertEqual(List_divider_014Again.top);
      console.info('testListDividerStrokeWidthToTen END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LIST_DIVIDER_TEST_0200
     * @tc.name      testListDividerStrokeWidthToForty
     * @tc.desc      List parent component binding divider property and strokeWidth set to 40
     */
    it('testListDividerStrokeWidthToForty', 0, async function (done) {
      console.info('testListDividerStrokeWidthToForty START');
      globalThis.value.message.notify({name:'strokeWidth', value:40})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('List_divider_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let List_divider_011 = CommonFunc.getComponentRect('List_divider_011');
      let List_divider_012 = CommonFunc.getComponentRect('List_divider_012');
      let List_divider_013 = CommonFunc.getComponentRect('List_divider_013');
      let List_divider_014 = CommonFunc.getComponentRect('List_divider_014');
      let List_divider_01 = CommonFunc.getComponentRect('List_divider_01');
      expect(Math.round(List_divider_011.right - List_divider_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_divider_012.right - List_divider_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_divider_013.right - List_divider_013.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_divider_014.right - List_divider_014.left)).assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_divider_011.bottom - List_divider_011.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_divider_012.bottom - List_divider_012.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_divider_013.bottom - List_divider_013.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_divider_014.bottom - List_divider_014.top)).assertEqual(Math.round(vp2px(100)));

      expect(List_divider_011.left).assertEqual(List_divider_01.left);
      expect(List_divider_012.left).assertEqual(List_divider_01.left);
      expect(List_divider_013.left).assertEqual(List_divider_01.left);
      expect(List_divider_014.left).assertEqual(List_divider_01.left);
      expect(List_divider_011.top).assertEqual(List_divider_01.top);
      expect(Math.round(List_divider_014.bottom - List_divider_01.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_divider_012.top - List_divider_011.bottom)).assertEqual(Math.round(vp2px(40)));
      expect(Math.round(List_divider_013.top - List_divider_012.bottom)).assertEqual(Math.round(vp2px(40)));
      expect(Math.round(List_divider_014.top - List_divider_013.bottom)).assertEqual(Math.round(vp2px(40)));
      expect(Math.round(List_divider_01.bottom - List_divider_01.top)).assertEqual(Math.round(vp2px(500)));
      expect(Math.round(List_divider_01.right - List_divider_01.left)).assertEqual(Math.round(vp2px(350)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      await CommonFunc.sleep(3000);
      let List_divider_014Again = CommonFunc.getComponentRect('List_divider_014');
      expect(List_divider_01.bottom).assertEqual(List_divider_014Again.bottom);
      console.info('testListDividerStrokeWidthToForty END');
      done();
    });
  })
}