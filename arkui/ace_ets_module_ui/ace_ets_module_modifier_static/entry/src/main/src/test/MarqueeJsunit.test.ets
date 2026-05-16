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

export default function marqueeJsunit() {
  describe('marqueeTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/marquee',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get marquee state success " + JSON.stringify(pages));
        if (!("marquee" == pages.name)) {
          console.info("get marquee state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);

        }
      } catch (err) {
        console.error("push marquee page error " + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   testMarquee_static_04001
     * @tc.name     testMarquee_static_04001
     * @tc.desc     testMarquee_static_04001
     * @tc.level    Level.LEVEL0
     */
it('testMarquee_static_04001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_04001 START');
      let strJsonNew = inspector.getInspectorByKey('MarqueeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF00FFFF');
      console.info('testMarquee_static_04001 END');
      done();
    });

    
    
    /**
     * @tc.number   testMarquee_static_04002
     * @tc.name     testMarquee_static_04002
     * @tc.desc     testMarquee_static_04002
     * @tc.level    Level.LEVEL0
     */
it('testMarquee_static_04002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_04002 START');
      let strJsonNew = inspector.getInspectorByKey('MarqueeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('35.00fp');
      console.info('testMarquee_static_04002 END');
      done();
    });

    
    
    /**
     * @tc.number   testMarquee_static_04003
     * @tc.name     testMarquee_static_04003
     * @tc.desc     testMarquee_static_04003
     * @tc.level    Level.LEVEL0
     */
it('testMarquee_static_04003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_04003 START');
      let strJsonNew = inspector.getInspectorByKey('MarqueeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      expect(obj.getElement('$attrs').getString('allowScale')).assertEqual('true');
      console.info('testMarquee_static_04003 END');
      done();
    });

    
    
    /**
     * @tc.number   testMarquee_static_04004
     * @tc.name     testMarquee_static_04004
     * @tc.desc     testMarquee_static_04004
     * @tc.level    Level.LEVEL0
     */
it('testMarquee_static_04004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_04004 START');
      let strJsonNew = inspector.getInspectorByKey('MarqueeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('500');
      console.info('testMarquee_static_04004 END');
      done();
    });

    
    
    /**
     * @tc.number   testMarquee_static_04005
     * @tc.name     testMarquee_static_04005
     * @tc.desc     testMarquee_static_04005
     * @tc.level    Level.LEVEL0
     */
it('testMarquee_static_04005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_04005 START');
      let strJsonNew = inspector.getInspectorByKey('MarqueeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('medium');
      console.info('testMarquee_static_04005 END');
      done();
    });
    
    
    /**
     * @tc.number   testMarquee_static_04006
     * @tc.name     testMarquee_static_04006
     * @tc.desc     testMarquee_static_04006
     * @tc.level    Level.LEVEL0
     */
it('testMarquee_static_04006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_04006 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('MarqueeKey1'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testMarquee_static_04006 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual('5.00fp'); //
      console.info('testMarquee_static_04006 END');
      done();
    });
  })
}