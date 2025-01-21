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

export default function column_Margin_ChangeParent() {

  describe('Column_Margin_ChangeParentTest', () => {
    beforeEach(async () => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_Margin_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_Margin_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_Margin_ChangeParent" == pages.name)) {
          console.info("get Column_Margin_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_Margin_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Margin_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("Column_Margin_ChangeParent after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_MARGIN_CHANGEPARENT_TEST_0100
     * @tc.name testColumnMarginChangeParent
     * @tc.desc The parent component is bound with the margin attributes. Other parameters are default
     */
    it('testColumnMarginChangeParent', 0, async () => {
      console.info('new testColumnMarginChangeParent START');
      globalThis.value.message.notify({
        name: 'margin', value: 10
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnMarginChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('Margin_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('Margin_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('Margin_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnMarginChange1');
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
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) - (Math.round(vp2px(40)))) <= 1)
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
      console.info('new testColumnMarginChangeParent END');
    });
  })
}