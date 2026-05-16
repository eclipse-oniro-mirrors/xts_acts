'use static';

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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { TextAlign, AxisModel, AxisType, ResponseRegionSupportedTool, PresetFillType } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function EnumsTest() {
  describe('EnumsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('EnumsTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.common.api23.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('EnumsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Enums/Enums',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('EnumsTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'Enums') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('EnumsTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info('EnumsTest after each called');
    });

    /**
     * @tc.number EnumsTest_001
     * @tc.name textAlignLeft
     * @tc.desc Test TextAlign LEFT enum value, verify LEFT=4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAlignLeft', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: textAlignLeft START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('textAlignLeftCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(TextAlign.LEFT).assertEqual(4);
        console.info('EnumsTest execute: textAlignLeft END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: textAlignLeft error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_002
     * @tc.name textAlignRight
     * @tc.desc Test TextAlign RIGHT enum value, verify RIGHT=5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAlignRight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: textAlignRight START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('textAlignRightCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(TextAlign.RIGHT).assertEqual(5);
        console.info('EnumsTest execute: textAlignRight END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: textAlignRight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_003
     * @tc.name axisModelAbsRx
     * @tc.desc Test AxisModel ABS_RX enum value, verify ABS_RX=8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsRx', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsRx START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsRxCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_RX).assertEqual(8);
        console.info('EnumsTest execute: axisModelAbsRx END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsRx error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_004
     * @tc.name axisModelAbsRy
     * @tc.desc Test AxisModel ABS_RY enum value, verify ABS_RY=9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsRy', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsRy START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsRyCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_RY).assertEqual(9);
        console.info('EnumsTest execute: axisModelAbsRy END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsRy error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_005
     * @tc.name axisModelAbsThrottle
     * @tc.desc Test AxisModel ABS_THROTTLE enum value, verify ABS_THROTTLE=10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsThrottle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsThrottle START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsThrottleCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_THROTTLE).assertEqual(10);
        console.info('EnumsTest execute: axisModelAbsThrottle END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsThrottle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_006
     * @tc.name axisModelAbsRudder
     * @tc.desc Test AxisModel ABS_RUDDER enum value, verify ABS_RUDDER=11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsRudder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsRudder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsRudderCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_RUDDER).assertEqual(11);
        console.info('EnumsTest execute: axisModelAbsRudder END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsRudder error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_007
     * @tc.name axisModelAbsWheel
     * @tc.desc Test AxisModel ABS_WHEEL enum value, verify ABS_WHEEL=12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsWheel', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsWheel START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsWheelCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_WHEEL).assertEqual(12);
        console.info('EnumsTest execute: axisModelAbsWheel END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsWheel error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_008
     * @tc.name axisModelAbsHat1x
     * @tc.desc Test AxisModel ABS_HAT1X enum value, verify ABS_HAT1X=13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsHat1x', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsHat1x START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsHat1xCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_HAT1X).assertEqual(13);
        console.info('EnumsTest execute: axisModelAbsHat1x END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsHat1x error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_009
     * @tc.name axisModelAbsHat1y
     * @tc.desc Test AxisModel ABS_HAT1Y enum value, verify ABS_HAT1Y=14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsHat1y', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsHat1y START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsHat1yCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_HAT1Y).assertEqual(14);
        console.info('EnumsTest execute: axisModelAbsHat1y END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsHat1y error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_010
     * @tc.name axisModelAbsHat2x
     * @tc.desc Test AxisModel ABS_HAT2X enum value, verify ABS_HAT2X=15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsHat2x', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsHat2x START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsHat2xCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_HAT2X).assertEqual(15);
        console.info('EnumsTest execute: axisModelAbsHat2x END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsHat2x error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_011
     * @tc.name axisModelAbsHat2y
     * @tc.desc Test AxisModel ABS_HAT2Y enum value, verify ABS_HAT2Y=16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsHat2y', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsHat2y START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsHat2yCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_HAT2Y).assertEqual(16);
        console.info('EnumsTest execute: axisModelAbsHat2y END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsHat2y error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_012
     * @tc.name axisModelAbsHat3x
     * @tc.desc Test AxisModel ABS_HAT3X enum value, verify ABS_HAT3X=17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsHat3x', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsHat3x START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsHat3xCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_HAT3X).assertEqual(17);
        console.info('EnumsTest execute: axisModelAbsHat3x END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsHat3x error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_013
     * @tc.name axisModelAbsHat3y
     * @tc.desc Test AxisModel ABS_HAT3Y enum value, verify ABS_HAT3Y=18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisModelAbsHat3y', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisModelAbsHat3y START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisModelAbsHat3yCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisModel.ABS_HAT3Y).assertEqual(18);
        console.info('EnumsTest execute: axisModelAbsHat3y END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisModelAbsHat3y error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_014
     * @tc.name axisTypeVerticalAxis
     * @tc.desc Test AxisType VERTICAL_AXIS enum value, verify VERTICAL_AXIS=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisTypeVerticalAxis', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisTypeVerticalAxis START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisTypeVerticalAxisCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisType.VERTICAL_AXIS).assertEqual(0);
        console.info('EnumsTest execute: axisTypeVerticalAxis END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisTypeVerticalAxis error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_015
     * @tc.name axisTypeHorizontalAxis
     * @tc.desc Test AxisType HORIZONTAL_AXIS enum value, verify HORIZONTAL_AXIS=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisTypeHorizontalAxis', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisTypeHorizontalAxis START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisTypeHorizontalAxisCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisType.HORIZONTAL_AXIS).assertEqual(1);
        console.info('EnumsTest execute: axisTypeHorizontalAxis END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisTypeHorizontalAxis error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_016
     * @tc.name axisTypePinchAxis
     * @tc.desc Test AxisType PINCH_AXIS enum value, verify PINCH_AXIS=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('axisTypePinchAxis', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: axisTypePinchAxis START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('axisTypePinchAxisCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(AxisType.PINCH_AXIS).assertEqual(2);
        console.info('EnumsTest execute: axisTypePinchAxis END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: axisTypePinchAxis error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_017
     * @tc.name responseRegionSupportedToolAll
     * @tc.desc Test ResponseRegionSupportedTool ALL enum value, verify ALL=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('responseRegionSupportedToolAll', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: responseRegionSupportedToolAll START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('responseRegionSupportedToolAllCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(ResponseRegionSupportedTool.ALL).assertEqual(0);
        console.info('EnumsTest execute: responseRegionSupportedToolAll END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: responseRegionSupportedToolAll error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_018
     * @tc.name responseRegionSupportedToolFinger
     * @tc.desc Test ResponseRegionSupportedTool FINGER enum value, verify FINGER=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('responseRegionSupportedToolFinger', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: responseRegionSupportedToolFinger START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('responseRegionSupportedToolFingerCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(ResponseRegionSupportedTool.FINGER).assertEqual(1);
        console.info('EnumsTest execute: responseRegionSupportedToolFinger END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: responseRegionSupportedToolFinger error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_019
     * @tc.name responseRegionSupportedToolPen
     * @tc.desc Test ResponseRegionSupportedTool PEN enum value, verify PEN=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('responseRegionSupportedToolPen', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: responseRegionSupportedToolPen START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('responseRegionSupportedToolPenCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(ResponseRegionSupportedTool.PEN).assertEqual(2);
        console.info('EnumsTest execute: responseRegionSupportedToolPen END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: responseRegionSupportedToolPen error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_020
     * @tc.name responseRegionSupportedToolMouse
     * @tc.desc Test ResponseRegionSupportedTool MOUSE enum value, verify MOUSE=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('responseRegionSupportedToolMouse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: responseRegionSupportedToolMouse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('responseRegionSupportedToolMouseCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(ResponseRegionSupportedTool.MOUSE).assertEqual(3);
        console.info('EnumsTest execute: responseRegionSupportedToolMouse END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: responseRegionSupportedToolMouse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_021
     * @tc.name presetFillTypeBreakpointDefault
     * @tc.desc Test PresetFillType BREAKPOINT_DEFAULT enum value, verify BREAKPOINT_DEFAULT=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('presetFillTypeBreakpointDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: presetFillTypeBreakpointDefault START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('presetFillTypeBreakpointDefaultCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(PresetFillType.BREAKPOINT_DEFAULT).assertEqual(0);
        console.info('EnumsTest execute: presetFillTypeBreakpointDefault END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: presetFillTypeBreakpointDefault error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_022
     * @tc.name presetFillTypeBreakpointSm1Md2Lg3
     * @tc.desc Test PresetFillType BREAKPOINT_SM1MD2LG3 enum value, verify BREAKPOINT_SM1MD2LG3=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('presetFillTypeBreakpointSm1Md2Lg3', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: presetFillTypeBreakpointSm1Md2Lg3 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('presetFillTypeBreakpointSm1Md2Lg3Case');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(PresetFillType.BREAKPOINT_SM1MD2LG3).assertEqual(1);
        console.info('EnumsTest execute: presetFillTypeBreakpointSm1Md2Lg3 END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: presetFillTypeBreakpointSm1Md2Lg3 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_023
     * @tc.name presetFillTypeBreakpointSm2Md3Lg5
     * @tc.desc Test PresetFillType BREAKPOINT_SM2MD3LG5 enum value, verify BREAKPOINT_SM2MD3LG5=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('presetFillTypeBreakpointSm2Md3Lg5', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnumsTest execute: presetFillTypeBreakpointSm2Md3Lg5 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('presetFillTypeBreakpointSm2Md3Lg5Case');
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(PresetFillType.BREAKPOINT_SM2MD3LG5).assertEqual(2);
        console.info('EnumsTest execute: presetFillTypeBreakpointSm2Md3Lg5 END');
        done();
      } catch (error) {
        console.error('EnumsTest execute: presetFillTypeBreakpointSm2Md3Lg5 error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
