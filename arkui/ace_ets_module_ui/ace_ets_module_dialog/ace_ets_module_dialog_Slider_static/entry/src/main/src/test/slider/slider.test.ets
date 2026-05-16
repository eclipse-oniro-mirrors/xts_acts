/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;
const LOG_CHUNK_SIZE = 500;

function logLongString(tag: string, longStr: string): void {
  let len = longStr.length;
  let part = 1;
  for (let i = 0; i < len; i += LOG_CHUNK_SIZE) {
    let end = i + LOG_CHUNK_SIZE;
    if (end > len) {
      end = len;
    }
    console.info(`${tag} [${part}] ${longStr.substring(i, end)}`);
    part++;
  }
}

export default function SliderTest() {
  describe('SliderTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SliderTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.slider_static", "EntryAbility");

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/SliderIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SliderTest state pages: " + JSON.stringify(pages));
        console.info("SliderTest state pages.name: " + pages.name);
        if (pages.name !== "SliderIndex") {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("SliderTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    beforeEach(async (): Promise<void> => {
      console.info("SliderTest beforeEach start");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SliderTest after each called");
    });

    /**
     * @tc.number SliderTest_001
     * @tc.name colorMetricsStopColor
     * @tc.desc Test ColorMetricsStop color property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorMetricsStopColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: colorMetricsStopColor START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderColorMetricsStop'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderColorMetricsStop'));
        logLongString('SliderTest: sliderColorMetricsStop node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: colorMetricsStopColor END');
        done();
      } catch (error) {
        console.error('SliderTest execute: colorMetricsStopColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderTest_002
     * @tc.name colorMetricsStopOffset
     * @tc.desc Test ColorMetricsStop offset property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorMetricsStopOffset', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: colorMetricsStopOffset START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderColorMetricsStop'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderColorMetricsStop'));
        logLongString('SliderTest: sliderColorMetricsStop node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: colorMetricsStopOffset END');
        done();
      } catch (error) {
        console.error('SliderTest execute: colorMetricsStopOffset error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderTest_003
     * @tc.name sliderStepItemAccessibilityText
     * @tc.desc Test SliderStepItemAccessibility text property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderStepItemAccessibilityText', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: sliderStepItemAccessibilityText START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderStepItemAccessibility'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderStepItemAccessibility'));
        logLongString('SliderTest: sliderStepItemAccessibility node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: sliderStepItemAccessibilityText END');
        done();
      } catch (error) {
        console.error('SliderTest execute: sliderStepItemAccessibilityText error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderTest_004
     * @tc.name sliderShowStepOptionsStepsAccessibility
     * @tc.desc Test SliderShowStepOptions stepsAccessibility property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderShowStepOptionsStepsAccessibility', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: sliderShowStepOptionsStepsAccessibility START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderShowStepOptions'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderShowStepOptions'));
        logLongString('SliderTest: sliderShowStepOptions node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: sliderShowStepOptionsStepsAccessibility END');
        done();
      } catch (error) {
        console.error('SliderTest execute: sliderShowStepOptionsStepsAccessibility error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderTest_005
     * @tc.name sliderCustomContentOptionsAccessibilityText
     * @tc.desc Test SliderCustomContentOptions accessibilityText property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderCustomContentOptionsAccessibilityText', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: sliderCustomContentOptionsAccessibilityText START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderCustomContentAccessibilityText'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderCustomContentAccessibilityText'));
        logLongString('SliderTest: sliderCustomContentAccessibilityText node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: sliderCustomContentOptionsAccessibilityText END');
        done();
      } catch (error) {
        console.error('SliderTest execute: sliderCustomContentOptionsAccessibilityText error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderTest_006
     * @tc.name sliderAttributePrefix
     * @tc.desc Test SliderAttribute prefix property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderAttributePrefix', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: sliderAttributePrefix START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderAttributePrefix'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderAttributePrefix'));
        logLongString('SliderTest: sliderAttributePrefix node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: sliderAttributePrefix END');
        done();
      } catch (error) {
        console.error('SliderTest execute: sliderAttributePrefix error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderTest_007
     * @tc.name sliderAttributeSuffix
     * @tc.desc Test SliderAttribute suffix property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderAttributeSuffix', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: sliderAttributeSuffix START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderAttributeSuffix'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderAttributeSuffix'));
        logLongString('SliderTest: sliderAttributeSuffix node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: sliderAttributeSuffix END');
        done();
      } catch (error) {
        console.error('SliderTest execute: sliderAttributeSuffix error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderTest_008
     * @tc.name sliderAttributeTrackColorMetrics
     * @tc.desc Test SliderAttribute trackColorMetrics property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderAttributeTrackColorMetrics', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderTest execute: sliderAttributeTrackColorMetrics START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderAttributeTrackColorMetrics'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderAttributeTrackColorMetrics'));
        logLongString('SliderTest: sliderAttributeTrackColorMetrics node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderTest execute: sliderAttributeTrackColorMetrics END');
        done();
      } catch (error) {
        console.error('SliderTest execute: sliderAttributeTrackColorMetrics error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
