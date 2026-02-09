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

export default function Grid_Row_SizeOption() {
  describe('Grid_Row_SizeOption', () => {
    beforeAll(() => {
      console.info("Grid_Row_SizeOption beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_SizeOption beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_SizeOption',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_SizeOption state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_SizeOption" == pages.name)) {
          console.info("get Grid_Row_SizeOption state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_SizeOption page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_SizeOption after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowSizeOption_static_0100
     * @tc.name     SUB_ACE_GridRowSizeOption_static_0100
     * @tc.desc     SUB_ACE_GridRowSizeOption_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowSizeOption_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowSizeOption_static_0100 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'size', value: '30vp' as String
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs(Math.round(secondSizeOption.top - firstSizeOption.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_static_0100 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowSizeOption_static_0200
     * @tc.name     SUB_ACE_GridRowSizeOption_static_0200
     * @tc.desc     SUB_ACE_GridRowSizeOption_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowSizeOption_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowSizeOption_static_0200 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'size', value: '70vp' as String
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');

      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdSizeOption.top - firstSizeOption.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_static_0200 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowSizeOption_static_0300
     * @tc.name     SUB_ACE_GridRowSizeOption_static_0300
     * @tc.desc     SUB_ACE_GridRowSizeOption_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowSizeOption_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowSizeOption_static_0300 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'size', value: '120vp' as String
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthSizeOption.top - firstSizeOption.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_static_0300 END');
      done();
    });
    
    
    

/**
     * @tc.number   SUB_ACE_GridRowSizeOption_static_0400
     * @tc.name     SUB_ACE_GridRowSizeOption_static_0400
     * @tc.desc     SUB_ACE_GridRowSizeOption_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowSizeOption_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowSizeOption_static_0400 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'size', value: '170vp' as String
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs((Math.round(secondSizeOption.left - firstSizeOption.right)) - (Math.round(UIContext.resolveUIContext()!.vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(fifthSizeOption.top - firstSizeOption.bottom)) - (Math.round(UIContext.resolveUIContext()!.vp2px(5)))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_static_0400 END');
      done();
    });
    
    
    

/**
     * @tc.number   SUB_ACE_GridRowSizeOption_static_0500
     * @tc.name     SUB_ACE_GridRowSizeOption_static_0500
     * @tc.desc     SUB_ACE_GridRowSizeOption_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowSizeOption_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowSizeOption_static_0500 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'size', value: '220vp' as String
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');

      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(sixthSizeOption.top - firstSizeOption.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_static_0500 END');
      done();
    });
    
    
    

/**
     * @tc.number   SUB_ACE_GridRowSizeOption_static_0600
     * @tc.name     SUB_ACE_GridRowSizeOption_static_0600
     * @tc.desc     SUB_ACE_GridRowSizeOption_static_0600
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowSizeOption_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowSizeOption_static_0600 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'size', value: '320vp' as String
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(seventhSizeOption.top - firstSizeOption.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_static_0600 END');
      done();
    });
  })
}
