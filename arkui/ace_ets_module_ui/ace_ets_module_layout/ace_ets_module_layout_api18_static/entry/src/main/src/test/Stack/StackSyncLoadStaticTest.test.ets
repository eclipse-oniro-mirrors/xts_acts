'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function StackSyncLoadStaticTest() {
  describe('StackSyncLoadStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("StackSyncLoadStaticTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("StackSyncLoadStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackSyncLoadStatic',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StackSyncLoadStatic state pages:" + JSON.stringify(pages));
        if (!("StackSyncLoadStatic" == pages.name)) {
          console.info("get StackSyncLoadStatic pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push StackSyncLoadStatic page error:" + err);
      }
      console.info("StackSyncLoadStaticTest beforeEach end");
      
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   StackSyncLoadStaticTest_0100
     * @tc.number SUB_ARKUI_API_StackSyncLoadStaticTest_0100
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StackSyncLoadStaticTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[StackSyncLoadStaticTest_0100] START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('StackSyncLoadStatic1');
 	  let strJson2 = inspector.getInspectorByKey('StackSyncLoadStatic2');
 
 	  console.info('[StackSyncLoadStaticTest_0100]:' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('alignContent'))
      console.info('[StackSyncLoadStaticTest_0100]:' + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('alignContent'))
  
 	  expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
    
      console.info('[StackSyncLoadStaticTest_0100] END');
      done();
    });


  })
}