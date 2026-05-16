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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function GridRowCol() {
  describe('GridRowCol', () => {
    beforeAll(() => {
      console.info("GridRowCol beforeAll start");
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridRowCol beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridRowCol',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridRowCol state pages: " + JSON.stringify(pages));
        if (!("GridRowCol" == pages.name)) {
          console.info("get GridRowCol state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridRowCol page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridRowCol_static_001
     * @tc.name     GridRowCol_static_001
     * @tc.desc     GridRowCol_static_001
     * @tc.level    Level.LEVEL0
     */
it('GridRowCol_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('GridRowCol');
      let obj1 = JSON.parseJsonElement(strJson1);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      let GridItem02 = CommonFunc.getComponentRect('GridItem02');
      let GridItem03 = CommonFunc.getComponentRect('GridItem03');
      let GridItem11 = CommonFunc.getComponentRect('GridItem11');
      console.info("[GridRowCol_static_001] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

	  expect(Math.abs(Math.round(GridItem01.left - GridItem00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(GridItem02.left - GridItem01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(GridItem03.top - GridItem00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(GridItem11.top - GridItem03.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridRowCol_static_001] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridRowCol_static_002
     * @tc.name     GridRowCol_static_002
     * @tc.desc     GridRowCol_static_002
     * @tc.level    Level.LEVEL0
     */
it('GridRowCol_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol_static_002] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'columnsTemplate', value: 'repeat(auto-fit,10%)' });
      await CommonFunc.sleep(200);
      let strJson1 = inspector.getInspectorByKey('GridRowCol');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol_static_002] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('columnsTemplate')).assertEqual('repeat(auto-fit,10%)');

      console.info('[GridRowCol_static_002] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridRowCol_static_003
     * @tc.name     GridRowCol_static_003
     * @tc.desc     GridRowCol_static_003
     * @tc.level    Level.LEVEL0
     */
it('GridRowCol_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol_static_003] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'columnsTemplate', value: 'repeat(auto-fit,90)' });
      await CommonFunc.sleep(200);
      let strJson1 = inspector.getInspectorByKey('GridRowCol');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol_static_003] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('columnsTemplate')).assertEqual('repeat(auto-fit,90)');

      console.info('[GridRowCol_static_003] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridRowCol_static_004
     * @tc.name     GridRowCol_static_004
     * @tc.desc     GridRowCol_static_004
     * @tc.level    Level.LEVEL0
     */
it('GridRowCol_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol_static_004] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'columnsTemplate', value: 'repeat(auto-fit,-1)' });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);

	  expect(Math.abs(Math.round(GridItem01.top - GridItem00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridRowCol_static_004] END');
      done();
    });

   
    
    

/**
     * @tc.number   GridRowCol_static_005
     * @tc.name     GridRowCol_static_005
     * @tc.desc     GridRowCol_static_005
     * @tc.level    Level.LEVEL0
     */
it('GridRowCol_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol_static_005] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'columnsTemplate', value: '1fr 1fr 1fr' });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);

	  expect(Math.abs(Math.round(GridItem01.left - GridItem00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridRowCol_static_005] END');
      done();
    });




  })
}
