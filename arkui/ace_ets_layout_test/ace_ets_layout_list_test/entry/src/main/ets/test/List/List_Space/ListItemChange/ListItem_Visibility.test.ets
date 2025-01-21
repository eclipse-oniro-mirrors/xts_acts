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

export default function listItem_Visibility() {
  
  describe('ListItem_VisibilityTest', function () {
    beforeEach(async function (done) {
      console.info("ListItem_Visibility beforeEach called");
      let options = {
        uri: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_Visibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ListItem_Visibility state pages:" + JSON.stringify(pages));
        if (!("ListItem_Visibility" == pages.name)) {
          console.info("get ListItem_Visibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push ListItem_Visibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_Visibility page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("ListItem_Visibility afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_VISIBILITY_TEST_0100
     * @tc.name      testListItemVisibilityFirstNone
     * @tc.desc      ListItem subcomponent binding Visibility property,first None
     */
    it('testListItemVisibilityFirstNone', 0, async function (done) {
      console.info('new testListItemVisibilityFirstNone START');
      globalThis.value.message.notify({name:'testVisibilityFirst', value:Visibility.None})
      globalThis.value.message.notify({name:'testVisibilitySecond', value:Visibility.Visible})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemVisibility1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let strJson2 = getInspectorByKey('ListItemTest41');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest44');
      let locationList = CommonFunc.getComponentRect('ListItemVisibility1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);
      expect(locationText1.left).assertEqual(locationText1.right);
      expect(locationText1.top).assertEqual(locationText1.bottom);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(120)));

      expect(Math.round(locationText1.top - locationList.top)).assertEqual(vp2px(0));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationList.bottom - locationText4.bottom)).assertEqual(Math.round(vp2px(80)));
      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemVisibilityFirstNone END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_VISIBILITY_TEST_0200
     * @tc.name      testListItemVisibilitySecondNone
     * @tc.desc      ListItem subcomponent binding Visibility property,second None
     */
    it('testListItemVisibilitySecondNone', 0, async function (done) {
      console.info('new testListItemVisibilitySecondNone START');
      globalThis.value.message.notify({name:'testVisibilityFirst', value:Visibility.Visible})
      globalThis.value.message.notify({name:'testVisibilitySecond', value:Visibility.None})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemVisibility1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let strJson2 = getInspectorByKey('ListItemTest42');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest44');
      let locationList = CommonFunc.getComponentRect('ListItemVisibility1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);
      expect(locationText2.left).assertEqual(locationText2.right);
      expect(locationText2.top).assertEqual(locationText2.bottom);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(120)));

      expect(Math.round(locationText1.top - locationList.top)).assertEqual(Math.round(vp2px(0)));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationList.bottom - locationText4.bottom)).assertEqual(Math.round(vp2px(80)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemVisibilitySecondNone END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_VISIBILITY_TEST_0300
     * @tc.name      testListItemVisibilityFirstHidden
     * @tc.desc      ListItem subcomponent binding Visibility property,first Hidden
     */
    it('testListItemVisibilityFirstHidden', 0, async function (done) {
      console.info('new testListItemVisibilityFirstHidden START');
      globalThis.value.message.notify({name:'testVisibilityFirst', value:Visibility.Hidden})
      globalThis.value.message.notify({name:'testVisibilitySecond', value:Visibility.Visible})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemVisibility1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let strJson2 = getInspectorByKey('ListItemTest41');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.Hidden');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest44');
      let locationList = CommonFunc.getComponentRect('ListItemVisibility1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(120)));

      expect(Math.round(locationText2.top - locationList.top)).assertEqual(Math.round(vp2px(140)));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.bottom - locationList.bottom)).assertEqual(Math.round(vp2px(40)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      await CommonFunc.sleep(1000);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4Again.bottom).assertEqual(locationList.bottom);
      await driver.swipe(360, 150, 360, 690);
      await CommonFunc.sleep(2000);
      console.info('new testListItemVisibilityFirstHidden END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_VISIBILITY_TEST_0400
     * @tc.name      testListItemVisibilityFirstVisibile
     * @tc.desc      ListItem subcomponent binding Visibility property,first Visible
     */
    it('testListItemVisibilityFirstVisibile', 0, async function (done) {
      console.info('new testListItemVisibilityFirstVisibile START');
      globalThis.value.message.notify({name:'testVisibilityFirst', value:Visibility.Visible})
      globalThis.value.message.notify({name:'testVisibilitySecond', value:Visibility.Visible})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemVisibility1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let strJson2 = getInspectorByKey('ListItemTest41');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.Visible');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest44');
      let locationList = CommonFunc.getComponentRect('ListItemVisibility1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(120)));

      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.bottom - locationList.bottom)).assertEqual(Math.round(vp2px(40)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      await CommonFunc.sleep(1000);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4Again.bottom).assertEqual(locationList.bottom);
      await driver.swipe(360, 150, 360, 690);
      await CommonFunc.sleep(1000);
      console.info('new testListItemVisibilityFirstVisibile END');
      done();
    });
  })
}