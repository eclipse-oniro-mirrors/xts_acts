'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import {FlexAlign} from '@ohos.arkui.component'
// import {fp2px,lpx2px} from '@ohos.arkui.UIContext'
import  RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
// import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test';
import inspector from '@ohos.arkui.inspector';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function column_JustifyContent_ChangeParent() {

  describe('Column_JustifyContent_ChangeParentTest', () => {
    beforeAll(async () => {
      console.info("Column_JustifyContent_ChangeParentTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      console.info("Column_JustifyContent_ChangeParent beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_JustifyContent_ChangeParent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Column_JustifyContent_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_JustifyContent_ChangeParent" == pages?.name)) {
          console.info("get Column_JustifyContent_ChangeParent state pages.name:" + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
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
     * @tc.number  testColumnJustifyContentChangeParentFlexAlignCenter_static
     * @tc.name     testColumnJustifyContentChangeParentFlexAlignCenter_static
     * @tc.desc     testColumnJustifyContentChangeParentFlexAlignCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnJustifyContentChangeParentFlexAlignCenter_static', Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter_static START');
      // GlobalContext.getContext().getObject<number>('value').message.notify({
      //   name: 'justifyContent', value: FlexAlign.Center
      // })
      AppStorage.get<MessageManager<FlexAlign>>("messageManager")?.notify({
        name: 'justifyContent', value: FlexAlign.Center
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.bottom - locationText3.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter_static END');
    });

    
    



    /**
     * @tc.number  testColumnJustifyContentChangeParentFlexAlignEnd
     * @tc.name     testColumnJustifyContentChangeParentFlexAlignEnd
     * @tc.desc     testColumnJustifyContentChangeParentFlexAlignEnd
     * @tc.level    Level.LEVEL0
     */
    it('testColumnJustifyContentChangeParentFlexAlignEnd', Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd START');
      // GlobalContext.getContext().getObject<number>('value').message.notify({
      //   name: 'justifyContent', value: FlexAlign.End
      // })
      AppStorage.get<MessageManager<FlexAlign>>("messageManager")?.notify({
        name: 'justifyContent', value: FlexAlign.End
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(locationText3.bottom - locationColumn.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd END');
    });

    
    



    /**
     * @tc.number  testColumnJustifyContentChangeParentFlexAlignSpaceBetween
     * @tc.name     testColumnJustifyContentChangeParentFlexAlignSpaceBetween
     * @tc.desc     testColumnJustifyContentChangeParentFlexAlignSpaceBetween
     * @tc.level    Level.LEVEL0
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceBetween', Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween START');
      // GlobalContext.getContext().getObject<number>('value').message.notify({
      //   name: 'justifyContent', value: FlexAlign.SpaceBetween
      // })
      AppStorage.get<MessageManager<FlexAlign>>("messageManager")?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceBetween
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top) - (locationColumn.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom) - (locationColumn.bottom))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      //Known issues with use case notes
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween END');
    });

    
    



    /**
     * @tc.number  testColumnJustifyContentChangeParentFlexAlignSpaceAround
     * @tc.name     testColumnJustifyContentChangeParentFlexAlignSpaceAround
     * @tc.desc     testColumnJustifyContentChangeParentFlexAlignSpaceAround
     * @tc.level    Level.LEVEL0
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceAround', Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround START');
      // GlobalContext.getContext().getObject<number>('value').message.notify({
      //   name: 'justifyContent', value: FlexAlign.SpaceAround
      // })
      AppStorage.get<MessageManager<FlexAlign>>("messageManager")?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceAround
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(100 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(50 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround END');
    });

    
    



    /**
     * @tc.number   testColumnJustifyContentChangeParentFlexAlignSpaceEvenly
     * @tc.name     testColumnJustifyContentChangeParentFlexAlignSpaceEvenly
     * @tc.desc     testColumnJustifyContentChangeParentFlexAlignSpaceEvenly
     * @tc.level    Level.LEVEL0
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceEvenly', Level.LEVEL0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly START');
      // GlobalContext.getContext().getObject<number>('value').message.notify({
      //   name: 'justifyContent', value: FlexAlign.SpaceEvenly
      // })
      AppStorage.get<MessageManager<FlexAlign>>("messageManager")?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceEvenly
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj= JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationText2.top - locationText1.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly END');
    });
  })
}