'use static';
/*
  * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function stateManagementDARKJsunit() {
  describe('stateManagementDARKTest', () => {
    beforeAll(() => {
      console.info("stateManagementDARKJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("stateManagementDARKJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/stateManagement',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stateManagementDARKJsunit state pages:" + JSON.stringify(pages));
        if (!("stateManagement" == pages.name)) {
          console.info("get stateManagementDARKJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stateManagementDARKJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateManagementDARKJsunit page error:" + err);
      }
      console.info("stateManagementDARKJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stateManagementDARK after each called");
    });
    
    /**
     * @tc.number   teststateManagementDARK_static_001
     * @tc.name     teststateManagementDARK_static_001
     * @tc.desc     teststateManagementDARK_static_001
     * @tc.level    Level.LEVEL0
     */
it('teststateManagementDARK_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stateManagementDARK teststateManagementDARK_static_001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('DARKText');
      console.info("[teststateManagementDARK_static_001] component textAlign strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF000001');
      console.info("[teststateManagementDARK_static_001] backgroundColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor'));
      done();
    });
  })
}
