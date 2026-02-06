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

export default function dividerJsunit() {
  describe('dividerTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/divider',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get divider state success " + JSON.stringify(pages));
        if (!("divider" == pages.name)) {
          console.info("get divider state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push divider page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   dividerTest_static_0001
     * @tc.name     dividerTest_static_0001
     * @tc.desc     dividerTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('dividerTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('divider');
      console.info("dividerTest_static_0001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('lineCap')).assertEqual("ROUND");
      console.info('dividerTest_static_0001 END');
      done();
    });

    
    
    /**
     * @tc.number   dividerTest_static_0002
     * @tc.name     dividerTest_static_0002
     * @tc.desc     dividerTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('dividerTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('divider');
      console.info("dividerTest_static_0002 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual("10.00vp");
      console.info('dividerTest_static_0002 END');
      done();
    });

    
    
    /**
     * @tc.number   dividerTest_static_0003
     * @tc.name     dividerTest_static_0003
     * @tc.desc     dividerTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('dividerTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerTest_static_0003 START');
      let strJsonNew = inspector.getInspectorByKey('divider');
      console.info("dividerTest_static_0003 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('color')).assertEqual("#FF123456");
      console.info('dividerTest_static_0003 END');
      done();
    });

    
    
    /**
     * @tc.number   dividerTest_static_0004
     * @tc.name     dividerTest_static_0004
     * @tc.desc     dividerTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('dividerTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerTest_static_0004 START');
      let strJsonNew = inspector.getInspectorByKey('divider');
      console.info("dividerTest_static_0004 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('vertical')).assertEqual("false");
      console.info('dividerTest_static_0004 END');
      done();
    });

    
    
    /**
     * @tc.number   dividerTest_static_0005
     * @tc.name     dividerTest_static_0005
     * @tc.desc     dividerTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('dividerTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('dividerTest_static_0005 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('divider');
      console.info("dividerTest_static_0005 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('color')).assertEqual("#FF654321");
      console.info('dividerTest_static_0005 END');
      done();
    });
  })
}