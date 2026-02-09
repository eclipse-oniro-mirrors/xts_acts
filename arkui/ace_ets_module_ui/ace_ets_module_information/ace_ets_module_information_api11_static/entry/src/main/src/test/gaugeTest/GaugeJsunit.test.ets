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
import events_emitter from '@ohos.events.emitter';
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
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function gaugeJsunit() {
  describe('gaugeTest', () => {
    beforeAll(() => {
      console.info("gaugeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/gauge'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gauge page error " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("gauge after each called");
    });

    /**
     * @tc.number   testGauge_static_001
     * @tc.name     testGauge_static_001
     * @tc.desc     testGauge_static_001
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('gauge');
      console.info("[testGauge001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth')).assertEqual('20.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('200.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('200.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual('50.00');
      done()
    });

    /**
     * @tc.number   testGauge_static_002
     * @tc.name     testGauge_static_002
     * @tc.desc     testGauge_static_002
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge002] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('gaugeValue',10)
      } catch (err) {
        console.log("[testGauge002] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge002] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('value')).assertEqual('10.00');
      done()
    });

    /**
     * @tc.number   testGauge_static_003
     * @tc.name     testGauge_static_003
     * @tc.desc     testGauge_static_003
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge003] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('strokeWidthValue',"30")

      } catch (err) {
        console.log("[testGauge003] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge003] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('30.00vp');
      done()
    });

    /**
     * @tc.number   testGauge_static_004
     * @tc.name     testGauge_static_004
     * @tc.desc     testGauge_static_004
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge004] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('startAngleValue',200)

      } catch (err) {
        console.log("[testGauge004] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('gauge');

      console.info("[testGauge004] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('startAngle')).assertEqual('200.00');
      done()
    });

    /**
     * @tc.number   testGauge_static_005
     * @tc.name     testGauge_static_005
     * @tc.desc     testGauge_static_005
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge005] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('endAngleValue',200)

      } catch (err) {
        console.log("[testGauge005] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge005] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('endAngle')).assertEqual('200.00');
      done()
    });

    /**
     * @tc.number   testGauge_static_006
     * @tc.name     testGauge_static_006
     * @tc.desc     testGauge_static_006
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge006] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('colorValues',JSON.stringify([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1]]))

      } catch (err) {
        expect().assertFail();
        console.log("[testGauge006] change component data error: " + (err as BusinessError).message);
      }
      done()
    });

    /**
     * @tc.number   testGauge_static_007
     * @tc.name     testGauge_static_007
     * @tc.desc     testGauge_static_007
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge007] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('gaugeValue',-10)

      } catch (err) {
        console.log("[testGauge007] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge007] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('value')).assertEqual('-10.00');
      done()
    });

    /**
     * @tc.number   testGauge_static_008
     * @tc.name     testGauge_static_008
     * @tc.desc     testGauge_static_008
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge008] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('strokeWidthValue','-30')

      } catch (err) {
        console.log("[testGauge008] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('gauge');

      console.info("[testGauge008] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('-30.00vp');
      done()
    });

    /**
     * @tc.number   testGauge_static_009
     * @tc.name     testGauge_static_009
     * @tc.desc     testGauge_static_009
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge009] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('startAngleValue',-10)

      } catch (err) {
        console.log("[testGauge009] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('gauge');

      console.info("[testGauge009] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('startAngle')).assertEqual('-10.00');
      done()
    });

    /**
     * @tc.number   testGauge_static_010
     * @tc.name     testGauge_static_010
     * @tc.desc     testGauge_static_010
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge010] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<number>('endAngleValue',-10)

      } catch (err) {
        console.log("[testGauge010] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('gauge');
      console.info("[testGauge010] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('endAngle')).assertEqual('-10.00');
      done()
    });

    /**
     * @tc.number   testGauge_static_011
     * @tc.name     testGauge_static_011
     * @tc.desc     testGauge_static_011
     * @tc.level    Level.LEVEL0
     */
it('testGauge_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge011] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('strokeWidthValue',"121111111")

      } catch (err) {
        console.log("[testGauge011] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('gauge');
      console.info("[testGauge011] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('121111111.00vp');
      done()
    });
  })
}
