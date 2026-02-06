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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function navigationJsunit() {


  describe('navigationTest', () => {

    /**
     * run before testcase
     */
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[navigationTest] before each called');
      await UtilsTest.msSleep(1000);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/Navigation',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        routerInstance.pushUrl(options);
        console.info("push navigation page success ");
      } catch (err) {
        console.info("push navigation page error " + JSON.stringify(err));
      }
      await UtilsTest.msSleep(1000);
    });

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[navigationTest] after each called');
      const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
      await UtilsTest.msSleep(1000)
    });


    
/**
     * @tc.number   testNavigationStatic010
     * @tc.name     testNavigationStatic010
     * @tc.desc     testNavigationStatic010
     * @tc.level    Level.LEVEL0
     */
it('testNavigationStatic010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testNavigationStatic010 START');
      let strJson = inspector.getInspectorByKey('navigation1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigation1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Navigation');
      expect(obj.getElement('$attrs').getString('title')).assertEqual('title');
      expect(obj.getElement('$attrs').getBoolean('hideBackButton')).assertFalse();
      expect(obj.getElement('$attrs').getBoolean('hideTitleBar')).assertFalse();
      console.info('testNavigationStatic010 End');
      done();
    });



    
/**
     * @tc.number   testNavigationStatic020
     * @tc.name     testNavigationStatic020
     * @tc.desc     testNavigationStatic020
     * @tc.level    Level.LEVEL0
     */
it('testNavigationStatic020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testNavigationStatic020 START');
      let strJson = inspector.getInspectorByKey('navigation2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigation2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Navigation');
      expect(obj.getElement('$attrs').getBoolean('hideTitleBar')).assertTrue();
      expect(obj.getElement('$attrs').getBoolean('hideBackButton')).assertTrue();
      console.info('testNavigationStatic020 End');
      done();
    });
  })
}
