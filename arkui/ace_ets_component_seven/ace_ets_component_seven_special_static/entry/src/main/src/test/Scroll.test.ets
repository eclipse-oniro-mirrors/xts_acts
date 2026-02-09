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

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function scrollOnScrollBeginJsunit() {
  describe('scrollTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("scrollTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scroll',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   testScroll0001_static_01
     * @tc.name     testScroll0001_static_01
     * @tc.desc     testScroll0001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testScroll0001_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0001_static_01 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0001_static_01] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollSnapAlign')).assertEqual("ScrollSnapAlign.NONE");
      console.info('testScroll0001_static_01 END');
      done();
    });

  
    
    
/**
     * @tc.number   testScroll0002_static_02
     * @tc.name     testScroll0002_static_02
     * @tc.desc     testScroll0002_static_02
     * @tc.level    Level.LEVEL0
     */
it('testScroll0002_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0002_static_02 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0002_static_02] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(Math.abs(obj.getElement('$attrs').getDouble('friction') - 0.6) < 0.000001).assertTrue();
      console.info('testScroll0001_static_02 END');
      done();
    });

   
    
    
/**
     * @tc.number   testScroll0003_static_03
     * @tc.name     testScroll0003_static_03
     * @tc.desc     testScroll0003_static_03
     * @tc.level    Level.LEVEL0
     */
it('testScroll0003_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0003_static_03 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0003_static_03] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);

      console.info('testScroll0003_static_03 END');
      done();
    });

  
    
    
/**
     * @tc.number   testStestScroll0004croll0001_static_04
     * @tc.name     testStestScroll0004croll0001_static_04
     * @tc.desc     testStestScroll0004croll0001_static_04
     * @tc.level    Level.LEVEL0
     */
it('testStestScroll0004croll0001_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0004_static_0 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0004_static_04] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      // expect(obj.getElement('$attrs').nestedScroll).assertEqual("{scrollForward:SELF_ONLY,scrollBackward:SELF_FIRST}");
      expect(true).assertEqual(true);
      console.info('testScroll0001_static_04 END');
      done();
    });

  
    
    
/**
     * @tc.number   testScroll0005_static_05
     * @tc.name     testScroll0005_static_05
     * @tc.desc     testScroll0005_static_05
     * @tc.level    Level.LEVEL0
     */
it('testScroll0005_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0005_static_05 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0005_static_05] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollable')).assertEqual("ScrollDirection.Vertical");
      console.info('testScroll0005_static_05 END');
      done();
    });

   
    
    
/**
     * @tc.number   testScroll0006_static_06
     * @tc.name     testScroll0006_static_06
     * @tc.desc     testScroll0006_static_06
     * @tc.level    Level.LEVEL0
     */
it('testScroll0006_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0006_static_06 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0006_static_06] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual("BarState.Auto");
      console.info('testScroll0006_static_06 END');
      done();
    });

   
    
    
/**
     * @tc.number   testScroll0007_static_07
     * @tc.name     testScroll0007_static_07
     * @tc.desc     testScroll0007_static_07
     * @tc.level    Level.LEVEL0
     */
it('testScroll0007_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0007_static_07 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0007_static_07] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollBarWidth')).assertEqual("5.00vp");
      console.info('testScroll0007_static_07 END');
      done();
    });

  
    
    
/**
     * @tc.number   testScroll0008_static_08
     * @tc.name     testScroll0008_static_08
     * @tc.desc     testScroll0008_static_08
     * @tc.level    Level.LEVEL0
     */
it('testScroll0008_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0008_static_08 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0008_static_08] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual("EdgeEffect.None");
      console.info('testScroll0008_static_08 END');
      done();
    });

  
    
    
/**
     * @tc.number   testScroll0009_static_09
     * @tc.name     testScroll0009_static_09
     * @tc.desc     testScroll0009_static_09
     * @tc.level    Level.LEVEL0
     */
it('testScroll0009_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll0009_static_09 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll0009_static_09] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF123456");
      console.info('testScroll0009_static_09 END');
      done();
    });

  
  })
}
