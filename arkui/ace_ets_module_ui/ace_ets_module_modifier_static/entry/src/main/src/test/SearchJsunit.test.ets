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

export default function searchJsunit() {
  describe('searchTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/search',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search state success " + JSON.stringify(pages));
        if (!("search" == pages.name)) {
          console.info("get search state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push search page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   searchTest_static_002
     * @tc.name     searchTest_static_002
     * @tc.desc     searchTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_002 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_002 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
      console.info('searchTest_static_002 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_003
     * @tc.name     searchTest_static_003
     * @tc.desc     searchTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_003 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_003 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual("#FF4169E1");
      console.info('searchTest_static_003 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_004
     * @tc.name     searchTest_static_004
     * @tc.desc     searchTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_004 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_004 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('placeholderColor')).assertEqual("#FF4169E1");
      console.info('searchTest_static_004 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_005
     * @tc.name     searchTest_static_005
     * @tc.desc     searchTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_005 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_005 component  is: " + JSON.parseJsonElement(objNew.getElement('$attrs').getString('placeholderFont')).getString('size'));
      let markObj = JSON.parseJsonElement(objNew.getElement('$attrs').getString('placeholderFont'));
      expect(markObj.getString('size')).assertEqual("16.00fp");
      expect(markObj.getString('style')).assertEqual("FontStyle.Italic");
      console.info('searchTest_static_005 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_006
     * @tc.name     searchTest_static_006
     * @tc.desc     searchTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_006 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_006 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      let markObj = JSON.parseJsonElement(objNew.getElement('$attrs').getString('textFont'));
      expect(markObj.getString('fontSize')).assertEqual("16.00fp");
      expect(markObj.getString('fontStyle')).assertEqual("FontStyle.Italic");
      console.info('searchTest_static_006 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_007
     * @tc.name     searchTest_static_007
     * @tc.desc     searchTest_static_007
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_007 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_007 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");
      console.info('searchTest_static_007 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_008
     * @tc.name     searchTest_static_008
     * @tc.desc     searchTest_static_008
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_008 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_008 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').tryGetElement('enableKeyboardOnFocus')).assertEqual(undefined);
      console.info('searchTest_static_008 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_009
     * @tc.name     searchTest_static_009
     * @tc.desc     searchTest_static_009
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_009 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_009 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').tryGetElement('selectionMenuHidden')).assertEqual(undefined);
      console.info('searchTest_static_009 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_010
     * @tc.name     searchTest_static_010
     * @tc.desc     searchTest_static_010
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_010 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_010 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('caretStyle').getString('width')).assertEqual("3.20fp");
      expect(objNew.getElement('$attrs').getElement('caretStyle').getString('color')).assertEqual("#80FF64FF");
      console.info('searchTest_static_010 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_011
     * @tc.name     searchTest_static_011
     * @tc.desc     searchTest_static_011
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_011 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_011 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('searchIcon').getString('size')).assertEqual("15.00px");
      console.info('searchTest_static_011 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_012
     * @tc.name     searchTest_static_012
     * @tc.desc     searchTest_static_012
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_012 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_012 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('searchButton')).assertEqual("SearchText");
      console.info('searchTest_static_012 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_013
     * @tc.name     searchTest_static_013
     * @tc.desc     searchTest_static_013
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_013 START');
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_013 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('cancelButton').getString('style')).assertEqual("CancelButtonStyle.CONSTANT");
      console.info('searchTest_static_013 END');
      done();
    });

    
    
    /**
     * @tc.number   searchTest_static_001
     * @tc.name     searchTest_static_001
     * @tc.desc     searchTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('searchTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('searchTest_static_001 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('search'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("searchTest_static_001 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.InApp");
      console.info('searchTest_static_001 END');
      done();
    });
  })
}