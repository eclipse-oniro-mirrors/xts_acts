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

export default function patternLockJsunit() {
  describe('patternLockTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/patternLock',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get patternLock state success " + JSON.stringify(pages));
        if (!("patternLock" == pages.name)) {
          console.info("get patternLock state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push patternLock page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0001
     * @tc.name     patternLockTest_static_0001
     * @tc.desc     patternLockTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0001 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('sideLength')).assertEqual("0.00vp");
      console.info('patternLockTest_static_0001 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0002
     * @tc.name     patternLockTest_static_0002
     * @tc.desc     patternLockTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0002 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('circleRadius')).assertEqual("10.00vp");
      console.info('patternLockTest_static_0002 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0003
     * @tc.name     patternLockTest_static_0003
     * @tc.desc     patternLockTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0003 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0003 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('selectedColor')).assertEqual("#FF123456");
      console.info('patternLockTest_static_0003 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0004
     * @tc.name     patternLockTest_static_0004
     * @tc.desc     patternLockTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0004 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0004 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('regularColor')).assertEqual("#FF123456");
      console.info('patternLockTest_static_0004 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0005
     * @tc.name     patternLockTest_static_0005
     * @tc.desc     patternLockTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0005 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0005 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('activeColor')).assertEqual("#FF123456");
      console.info('patternLockTest_static_0005 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0006
     * @tc.name     patternLockTest_static_0006
     * @tc.desc     patternLockTest_static_0006
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0006 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0006 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('pathColor')).assertEqual("#FF123456");
      console.info('patternLockTest_static_0006 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0007
     * @tc.name     patternLockTest_static_0007
     * @tc.desc     patternLockTest_static_0007
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0007 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0007 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('pathStrokeWidth')).assertEqual("12.00vp");
      console.info('patternLockTest_static_0007 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0008
     * @tc.name     patternLockTest_static_0008
     * @tc.desc     patternLockTest_static_0008
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_static_0008 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0008 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('autoReset')).assertEqual("true");
      console.info('patternLockTest_static_0008 END');
      done();
    });

    
    
    /**
     * @tc.number   patternLockTest_static_0009
     * @tc.name     patternLockTest_static_0009
     * @tc.desc     patternLockTest_static_0009
     * @tc.level    Level.LEVEL0
     */
it('patternLockTest_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('patternLockTest_static_0009 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_static_0009 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('sideLength')).assertEqual("0.00vp");
      console.info('patternLockTest_static_0009 END');
      done();
    });
  })
}