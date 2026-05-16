'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
const SLEEP_TIME_S = 100;

export default function AnimationControllerTest() {
  describe('AnimationControllerTest', () => {
    beforeAll(() => {
      console.info("AnimationControllerTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AnimationControllerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/drawableDescriptor/ImageAnimationController',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AnimationControllerTest state pages:" + JSON.stringify(pages));
        if (!("ImageAnimationController" == pages.name)) {
          console.info("get AnimationControllerTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push AnimationControllerTest page error:" + err);
      }
      console.info("AnimationControllerTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("AnimationControllerTest after each called");
    });
    /**
     * @tc.number   AnimationController_static_001
     * @tc.name     AnimationController_static_001
     * @tc.desc     test the getAnimationController()?.getStatus()
     * @tc.level    Level.LEVEL1
     */
    it('AnimationController_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationController_static_001 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('animated'));
      await (button?.click() as Promise<void>);
      console.info('animated click success');
      await Utils.sleep(SLEEP_TIME_S);
      const button1 = await driver.findComponent(ON.id('Controller1'));
      await (button1?.click() as Promise<void>);
      console.info('Controller1 click success');
      await Utils.sleep(SLEEP_TIME_S);
      const button2 = await driver.findComponent(ON.id('c1status'));
      await (button2?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('getStatus');
      let obj = JSON.parseJsonElement(strJson);
      console.info('AnimationController_static_001 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('status = Initial');
      done();
    })
    /**
     * @tc.number   AnimationController_static_002
     * @tc.name     AnimationController_static_002
     * @tc.desc     test the getAnimationController()?.start()
     * @tc.level    Level.LEVEL1
     */
    it('AnimationController_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationController_static_002 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('start'));
      await (button1?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      const button2 = await driver.findComponent(ON.id('c1status'));
      await (button2?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('getStatus');
      let obj = JSON.parseJsonElement(strJson);
      console.info('AnimationController_static_002 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('status = Running');
      done();
    })
    /**
     * @tc.number   AnimationController_static_003
     * @tc.name     AnimationController_static_003
     * @tc.desc     test the getAnimationController()?.stop()
     * @tc.level    Level.LEVEL1
     */
    it('AnimationController_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationController_static_003 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('stop'));
      await (button1?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      const button2 = await driver.findComponent(ON.id('c1status'));
      await (button2?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('getStatus');
      let obj = JSON.parseJsonElement(strJson);
      console.info('AnimationController_static_003 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('status = Stopped');
      done();
    })
    /**
     * @tc.number   AnimationController_static_004
     * @tc.name     AnimationController_static_004
     * @tc.desc     test the getAnimationController()?.pause()
     * @tc.level    Level.LEVEL1
     */
    it('AnimationController_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationController_static_004 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('pause'));
      await (button1?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      const button2 = await driver.findComponent(ON.id('c1status'));
      await (button2?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('getStatus');
      let obj = JSON.parseJsonElement(strJson);
      console.info('AnimationController_static_004 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('status = Paused');
      done();
    })
    /**
     * @tc.number   AnimationController_static_005
     * @tc.name     AnimationController_static_005
     * @tc.desc     test the getAnimationController()?.resume()
     * @tc.level    Level.LEVEL1
     */
    it('AnimationController_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('AnimationController_static_005 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('resume'));
      await (button1?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      const button2 = await driver.findComponent(ON.id('c1status'));
      await (button2?.click() as Promise<void>);
      console.info('c1status click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('getStatus');
      let obj = JSON.parseJsonElement(strJson);
      console.info('AnimationController_static_005 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('status = Running');
      done();
    })
  })
}