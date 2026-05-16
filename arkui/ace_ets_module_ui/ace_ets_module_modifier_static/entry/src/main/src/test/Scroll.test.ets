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
import Utils from './Utils.test';
interface Action {
  ACTION: boolean
}
export default function scrollOnScrollBeginJsunit() {
  describe('scrollTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scroll',
      }
      try {
        const alphabetIndexer = AppStorage.get<Router>("router") as Router
        alphabetIndexer.clear();
        let pages = alphabetIndexer.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          alphabetIndexer.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testScrollStatic0001
     * @tc.name     testScrollStatic0001
     * @tc.desc     testScrollStatic0001
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0001 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0001] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('scrollSnapAlign')).assertEqual("ScrollSnapAlign.NONE");
      console.info('testScrollStatic0001 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0002
     * @tc.name     testScrollStatic0002
     * @tc.desc     testScrollStatic0002
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0002 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0002] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getDouble('friction')).assertEqual(1);
      console.info('testScrollStatic0001 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0003
     * @tc.name     testScrollStatic0003
     * @tc.desc     testScrollStatic0003
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0003 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0003] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);
      console.info('testScrollStatic0003 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0005
     * @tc.name     testScrollStatic0005
     * @tc.desc     testScrollStatic0005
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0005 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0005] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('scrollable')).assertEqual("ScrollDirection.Vertical");
      console.info('testScrollStatic0005 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0006
     * @tc.name     testScrollStatic0006
     * @tc.desc     testScrollStatic0006
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0006 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0006] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual("BarState.Auto");
      console.info('testScrollStatic0006 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0007
     * @tc.name     testScrollStatic0007
     * @tc.desc     testScrollStatic0007
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0007 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0007] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('scrollBarWidth')).assertEqual("5.00vp");
      console.info('testScrollStatic0007 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0008
     * @tc.name     testScrollStatic0008
     * @tc.desc     testScrollStatic0008
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0008 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0008] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual("EdgeEffect.None");
      console.info('testScrollStatic0008 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0009
     * @tc.name     testScrollStatic0009
     * @tc.desc     testScrollStatic0009
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0009 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0009] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF123456");
      console.info('testScrollStatic0009 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0010
     * @tc.name     testScrollStatic0010
     * @tc.desc     testScrollStatic0010
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0010 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollStatic0010] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').tryGetElement('enablePaging')).assertEqual(undefined);
      console.info('testScrollStatic0010 END');
      done();
    });

    
    
    /**
     * @tc.number   testScrollStatic0011
     * @tc.name     testScrollStatic0011
     * @tc.desc     testScrollStatic0011
     * @tc.level    Level.LEVEL0
     */
it('testScrollStatic0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollStatic0011 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
      await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('ScrollKey1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testScrollStatic0011 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF222222");
      console.info('testScrollStatic0011 END');
      done();
    });

  })
}
