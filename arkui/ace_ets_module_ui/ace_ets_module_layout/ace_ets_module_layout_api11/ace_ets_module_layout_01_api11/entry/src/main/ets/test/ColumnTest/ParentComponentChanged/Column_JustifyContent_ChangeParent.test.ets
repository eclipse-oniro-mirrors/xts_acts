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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

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
    it('testColumnJustifyContentChangeParentFlexAlignCenter',  Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'justifyContent', value: FlexAlign.Center
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.bottom - locationText3.bottom) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0200
     * @tc.name testColumnJustifyContentChangeParentFlexAlignEnd
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.End. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignEnd',  Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'justifyContent', value: FlexAlign.End
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(locationText3.bottom - locationColumn.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0300
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceBetween
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceBetween. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceBetween',  Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceBetween
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top) - (locationColumn.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom) - (locationColumn.bottom))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - vp2px(50))) <= 1)
        .assertTrue();
      //Known issues with use case notes
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0400
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceAround
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceAround. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceAround',  Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceAround
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - vp2px(100 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - vp2px(50 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0500
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceEvenly
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceEvenly. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceEvenly',  Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceEvenly
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnJustifyContentChange1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationText2.top - locationText1.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly END');
    });
  })
}