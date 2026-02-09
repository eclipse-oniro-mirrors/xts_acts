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

export default function textJsunit() {
  describe('textTest', () => {
    beforeAll(() => {
      console.info("scrollNestedScroll beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get text state success " + JSON.stringify(pages));
        if (!("text" == pages.name)) {
          console.info("get text state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push text page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   textTest_static_0001
     * @tc.name     textTest_static_0001
     * @tc.desc     textTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0001 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center")
      console.info('textTest_static_0001 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0002
     * @tc.name     textTest_static_0002
     * @tc.desc     textTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('text2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0002 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('font'))?.getString('size')).assertEqual("12.00fp")
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('font'))?.getString('weight')).assertEqual("FontWeight.Normal")
      console.info('textTest_static_0002 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0003
     * @tc.name     textTest_static_0003
     * @tc.desc     textTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0003 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0003 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('lineHeight')).assertEqual("20.00fp")
      console.info('textTest_static_0003 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0004
     * @tc.name     textTest_static_0004
     * @tc.desc     textTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0004 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0004 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual("#FF000000")
      console.info('textTest_static_0004 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0005
     * @tc.name     textTest_static_0005
     * @tc.desc     textTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0005 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0005 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.None")
      console.info('textTest_static_0005 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0006
     * @tc.name     textTest_static_0006
     * @tc.desc     textTest_static_0006
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0006 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0006 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual("10.00fp")
      console.info('textTest_static_0006 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0007
     * @tc.name     textTest_static_0007
     * @tc.desc     textTest_static_0007
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0007 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0007 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('maxLines')).assertEqual("10")
      console.info('textTest_static_0007 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0008
     * @tc.name     textTest_static_0008
     * @tc.desc     textTest_static_0008
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0008 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0008 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("10.000000")
      expect(objNew.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF0000FF")
      expect(objNew.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("50.000000")
      expect(objNew.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("35.000000")
      expect(objNew.getElement('$attrs').getElement('textShadow').getString('type')).assertEqual("0")
      console.info('textTest_static_0008 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0009
     * @tc.name     textTest_static_0009
     * @tc.desc     textTest_static_0009
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0009 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0009 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('heightAdaptivePolicy')).assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
      console.info('textTest_static_0009 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0010
     * @tc.name     textTest_static_0010
     * @tc.desc     textTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0010 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0010 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('wordBreak')).assertEqual("normal")
      console.info('textTest_static_0010 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0011
     * @tc.name     textTest_static_0011
     * @tc.desc     textTest_static_0011
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0011 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0011 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('textCase')).assertEqual("TextCase.Normal")
      console.info('textTest_static_0011 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0012
     * @tc.name     textTest_static_0012
     * @tc.desc     textTest_static_0012
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0012 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0012 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').tryGetElement('draggable')).assertEqual(undefined)
      console.info('textTest_static_0012 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0013
     * @tc.name     textTest_static_0013
     * @tc.desc     textTest_static_0013
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0013 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0013 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').tryGetElement('textIndent')).assertEqual(undefined)
      console.info('textTest_static_0013 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0014
     * @tc.name     textTest_static_0014
     * @tc.desc     textTest_static_0014
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0014 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0014 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontStyle')).assertEqual("FontStyle.Normal")
      console.info('textTest_static_0014 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0015
     * @tc.name     textTest_static_0015
     * @tc.desc     textTest_static_0015
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0015 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0015 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None")
      console.info('textTest_static_0015 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0016
     * @tc.name     textTest_static_0016
     * @tc.desc     textTest_static_0016
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0016 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0016 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Lighter")
      console.info('textTest_static_0016 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0017
     * @tc.name     textTest_static_0017
     * @tc.desc     textTest_static_0017
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0017 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0017 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontFamily')).assertEqual('fontFamily')
      console.info('textTest_static_0017 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0018
     * @tc.name     textTest_static_0018
     * @tc.desc     textTest_static_0018
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0018 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0018 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('minFontSize')).assertEqual("5.00fp")
      console.info('textTest_static_0018 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0019
     * @tc.name     textTest_static_0019
     * @tc.desc     textTest_static_0019
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0019 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0019 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('decoration'))?.getString('type')).assertEqual("TextDecorationType.None")
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('decoration'))?.getString('color')).assertEqual("#FF000000")
      console.info('textTest_static_0019 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0020
     * @tc.name     textTest_static_0020
     * @tc.desc     textTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0020 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0020 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('maxFontSize')).assertEqual("30.00fp")
      console.info('textTest_static_0020 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0021
     * @tc.name     textTest_static_0021
     * @tc.desc     textTest_static_0021
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_00061 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0021 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('letterSpacing')).assertEqual("10.00fp")
      console.info('textTest_static_0021 END');
      done();
    });

    
    
    /**
     * @tc.number   textTest_static_0022
     * @tc.name     textTest_static_0022
     * @tc.desc     textTest_static_0022
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0022 START');
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0022 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('baselineOffset')).assertEqual("100")
      console.info('textTest_static_0022 END');
      done();
    });


    
    
    /**
     * @tc.number   textTest_static_0023
     * @tc.name     textTest_static_0023
     * @tc.desc     textTest_static_0023
     * @tc.level    Level.LEVEL0
     */
it('textTest_static_0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTest_static_0023 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('text1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTest_static_0011 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('wordBreak')).assertEqual("break-all")
      console.info('textTest_static_0011 END');
      done();
    });
  })
}