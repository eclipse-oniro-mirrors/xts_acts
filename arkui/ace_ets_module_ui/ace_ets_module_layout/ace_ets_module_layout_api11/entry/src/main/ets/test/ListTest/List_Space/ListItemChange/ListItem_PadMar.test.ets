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

export default function listItem_PadMar() {

  describe('ListItem_PadMarTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ListItem_PadMar beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_PadMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ListItem_PadMar state pages:" + JSON.stringify(pages));
        if (!("ListItem_PadMar" == pages.name)) {
          console.info("get ListItem_PadMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push ListItem_PadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_PadMar page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListItem_PadMar afterEach called");
    });

    /**
     * @tc.number SUB_ACE_LIST_LISTITEM_PADMAR_TEST_0100
     * @tc.name testListItemPadMar
     * @tc.desc ListItem subcomponent binding padding and margin properties
     */
    it('testListItemPadMar', 0, async (done: Function) => {
      console.info('new testListItemPadMar START');
      globalThis.value.message.notify({
        name: 'margin', value: 10
      })
      globalThis.value.message.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemPadMar1');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest31');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest32');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest33');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest34');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemPadMar1');
      let TextTest1: RectValue = CommonFunc.getComponentRect('PadMarText1');
      let TextTest2: RectValue = CommonFunc.getComponentRect('PadMarText2');
      let TextTest3: RectValue = CommonFunc.getComponentRect('PadMarText3');
      let TextTest4: RectValue = CommonFunc.getComponentRect('PadMarText4');
      expect(Math.round(locationText1.left - locationList.left)).assertEqual(Math.round(vp2px(10)));
      expect(Math.abs(locationText2.left - locationText3.left) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText4.left) <= 1).assertTrue();
      expect(Math.abs(locationText4.left - locationList.left) <= 1).assertTrue();
      expect(Math.round(locationText1.top - locationList.top)).assertEqual(Math.round(vp2px(10)));

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(30)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationList.bottom - locationText4.bottom)).assertEqual(Math.round(vp2px(20)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      expect(Math.round(TextTest1.left - locationText1.left)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(TextTest1.top - locationText1.top)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(locationText1.right - TextTest1.right)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(locationText1.bottom - TextTest1.bottom)).assertEqual(Math.round(vp2px(10)));
      let driver = Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest34');
      expect(Math.abs(locationText4.top - locationText4Again.top) <= 1).assertTrue();
      console.info('new testListItemPadMar END');
      done();
    });
  })
}