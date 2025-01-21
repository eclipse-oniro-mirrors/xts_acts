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

export default function column_JustifyContent_ChangeParent() {

  describe('Column_JustifyContent_ChangeParentTest', () => {
    beforeEach(async () => {
      console.info("Column_JustifyContent_ChangeParent beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_JustifyContent_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_JustifyContent_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_JustifyContent_ChangeParent" == pages.name)) {
          console.info("get Column_JustifyContent_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_JustifyContent_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_JustifyContent_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("Column_JustifyContent_ChangeParent afterEach called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0100
     * @tc.name testColumnJustifyContentChangeParentFlexAlignCenter
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.Center. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignCenter', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter START');
      globalThis.value.message.notify({
        name: 'justifyContent', value: FlexAlign.Center
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
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
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0200
     * @tc.name testColumnJustifyContentChangeParentFlexAlignEnd
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.End. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignEnd', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd START');
      globalThis.value.message.notify({
        name: 'justifyContent', value: FlexAlign.End
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
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
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (Math.round(vp2px(40)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText3.bottom) - (locationColumn.bottom)) <= 1).assertTrue();
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
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0300
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceBetween
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceBetween. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceBetween', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween START');
      globalThis.value.message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceBetween
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
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
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom) - (locationColumn.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      //Known issues with use case notes
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
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0400
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceAround
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceAround. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceAround', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround START');
      globalThis.value.message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceAround
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
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
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(vp2px(100 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (Math.round(locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (Math.round(vp2px(50 / 3)))) <= 1)
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
      expect(Math.abs((Math.floor(locationText3.bottom - locationText3.top)) - (Math.floor(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0500
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceEvenly
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceEvenly. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceEvenly', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly START');
      globalThis.value.message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceEvenly
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
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
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (Math.round(locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationColumn.top)) - (Math.round(locationText2.top - locationText1.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationText1.top - locationColumn.top) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1)
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
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly END');
    });
  })
}