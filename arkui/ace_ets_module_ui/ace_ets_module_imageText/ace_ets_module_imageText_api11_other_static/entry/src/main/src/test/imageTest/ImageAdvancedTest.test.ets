'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ImageAdvancedTest() {

  describe('ImageAdvancedTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    const routerPush = async (target: string) => {
      let options: router.RouterOptions = {
        url: `MainAbility/pages/image/imageAdvanced/${target}`,
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        if (!(target == pages.name)) {
          console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info(`push ${target} page result:` + JSON.stringify(result));
        }

      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }

    beforeEach(async (): Promise<void> => {

    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("after each called");
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050] START');
      await routerPush("imageAltBase64")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('loadingResultAlt');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050] component obj is: " + JSON.stringify(obj));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050] obj.getElement('$attrs').getString('content') is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('success');
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050] END');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] START');
      await routerPush("image01")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentOffsetX01');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] UIContext.resolveUIContext()!.vp2px(1): " + UIContext.resolveUIContext()!.vp2px(1));
      let strJson2 = inspector.getInspectorByKey('contentOffsetY01');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      let strJson3 = inspector.getInspectorByKey('contentHeight01');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] component obj3 is: " + JSON.stringify(obj3));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] obj3.getElement('$attrs').getString('content') is: " + obj3.getElement('$attrs').getString('content'));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(1)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(1)) <= 1).assertTrue();
      expect(Math.abs(Number(obj3.getElement('$attrs').getString('content'))) >= 97).assertTrue();
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] END');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290] START');
      await routerPush("image02")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentHeight02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content'))) >= 297).assertTrue();
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300] START');
      await routerPush("image03")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentHeight03');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300] UIContext.resolveUIContext()!.vp2px(80): " + UIContext.resolveUIContext()!.vp2px(80));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX03');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300] UIContext.resolveUIContext()!.vp2px(10): " + UIContext.resolveUIContext()!.vp2px(10));
      let round = Math.round(UIContext.resolveUIContext()!.vp2px(10))
      let vp2px10 = Math.abs(UIContext.resolveUIContext()!.vp2px(10) - round) < 0.001 ? round : Math.floor(UIContext.resolveUIContext()!.vp2px(10))
      let contentHeigt = Number(obj1.getElement('$attrs').getString('content'))
      let imageContentHeight = UIContext.resolveUIContext()!.vp2px(100) - vp2px10 * 2
      expect(Math.abs(contentHeigt - imageContentHeight) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310] START');
      await routerPush("image04")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentHeight04');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310] UIContext.resolveUIContext()!.vp2px(60): " + UIContext.resolveUIContext()!.vp2px(60));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX04');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310] UIContext.resolveUIContext()!.vp2px(20): " + UIContext.resolveUIContext()!.vp2px(20));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(60)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(20)) <= 1).assertTrue();
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320] START');
      await routerPush("image05")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentHeight05');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320] UIContext.resolveUIContext()!.vp2px(80): " + UIContext.resolveUIContext()!.vp2px(80));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX05');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320] UIContext.resolveUIContext()!.vp2px(10): " + UIContext.resolveUIContext()!.vp2px(10));
      let round = Math.round(UIContext.resolveUIContext()!.vp2px(10))
      let vp2px10 = Math.abs(UIContext.resolveUIContext()!.vp2px(10) - round) < 0.001 ? round : Math.floor(UIContext.resolveUIContext()!.vp2px(10))
      let contentHeigt = Number(obj1.getElement('$attrs').getString('content'))
      let imageContentHeight = UIContext.resolveUIContext()!.vp2px(100) - vp2px10 * 2
      expect(Math.abs(contentHeigt - imageContentHeight) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330] START');
      await routerPush("image06")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentHeight06');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330] UIContext.resolveUIContext()!.vp2px(60): " + UIContext.resolveUIContext()!.vp2px(60));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX06');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330] UIContext.resolveUIContext()!.vp2px(20): " + UIContext.resolveUIContext()!.vp2px(20));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(60)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(20)) <= 1).assertTrue();
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340] START');
      await routerPush("image07")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentHeight07');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340] UIContext.resolveUIContext()!.vp2px(100): " + UIContext.resolveUIContext()!.vp2px(100));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX07');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - UIContext.resolveUIContext()!.vp2px(0)) <= 1).assertTrue();
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350] START');
      await routerPush("image08")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentOffsetY08');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      let strJson2 = inspector.getInspectorByKey('contentOffsetX08');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360] START');
      await routerPush("image09")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult09');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370] START');
      await routerPush("image10")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult10');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380] START');
      await routerPush("imageBase64")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResultBase64');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] START');
      await routerPush("image14")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingJpg14');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      let strJson2 = inspector.getInspectorByKey('loadingPng14');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertContain('success');
      let strJson3 = inspector.getInspectorByKey('loadingBmp14');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] component obj3 is: " + JSON.stringify(obj3));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] obj3.getElement('$attrs').getString('content') is: " + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertContain('success');
      let strJson4 = inspector.getInspectorByKey('loadingSvg14');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] component obj4 is: " + JSON.stringify(obj4));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] obj4.getElement('$attrs').getString('content') is: " + obj4.getElement('$attrs').getString('content'));
      expect(obj4.getElement('$attrs').getString('content')).assertContain('success');
      let strJson5 = inspector.getInspectorByKey('loadingGif14');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] component obj5 is: " + JSON.stringify(obj5));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420] obj5.getElement('$attrs').getString('content') is: " + obj5.getElement('$attrs').getString('content'));
      expect(obj5.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430] START');
      await routerPush("image15")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult15');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440] START');
      await routerPush("image16")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult16');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });
  })
}
