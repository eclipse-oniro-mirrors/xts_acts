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

export default function column_AlignItems_ChangeParent() {

  describe('Column_AlignItems_ChangeParentTest', () => {
    beforeEach(async () => {
      console.info("Column_AlignItems_ChangeParent beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_AlignItems_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_AlignItems_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_AlignItems_ChangeParent" == pages.name)) {
          console.info("get Column_AlignItems_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_AlignItems_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_AlignItems_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Column_AlignItems_ChangeParent afterEach called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_ALIGNITEMS_CHANGEPARENT_TEST_0100
     * @tc.name testColumnAlignItemsChangeParentHorizontalAlignStart
     * @tc.desc The parent component is bound to alignItems property HorizontalAlign.Start. Other parameters are default
     */
    it('testColumnAlignItemsChangeParentHorizontalAlignStart', 0, async () => {
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignStart START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'alignItems', value: HorizontalAlign.Start
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnAlignItemsChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignItems_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignItems_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignItems_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnAlignItemsChange1');
      expect(Math.abs((locationText1.left) - (locationColumn.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.left) - (locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.left) - (locationText3.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.right - locationText1.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
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
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignStart END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_ALIGNITEMS_CHANGEPARENT_TEST_0200
     * @tc.name testColumnAlignItemsChangeParentHorizontalAlignEnd
     * @tc.desc The parent component is bound to alignItems property HorizontalAlign.End. Other parameters are default
     */
    it('testColumnAlignItemsChangeParentHorizontalAlignEnd', 0, async () => {
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignEnd START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'alignItems', value: HorizontalAlign.End
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnAlignItemsChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignItems_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignItems_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignItems_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnAlignItemsChange1');
      expect(Math.abs((locationText1.right) - (locationColumn.right)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right) - (locationText2.right)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right) - (locationText3.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
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
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignEnd END');
    });
  })
}