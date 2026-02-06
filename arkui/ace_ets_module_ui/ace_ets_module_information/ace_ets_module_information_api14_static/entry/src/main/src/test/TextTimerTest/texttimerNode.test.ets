'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextTimerNodeTest() {
  describe('TextTimerNodeTest', () => {
    beforeAll(() => {
      console.info("TextTimerNodeTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('texttimerNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/texttimerNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get texttimerNode state pages: ' + JSON.stringify(pages));
        if (!('texttimerNode' == pages.name)) {
          console.info('get texttimerNode pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push texttimerNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('texttimerNode beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('texttimerNode after each called');
    })

    
    /**
     * @tc.number   TextTimerNode_static_0100
     * @tc.name     TextTimerNode_static_0100
     * @tc.desc     TextTimerNode_static_0100
     * @tc.level    Level.LEVEL2
     */
it('TextTimerNode_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

        let tagName = 'TextTimerNode0100';
        console.info('[' + tagName + '] START============================');
        let strJsonNew = inspector.getInspectorByKey('key_ TextTimer_001');
        console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew).getString('$type')));
        expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('TextTimer');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
      
    })
  }