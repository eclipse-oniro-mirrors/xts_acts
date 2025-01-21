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
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback, Message } from '../../../MainAbility/common/MessageManager';

export default function column_Padding_ChangeParent() {

  describe('Column_Padding_ChangeParentTest', () => {
    beforeEach(async () => {
      console.info("Column_Padding_ChangeParent beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_Padding_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_Padding_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_Padding_ChangeParent" == pages.name)) {
          console.info("get Column_Padding_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_Padding_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Padding_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Column_Padding_ChangeParent afterEach called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_PADDING_CHANGEPARENT_TEST_0100
     * @tc.name testColumnPaddingChangeParentInRange
     * @tc.desc The parent component is bound with the padding attributes. Other parameters are default,
     *               the remaining space of the parent component meets the layout of the child components
     */
    it('testColumnPaddingChangeParentInRange', 0, async () => {
      console.info('new testColumnPaddingChangeParentInRange START');
      globalThis.value.message.notify({
        name: 'padding', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnPaddingChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('Padding_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('Padding_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('Padding_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnPaddingChange1');
      expect(Math.abs((Math.round((locationText1.left - locationColumn.left) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationColumn.right - locationText1.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('new testColumnPaddingChangeParentInRange END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_PADDING_CHANGEPARENT_TEST_0200
     * @tc.name testColumnPaddingChangeParentOutRange
     * @tc.desc The parent component is bound with the padding attributes. Other parameters are default,
     *               the remaining space of the parent component does not meet the layout of the child components
     */
    it('testColumnPaddingChangeParentOutRange', 0, async () => {
      console.info('new testColumnPaddingChangeParentOutRange START');
      globalThis.value.message.notify({
        name: 'padding', value: 50
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnPaddingChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('Padding_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('Padding_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('Padding_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnPaddingChange1');
      expect(Math.abs((Math.round((locationText1.left - locationColumn.left) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.left - locationColumn.left)) - (Math.round(locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationColumn.right - locationText1.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationColumn.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('new testColumnPaddingChangeParentOutRange END');
    });
  })
}