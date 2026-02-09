'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function hitTestModeJsunit() {
  describe('hitTestModeJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("hitTestMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'pages/hitTestMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get hitTestMode state success " + JSON.stringify(pages));
        if (!("hitTestMode" == pages.name)) {
          console.info("get hitTestMode state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push hitTestMode page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("hitTestModeTest after each called");
    });

    
    
    
    /**
     * @tc.number   testhitTestMode_static_0002
     * @tc.name     testhitTestMode_static_0002
     * @tc.desc     testhitTestMode_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testhitTestMode_static_0002', Level.LEVEL0, async () => {
      console.info('hitTestMode testhitTestMode0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Block');
      console.info("[testhitTestMode0002] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Stack');
      console.info("[testhitTestMode0002] hitTestBehavior value :" +
      obj.getElement('$attrs').tryGetString('hitTestBehavior'));
      expect(obj.getElement('$attrs').tryGetString('hitTestBehavior')).assertEqual(undefined);
    });
  })
}
