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

export default function imageAnimatorJsunit() {
  describe('imageAnimatorTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageAnimator',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageAnimator state success " + JSON.stringify(pages));
        if (!("imageAnimator" == pages.name)) {
          console.info("get imageAnimator state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push imageAnimator page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0001
     * @tc.name     imageAnimatorTest_static_0001
     * @tc.desc     imageAnimatorTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('iterations')).assertEqual("1");
      console.info('imageAnimatorTest_static_0001 END');
      done();
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0002
     * @tc.name     imageAnimatorTest_static_0002
     * @tc.desc     imageAnimatorTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0002 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fillMode')).assertEqual('FillMode.None');
      console.info('imageAnimatorTest_static_0002 END');
      done();
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0003
     * @tc.name     imageAnimatorTest_static_0003
     * @tc.desc     imageAnimatorTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0003 START');
      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0003 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fixedSize')).assertEqual('true');
      console.info('imageAnimatorTest_static_0003 END');
      done();
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0004
     * @tc.name     imageAnimatorTest_static_0004
     * @tc.desc     imageAnimatorTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0004 START');
      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0004 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('reverse')).assertEqual('true');
      console.info('imageAnimatorTest_static_0004 END');
      done();
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0005
     * @tc.name     imageAnimatorTest_static_0005
     * @tc.desc     imageAnimatorTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0005 START');
      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0005 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('duration')).assertEqual("2000");
      console.info('imageAnimatorTest_static_0005 END');
      done();
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0006
     * @tc.name     imageAnimatorTest_static_0006
     * @tc.desc     imageAnimatorTest_static_0006
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0006 START');
      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0006 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('state')).assertEqual('AnimationStatus.Initial');
      console.info('imageAnimatorTest_static_0006 END');
      done();
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0007
     * @tc.name     imageAnimatorTest_static_0007
     * @tc.desc     imageAnimatorTest_static_0007
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0007 START');
      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0007 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('images'))
        .assertEqual('[{\"src\":\"resource:///16777250.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"},{\"src\":\"resource:///16777251.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"},{\"src\":\"resource:///16777252.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"},{\"src\":\"resource:///16777253.jpg\",\"left\":\"0.00vp\",\"top\":\"0.00vp\",\"width\":\"0.00vp\",\"height\":\"0.00vp\",\"duration\":\"0\"}]');
      console.info('imageAnimatorTest_static_0007 END');
      done();
    });

    
    
    /**
     * @tc.number   imageAnimatorTest_static_0008
     * @tc.name     imageAnimatorTest_static_0008
     * @tc.desc     imageAnimatorTest_static_0008
     * @tc.level    Level.LEVEL0
     */
it('imageAnimatorTest_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('imageAnimatorTest_static_0008 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
      await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('imageAnimator');

      console.info("imageAnimatorTest_static_0008 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('iterations')).assertEqual("1");
      console.info('imageAnimatorTest_static_0008 END');
      done();
    });
  })
}