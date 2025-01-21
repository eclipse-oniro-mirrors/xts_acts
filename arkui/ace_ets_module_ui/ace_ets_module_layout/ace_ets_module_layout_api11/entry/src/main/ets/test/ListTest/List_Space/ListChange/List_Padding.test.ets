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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function List_Padding() {

  describe('List_Padding', () => {
    beforeEach(async (done: Function) => {
      console.info("List_Padding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_Padding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_Padding state pages:" + JSON.stringify(pages));
        if (!("List_Padding" == pages.name)) {
          console.info("get List_Padding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push List_Padding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_Padding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_Padding beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_Padding after each called");
    });

    /**
     * @tc.number SUB_ACE_LIST_LIST_PADDING_TEST_0100
     * @tc.name testListPaddingToTwenty
     * @tc.desc List parent component binding padding property and value set to 20
     */
    it('testListPaddingToTwenty', 0, async (done: Function) => {
      console.info('testListPaddingToTwenty START');
      globalThis.value.message.notify({
        name: 'addPadding', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('List_Padding_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_Padding_011: RectValue = CommonFunc.getComponentRect('List_Padding_011');
      let List_Padding_012: RectValue = CommonFunc.getComponentRect('List_Padding_012');
      let List_Padding_013: RectValue = CommonFunc.getComponentRect('List_Padding_013');
      let List_Padding_014: RectValue = CommonFunc.getComponentRect('List_Padding_014');
      let List_Padding_01: RectValue = CommonFunc.getComponentRect('List_Padding_01');
      expect(Math.round(List_Padding_011.right - List_Padding_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_Padding_012.right - List_Padding_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_Padding_013.right - List_Padding_013.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_Padding_014.right - List_Padding_014.left)).assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_Padding_011.bottom - List_Padding_011.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_Padding_012.bottom - List_Padding_012.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_Padding_013.bottom - List_Padding_013.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_Padding_014.bottom - List_Padding_014.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(List_Padding_011.left - List_Padding_01.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_012.left - List_Padding_01.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_013.left - List_Padding_01.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_014.left - List_Padding_01.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_011.top - List_Padding_01.top)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_01.bottom - List_Padding_014.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_01.right - List_Padding_011.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(List_Padding_01.right - List_Padding_012.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(List_Padding_01.right - List_Padding_013.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(List_Padding_01.right - List_Padding_014.right)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(List_Padding_012.top - List_Padding_011.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_013.top - List_Padding_012.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_Padding_014.top - List_Padding_013.bottom)).assertEqual(Math.round(vp2px(20)));
      let driver = Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let List_Padding_014Again: RectValue = CommonFunc.getComponentRect('List_Padding_014');
      expect(List_Padding_014.top).assertEqual(List_Padding_014Again.top);
      console.info('testListPaddingToTwenty END');
      done();
    });
  })
}