'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
export default function repeatKeyJsunit() {
  describe('repeatKeyJsunit', () => {

    beforeAll(() => {
      console.info("repeatKeyJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("repeatKeyJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Repeat/repeatKey',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get repeatKeyJsunit state pages:" + JSON.stringify(pages));
        if (!("repeatKeyJsunit" == pages.name)) {
          console.info("get repeatKeyJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push repeatKeyJsunit page error:" + err);
      }
      console.info("repeatKeyJsunit beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatKeyJsunit after each called");
    });

    
    
    /**
     * @tc.number   RepeatKey_static_001
     * @tc.name     RepeatKey_static_001
     * @tc.desc     RepeatKey_static_001
     * @tc.level    Level.LEVEL0
     */
it('RepeatKey_static_001', Level.LEVEL0, async () => {
      console.info('RepeatKey_static_001 START');
      expect(!!inspector.getInspectorByKey('one')).assertTrue();
      console.info('RepeatKey_static_001 END');
    });

    
    
    /**
     * @tc.number   RepeatKey_static_002
     * @tc.name     RepeatKey_static_002
     * @tc.desc     RepeatKey_static_002
     * @tc.level    Level.LEVEL0
     */
it('RepeatKey_static_002', Level.LEVEL0, async () => {
      console.info('RepeatKey_static_001 START');
      expect(!inspector.getInspectorByKey('one1')).assertTrue();
      console.info('RepeatKey_static_001 END');
    });
  })
}
  