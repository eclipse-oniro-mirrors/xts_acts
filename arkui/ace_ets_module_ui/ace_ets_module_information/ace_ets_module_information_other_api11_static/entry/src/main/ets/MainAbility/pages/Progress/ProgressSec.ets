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

import events_emitter from '@ohos.events.emitter';
import { MessageManager, Message, Callback } from '../../common/MessageManager';
import { Entry, Component, ProgressMask, Row, Column, List, ListItem, Image, $r, Color, ClickEvent, Button,ProgressStyleOptions,
  HorizontalAlign, Flex, FlexDirection, ItemAlign, FontWeight,FlexAlign, Alignment, TextOverflow, ProgressType,ResourceColor,
  RowOptions, ColumnOptions, Text, Progress, Margin, ProgressStyle, Resource, ProgressStatus, LinearGradient, FontStyle,LinearStyleOptions,
  CapsuleStyleOptions, RingStyleOptions
} from '@ohos.arkui.component'
import { State, AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement'
import { UIContext, Router, Context } from '@ohos.arkui.UIContext';

@Entry
@Component
struct progressSecTest {
  @StoragePropRef('progress_capsule_borderWidth_number') progress_capsule_borderWidth_number: number|undefined = 10
  @StoragePropRef('progress_capsule_borderWidth_string') progress_capsule_borderWidth_string: string = '1vp'
  @StoragePropRef('progress_capsule_borderWidth_resource') progress_capsule_borderWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @StoragePropRef('progress_capsule_borderColor_number') progress_capsule_borderColor_number: ResourceColor = 0xFF000000.toInt()
  @StoragePropRef('progress_capsule_borderColor_string') progress_capsule_borderColor_string: string|undefined = '#FFFF9535'
  @StoragePropRef('progress_capsule_borderColor_color') progress_capsule_borderColor_color: Color = Color.Red
  @StoragePropRef('progress_capsule_borderColor_resource') progress_capsule_borderColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
  @StoragePropRef('progress_capsule_fontSize_number') progress_capsule_fontSize_number: number|undefined = 12
  @StoragePropRef('progress_capsule_fontSize_string') progress_capsule_fontSize_string: string = '12vp'
  @StoragePropRef('progress_capsule_fontSize_resource') progress_capsule_fontSize_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @StoragePropRef('progress_capsule_fontWeight_number') progress_capsule_fontWeight_number: FontWeight | int | string |undefined= 400
  @StoragePropRef('progress_capsule_fontWeight_string') progress_capsule_fontWeight_string: string = '400'
  @StoragePropRef('progress_capsule_fontWeight_fontWeight') progress_capsule_fontWeight_fontWeight: FontWeight = FontWeight.Normal
  @StoragePropRef('progress_capsule_fontStyle_fontStyle') progress_capsule_fontStyle_fontStyle: FontStyle|undefined = FontStyle.Normal
  @StoragePropRef('progress_capsule_fontColor_number') progress_capsule_fontColor_number: ResourceColor = 0xFF000000.toInt()
  @StoragePropRef('progress_capsule_fontColor_string') progress_capsule_fontColor_string: string|undefined = '#FFFF9535'
  @StoragePropRef('progress_capsule_fontColor_color') progress_capsule_fontColor_color: Color = Color.Red
  @StoragePropRef('progress_capsule_fontColor_resource') progress_capsule_fontColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
  @StoragePropRef('progress_capsule_content_string') progress_capsule_content_string: string|undefined = '下载'
  @StoragePropRef('progress_capsule_enableScanEffect_boolean') progress_capsule_enableScanEffect_boolean: boolean|undefined = false
  @StoragePropRef('progress_capsule_showDefaultPercentage_boolean') progress_capsule_showDefaultPercentage_boolean: boolean|undefined = false
  @StoragePropRef('progress_capsule_enableSmoothEffect_boolean') progress_capsule_enableSmoothEffect_boolean: boolean|undefined = false
  @StoragePropRef('progress_ring_strokeWidth_number') progress_ring_strokeWidth_number: number|undefined = 4
  @StoragePropRef('progress_ring_strokeWidth_string') progress_ring_strokeWidth_string: string = '4vp'
  @StoragePropRef('progress_ring_strokeWidth_resource') progress_ring_strokeWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @StoragePropRef('progress_ring_shadow_bool') progress_ring_shadow_bool: boolean|undefined = false
  @StoragePropRef('progress_ring_status_progressStatus') progress_ring_status_progressStatus: ProgressStatus|undefined = ProgressStatus.PROGRESSING
  @StoragePropRef('progress_ring_color_purity') progress_ring_color_purity: ResourceColor | LinearGradient = 0x000000
  @StoragePropRef('progress_ring_color_linear_number') progress_ring_color_linear_number: LinearGradient = new LinearGradient([{ color: 0xFFFF0000.toInt(), offset: 0 }, {
    color: 0xFFFFFFFF.toInt(),
    offset: 1
  }])
  @StoragePropRef('progress_ring_color_linear_string') progress_ring_color_linear_string: LinearGradient = new LinearGradient([{ color: '#FFFF9A35', offset: 0 }, {
    color: '#FFFFFFFF',
    offset: 1
  }])
  @StoragePropRef('progress_ring_color_linear_color') progress_ring_color_linear_color: LinearGradient = new LinearGradient([{ color: Color.Red, offset: 0 }, {
    color: Color.White,
    offset: 1
  }])
  @StoragePropRef('progress_ring_color_linear_resource') progress_ring_color_linear_resource: LinearGradient = new LinearGradient([{
    color: $r('sys.color.ohos_id_color_connected'),
    offset: 0
  }, { color: $r('sys.color.ohos_id_color_background'), offset: 1 }]) as LinearGradient
  @StoragePropRef('progress_ring_color_linear_null') progress_ring_color_linear_null: LinearGradient|undefined|Color|int|String|Resource = undefined
  @StoragePropRef('progress_ring_color_linear_undefined') progress_ring_color_linear_undefined: LinearGradient | undefined = undefined
  @StoragePropRef('progress_ring_enableScanEffect_boolean') progress_ring_enableScanEffect_boolean: boolean| undefined = false
  @StoragePropRef('progress_ring_enableSmoothEffect_boolean') progress_ring_enableSmoothEffect_boolean: boolean| undefined = false
  @StoragePropRef('progress_linear_enableScanEffect_boolean') progress_linear_enableScanEffect_boolean: boolean| undefined = false
  @StoragePropRef('progress_linear_enableSmoothEffect_boolean') progress_linear_enableSmoothEffect_boolean: boolean| undefined = false
  @StoragePropRef('progress_scaleRing_enableSmoothEffect_boolean') progress_scaleRing_enableSmoothEffect_boolean: boolean| undefined = false
  @StoragePropRef('progress_eclipse_enableSmoothEffect_boolean') progress_eclipse_enableSmoothEffect_boolean: boolean| undefined = false

  build() {
    Column() {
      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_default')

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_default_default')
        .backgroundColor($r('sys.color.ohos_id_color_background'))
        .color($r('sys.color.ohos_id_color_emphasize'))
        .style({
          borderWidth: $r('sys.float.ohos_id_float_progress_border_width'),
          borderColor: $r('sys.color.ohos_id_color_emphasize'),
          font: {
            size: $r('sys.float.ohos_id_text_size_button3'),
          },
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
        } as CapsuleStyleOptions)
        .padding($r('sys.float.ohos_id_alpha_content_fourth'))
        .margin($r('sys.float.ohos_id_alpha_highlight_bg'))

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_showDefaultPercentage_default')
        .style({
          showDefaultPercentage: true
        } as CapsuleStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_number')
        .style({
          borderWidth: this.progress_capsule_borderWidth_number,
          borderColor: this.progress_capsule_borderColor_number,
          font: {
            size: this.progress_capsule_fontSize_number,
            weight: this.progress_capsule_fontWeight_number,
            style: this.progress_capsule_fontStyle_fontStyle
          },
          fontColor: this.progress_capsule_fontColor_number,
          content: this.progress_capsule_content_string,
          enableScanEffect: this.progress_capsule_enableScanEffect_boolean,
          showDefaultPercentage: this.progress_capsule_showDefaultPercentage_boolean,
          enableSmoothEffect: this.progress_capsule_enableSmoothEffect_boolean
        } as CapsuleStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_string')
        .style({
          borderWidth: this.progress_capsule_borderWidth_string,
          borderColor: this.progress_capsule_borderColor_string,
          font: {
            size: this.progress_capsule_fontSize_string,
            weight: this.progress_capsule_fontWeight_string,
            style: this.progress_capsule_fontStyle_fontStyle
          },
          fontColor: this.progress_capsule_fontColor_string,
          content: this.progress_capsule_content_string,
          enableScanEffect: this.progress_capsule_enableScanEffect_boolean,
          showDefaultPercentage: this.progress_capsule_showDefaultPercentage_boolean
        } as CapsuleStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_enum')
        .style({
          borderWidth: this.progress_capsule_borderWidth_number,
          borderColor: this.progress_capsule_borderColor_color,
          font: {
            size: this.progress_capsule_fontSize_number,
            weight: this.progress_capsule_fontWeight_fontWeight,
            style: this.progress_capsule_fontStyle_fontStyle
          },
          fontColor: this.progress_capsule_fontColor_color,
          content: this.progress_capsule_content_string,
          enableScanEffect: this.progress_capsule_enableScanEffect_boolean,
          showDefaultPercentage: this.progress_capsule_showDefaultPercentage_boolean
        } as CapsuleStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_resource')
        .style({
          borderWidth: this.progress_capsule_borderWidth_resource,
          borderColor: this.progress_capsule_borderColor_resource,
          font: {
            size: this.progress_capsule_fontSize_resource,
            weight: this.progress_capsule_fontWeight_number,
            style: this.progress_capsule_fontStyle_fontStyle
          },
          fontColor: this.progress_capsule_fontColor_resource,
          content: this.progress_capsule_content_string,
          enableScanEffect: this.progress_capsule_enableScanEffect_boolean,
          showDefaultPercentage: this.progress_capsule_showDefaultPercentage_boolean
        } as CapsuleStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_resource_judge')
        .style({
          borderWidth: $r('sys.float.ohos_id_text_margin_vertical'),
          borderColor: $r('sys.color.ohos_id_color_connected'),
          font: {
            size: $r('sys.float.ohos_id_text_margin_vertical'),
            weight: this.progress_capsule_fontWeight_number,
            style: this.progress_capsule_fontStyle_fontStyle
          },
          fontColor: $r('sys.color.ohos_id_color_connected'),
          content: this.progress_capsule_content_string,
          enableScanEffect: this.progress_capsule_enableScanEffect_boolean,
          showDefaultPercentage: this.progress_capsule_showDefaultPercentage_boolean
        } as CapsuleStyleOptions)


      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_default')

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_default_default')
        .backgroundColor($r('sys.color.ohos_id_color_button_normal'))

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_default_default_color_begin')
        .color($r('sys.color.ohos_id_color_ring_progress_begin'))

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_default_default_color_end')
        .color($r('sys.color.ohos_id_color_ring_progress_end'))

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_number')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus,
          enableScanEffect: this.progress_ring_enableScanEffect_boolean,
          enableSmoothEffect: this.progress_ring_enableSmoothEffect_boolean
        } as RingStyleOptions)
        .color(this.progress_ring_color_purity)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_string')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_string,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus,
          enableScanEffect: this.progress_ring_enableScanEffect_boolean
        } as RingStyleOptions)
        .color(this.progress_ring_color_purity)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_resource')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_resource,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus,
          enableScanEffect: this.progress_ring_enableScanEffect_boolean
        } as RingStyleOptions)
        .color(this.progress_ring_color_purity)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_resource_judge')
        .style({
          strokeWidth: $r('sys.float.ohos_id_text_margin_vertical'),
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus,
          enableScanEffect: this.progress_ring_enableScanEffect_boolean
        } as RingStyleOptions)
        .color($r('sys.color.ohos_id_color_background'))
        .backgroundColor($r('sys.color.ohos_id_color_connected'))

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_number')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        } as RingStyleOptions)
        .color(this.progress_ring_color_linear_number)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_string')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        } as RingStyleOptions)
        .color(this.progress_ring_color_linear_string)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_color')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        } as RingStyleOptions)
        .color(this.progress_ring_color_linear_color)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_resource')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        } as RingStyleOptions)
        .color(this.progress_ring_color_linear_resource)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_null')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        } as RingStyleOptions)
        .color(this.progress_ring_color_linear_null)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_undefined')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        } as RingStyleOptions)
        .color(this.progress_ring_color_linear_undefined)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_default')

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_number')
        .color(this.progress_ring_color_purity)
        .style({
          enableScanEffect: this.progress_linear_enableScanEffect_boolean,
          enableSmoothEffect: this.progress_linear_enableSmoothEffect_boolean
        } as LinearStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_linear_number')
        .color(this.progress_ring_color_linear_number)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_linear_string')
        .color(this.progress_ring_color_linear_string)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_linear_color')
        .color(this.progress_ring_color_linear_color)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_linear_resource')
        .color(this.progress_ring_color_linear_resource)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_linear_null')
        .color(this.progress_ring_color_linear_null)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_linear_undefined')
        .color(this.progress_ring_color_linear_undefined)

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_default')

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_number')
        .color(this.progress_ring_color_purity)
        .style({
          enableSmoothEffect: this.progress_eclipse_enableSmoothEffect_boolean
        } as ProgressStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_linear_number')
        .color(this.progress_ring_color_linear_number)

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_linear_string')
        .color(this.progress_ring_color_linear_string)

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_linear_color')
        .color(this.progress_ring_color_linear_color)

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_linear_resource')
        .color(this.progress_ring_color_linear_resource)

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_linear_null')
        .color(this.progress_ring_color_linear_null)

      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .key('progress_eclipse_color_linear_undefined')
        .color(this.progress_ring_color_linear_undefined)

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_default')

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_number')
        .color(this.progress_ring_color_purity)
        .style({
          enableSmoothEffect: this.progress_scaleRing_enableSmoothEffect_boolean
        } as ProgressStyleOptions)

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_linear_number')
        .color(this.progress_ring_color_linear_number)

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_linear_string')
        .color(this.progress_ring_color_linear_string)

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_linear_color')
        .color(this.progress_ring_color_linear_color)

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_linear_resource')
        .color(this.progress_ring_color_linear_resource)

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_linear_null')
        .color(this.progress_ring_color_linear_null)

      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .key('progress_scaleRing_color_linear_undefined')
        .color(this.progress_ring_color_linear_undefined)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_default')

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_number')
        .color(this.progress_ring_color_purity)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_linear_number')
        .color(this.progress_ring_color_linear_number)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_linear_string')
        .color(this.progress_ring_color_linear_string)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_linear_color')
        .color(this.progress_ring_color_linear_color)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_linear_resource')
        .color(this.progress_ring_color_linear_resource)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_linear_null')
        .color(this.progress_ring_color_linear_null)

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_color_linear_undefined')
        .color(this.progress_ring_color_linear_undefined)
    }
    .width('100%')
  }
}