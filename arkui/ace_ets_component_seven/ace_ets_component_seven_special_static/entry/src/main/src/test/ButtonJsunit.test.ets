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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function buttonJsunit() {
  describe('buttonTest', () => {
    beforeAll(() => {
      console.info("buttonTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("button" == pages.name)) {
          console.info("get button state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push button page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push button page error: " + err);
      }
    });

    beforeEach(async () => {
      await Utils.sleep(1000);
      console.info("button before each called");
    })


    
    
/**
     * @tc.number   testButton1601_static_01
     * @tc.name     testButton1601_static_01
     * @tc.desc     testButton1601_static_01
     * @tc.level    Level.LEVEL0
     */
it('testButton1601_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1601_static_01] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1601_static_01] component testButton1601 is: " + strJsonNew);
      expect(objNew.getElement('$attrs').getString('type')).assertEqual('ButtonType.Circle');
      done();
    });

    
    
/**
     * @tc.number   testButton1602_static_02
     * @tc.name     testButton1602_static_02
     * @tc.desc     testButton1602_static_02
     * @tc.level    Level.LEVEL0
     */
it('testButton1602_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1602_static_02] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1602_static_02] component testButton1602 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('stateEffect')).assertEqual('true');
      done();
    });


    
    
/**
     * @tc.number   testButton1603_static_03
     * @tc.name     testButton1603_static_03
     * @tc.desc     testButton1603_static_03
     * @tc.level    Level.LEVEL0
     */
it('testButton1603_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1603_static_03] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1603_static_03] component testButton1603 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual('#FFCCCCCC');
      done();
    });

    
    
/**
     * @tc.number   testButton1604_static_04
     * @tc.name     testButton1604_static_04
     * @tc.desc     testButton1604_static_04
     * @tc.level    Level.LEVEL0
     */
it('testButton1604_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1604_static_04] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1604_static_04] component testButton1604 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');
      done();
    });

    
    
/**
     * @tc.number   testButton1605_static_05
     * @tc.name     testButton1605_static_05
     * @tc.desc     testButton1605_static_05
     * @tc.level    Level.LEVEL0
     */
it('testButton1605_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1605_static_05] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1605_static_05] component testButton1605 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      done();
    });

    
    
/**
     * @tc.number   testButton1606_static_06
     * @tc.name     testButton1606_static_06
     * @tc.desc     testButton1606_static_06
     * @tc.level    Level.LEVEL0
     */
it('testButton1606_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1606_static_06] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1606_static_06] component testButton1606 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      done();
    });

    
    
/**
     * @tc.number   testButton1607_static_07
     * @tc.name     testButton1607_static_07
     * @tc.desc     testButton1607_static_07
     * @tc.level    Level.LEVEL0
     */
it('testButton1607_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1607_static_07] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1607_static_07] component testButton1607 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');
      done();
    });

    
    
/**
     * @tc.number   testButton1608_static_08
     * @tc.name     testButton1608_static_08
     * @tc.desc     testButton1608_static_08
     * @tc.level    Level.LEVEL0
     */
it('testButton1608_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testButton1608_static_08] START');
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('button2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testButton1608_static_08] component testButton1608 is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('labelStyle')).getString('overflow')).assertEqual('TextOverflow.Clip');
      done();
    });

  })
}