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
import bundle from '@ohos.bundle.bundleManager';

export default function spanJsunit() {
  describe('spanTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get span state success " + JSON.stringify(pages));
        if (!("span" == pages.name)) {
          console.info("get span pages success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push span page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   test_span_static_001
     * @tc.name     test_span_static_001
     * @tc.desc     test_span_static_001
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_001] START');
      let strJson = inspector.getInspectorByKey('SpanKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_001] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual('0.00fp');
      console.info('[test_span_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_002
     * @tc.name     test_span_static_002
     * @tc.desc     test_span_static_002
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_002] START');
      let strJson = inspector.getInspectorByKey('SpanKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_002] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      console.info('[test_span_static_002] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_003
     * @tc.name     test_span_static_003
     * @tc.desc     test_span_static_003
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_003] START');
      let strJson = inspector.getInspectorByKey('SpanKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_003] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('0.00fp');
      console.info('[test_span_static_003] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_004
     * @tc.name     test_span_static_004
     * @tc.desc     test_span_static_004
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_004] START');
      let strJson = inspector.getInspectorByKey('SpanKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_004] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      let mDecoration = JSON.parseJsonElement(obj.getElement('$attrs').getString('decoration'));
      expect(mDecoration.getString('type')).assertEqual('TextDecorationType.LineThrough');
      console.info('[test_span_static_004] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_005
     * @tc.name     test_span_static_005
     * @tc.desc     test_span_static_005
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_005] START');
      let strJson = inspector.getInspectorByKey('SpanKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_005] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF808080');
      console.info('[test_span_static_005] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_006
     * @tc.name     test_span_static_006
     * @tc.desc     test_span_static_006
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_006] START');
      let strJson = inspector.getInspectorByKey('SpanKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_006] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      let mFont =JSON.parseJsonElement(obj.getElement('$attrs').getString('font'));
      expect(mFont.getString('size')).assertEqual('40.00fp');
      console.info('[test_span_static_006] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_007
     * @tc.name     test_span_static_007
     * @tc.desc     test_span_static_007
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_007] START');
      let strJson = inspector.getInspectorByKey('SpanKey2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_007] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual("fontFamily");
      console.info('[test_span_static_007] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_008
     * @tc.name     test_span_static_008
     * @tc.desc     test_span_static_008
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_008] START');
      let strJson = inspector.getInspectorByKey('SpanKey2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_008] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');

      console.info('[test_span_static_008] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_009
     * @tc.name     test_span_static_009
     * @tc.desc     test_span_static_009
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_009] START');
      let strJson = inspector.getInspectorByKey('SpanKey2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_009] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');
      console.info('[test_span_static_009] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_010
     * @tc.name     test_span_static_010
     * @tc.desc     test_span_static_010
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_span_static_010] START');
      let strJson = inspector.getInspectorByKey('SpanKey2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_span_static_010] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      console.info('[test_span_static_010] END');
      done();
    });

    
    
    /**
     * @tc.number   test_span_static_011
     * @tc.name     test_span_static_011
     * @tc.desc     test_span_static_011
     * @tc.level    Level.LEVEL0
     */
it('test_span_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('test_span_static_011 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('SpanKey2');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("test_span_static_011 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      console.info('test_span_static_011 END');
      done();
    });
  })
}