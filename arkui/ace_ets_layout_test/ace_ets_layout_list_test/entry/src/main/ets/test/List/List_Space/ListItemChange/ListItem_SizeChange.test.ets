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

export default function listItem_SizeChange() {
  
  describe('ListItem_SizeChangeTest', function () {
    beforeEach(async function (done) {
      console.info("ListItem_SizeChange beforeEach called");
      let options = {
        uri: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_SizeChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ListItem_SizeChange state pages:" + JSON.stringify(pages));
        if (!("ListItem_SizeChange" == pages.name)) {
          console.info("get ListItem_SizeChange state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push ListItem_SizeChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_SizeChange page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("ListItem_SizeChange afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0100
     * @tc.name      testListItemSizeChangeHeight120Width300
     * @tc.desc      The ListItem subcomponent changes the width 300 and height 120 attributes
     */
    it('testListItemSizeChangeHeight120Width300', 0, async function (done) {
      console.info('new testListItemSizeChangeHeight120Width300 START');
      globalThis.value.message.notify({name:'height', value:120})
      globalThis.value.message.notify({name:'width', value:300})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest4');
      let locationList = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(120)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationList.bottom - locationText4.bottom)).assertEqual(Math.round(vp2px(20)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest4');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemSizeChangeHeight120Width300 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0200
     * @tc.name      testListItemSizeChangeHeight160Width300
     * @tc.desc      The ListItem subcomponent changes the width 300 and height 160 attributes
     */
    it('testListItemSizeChangeHeight160Width300', 0, async function (done) {
      console.info('new testListItemSizeChangeHeight160Width300 START');
      globalThis.value.message.notify({name:'height', value:160})
      globalThis.value.message.notify({name:'width', value:300})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest4');
      let locationList = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(160)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.bottom - locationList.bottom)).assertEqual(Math.round(vp2px(20)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      await CommonFunc.sleep(1000);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest4');
      expect(locationText4Again.bottom).assertEqual(locationList.bottom);
      console.info('new testListItemSizeChangeHeight160Width300 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0300
     * @tc.name      testListItemSizeChangeHeight100Width100
     * @tc.desc      The ListItem subcomponent changes the width 100 and height 100 attributes
     */
    it('testListItemSizeChangeHeight100Width100', 0, async function (done) {
      console.info('new testListItemSizeChangeHeight100Width100 START');
      globalThis.value.message.notify({name:'height', value:100})
      globalThis.value.message.notify({name:'width', value:100})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest4');
      let locationList = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(100)));
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
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest4');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemSizeChangeHeight100Width100 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0400
     * @tc.name      testListItemSizeChangeHeight100Width380
     * @tc.desc      The ListItem subcomponent changes the width 380 and height 100 attributes
     */
    it('testListItemSizeChangeHeight100Width380', 0, async function (done) {
      console.info('new testListItemSizeChangeHeight100Width380 START');
      globalThis.value.message.notify({name:'height', value:100})
      globalThis.value.message.notify({name:'width', value:380})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest4');
      let locationList = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(380)));
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
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest4');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemSizeChangeHeight100Width380 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_LIST_LISTITEM_SIZECHANGE_TEST_0500
     * @tc.name      testListItemSizeChangeHeight160Width380
     * @tc.desc      The ListItem subcomponent changes the width 380 and height 100 attributes
     */
    it('testListItemSizeChangeHeight160Width380', 0, async function (done) {
      console.info('new testListItemSizeChangeHeight160Width380 START');
      globalThis.value.message.notify({name:'height', value:160})
      globalThis.value.message.notify({name:'width', value:380})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ListItemSizeChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      let locationText1 = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2 = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3 = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4 = CommonFunc.getComponentRect('ListItemTest4');
      let locationList = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(380)));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(Math.round(vp2px(160)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(locationText4.right - locationText4.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(locationText4.bottom - locationText4.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.top - locationText3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(locationText4.bottom - locationList.bottom)).assertEqual(Math.round(vp2px(20)));

      expect(Math.round(locationList.right - locationList.left)).assertEqual(Math.round(vp2px(350)));
      expect(Math.round(locationList.bottom - locationList.top)).assertEqual(Math.round(vp2px(500)));
      let driver = await Driver.create();
      await driver.swipe(360, 690, 360, 30);
      await CommonFunc.sleep(1000);
      let locationText4Again = CommonFunc.getComponentRect('ListItemTest4');
      expect(locationText4Again.bottom).assertEqual(locationList.bottom);
      console.info('new testListItemSizeChangeHeight160Width380 END');
      done();
    });
  })
}