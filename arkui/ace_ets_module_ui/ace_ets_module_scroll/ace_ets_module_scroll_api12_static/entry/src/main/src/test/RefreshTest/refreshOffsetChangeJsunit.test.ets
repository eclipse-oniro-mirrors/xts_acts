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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function refreshOffsetChangeJsunit() {
  describe('refreshOffsetChangeJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("refreshOffsetChangeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshOffsetChange',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get refreshOffsetChangeJsunit state pages: " + JSON.stringify(pages));
        if (!("refreshOffsetChange" == pages.name)) {
          console.info("get refreshOffsetChangeJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push refreshOffsetChangeJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" refreshOffsetChangeJsunit after each called");
    });

    
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0100
     * @tc.name     refreshOffsetChangeJsunit_static_0100
     * @tc.desc     refreshOffsetChangeJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Refresh_Offset2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[refreshOffsetChangeJsunit_static_0100] refreshOffset: " +
      JSON.stringify(obj.getElement('$attrs').getString('refreshOffset')));
      expect(obj.getElement('$attrs').getString('refreshOffset')).assertEqual('400.00vp');
      console.info('[refreshOffsetChangeJsunit_static_0100] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0200
     * @tc.name     refreshOffsetChangeJsunit_static_0200
     * @tc.desc     refreshOffsetChangeJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0200 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset2');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0200 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(bottom - height / 2)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('refresh_mess2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('message');
      console.info('[refreshOffsetChangeJsunit_static_0200] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0300
     * @tc.name     refreshOffsetChangeJsunit_static_0300
     * @tc.desc     refreshOffsetChangeJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0300 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset3');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0300 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 10)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(bottom)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('refresh_mess3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onOffsetChange');
      console.info('[refreshOffsetChangeJsunit_static_0300] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0400
     * @tc.name     refreshOffsetChangeJsunit_static_0400
     * @tc.desc     refreshOffsetChangeJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0400 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0400 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 10)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(bottom)).toInt());
      await CommonFunc.sleep(3000);
      let strJson1 = inspector.getInspectorByKey('refresh_mess1_1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[refreshOffsetChangeJsunit_static_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).not().assertEqual('message');

      let strJson2 = inspector.getInspectorByKey('refresh_mess1_2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[refreshOffsetChangeJsunit_static_0400] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).not().assertEqual('message');

      let strJson3 = inspector.getInspectorByKey('refresh_mess1_3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[refreshOffsetChangeJsunit_static_0400] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('onRefreshing');
      console.info('[refreshOffsetChangeJsunit_static_0400] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0500
     * @tc.name     refreshOffsetChangeJsunit_static_0500
     * @tc.desc     refreshOffsetChangeJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0500 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset2');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0500 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 10)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(bottom)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('refresh_mess2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onOffsetChange');
      console.info('[refreshOffsetChangeJsunit_static_0500] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0600
     * @tc.name     refreshOffsetChangeJsunit_static_0600
     * @tc.desc     refreshOffsetChangeJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0600 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0600 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.drag((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.1)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.25)).toInt());
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.25)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 8)).toInt());
      let strJson = inspector.getInspectorByKey('refresh_mess1_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onOffsetChange-');
      console.info('[refreshOffsetChangeJsunit_static_0600] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0700
     * @tc.name     refreshOffsetChangeJsunit_static_0700
     * @tc.desc     refreshOffsetChangeJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0700 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0700 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.1)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.7)).toInt());
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('refresh_mess1_1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[refreshOffsetChangeJsunit_static_0700] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onStateChange:3');

      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.5)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.4)).toInt());
      let strJson = inspector.getInspectorByKey('refresh_mess1_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onOffsetChange-');
      console.info('[refreshOffsetChangeJsunit_static_0700] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0800
     * @tc.name     refreshOffsetChangeJsunit_static_0800
     * @tc.desc     refreshOffsetChangeJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0800 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0800 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.1)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.5)).toInt());
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('refresh_mess1_1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[refreshOffsetChangeJsunit_static_0800] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onStateChange:3');

      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.5)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(top + height * 0.6)).toInt());
      let strJson = inspector.getInspectorByKey('refresh_mess1_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onOffsetChange+');
      console.info('[refreshOffsetChangeJsunit_static_0800] END');
      done();
    });

    
      
  
/**
     * @tc.number   refreshOffsetChangeJsunit_static_0900
     * @tc.name     refreshOffsetChangeJsunit_static_0900
     * @tc.desc     refreshOffsetChangeJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('refreshOffsetChangeJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('refreshOffsetChangeJsunit_static_0900 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('changeOrientation'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset3');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_static_0900 value is" + left + " --" + right + "--" + top + "--" +
        bottom);
      let height = bottom - top;
      let width = right - left;

      await driver.swipe((Math.round(left + width * 0.2)).toInt(), (Math.round(top + height / 10)).toInt(),
        (Math.round(left + width * 0.2)).toInt(), (Math.round(bottom)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('refresh_mess2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[refreshOffsetChangeJsunit_static_0900] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onOffsetChange');
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[refreshOffsetChangeJsunit_static_0900] END');
      done();
    });

  })
}