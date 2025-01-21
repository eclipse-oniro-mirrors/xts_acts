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

export default function listItem_Padding() {
  
  describe('ListItem_PaddingTest', function () {
    beforeEach(async function (done) {
      console.info("ListItem_Padding beforeEach called");
      let options = {
        uri: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_Padding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ListItem_Padding state pages:" + JSON.stringify(pages));
        if (!("ListItem_Padding" == pages.name)) {
          console.info("get ListItem_Padding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push ListItem_Padding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_Padding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("ListItem_Padding afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_PADDING_TEST_0100
     * @tc.name      testListItemPadding
     * @tc.desc      ListItem subcomponent binding padding property
     */
    it('testListItemPadding', 0, async function (done) {
      console.info('new testListItemPadding START');
      globalThis.value.message.notify({name:'padding', value:10})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemPadding1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest21');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest22');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest23');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest24');
      let locationList = CommonFunc.getComponentRect('ListItemPadding1');
      let TextTest1 = CommonFunc.getComponentRect('PaddingText1');
      let TextTest2 = CommonFunc.getComponentRect('PaddingText2');
      let TextTest3 = CommonFunc.getComponentRect('PaddingText3');
      let TextTest4 = CommonFunc.getComponentRect('PaddingText4');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationList.bottom - locationText4.bottom)).assertEqual(Math.round(vp2px(40)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      expect(Math.round(TextTest1.left - locationText1.left)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(TextTest1.top - locationText1.top)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(locationText1.right - TextTest1.right)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(locationText1.bottom - TextTest1.bottom)).assertEqual(Math.round(vp2px(10)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest24');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemPadding END');
      done();
    });
  })
}