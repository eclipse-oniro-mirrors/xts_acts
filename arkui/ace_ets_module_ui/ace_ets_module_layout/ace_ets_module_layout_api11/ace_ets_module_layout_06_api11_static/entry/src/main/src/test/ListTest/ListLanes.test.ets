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
import { Axis } from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../hypium/index';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue  from '../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
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
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;



export default function ListLanes() {
  describe('ListLanes', () => {
    beforeAll(() => {
      console.info("ListLanes beforeAll start");
            
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    })
    beforeEach(async (): Promise<void> => {
      console.info("ListLanes beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListLanes',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ListLanes state pages: " + JSON.stringify(pages));
        if (!("ListLanes" == pages.name)) {
          console.info("get ListLanes state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListLanes page error: " + err);
        expect().assertFail();
      }
    });

    
    
    



/**
     * @tc.number   ListLanes_static_001
     * @tc.name     ListLanes_static_001
     * @tc.desc     ListLanes_static_001
     * @tc.level    Level.LEVEL0
     */
it('ListLanes_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes_static_001] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | Axis>>('messageManager')?.notify({ name:'listGutter', value: '-1vp' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(0)));

      console.info('[ListLanes_static_001] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListLanes_static_002
     * @tc.name     ListLanes_static_002
     * @tc.desc     ListLanes_static_002
     * @tc.level    Level.LEVEL0
     */
it('ListLanes_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes_002] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | Axis>>('messageManager')?.notify({ name:'listGutter', value: '10%' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem2 = CommonFunc.getComponentRect('ListItem2');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(ListItem2.top - ListItem0.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

      console.info('[ListLanes_002] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListLanes_static_007
     * @tc.name     ListLanes_static_007
     * @tc.desc     ListLanes_static_007
     * @tc.level    Level.LEVEL0
     */
it('ListLanes_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes_007] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | Axis>>('messageManager')?.notify({ name:'listGutter', value: '10px' });
      AppStorage.get<MessageManager<string | number | Axis>>('messageManager')?.notify({ name:'listSpace', value: '10px' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      let ListItem2 = CommonFunc.getComponentRect('ListItem2');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(10));
      expect(Math.round(ListItem2.top - ListItem0.bottom)).assertEqual(Math.round(10));

      console.info('[ListLanes_007] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListLanes_static_008
     * @tc.name     ListLanes_static_008
     * @tc.desc     ListLanes_static_008
     * @tc.level    Level.LEVEL0
     */
it('ListLanes_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes_008] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | Axis>>('messageManager')?.notify({ name:'listGutter', value: '10vp' });
      AppStorage.get<MessageManager<string | int | Axis>>('messageManager') ?.notify({ name:'initialIndex', value: 8 });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(ListItem1.left - ListItem0.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[ListLanes_008] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListLanes_static_009
     * @tc.name     ListLanes_static_009
     * @tc.desc     ListLanes_static_009
     * @tc.level    Level.LEVEL0
     */
it('ListLanes_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes_008] START');
      await CommonFunc.sleep(200);
      let ListLanes = CommonFunc.getComponentRect('ListLanesKey');
      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(ListItem1.left - ListItem0.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem0.left - ListLanes.left) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

      console.info('[ListLanes_008] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListLanes_static_010
     * @tc.name     ListLanes_static_010
     * @tc.desc     ListLanes_static_010
     * @tc.level    Level.LEVEL0
     */
it('ListLanes_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes_010] START');
      await CommonFunc.sleep(200);
      let ListLanes = CommonFunc.getComponentRect('ListLanesKey');
      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      let ColumnKey = CommonFunc.getComponentRect('ColumnKey');
      await CommonFunc.sleep(1000);
      console.log('UIContext.resolveUIContext()!.vp2px(10) is:' +UIContext.resolveUIContext()!.vp2px(10));
      console.log('ListItem0 rect_value is:' +JSON.stringify(ListItem0));
      console.log('ListItem1 rect_value is:' +JSON.stringify(ListItem1));
	  expect(Math.abs(Math.round(ListItem1.left - ListItem0.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      console.log('ListLanes rect_value is:' +JSON.stringify(ListLanes));
      console.log('ColumnKey rect_value is:' +JSON.stringify(ColumnKey));
	  expect(Math.abs(Math.round(ListLanes.top - ColumnKey.top) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[ListLanes_010] END');
      done();
    });

  })
}
