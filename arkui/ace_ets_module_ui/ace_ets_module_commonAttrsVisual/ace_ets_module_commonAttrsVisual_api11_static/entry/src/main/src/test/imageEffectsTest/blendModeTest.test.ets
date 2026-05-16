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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function blendModeTest() {
  describe('blendModeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("blendModeTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("blendModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/blendMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get blendModeTest state pages:" + JSON.stringify(pages));
        if (!("blendMode" == pages.name)) {
          console.info("get blendModeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push blendModeTest page error:" + err);
      }
      console.info("blendModeTest beforeEach end");
    });


    
    
/**
     * @tc.number   blendModeTest_static_0100
     * @tc.name     blendModeTest_static_0100
     * @tc.desc     blendModeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column0');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0100] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0100] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0100] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(0);
      console.info('[blendModeTest_0100] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0200
     * @tc.name     blendModeTest_static_0200
     * @tc.desc     blendModeTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column1');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0200] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0200] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0200] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(1);
      console.info('[blendModeTest_0200] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0030
     * @tc.name     blendModeTest_static_0030
     * @tc.desc     blendModeTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_static_0030 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column2');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_static_0030] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_static_0030] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_static_0030] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(2);
      console.info('[blendModeTest_static_0030] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0400
     * @tc.name     blendModeTest_static_0400
     * @tc.desc     blendModeTest_static_0400
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column3');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0400] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0400] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0400] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(3);
      console.info('[blendModeTest_0400] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0500
     * @tc.name     blendModeTest_static_0500
     * @tc.desc     blendModeTest_static_0500
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column4');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0500] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0500] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0500] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(4);
      console.info('[blendModeTest_0500] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0600
     * @tc.name     blendModeTest_static_0600
     * @tc.desc     blendModeTest_static_0600
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column5');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0600] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0600] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0600] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(5);
      console.info('[blendModeTest_0600] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0700
     * @tc.name     blendModeTest_static_0700
     * @tc.desc     blendModeTest_static_0700
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column6');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0700] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0700] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0700] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(6);
      console.info('[blendModeTest_0700] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0800
     * @tc.name     blendModeTest_static_0800
     * @tc.desc     blendModeTest_static_0800
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column7');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0800] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0800] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0800] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(7);
      console.info('[blendModeTest_0800] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0900
     * @tc.name     blendModeTest_static_0900
     * @tc.desc     blendModeTest_static_0900
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column8');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0900] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0900] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0900] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(8);
      console.info('[blendModeTest_0900] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0101
     * @tc.name     blendModeTest_static_0101
     * @tc.desc     blendModeTest_static_0101
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0101', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_static_0101 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column9');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_static_0101] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_static_0101] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_static_0101] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(9);
      console.info('[blendModeTest_static_0101] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0110
     * @tc.name     blendModeTest_static_0110
     * @tc.desc     blendModeTest_static_0110
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_static_0110 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column10');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_static_0110] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_static_0110] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_static_0110] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(10);
      console.info('[blendModeTest_static_0110] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0120
     * @tc.name     blendModeTest_static_0120
     * @tc.desc     blendModeTest_static_0120
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column11');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0120] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0120] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0120] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(11);
      console.info('[blendModeTest_0120] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0130
     * @tc.name     blendModeTest_static_0130
     * @tc.desc     blendModeTest_static_0130
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0130', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column12');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0130] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0130] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0130] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(12);
      console.info('[blendModeTest_0130] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0140
     * @tc.name     blendModeTest_static_0140
     * @tc.desc     blendModeTest_static_0140
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0140', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column13');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0140] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0140] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0140] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(13);
      console.info('[blendModeTest_0140] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0150
     * @tc.name     blendModeTest_static_0150
     * @tc.desc     blendModeTest_static_0150
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0150', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column14');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0150] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0150] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0150] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(14);
      console.info('[blendModeTest_0150] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0160
     * @tc.name     blendModeTest_static_0160
     * @tc.desc     blendModeTest_static_0160
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0160', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column15');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0160] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0160] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0160] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(15);
      console.info('[blendModeTest_0160] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0170
     * @tc.name     blendModeTest_static_0170
     * @tc.desc     blendModeTest_static_0170
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0170', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column16');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0170] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0170] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0170] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(16);
      console.info('[blendModeTest_0170] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0180
     * @tc.name     blendModeTest_static_0180
     * @tc.desc     blendModeTest_static_0180
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0180', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column17');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0180] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0180] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0180] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(17);
      console.info('[blendModeTest_0180] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0190
     * @tc.name     blendModeTest_static_0190
     * @tc.desc     blendModeTest_static_0190
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0190', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column18');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0190] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0190] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0190] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(18);
      console.info('[blendModeTest_0190] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0201
     * @tc.name     blendModeTest_static_0201
     * @tc.desc     blendModeTest_static_0201
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0201', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_static_0201 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column19');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_static_0201] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_static_0201] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_static_0201] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(19);
      console.info('[blendModeTest_static_0201] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0210
     * @tc.name     blendModeTest_static_0210
     * @tc.desc     blendModeTest_static_0210
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0210', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column20');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0210] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0210] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0210] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(20);
      console.info('[blendModeTest_0210] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0220
     * @tc.name     blendModeTest_static_0220
     * @tc.desc     blendModeTest_static_0220
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0220', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column21');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0220] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0220] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0220] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(21);
      console.info('[blendModeTest_0220] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0230
     * @tc.name     blendModeTest_static_0230
     * @tc.desc     blendModeTest_static_0230
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0230', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column22');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0230] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0230] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0230] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(22);
      console.info('[blendModeTest_0230] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0240
     * @tc.name     blendModeTest_static_0240
     * @tc.desc     blendModeTest_static_0240
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0240', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column23');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0240] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0240] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0240] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(23);
      console.info('[blendModeTest_0240] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0250
     * @tc.name     blendModeTest_static_0250
     * @tc.desc     blendModeTest_static_0250
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0250', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column24');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0250] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0250] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0250] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(24);
      console.info('[blendModeTest_0250] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0260
     * @tc.name     blendModeTest_static_0260
     * @tc.desc     blendModeTest_static_0260
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0260', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column25');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0260] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0260] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0260] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(25);
      console.info('[blendModeTest_0260] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0270
     * @tc.name     blendModeTest_static_0270
     * @tc.desc     blendModeTest_static_0270
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0270', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column26');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0270] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0270] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0270] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(26);
      console.info('[blendModeTest_0270] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0280
     * @tc.name     blendModeTest_static_0280
     * @tc.desc     blendModeTest_static_0280
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0280', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column27');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0280] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0280] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0280] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(27);
      console.info('[blendModeTest_0280] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0290
     * @tc.name     blendModeTest_static_0290
     * @tc.desc     blendModeTest_static_0290
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0290', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column28');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0290] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0290] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0290] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(28);
      console.info('[blendModeTest_0290] END');
      done();
    });

    
    
/**
     * @tc.number   blendModeTest_static_0300
     * @tc.name     blendModeTest_static_0300
     * @tc.desc     blendModeTest_static_0300
     * @tc.level    Level.LEVEL2
     */
it('blendModeTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('blendModeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blend_column29');
      await CommonFunc.sleep(1000);
      console.info("[blendModeTest_0300] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[blendModeTest_0300] component JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[blendModeTest_0300] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(29);
      console.info('[blendModeTest_0300] END');
      done();
    });
  })
}

