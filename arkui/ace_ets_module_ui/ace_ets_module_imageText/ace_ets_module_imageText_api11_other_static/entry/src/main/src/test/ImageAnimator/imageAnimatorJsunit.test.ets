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

import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
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
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AnimationStatus, FillMode } from '@ohos.arkui.component';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const waitUiReadyMs = 1000;

export default function imageAniamtorJsunit() {
  describe('imageAniamtorJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageAniamtorJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/imageAnimator',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageAniamtorJsunit state pages:" + JSON.stringify(pages));
        if (!("imageAnimator" == pages.name)) {
          console.info("get imageAniamtorJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageAniamtorJsunit page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push imageAniamtorJsunit page error:" + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   imageAniamtorJsunit_static_0100
     * @tc.name     imageAniamtorJsunit_static_0100
     * @tc.desc     imageAniamtorJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[imageAnimatorJsunit_0100] START');
      await CommonFunc.sleep(1000);
      // get the text imageAnimator component and test attribute
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageAnimatorJsunit_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[imageAnimatorJsunit_0100] images: ' + obj.getElement('$attrs').getString('images'))
      console.info('[imageAnimatorJsunit_0100] state: ' + obj.getElement('$attrs').getString('state'))
      console.info('[imageAnimatorJsunit_0100] duration: ' + obj.getElement('$attrs').getString('duration'))
      console.info('[imageAnimatorJsunit_0100] reverse: ' + obj.getElement('$attrs').getString('reverse'))
      console.info('[imageAnimatorJsunit_0100] fixedSize: ' + obj.getElement('$attrs').getString('fixedSize'))
      console.info('[imageAnimatorJsunit_0100] fillMode: ' + obj.getElement('$attrs').getString('fillMode'))
      console.info('[imageAnimatorJsunit_0100] iterations: ' + obj.getElement('$attrs').getString('iterations'))
      expect(obj.getElement('$attrs').getString('images'))
        .assertEqual('[{"src":"resource://RAWFILE/img1.png","left":"20.00vp","top":"20.00vp","width":"20.00vp","height":"20.00vp","duration":"0"},{"src":"resource://RAWFILE/img2.png","left":"20.00vp","top":"20.00vp","width":"30.00vp","height":"20.00vp","duration":"0"},{"src":"resource://RAWFILE/img3.png","left":"20.00vp","top":"20.00vp","width":"20.00vp","height":"20.00vp","duration":"0"}]');
      expect(obj.getElement('$attrs').getString('state')).assertEqual('AnimationStatus.Initial');
      expect(obj.getElement('$attrs').getString('reverse')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('fixedSize')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('fillMode')).assertEqual('FillMode.None');
      expect(obj.getElement('$attrs').getString('iterations')).assertEqual('1');
      expect(obj.getElement('$attrs').getString('duration')).assertEqual('2000');
      console.info('[imageAnimatorJsunit_0100] END');
      done();
    });

    
/**
     * @tc.number   imageAniamtorJsunit_static_0200
     * @tc.name     imageAniamtorJsunit_static_0200
     * @tc.desc     imageAniamtorJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[imageAniamtorJsunit_static_0200] START');
      // test the enum of state of animator
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<AnimationStatus>('state', AnimationStatus.Running);
      await CommonFunc.sleep(800);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageAniamtorJsunit_static_0200] component obj is: ' + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual('AnimationStatus.Running');
      AppStorage.setOrCreate<AnimationStatus>('state', AnimationStatus.Paused);
      await CommonFunc.sleep(800);
      let strJson2 = inspector.getInspectorByKey('imageAnimator');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[imageAniamtorJsunit_static_0200] component obj2 is: ' + obj2.getElement('$attrs').getString('state'));
      expect(obj2.getElement('$attrs').getString('state')).assertEqual('AnimationStatus.Paused');
      AppStorage.setOrCreate<AnimationStatus>('state', AnimationStatus.Stopped);
      await CommonFunc.sleep(800);
      let strJson3 = inspector.getInspectorByKey('imageAnimator');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[imageAniamtorJsunit_static_0200] component obj3 is: ' + obj3.getElement('$attrs').getString('state'));
      expect(obj3.getElement('$attrs').getString('state')).assertEqual('AnimationStatus.Stopped');
      console.info('[imageAniamtorJsunit_static_0200] END');
      done();
    });

    
/**
     * @tc.number   imageAniamtorJsunit_static_0300
     * @tc.name     imageAniamtorJsunit_static_0300
     * @tc.desc     imageAniamtorJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAniamtorJsunit_static_0300 START');
      // test the illegal value of imageAnimator
      await CommonFunc.sleep(1000);
      //1.2强类型，不能赋值state数字
      AppStorage.setOrCreate<AnimationStatus>('state', AnimationStatus.Initial);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAniamtorJsunit_static_0300 component obj is: ' + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual('AnimationStatus.Initial');
      done();
    });

    
/**
     * @tc.number   imageAniamtorJsunit_static_0400
     * @tc.name     imageAniamtorJsunit_static_0400
     * @tc.desc     imageAniamtorJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAniamtorJsunit_static_0400 START');
      // test the value of FillMode
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<FillMode>('fillMode', FillMode.Forwards);
      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAniamtorJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getString('fillMode'));
      expect(obj.getElement('$attrs').getString('fillMode')).assertEqual('FillMode.Forwards');
      AppStorage.setOrCreate<FillMode>('fillMode', FillMode.Backwards);
      await CommonFunc.sleep(5000);
      let strJson2 = inspector.getInspectorByKey('imageAnimator');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageAniamtorJsunit_static_0400 component obj2 is: ' + obj2.getElement('$attrs').getString('fillMode'));
      expect(obj2.getElement('$attrs').getString('fillMode')).assertEqual('FillMode.Backwards');
      AppStorage.setOrCreate<FillMode>('fillMode', FillMode.Both);
      await CommonFunc.sleep(5000);
      let strJson3 = inspector.getInspectorByKey('imageAnimator');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('imageAniamtorJsunit_static_0400 component obj3 is: ' + obj3.getElement('$attrs').getString('fillMode'));
      expect(obj3.getElement('$attrs').getString('fillMode')).assertEqual('FillMode.Both');
      done();
    });

    
/**
     * @tc.number   imageAniamtorJsunit_static_0500
     * @tc.name     imageAniamtorJsunit_static_0500
     * @tc.desc     imageAniamtorJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAniamtorJsunit_static_0500 START');
      // test the illegal value of imageAnimator
      await CommonFunc.sleep(1000);
      //1.2强类型，不能赋值state数字
      AppStorage.setOrCreate<FillMode>('fillMode', FillMode.Forwards);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAniamtorJsunit_static_0500 component obj is: ' + obj.getElement('$attrs').getString('fillMode'));
      expect(obj.getElement('$attrs').getString('fillMode')).assertEqual('FillMode.Forwards');
      done();
    });

    
/**
     * @tc.number   imageAniamtorJsunit_static_0600
     * @tc.name     imageAniamtorJsunit_static_0600
     * @tc.desc     imageAniamtorJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[imageAniamtorJsunit_static_0600] START');
      // test the boolean attribute  of imageAnimator
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<int>('duration', 700);
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<boolean>('reverse', true);
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<boolean>('fixedSize', false);
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<int>('iterations', 2);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageAniamtorJsunit_static_0600] component obj is: ' + obj.getElement('$attrs').getString('duration')
        + "---" + obj.getElement('$attrs').getString('reverse') + "---" + obj.getElement('$attrs').getString('fixedSize') + "----" + obj.getElement('$attrs').getString('iterations'));
      expect(obj.getElement('$attrs').getString('duration')).assertEqual('700');
      expect(obj.getElement('$attrs').getString('reverse')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('fixedSize')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('iterations')).assertEqual('2');
      console.info('[imageAniamtorJsunit_static_0600] END');
      done();
    });


    
/**
     * @tc.number   imageAniamtorJsunit_static_0700
     * @tc.name     imageAniamtorJsunit_static_0700
     * @tc.desc     imageAniamtorJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAniamtorJsunit_static_0700 START');
      // test the image event start and Finish
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('start'));
      await CommonFunc.sleep(1000);
      expect(btn != null).assertTrue();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('t1');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[imageAniamtorJsunit_static_0700] obj: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('start');
      await CommonFunc.sleep(3000);
      let strJson1 = inspector.getInspectorByKey('t5');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[imageAniamtorJsunit_static_0700] obj1: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onFinish');
      console.info('imageAniamtorJsunit_static_0700 END');
      done();
    });


    
/**
     * @tc.number   imageAniamtorJsunit_static_0800
     * @tc.name     imageAniamtorJsunit_static_0800
     * @tc.desc     imageAniamtorJsunit_static_0800
     * @tc.level    Level.LEVEL1
     */
it('imageAniamtorJsunit_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAniamtorJsunit_static_0370 START');
      // test the image event of pause and repeat
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('infinite'));
      await CommonFunc.sleep(1000);
      expect(btn != null).assertTrue();
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('start'));
      expect(btn2 != null).assertTrue();
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('t3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAnimatorJsunit_0800 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onRepeat');

      let btn3 = await driver.findComponent(ON.id('pause'));
      expect(btn3 != null).assertTrue();
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('t2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageAnimatorJsunit_0800 component obj2 is: ' + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('pause');
      done();
    });
  })
}