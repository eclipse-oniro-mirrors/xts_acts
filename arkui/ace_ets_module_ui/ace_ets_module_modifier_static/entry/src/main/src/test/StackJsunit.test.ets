'use static';
/*
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';

export default function stackJsunit() {
  describe('stackTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stack state success " + JSON.stringify(pages));
        if (!("stack" == pages.name)) {
          console.info("get stack state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push stack page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   stackTest_static_002
     * @tc.name     stackTest_static_002
     * @tc.desc     stackTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('stackTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stackTest_static_002 START');
      let strJsonNew = inspector.getInspectorByKey('stack');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("stackTest_static_002 component  is: " + JSON.stringify(objNew.getElement('$attrs').getString('alignContent')));
      expect(objNew.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.Center");
      console.info('stackTest_static_002 END');
      done();
    });

    
    
    /**
     * @tc.number   stackTest_static_001
     * @tc.name     stackTest_static_001
     * @tc.desc     stackTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('stackTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stackTest_static_001 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('stack');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("stackTest_static_001 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.Top");
      console.info('stackTest_static_001 END');
      done();
    });
  })
}