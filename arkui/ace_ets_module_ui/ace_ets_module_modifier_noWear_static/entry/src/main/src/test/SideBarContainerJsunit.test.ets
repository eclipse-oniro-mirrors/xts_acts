'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import Utils from "../../ets/MainAbility/common/Utils";
import accessibility from '@ohos.accessibility';
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function sideBarContainerJsunit() {
  describe('sideBarContainerTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.open.harmony.modifiernowear.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sideBarContainer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sideBarContainer state pages:" + JSON.stringify(pages));
        if (!("sideBarContainer" == pages.name)) {
          console.info("get sideBarContainer pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sideBarContainer page error: " + err);
      }
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0002
     * @tc.name     sideBarContainerTest_static_0002
     * @tc.desc     sideBarContainerTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0002 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0002 component is: " + objNew.getElement('$attrs').getString('divider'));
      let objDivider = JSON.parseJsonElement(objNew.getElement('$attrs').getString('divider'));
      expect(objDivider?.getString('strokeWidth')).assertEqual("100.00vp");
      expect(objDivider?.getString('color')).assertEqual("#FFFF0000");
      expect(objDivider?.getString('startMargin')).assertEqual("100.00vp");
      expect(objDivider?.getString('endMargin')).assertEqual("100.00vp");
      console.info('sideBarContainerTest_0002 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0003
     * @tc.name     sideBarContainerTest_static_0003
     * @tc.desc     sideBarContainerTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0003 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0003 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('minContentWidth')).assertEqual("100.000000");
      console.info('sideBarContainerTest_0003 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0004
     * @tc.name     sideBarContainerTest_static_0004
     * @tc.desc     sideBarContainerTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0004 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0004 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('sideBarWidth')).assertEqual("100.000000");
      console.info('sideBarContainerTest_0004 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0005
     * @tc.name     sideBarContainerTest_static_0005
     * @tc.desc     sideBarContainerTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0005 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0005 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('minSideBarWidth')).assertEqual("100.000000");
      console.info('sideBarContainerTest_0005 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0006
     * @tc.name     sideBarContainerTest_static_0006
     * @tc.desc     sideBarContainerTest_static_0006
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0006 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0006 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('maxSideBarWidth')).assertEqual("100.000000");
      console.info('sideBarContainerTest_0006 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_0007
     * @tc.name     sideBarContainerTest_0007
     * @tc.desc     sideBarContainerTest_0007
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_static_0007 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0007 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('showSideBar')).assertEqual("true");
      console.info('sideBarContainerTest_0007 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0008
     * @tc.name     sideBarContainerTest_static_0008
     * @tc.desc     sideBarContainerTest_static_0008
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0008 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0008 component is: " + objNew.getElement('$attrs').getString('controlButton'));
      let controlButtonObj = JSON.parseJsonElement(objNew.getElement('$attrs').getString('controlButton'));
      expect(controlButtonObj.getString('left')).assertEqual("10.000000");
      expect(controlButtonObj.getString('top')).assertEqual("10.000000");
      expect(controlButtonObj.getString('width')).assertEqual("10.000000");
      expect(controlButtonObj.getString('height')).assertEqual("10.000000");
      console.info('sideBarContainerTest_0008 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0009
     * @tc.name     sideBarContainerTest_static_0009
     * @tc.desc     sideBarContainerTest_static_0009
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0009 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0009 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('showControlButton')).assertEqual("true");
      console.info('sideBarContainerTest_0009 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0010
     * @tc.name     sideBarContainerTest_static_0010
     * @tc.desc     sideBarContainerTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0010 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0010 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('autoHide')).assertEqual("false");
      console.info('sideBarContainerTest_0010 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_0011
     * @tc.name     sideBarContainerTest_0011
     * @tc.desc     sideBarContainerTest_0011
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_static_0011 START');
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0011 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('sideBarPosition')).assertEqual("SideBarPosition.Start");
      console.info('sideBarContainerTest_0011 END');
      done();
    });


    
    /**
     * @tc.number   sideBarContainerTest_static_0012
     * @tc.name     sideBarContainerTest_static_0012
     * @tc.desc     sideBarContainerTest_static_0012
     * @tc.level    Level.LEVEL0
     */
it('sideBarContainerTest_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarContainerTest_0012 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJsonNew = inspector.getInspectorByKey('sideBarContainer');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("sideBarContainerTest_0012 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('autoHide')).assertEqual("true");
      console.info('sideBarContainerTest_0012 END');
      done();
    });
  })
}