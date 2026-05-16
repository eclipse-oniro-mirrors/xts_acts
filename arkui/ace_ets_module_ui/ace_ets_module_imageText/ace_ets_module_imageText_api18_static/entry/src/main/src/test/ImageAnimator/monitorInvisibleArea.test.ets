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

import { describe, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function monitorInvisibleAreaTest() {
  describe('monitorInvisibleAreaTest', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("monitorInvisibleAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/monitorInvisibleArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get monitorInvisibleAreaTest state pages: " + JSON.stringify(pages));
        if (!("monitorInvisibleArea" == pages.name)) {
          console.info("get monitorInvisibleAreaTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push monitorInvisibleAreaTest page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   monitorInvisibleAreaTest_static_001
     * @tc.name     monitorInvisibleAreaTest_static_001
     * @tc.desc     monitorInvisibleAreaTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('monitorInvisibleAreaTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_001 START');
      await CommonFunc.sleep(1000);
      let btnTrue: Component = await driver.findComponent(ON.id('trueFlag')) as Component;
      await btnTrue.click()
      await CommonFunc.sleep(1000);

      let scroll: Component = await driver.findComponent(ON.id('scrollFlag')) as Component;
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;

      await driver.swipe(
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.75)).toInt(),
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.25)).toInt()
      );
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      console.info("[monitorInvisibleAreaTest_001] component strJson is: " + inspector.getInspectorByKey('ImageAnimatorFlag'));
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_001] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("[monitorInvisibleAreaTest_001] component obj monitorInvisibleArea is: " +
      JSON.stringify(obj.getElement('$attrs').getString('monitorInvisibleArea')));
      expect(obj.getElement('$attrs').getString('monitorInvisibleArea')).assertEqual('true');

      let textStrJson: Component = await driver.findComponent(ON.id('textFlag')) as Component;
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_001] text: " + JSON.stringify(text));
      expect(text).assertEqual('Pause');
      console.info("[monitorInvisibleAreaTest_001] end");
      done();
    });


    
    /**
     * @tc.number   monitorInvisibleAreaTest_static_002
     * @tc.name     monitorInvisibleAreaTest_static_002
     * @tc.desc     monitorInvisibleAreaTest_static_002
     * @tc.level    Level.LEVEL1
     */
it('monitorInvisibleAreaTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_002 START');
      await CommonFunc.sleep(2000);
      let scroll: Component = await driver.findComponent(ON.id('scrollFlag')) as Component;
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;

      await driver.swipe(
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.25)).toInt(),
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.75)).toInt()
      );
      await CommonFunc.sleep(6000);

      let btnFalse: Component = await driver.findComponent(ON.id('falseFlag')) as Component;
      await btnFalse.click()
      await CommonFunc.sleep(2000);
      await driver.swipe(
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.75)).toInt(),
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.25)).toInt()
      );
      await CommonFunc.sleep(6000);

      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_002] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('monitorInvisibleArea')).assertEqual('false');

      let textStrJson: Component = await driver.findComponent(ON.id('textFlag')) as Component;
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_002] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_002] end");
      done();
    });


    
    /**
     * @tc.number   monitorInvisibleAreaTest_static_003
     * @tc.name     monitorInvisibleAreaTest_static_003
     * @tc.desc     monitorInvisibleAreaTest_static_003
     * @tc.level    Level.LEVEL1
     */
it('monitorInvisibleAreaTest_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_003 START');
      await CommonFunc.sleep(2000);
      let scroll: Component = await driver.findComponent(ON.id('scrollFlag')) as Component;
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;

      await driver.swipe(
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.25)).toInt(),
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.75)).toInt()
      );
      await CommonFunc.sleep(6000);

      let btnUndefined: Component = await driver.findComponent(ON.id('undefinedFlag')) as Component;
      await btnUndefined.click()
      await CommonFunc.sleep(2000);
      await driver.swipe(
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.75)).toInt(),
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.25)).toInt()
      );
      await CommonFunc.sleep(6000);
      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_003] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('monitorInvisibleArea')).assertEqual('false');

      let textStrJson: Component = await driver.findComponent(ON.id('textFlag')) as Component;
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_003] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_003] end");
      done();
    });


    
    /**
     * @tc.number   monitorInvisibleAreaTest_static_004
     * @tc.name     monitorInvisibleAreaTest_static_004
     * @tc.desc     monitorInvisibleAreaTest_static_004
     * @tc.level    Level.LEVEL1
     */
it('monitorInvisibleAreaTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_004 START');
      await CommonFunc.sleep(2000);
      let scroll: Component = await driver.findComponent(ON.id('scrollFlag')) as Component;
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.25)).toInt(),
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.75)).toInt()
      );
      await CommonFunc.sleep(6000);

      let btnNull: Component = await driver.findComponent(ON.id('nullFlag')) as Component;
      await btnNull.click()
      await CommonFunc.sleep(2000);
      await driver.swipe(
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.75)).toInt(),
        (Math.round(left + (right - left) * 0.5)).toInt(),
        (Math.round(top + (bottom - top) * 0.25)).toInt()
      );
      await CommonFunc.sleep(6000);
      let strJson = inspector.getInspectorByKey('ImageAnimatorFlag');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[monitorInvisibleAreaTest_004] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('monitorInvisibleArea')).assertEqual('false');

      let textStrJson: Component = await driver.findComponent(ON.id('textFlag')) as Component;
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_004] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_004] end");
      done();
    });
  })
}
