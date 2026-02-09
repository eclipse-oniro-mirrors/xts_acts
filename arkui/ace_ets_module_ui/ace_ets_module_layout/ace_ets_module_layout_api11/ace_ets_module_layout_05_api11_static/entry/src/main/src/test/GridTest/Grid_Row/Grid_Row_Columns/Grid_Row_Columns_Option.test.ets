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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import inspector from '@ohos.arkui.inspector'
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function Grid_Row_Columns_Option() {
  describe('Grid_Row_Columns_Option', () => {
    beforeAll(() => {
      console.info("Grid_Row_Columns_Option beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_Columns_Option beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns_Option',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_Columns_Option state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Columns_Option" == pages.name)) {
          console.info("get Grid_Row_Columns_Option state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_Columns_Option page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Columns_Option after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowColumns_Option_static_0100
     * @tc.name     SUB_ACE_GridRowColumns_Option_static_0100
     * @tc.desc     SUB_ACE_GridRowColumns_Option_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowColumns_Option_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowColumns_Option_static_0100 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'option', value: '30'
      })
      await CommonFunc.sleep(2000)

      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let gridRowColumnsJson = inspector.getInspectorByKey('GridRow_Columns_Option001');
     expect(JSON.parseJsonElement(gridRowColumnsJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.top - firstColumns.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_static_0100 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowColumns_Option_static_0200
     * @tc.name     SUB_ACE_GridRowColumns_Option_static_0200
     * @tc.desc     SUB_ACE_GridRowColumns_Option_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowColumns_Option_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowColumns_Option_static_0200 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'option', value: '70'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let gridRowColumnsJson = inspector.getInspectorByKey('GridRow_Columns_Option001');
     expect(JSON.parseJsonElement(gridRowColumnsJson).getString('$type')).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthColumns.left - thirdColumns.right) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_static_0200 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowColumns_Option_static_0300
     * @tc.name     SUB_ACE_GridRowColumns_Option_static_0300
     * @tc.desc     SUB_ACE_GridRowColumns_Option_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowColumns_Option_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowColumns_Option_static_0300 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'option', value: '120'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');
      let gridRowColumnsJson = inspector.getInspectorByKey('GridRow_Columns_Option001');
     expect(JSON.parseJsonElement(gridRowColumnsJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) -
      Math.round(thirdColumns.left - secondColumns.right)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_static_0300 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowColumns_Option_static_0400
     * @tc.name     SUB_ACE_GridRowColumns_Option_static_0400
     * @tc.desc     SUB_ACE_GridRowColumns_Option_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowColumns_Option_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowColumns_Option_static_0400 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'option', value: '170'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');

      let gridRowColumnsJson = inspector.getInspectorByKey('GridRow_Columns_Option001');
     expect(JSON.parseJsonElement(gridRowColumnsJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(thirdColumns.left - secondColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdColumns.left - secondColumns.right) - Math.round(fourthColumns.left - thirdColumns.right)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.floor(secondColumns.left - firstColumns.right) - Math.floor(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_static_0400 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowColumns_Option_static_0500
     * @tc.name     SUB_ACE_GridRowColumns_Option_static_0500
     * @tc.desc     SUB_ACE_GridRowColumns_Option_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowColumns_Option_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowColumns_Option_static_0500 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'option', value: '220'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');
      let gridRowColumnsJson = inspector.getInspectorByKey('GridRow_Columns_Option001');
     expect(JSON.parseJsonElement(gridRowColumnsJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(thirdColumns.left - secondColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdColumns.left - secondColumns.right) - Math.round(fourthColumns.left - thirdColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthColumns.left - thirdColumns.right) - Math.round(fifthColumns.left - fourthColumns.right)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.floor(secondColumns.left - firstColumns.right) - Math.floor(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_static_0500 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowColumns_Option_static_0600
     * @tc.name     SUB_ACE_GridRowColumns_Option_static_0600
     * @tc.desc     SUB_ACE_GridRowColumns_Option_static_0600
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowColumns_Option_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowColumns_Option_static_0600 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'option', value: '320'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');
      let sixthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option5');
      let gridRowColumnsJson = inspector.getInspectorByKey('GridRow_Columns_Option001');
     expect(JSON.parseJsonElement(gridRowColumnsJson).getString('$type')).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(thirdColumns.left - secondColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdColumns.left - secondColumns.right) - Math.round(fourthColumns.left - thirdColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthColumns.left - thirdColumns.right) - Math.round(fifthColumns.left - fourthColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fifthColumns.left - fourthColumns.right) - Math.round(sixthColumns.left - fifthColumns.right)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.floor(secondColumns.left - firstColumns.right) - Math.floor(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_static_0600 END');
      done();
    });


  })
}
