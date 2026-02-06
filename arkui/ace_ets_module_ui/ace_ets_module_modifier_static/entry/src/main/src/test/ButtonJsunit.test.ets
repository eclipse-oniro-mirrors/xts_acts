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

export default function buttonJsunit() {
  describe('buttonTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });
    
    beforeEach(async () => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("button" == pages.name)) {
          routerInstance.clear()
          console.info("get button state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push button page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testButtonStatic1601
     * @tc.name     testButtonStatic1601
     * @tc.desc     testButtonStatic1601
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1601', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1601] START');
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButtonStatic1601] component testButtonStatic1601 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('type')).assertEqual('ButtonType.Circle');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1602
     * @tc.name     testButtonStatic1602
     * @tc.desc     testButtonStatic1602
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1602', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1602] START');
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButtonStatic1602] component testButtonStatic1602 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('stateEffect')).assertEqual('true');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1603
     * @tc.name     testButtonStatic1603
     * @tc.desc     testButtonStatic1603
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1603', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1603] START');
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButtonStatic1603] component testButtonStatic1603 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontColor')).assertEqual('#FFCCCCCC');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1604
     * @tc.name     testButtonStatic1604
     * @tc.desc     testButtonStatic1604
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1604', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1604] START');
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButtonStatic1604] component testButtonStatic1604 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1605
     * @tc.name     testButtonStatic1605
     * @tc.desc     testButtonStatic1605
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1605', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1605] START');
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButtonStatic1605] component testButtonStatic1605 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1606
     * @tc.name     testButtonStatic1606
     * @tc.desc     testButtonStatic1606
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1606', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1606] START');
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButtonStatic1606] component testButtonStatic1606 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1607
     * @tc.name     testButtonStatic1607
     * @tc.desc     testButtonStatic1607
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1607', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1607] START');
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButtonStatic1607] component testButtonStatic1607 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1608
     * @tc.name     testButtonStatic1608
     * @tc.desc     testButtonStatic1608
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1608', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButtonStatic1608] START');
      let strJsonNew = inspector.getInspectorByKey('button2');

      console.info("[testButtonStatic1608] component testButtonStatic1608 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('labelStyle')).getString('overflow')).assertEqual('TextOverflow.Clip');
      done();
    });

    
    
    /**
     * @tc.number   testButtonStatic1609
     * @tc.name     testButtonStatic1609
     * @tc.desc     testButtonStatic1609
     * @tc.level    Level.LEVEL0
     */
it('testButtonStatic1609', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testButtonStatic1609 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton')) as  Component;
      await button.click();
      await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('button'); //测试组件的key名称


      console.info("testButtonStatic1609 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize')).assertEqual('13.00fp'); //

      console.info('testButtonStatic1609 END');
      done();
    });

  })
}