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

export default function Grid_Row_GutterOption_Number() {
  describe('Grid_Row_GutterOption_Number',  ()=> {
    beforeAll(() => {
      console.info("Grid_Row_GutterOption_Number beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_GutterOption_Number beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Number',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_GutterOption_Number state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_GutterOption_Number" == pages.name)) {
          console.info("get Grid_Row_GutterOption_Number state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_GutterOption_Number page error: " + err);
      }
    });

    afterEach(async ()=> {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_GutterOption_Number after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_NUMBER_static_0100
     * @tc.name     SUB_ACE_GridRowGutterOption_NUMBER_static_0100
     * @tc.desc     SUB_ACE_GridRowGutterOption_NUMBER_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_NUMBER_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_NUMBER_static_0100 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({ name: 'length', value: -20.0 })
      await CommonFunc.sleep(2000)

      let LengthNumber_1:RectValue = CommonFunc.getComponentRect('Length_Number001');
      let firstLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_0');
      let secondLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_1');
      let thirdLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_2');
      let gridRowGutterLengthNumJson = inspector.getInspectorByKey('Length_Number001');
     let gridRowGutter = JSON.parseJsonElement(gridRowGutterLengthNumJson);
     expect(gridRowGutter.getString('$type')).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondLengthNumber.left - firstLengthNumber.right) -
      Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdLengthNumber.top - firstLengthNumber.bottom) -
      Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_NUMBER_static_0100 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_NUMBER_static_0200
     * @tc.name     SUB_ACE_GridRowGutterOption_NUMBER_static_0200
     * @tc.desc     SUB_ACE_GridRowGutterOption_NUMBER_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_NUMBER_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_NUMBER_static_0200 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({ name: 'length', value: 0.0 })
      await CommonFunc.sleep(2000)

      let LengthNumber_1:RectValue = CommonFunc.getComponentRect('Length_Number001');
      let firstLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_0');
      let secondLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_1');
      let thirdLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_2');
      let gridRowGutterLengthNumJson = inspector.getInspectorByKey('Length_Number001');
     let gridRowGutter = JSON.parseJsonElement(gridRowGutterLengthNumJson);
     expect(gridRowGutter.getString('$type')).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondLengthNumber.left - firstLengthNumber.right) -
      Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdLengthNumber.top - firstLengthNumber.bottom) -
      Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_NUMBER_static_0200 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_NUMBER_static_0300
     * @tc.name     SUB_ACE_GridRowGutterOption_NUMBER_static_0300
     * @tc.desc     SUB_ACE_GridRowGutterOption_NUMBER_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_NUMBER_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_NUMBER_static_0300 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({ name: 'length', value: 10.0 })
      await CommonFunc.sleep(2000)

      let LengthNumber_1:RectValue = CommonFunc.getComponentRect('Length_Number001');
      let firstLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_0');
      let secondLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_1');
      let thirdLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_2');
      let gridRowGutterLengthNumJson = inspector.getInspectorByKey('Length_Number001');
     let gridRowGutter = JSON.parseJsonElement(gridRowGutterLengthNumJson);
     expect(gridRowGutter.getString('$type')).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondLengthNumber.left - firstLengthNumber.right) -
      Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdLengthNumber.top - firstLengthNumber.bottom) -
      Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_NUMBER_static_0300 END');
      done();
    });
  })
}
