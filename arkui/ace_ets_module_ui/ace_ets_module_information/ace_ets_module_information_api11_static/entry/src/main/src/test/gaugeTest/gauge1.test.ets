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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function gaugeColorsJsunit() {
  describe('gaugeColorsTest', () => {
    beforeAll(() => {
      console.info("gaugeColorsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/gauge1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge1" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gauge page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("gaugeColors after each called");
    });

    
    /**
     * @tc.number   testgaugeColors_static_0001
     * @tc.name     testgaugeColors_static_0001
     * @tc.desc     testgaugeColors_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testgaugeColors_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("200.00vp");
      console.info("[testgaugeColors0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
  done()
    });

    
    /**
     * @tc.number   testgaugeColors_static_0002
     * @tc.name     testgaugeColors_static_0002
     * @tc.desc     testgaugeColors_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testgaugeColors_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("200.00vp");
      console.info("[testgaugeColors0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));
  done()
    });

    
    /**
     * @tc.number   testgaugeColors_static_0003
     * @tc.name     testgaugeColors_static_0003
     * @tc.desc     testgaugeColors_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testgaugeColors_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors0003] component startAngle strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startAngle')).assertEqual("210.00");
      console.info("[testgaugeColors0003] startAngle value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startAngle'));
  done()
    });

    
    /**
     * @tc.number   testgaugeColors_static_0004
     * @tc.name     testgaugeColors_static_0004
     * @tc.desc     testgaugeColors_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testgaugeColors_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors0004] component endAngle strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('endAngle')).assertEqual("150.00");
      console.info("[testgaugeColors0004] endAngle value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('endAngle'));
  done()
    });

    
    /**
     * @tc.number   testgaugeColors_static_0005
     * @tc.name     testgaugeColors_static_0005
     * @tc.desc     testgaugeColors_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testgaugeColors_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors0005] component strokeWidth strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth')).assertEqual("20.00vp");
      console.info("[testgaugeColors0005] strokeWidth value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
  done()
    });

    
    /**
     * @tc.number   testgaugeColors_static_0006
     * @tc.name     testgaugeColors_static_0006
     * @tc.desc     testgaugeColors_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testgaugeColors_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gaugeColors testgaugeColors0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Gauge');
      console.info("[testgaugeColors0006] component colors strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors'))
        .assertEqual('[[[["#FF317AF7","0.000000"]],1],[[["#FF5BA854","0.000000"]],1],[[["#FFE08C3A","0.000000"]],1],[[["#FF9C554B","0.000000"]],1],[[["#FFD94838","0.000000"]],1]]');
      console.info("[testgaugeColors0006] colors value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors'));
  done()
    });
  })
}
