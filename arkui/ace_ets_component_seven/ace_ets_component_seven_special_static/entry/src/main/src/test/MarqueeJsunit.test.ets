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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function marqueeJsunit() {
  describe('marqueeTest', () => {
    beforeAll(() => {
        console.info("marqueeTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
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
          routerInstance.pushUrl(options);;
          await Utils.sleep(4000);
        }
      } catch (err) {
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
  })
}