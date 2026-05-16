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

'use static'

import {
  Entry,
  Component,
  Column,
  Text,
  TextAlign,
  AxisModel,
  AxisType,
  ResponseRegionSupportedTool,
  PresetFillType
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct EnumsPage {
  aboutToAppear(): void {
    const snapshot = `textAlignLeft=${TextAlign.LEFT};textAlignRight=${TextAlign.RIGHT};` +
      `axisModelAbsRx=${AxisModel.ABS_RX};axisModelAbsRy=${AxisModel.ABS_RY};` +
      `axisModelAbsThrottle=${AxisModel.ABS_THROTTLE};axisModelAbsRudder=${AxisModel.ABS_RUDDER};` +
      `axisModelAbsWheel=${AxisModel.ABS_WHEEL};axisModelAbsHat1x=${AxisModel.ABS_HAT1X};` +
      `axisModelAbsHat1y=${AxisModel.ABS_HAT1Y};axisModelAbsHat2x=${AxisModel.ABS_HAT2X};` +
      `axisModelAbsHat2y=${AxisModel.ABS_HAT2Y};axisModelAbsHat3x=${AxisModel.ABS_HAT3X};` +
      `axisModelAbsHat3y=${AxisModel.ABS_HAT3Y};axisTypeVertical=${AxisType.VERTICAL_AXIS};` +
      `axisTypeHorizontal=${AxisType.HORIZONTAL_AXIS};axisTypePinch=${AxisType.PINCH_AXIS};` +
      `responseRegionAll=${ResponseRegionSupportedTool.ALL};responseRegionFinger=${ResponseRegionSupportedTool.FINGER};` +
      `responseRegionPen=${ResponseRegionSupportedTool.PEN};responseRegionMouse=${ResponseRegionSupportedTool.MOUSE};` +
      `presetFillDefault=${PresetFillType.BREAKPOINT_DEFAULT};presetFillSm1Md2Lg3=${PresetFillType.BREAKPOINT_SM1MD2LG3};` +
      `presetFillSm2Md3Lg5=${PresetFillType.BREAKPOINT_SM2MD3LG5}`;
    AppStorage.setOrCreate<string>('EnumsPageState', snapshot);
  }

  build() {
    Column() {
      Text(`LEFT=${TextAlign.LEFT}`).id('textAlignLeftCase').key('textAlignLeftCase')
      Text(`RIGHT=${TextAlign.RIGHT}`).id('textAlignRightCase').key('textAlignRightCase')

      Text(`ABS_RX=${AxisModel.ABS_RX}`).id('axisModelAbsRxCase').key('axisModelAbsRxCase')
      Text(`ABS_RY=${AxisModel.ABS_RY}`).id('axisModelAbsRyCase').key('axisModelAbsRyCase')
      Text(`ABS_THROTTLE=${AxisModel.ABS_THROTTLE}`).id('axisModelAbsThrottleCase').key('axisModelAbsThrottleCase')
      Text(`ABS_RUDDER=${AxisModel.ABS_RUDDER}`).id('axisModelAbsRudderCase').key('axisModelAbsRudderCase')
      Text(`ABS_WHEEL=${AxisModel.ABS_WHEEL}`).id('axisModelAbsWheelCase').key('axisModelAbsWheelCase')
      Text(`ABS_HAT1X=${AxisModel.ABS_HAT1X}`).id('axisModelAbsHat1xCase').key('axisModelAbsHat1xCase')
      Text(`ABS_HAT1Y=${AxisModel.ABS_HAT1Y}`).id('axisModelAbsHat1yCase').key('axisModelAbsHat1yCase')
      Text(`ABS_HAT2X=${AxisModel.ABS_HAT2X}`).id('axisModelAbsHat2xCase').key('axisModelAbsHat2xCase')
      Text(`ABS_HAT2Y=${AxisModel.ABS_HAT2Y}`).id('axisModelAbsHat2yCase').key('axisModelAbsHat2yCase')
      Text(`ABS_HAT3X=${AxisModel.ABS_HAT3X}`).id('axisModelAbsHat3xCase').key('axisModelAbsHat3xCase')
      Text(`ABS_HAT3Y=${AxisModel.ABS_HAT3Y}`).id('axisModelAbsHat3yCase').key('axisModelAbsHat3yCase')

      Text(`VERTICAL_AXIS=${AxisType.VERTICAL_AXIS}`).id('axisTypeVerticalAxisCase').key('axisTypeVerticalAxisCase')
      Text(`HORIZONTAL_AXIS=${AxisType.HORIZONTAL_AXIS}`).id('axisTypeHorizontalAxisCase').key('axisTypeHorizontalAxisCase')
      Text(`PINCH_AXIS=${AxisType.PINCH_AXIS}`).id('axisTypePinchAxisCase').key('axisTypePinchAxisCase')

      Text(`ALL=${ResponseRegionSupportedTool.ALL}`).id('responseRegionSupportedToolAllCase').key('responseRegionSupportedToolAllCase')
      Text(`FINGER=${ResponseRegionSupportedTool.FINGER}`).id('responseRegionSupportedToolFingerCase').key('responseRegionSupportedToolFingerCase')
      Text(`PEN=${ResponseRegionSupportedTool.PEN}`).id('responseRegionSupportedToolPenCase').key('responseRegionSupportedToolPenCase')
      Text(`MOUSE=${ResponseRegionSupportedTool.MOUSE}`).id('responseRegionSupportedToolMouseCase').key('responseRegionSupportedToolMouseCase')

      Text(`BREAKPOINT_DEFAULT=${PresetFillType.BREAKPOINT_DEFAULT}`)
        .id('presetFillTypeBreakpointDefaultCase')
        .key('presetFillTypeBreakpointDefaultCase')
      Text(`BREAKPOINT_SM1MD2LG3=${PresetFillType.BREAKPOINT_SM1MD2LG3}`)
        .id('presetFillTypeBreakpointSm1Md2Lg3Case')
        .key('presetFillTypeBreakpointSm1Md2Lg3Case')
      Text(`BREAKPOINT_SM2MD3LG5=${PresetFillType.BREAKPOINT_SM2MD3LG5}`)
        .id('presetFillTypeBreakpointSm2Md3Lg5Case')
        .key('presetFillTypeBreakpointSm2Md3Lg5Case')
    }.width('100%').height('100%')
  }
}
