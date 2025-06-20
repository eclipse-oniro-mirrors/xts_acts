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
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function column_WidthHeight_ChangeParent() {

  describe('Column_WidthHeight_ChangeParentTest',  () =>{
    beforeEach(async () => {
      console.info("Column_WidthHeight_ChangeParent beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_WidthHeight_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_WidthHeight_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_WidthHeight_ChangeParent" == pages.name)) {
          console.info("get Column_WidthHeight_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_WidthHeight_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_WidthHeight_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("Column_WidthHeight_ChangeParent afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_WIDTHHEIGHT_CHANGEPARENT_TEST_0100
     * @tc.name      testColumnWidthHeightChangeParentHeightInRange
     * @tc.desc      The parent component changes the width 350 and height 400 attributes, Other parameters default
     */
    it('testColumnWidthHeightChangeParentHeightInRange', 0, async () => {
      console.info('new testColumnWidthHeightChangeParentHeightInRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({ name: 'height', value: 400 })
      GlobalContext.getContext().getObject<number>('value').message.notify({ name: 'width', value: 350 })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnWidthHeightChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.abs((Math.round((locationText1.left - locationColumn.left) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText1.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText2.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText3.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationColumn.right - locationText1.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) - (Math.round(vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      console.info('new testColumnWidthHeightChangeParentHeightInRange END');
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_WIDTHHEIGHT_CHANGEPARENT_TEST_0200
     * @tc.name      testColumnWidthHeightChangeParentHeightOutRange
     * @tc.desc      The parent component changes the width 350 and height 300 attributes,Other parameters default
     */
    it('testColumnWidthHeightChangeParentHeightOutRange', 0, async () => {
      console.info('new testColumnWidthHeightChangeParentHeightOutRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({ name: 'height', value: 300 })
      GlobalContext.getContext().getObject<number>('value').message.notify({ name: 'width', value: 350 })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnWidthHeightChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.abs((Math.round((locationText1.left - locationColumn.left) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText1.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText2.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText3.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationColumn.right - locationText1.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationColumn.bottom)) - (Math.round(vp2px(60)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      console.info('new testColumnWidthHeightChangeParentHeightOutRange END');
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_WIDTHHEIGHT_CHANGEPARENT_TEST_0300
     * @tc.name      testColumnWidthHeightChangeParentWidthOutRange
     * @tc.desc      The parent component changes the width 200 and height 400 attributes,Other parameters default
     */
    it('testColumnWidthHeightChangeParentWidthOutRange', 0, async () => {
      console.info('new testColumnWidthHeightChangeParentWidthOutRange START');
      GlobalContext.getContext().getObject<number>('value').message.notify({ name: 'height', value: 400 })
      GlobalContext.getContext().getObject<number>('value').message.notify({ name: 'width', value: 200 })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnWidthHeightChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.abs((Math.round(locationColumn.left - locationText1.left)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.left - locationText1.left)) - (Math.round(locationText1.right - locationColumn.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.left - locationText2.left)) - (Math.round(locationText2.right - locationColumn.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.left - locationText3.left)) - (Math.round(locationText3.right - locationColumn.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationColumn.right)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) - (Math.round(vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      console.info('new testColumnWidthHeightChangeParentWidthOutRange END');
    });
  })
}