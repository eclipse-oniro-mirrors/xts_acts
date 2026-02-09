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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '../../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { VerticalAlign } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RelativeContainer_Vertical() {
  describe('RelativeContainer_Vertical', () => {
    beforeAll(async() => {
      console.info("RelativeContainer_Vertical beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RelativeContainer_Vertical beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_Vertical/RelativeContainer_Vertical",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeContainer_Vertical state pages:" + "");
        if (!("RelativeContainer_Vertical" == pages.name)) {
          console.info("get RelativeContainer_Vertical pages.name:" + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push RelativeContainer_Vertical page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RelativeContainer_Vertical after each called")
    });
    
    
    

/**
     * @tc.number   SUB_ACE_RelativeContainer_Vertical_TEST_static_0100
     * @tc.name     SUB_ACE_RelativeContainer_Vertical_TEST_static_0100
     * @tc.desc     SUB_ACE_RelativeContainer_Vertical_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_RelativeContainer_Vertical_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_static_0100] START');
      AppStorage.get<MessageManager<VerticalAlign>>("messageManager")?.notify({
        name: 'addalign', value: VerticalAlign.Top
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Vertical_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_bt1');
      let RelativeContainer_Vertical_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Vertical_tx2.top - RelativeContainer_Vertical_bt1.top) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Vertical_tx2.left - RelativeContainer_Vertical_bt1.right) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_RelativeContainer_Vertical_TEST_static_0200
     * @tc.name     SUB_ACE_RelativeContainer_Vertical_TEST_static_0200
     * @tc.desc     SUB_ACE_RelativeContainer_Vertical_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_RelativeContainer_Vertical_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_static_0200] START');
      AppStorage.get<MessageManager<VerticalAlign>>("messageManager")?.notify({
        name: 'addalign', value: VerticalAlign.Center
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Vertical_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_bt1');
      let RelativeContainer_Vertical_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Vertical_tx2.top - ((RelativeContainer_Vertical_bt1.bottom - RelativeContainer_Vertical_bt1.top) / 2 + RelativeContainer_Vertical_bt1.top)) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_Vertical_tx2.left - RelativeContainer_Vertical_bt1.right) <= 1).assertTrue();


      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_static_0200] END');
      done();

    });

    
    
    

/**
     * @tc.number   SUB_ACE_RelativeContainer_Vertical_TEST_static_0300
     * @tc.name     SUB_ACE_RelativeContainer_Vertical_TEST_static_0300
     * @tc.desc     SUB_ACE_RelativeContainer_Vertical_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_RelativeContainer_Vertical_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_static_0300] START');
      AppStorage.get<MessageManager<VerticalAlign>>("messageManager")?.notify({
        name: 'addalign', value: VerticalAlign.Bottom
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let RelativeContainer_Vertical_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_bt1');
      let RelativeContainer_Vertical_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Vertical_tx2');


      console.log('assert position')

      expect(Math.abs(RelativeContainer_Vertical_tx2.top - RelativeContainer_Vertical_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Vertical_tx2.left - RelativeContainer_Vertical_bt1.right) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Vertical_TEST_static_0300] END');
      done();

    });
  })
}