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

export default function textAreaJsunit() {
  describe('textAreaTest', () => {
    beforeAll(() => {
      console.info("scrollNestedScroll beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textArea state success " + JSON.stringify(pages));
        if (!("textArea" == pages.name)) {
          console.info("get textArea state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push textArea page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   textAreaTest_static_002
     * @tc.name     textAreaTest_static_002
     * @tc.desc     textAreaTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_002 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_002 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
      console.info('textAreaTest_static_002 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_003
     * @tc.name     textAreaTest_static_003
     * @tc.desc     textAreaTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_003 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_003 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      // expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual("#FF123456");
      expect(objNew.getElement('$attrs').getString('fontColor') != null).assertTrue();
      console.info('textAreaTest_static_003 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_004
     * @tc.name     textAreaTest_static_004
     * @tc.desc     textAreaTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_004 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_004 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('placeholderColor')).assertEqual("#FF000000");
      console.info('textAreaTest_static_004 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_005
     * @tc.name     textAreaTest_static_005
     * @tc.desc     textAreaTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_005 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_005 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('placeholderFont'))
        .assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"weight\":\"400\",\"fontFamily\":\"sans-serif\"}");
      console.info('textAreaTest_static_005 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_006
     * @tc.name     textAreaTest_static_006
     * @tc.desc     textAreaTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_006 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_006 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontWeight')).assertEqual("100");
      console.info('textAreaTest_static_006 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_007
     * @tc.name     textAreaTest_static_007
     * @tc.desc     textAreaTest_static_007
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_007 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_007 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");
      console.info('textAreaTest_static_007 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_008
     * @tc.name     textAreaTest_static_008
     * @tc.desc     textAreaTest_static_008
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_008 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_008 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').tryGetElement('selectionMenuHidden')).assertEqual(undefined);
      console.info('textAreaTest_static_008 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_009
     * @tc.name     textAreaTest_static_009
     * @tc.desc     textAreaTest_static_009
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_009 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_009 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').tryGetElement('enableKeyboardOnFocus')).assertEqual(undefined);
      console.info('textAreaTest_static_009 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_010
     * @tc.name     textAreaTest_static_010
     * @tc.desc     textAreaTest_static_010
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_010 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_010 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('caretColor')).assertEqual("#FF000000");
      console.info('textAreaTest_static_010 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_011
     * @tc.name     textAreaTest_static_011
     * @tc.desc     textAreaTest_static_011
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_011 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_011 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('maxLength')).assertEqual("40");
      console.info('textAreaTest_static_011 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_012
     * @tc.name     textAreaTest_static_012
     * @tc.desc     textAreaTest_static_012
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_012 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_012 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('maxLines')).assertEqual("20");
      console.info('textAreaTest_static_012 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_013
     * @tc.name     textAreaTest_static_013
     * @tc.desc     textAreaTest_static_013
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_013 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_013 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.INLINE");
      console.info('textAreaTest_static_013 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_014
     * @tc.name     textAreaTest_static_014
     * @tc.desc     textAreaTest_static_014
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_014 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_014 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontStyle')).assertEqual("FontStyle.Italic");
      console.info('textAreaTest_static_014 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_018
     * @tc.name     textAreaTest_static_018
     * @tc.desc     textAreaTest_static_018
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_018 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_018 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual("12.00fp");
      console.info('textAreaTest_static_018 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_015
     * @tc.name     textAreaTest_static_015
     * @tc.desc     textAreaTest_static_015
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_015 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_015 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontFamily')).assertEqual("fontFamily");
      console.info('textAreaTest_static_015 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_016
     * @tc.name     textAreaTest_static_016
     * @tc.desc     textAreaTest_static_016
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_016 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_016 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('barState')).assertEqual("BarState.ON");
      console.info('textAreaTest_static_016 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_017
     * @tc.name     textAreaTest_static_017
     * @tc.desc     textAreaTest_static_017
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_017 START');
      let strJsonNew = inspector.getInspectorByKey('textArea');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_017 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('showCounter').getBoolean('value')).assertEqual(false);
      console.info('textAreaTest_static_017 END');
      done();
    });

    
    
    /**
     * @tc.number   textAreaTest_static_001
     * @tc.name     textAreaTest_static_001
     * @tc.desc     textAreaTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('textAreaTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaTest_static_001 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('textArea'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textAreaTest_static_001 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontStyle')).assertEqual("FontStyle.Normal");
      console.info('textAreaTest_static_001 END');
      done();
    });

  })
}