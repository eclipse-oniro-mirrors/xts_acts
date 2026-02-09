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


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;



export default function RenderFitJsunit() {
  describe('RenderFitJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RenderFitJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/RenderFit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RenderFitJsunit state pages:" + JSON.stringify(pages));
        if (!("RenderFit" == pages.name)) {
          console.info("get RenderFitJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RenderFitJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push RenderFitJsunit page error: " + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   RenderFitJsunit_static_0100
     * @tc.name     RenderFitJsunit_static_0100
     * @tc.desc     RenderFitJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('LEFT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0100] LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.LEFT');
      console.info('[RenderFitJsunit_static_0100] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0200
     * @tc.name     RenderFitJsunit_static_0200
     * @tc.desc     RenderFitJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0200] START');
      let strJson = inspector.getInspectorByKey('RIGHT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0200] RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RIGHT');
      console.info('[RenderFitJsunit_static_0200] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0300
     * @tc.name     RenderFitJsunit_static_0300
     * @tc.desc     RenderFitJsunit_static_0300
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0300] START');
      let strJson = inspector.getInspectorByKey('TOP_LEFT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0300] TOP_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.TOP_LEFT');
      console.info('[RenderFitJsunit_static_0300] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0400
     * @tc.name     RenderFitJsunit_static_0400
     * @tc.desc     RenderFitJsunit_static_0400
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0400] START');
      let strJson = inspector.getInspectorByKey('TOP_RIGHT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0400] TOP_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.TOP_RIGHT');
      console.info('[RenderFitJsunit_static_0400] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0500
     * @tc.name     RenderFitJsunit_static_0500
     * @tc.desc     RenderFitJsunit_static_0500
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0500] START');
      let strJson = inspector.getInspectorByKey('BOTTOM_LEFT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0500] BOTTOM_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.BOTTOM_LEFT');
      console.info('[RenderFitJsunit_static_0500] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0600
     * @tc.name     RenderFitJsunit_static_0600
     * @tc.desc     RenderFitJsunit_static_0600
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0600] START');
      let strJson = inspector.getInspectorByKey('BOTTOM_RIGHT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0600] BOTTOM_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.BOTTOM_RIGHT');
      console.info('[RenderFitJsunit_static_0600] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0700
     * @tc.name     RenderFitJsunit_static_0700
     * @tc.desc     RenderFitJsunit_static_0700
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0700] START');
      let strJson = inspector.getInspectorByKey('RESIZE_FILL');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0700] RESIZE_FILL: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RESIZE_FILL');
      console.info('[RenderFitJsunit_static_0700] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0800
     * @tc.name     RenderFitJsunit_static_0800
     * @tc.desc     RenderFitJsunit_static_0800
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0800] START');
      let strJson = inspector.getInspectorByKey('RESIZE_CONTAIN');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0800] RESIZE_CONTAIN: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RESIZE_CONTAIN');
      console.info('[RenderFitJsunit_static_0800] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_0900
     * @tc.name     RenderFitJsunit_static_0900
     * @tc.desc     RenderFitJsunit_static_0900
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_0900] START');
      let strJson = inspector.getInspectorByKey('RESIZE_CONTAIN_TOP_LEFT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_0900] RESIZE_CONTAIN_TOP_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RESIZE_CONTAIN_TOP_LEFT');
      console.info('[RenderFitJsunit_static_0900] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_1000
     * @tc.name     RenderFitJsunit_static_1000
     * @tc.desc     RenderFitJsunit_static_1000
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_1000] START');
      let strJson = inspector.getInspectorByKey('RESIZE_CONTAIN_BOTTOM_RIGHT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_1000] RESIZE_CONTAIN_BOTTOM_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RESIZE_CONTAIN_BOTTOM_RIGHT');
      console.info('[RenderFitJsunit_static_1000] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_1100
     * @tc.name     RenderFitJsunit_static_1100
     * @tc.desc     RenderFitJsunit_static_1100
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_1100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_1100] START');
      let strJson = inspector.getInspectorByKey('RESIZE_COVER');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_1100] RESIZE_COVER: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RESIZE_COVER');
      console.info('[RenderFitJsunit_static_1100] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_1200
     * @tc.name     RenderFitJsunit_static_1200
     * @tc.desc     RenderFitJsunit_static_1200
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_1200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_1200] START');
      let strJson = inspector.getInspectorByKey('RESIZE_COVER_TOP_LEFT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_1200] RESIZE_COVER_TOP_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RESIZE_COVER_TOP_LEFT');
      console.info('[RenderFitJsunit_static_1200] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_1300
     * @tc.name     RenderFitJsunit_static_1300
     * @tc.desc     RenderFitJsunit_static_1300
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_1300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_1300] START');
      let strJson = inspector.getInspectorByKey('RESIZE_COVER_BOTTOM_RIGHT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_1300] RESIZE_COVER_BOTTOM_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.RESIZE_COVER_BOTTOM_RIGHT');
      console.info('[RenderFitJsunit_static_1300] END');
      done();
    });

    
/**
     * @tc.number   RenderFitJsunit_static_1400
     * @tc.name     RenderFitJsunit_static_1400
     * @tc.desc     RenderFitJsunit_static_1400
     * @tc.level    Level.LEVEL2
     */
it('RenderFitJsunit_static_1400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_static_1400] START');
      let strJson = inspector.getInspectorByKey('RenderFit_TOP');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderFitJsunit_static_1400] TOP: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('renderFit')).assertEqual('RenderFit.TOP');
      console.info('[RenderFitJsunit_static_1400] END');
      done();
    });
  })
}
