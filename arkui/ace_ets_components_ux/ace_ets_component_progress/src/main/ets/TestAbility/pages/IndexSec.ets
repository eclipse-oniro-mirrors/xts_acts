/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { MessageManager } from '../../test/MessageManager';
import { Callback } from '@ohos.base';


@Entry
@Component
struct progressSecTest {
  @State progress_capsule_borderWidth_number: number = 1
  @State progress_capsule_borderWidth_string: string = '1vp'
  @State progress_capsule_borderWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @State progress_capsule_borderColor_number: number = 0xFF000000
  @State progress_capsule_borderColor_string: string = '#FFFF9535'
  @State progress_capsule_borderColor_color: Color = Color.Red
  @State progress_capsule_borderColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
  @State progress_capsule_fontSize_number: number = 12
  @State progress_capsule_fontSize_string: string = '12vp'
  @State progress_capsule_fontSize_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @State progress_capsule_fontWeight_number: number = 400
  @State progress_capsule_fontWeight_string: string = '400'
  @State progress_capsule_fontWeight_fontWeight: FontWeight = FontWeight.Normal
  @State progress_capsule_fontStyle_fontStyle: FontStyle = FontStyle.Normal
  @State progress_capsule_fontColor_number: number = 0xFF000000
  @State progress_capsule_fontColor_string: string = '#FFFF9535'
  @State progress_capsule_fontColor_color: Color = Color.Red
  @State progress_capsule_fontColor_resource: Resource = $r('sys.color.ohos_id_color_connected')
  @State progress_capsule_content_string: string = '下载'
  @State progress_capsule_enableScanEffect_boolean: boolean = false
  @State progress_capsule_showDefaultPercentage_boolean: boolean = false
  @State progress_capsule_enableSmoothEffect_boolean: boolean = false
  @State progress_ring_strokeWidth_number: number = 4
  @State progress_ring_strokeWidth_string: string = '4vp'
  @State progress_ring_strokeWidth_resource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @State progress_ring_shadow_bool: boolean = false
  @State progress_ring_status_progressStatus: ProgressStatus = ProgressStatus.PROGRESSING
  @State progress_ring_color_purity: number = 0x000000
  @State progress_ring_color_linear_number: LinearGradient = new LinearGradient([{ color: 0xFFFF0000, offset: 0 }, {
    color: 0xFFFFFFFF,
    offset: 1
  }])
  @State progress_ring_color_linear_string: LinearGradient = new LinearGradient([{ color: '#FFFF9A35', offset: 0 }, {
    color: '#FFFFFFFF',
    offset: 1
  }])
  @State progress_ring_color_linear_color: LinearGradient = new LinearGradient([{ color: Color.Red, offset: 0 }, {
    color: Color.White,
    offset: 1
  }])
  @State progress_ring_color_linear_resource: LinearGradient = new LinearGradient([{
    color: $r('sys.color.ohos_id_color_connected'),
    offset: 0
  }, { color: $r('sys.color.ohos_id_color_background'), offset: 1 }])
  @State progress_ring_color_linear_null: LinearGradient = null
  @State progress_ring_color_linear_undefined: LinearGradient = undefined
  @State progress_ring_enableScanEffect_boolean: boolean = false
  @State progress_ring_enableSmoothEffect_boolean: boolean = false
  @State progress_linear_enableScanEffect_boolean: boolean = false
  @State progress_linear_enableSmoothEffect_boolean: boolean = false
  @State progress_scaleRing_enableSmoothEffect_boolean: boolean = false
  @State progress_eclipse_enableSmoothEffect_boolean: boolean = false
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("progress page state change called:" + JSON.stringify(eventData));
    console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: callback " + eventData.data.progress_capsule_borderWidth_resource);

    this.progress_capsule_borderWidth_number = eventData.data.progress_capsule_borderWidth_number;
    this.progress_capsule_borderWidth_string = eventData.data.progress_capsule_borderWidth_string;
    this.progress_capsule_borderWidth_resource = eventData.data.progress_capsule_borderWidth_resource;
    console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: callback2 " + this.progress_capsule_borderWidth_resource);
    this.progress_capsule_borderColor_number = eventData.data.progress_capsule_borderColor_number;
    this.progress_capsule_borderColor_string = eventData.data.progress_capsule_borderColor_string;
    this.progress_capsule_borderColor_color = eventData.data.progress_capsule_borderColor_color;
    this.progress_capsule_borderColor_resource = eventData.data.progress_capsule_borderColor_resource;
    this.progress_capsule_fontSize_number = eventData.data.progress_capsule_fontSize_number;
    this.progress_capsule_fontSize_string = eventData.data.progress_capsule_fontSize_string;
    this.progress_capsule_fontSize_resource = eventData.data.progress_capsule_fontSize_resource;
    this.progress_capsule_fontWeight_number = eventData.data.progress_capsule_fontWeight_number;
    this.progress_capsule_fontWeight_string = eventData.data.progress_capsule_fontWeight_string;
    this.progress_capsule_fontWeight_fontWeight = eventData.data.progress_capsule_fontWeight_fontWeight;
    this.progress_capsule_fontStyle_fontStyle = eventData.data.progress_capsule_fontStyle_fontStyle;
    this.progress_capsule_fontColor_number = eventData.data.progress_capsule_fontColor_number;
    this.progress_capsule_fontColor_string = eventData.data.progress_capsule_fontColor_string;
    this.progress_capsule_fontColor_color = eventData.data.progress_capsule_fontColor_color;
    this.progress_capsule_fontColor_resource = eventData.data.progress_capsule_fontColor_resource;
    this.progress_capsule_content_string = eventData.data.progress_capsule_content_string;
    this.progress_capsule_enableScanEffect_boolean = eventData.data.progress_capsule_enableScanEffect_boolean;
    this.progress_capsule_showDefaultPercentage_boolean = eventData.data.progress_capsule_showDefaultPercentage_boolean;
    this.progress_capsule_enableSmoothEffect_boolean = eventData.data.progress_capsule_enableSmoothEffect_boolean;

    this.progress_ring_strokeWidth_number = eventData.data.progress_ring_strokeWidth_number;
    this.progress_ring_strokeWidth_string = eventData.data.progress_ring_strokeWidth_string;
    this.progress_ring_strokeWidth_resource = eventData.data.progress_ring_strokeWidth_resource;
    this.progress_ring_shadow_bool = eventData.data.progress_ring_shadow_bool;
    this.progress_ring_status_progressStatus = eventData.data.progress_ring_status_progressStatus;
    this.progress_ring_color_purity = eventData.data.progress_ring_color_purity;
    this.progress_ring_color_linear_number = eventData.data.progress_ring_color_linear_number;
    this.progress_ring_color_linear_string = eventData.data.progress_ring_color_linear_string;
    this.progress_ring_color_linear_color = eventData.data.progress_ring_color_linear_color;
    this.progress_ring_color_linear_resource = eventData.data.progress_ring_color_linear_resource;
    this.progress_ring_color_linear_null = eventData.data.progress_ring_color_linear_null;
    this.progress_ring_color_linear_undefined = eventData.data.progress_ring_color_linear_undefined;
    this.progress_ring_enableScanEffect_boolean = eventData.data.progress_ring_enableScanEffect_boolean;
    this.progress_ring_enableSmoothEffect_boolean = eventData.data.progress_ring_enableSmoothEffect_boolean;

    this.progress_linear_enableScanEffect_boolean = eventData.data.progress_linear_enableScanEffect_boolean;
    this.progress_linear_enableSmoothEffect_boolean = eventData.data.progress_linear_enableSmoothEffect_boolean;

    this.progress_scaleRing_enableSmoothEffect_boolean = eventData.data.progress_scaleRing_enableSmoothEffect_boolean;
    this.progress_eclipse_enableSmoothEffect_boolean = eventData.data.progress_eclipse_enableSmoothEffect_boolean;
  }
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('divider onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback<ESObject> = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'progress_capsule_borderWidth_resource') {
        this.progress_capsule_borderWidth_resource = message.value
      }
      if (message.name == 'progress_capsule_borderColor_resource') {
        this.progress_capsule_borderColor_resource = message.value
      }
      if (message.name == 'progress_capsule_fontSize_resource') {
        this.progress_capsule_fontSize_resource = message.value
      }
      if (message.name == 'progress_capsule_fontColor_resource') {
        this.progress_capsule_fontColor_resource = message.value
      }
      if (message.name == 'progress_ring_strokeWidth_resource') {
        this.progress_ring_strokeWidth_resource = message.value
      }
      if (message.name == 'progress_ring_color_linear_number') {
        this.progress_ring_color_linear_number = message.value
      }
      if (message.name == 'progress_ring_color_linear_string') {
        this.progress_ring_color_linear_string = message.value
      }
      if (message.name == 'progress_ring_color_linear_color') {
        this.progress_ring_color_linear_color = message.value
      }
      if (message.name == 'progress_ring_color_linear_resource') {
        this.progress_ring_color_linear_resource = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_default')

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_default_default')
        .backgroundColor($r('sys.color.ohos_id_color_background'))
        .color($r('sys.color.ohos_id_color_emphasize_contrary'))
        .style({
          borderWidth: $r('sys.float.ohos_id_float_progress_border_width'),
          borderColor: $r('sys.color.ohos_id_color_emphasize_contrary'),
          font: {
            size: $r('sys.float.ohos_id_text_size_button3'),
          },
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
        })
        .padding($r('sys.float.ohos_id_alpha_content_fourth'))
        .margin($r('sys.float.ohos_id_alpha_highlight_bg'))

      Progress({ value: 60, total: 100, type: ProgressType.Capsule })
        .key('progress_capsule_showDefaultPercentage_default')
        .style({
          showDefaultPercentage: true
        })

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
        })

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
        })

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
        })

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
        })

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
        })


      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_default')

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_default_default')
        .backgroundColor($r('sys.color.ohos_id_color_component_normal'))

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
        })
        .color(this.progress_ring_color_purity)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_string')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_string,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus,
          enableScanEffect: this.progress_ring_enableScanEffect_boolean
        })
        .color(this.progress_ring_color_purity)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_resource')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_resource,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus,
          enableScanEffect: this.progress_ring_enableScanEffect_boolean
        })
        .color(this.progress_ring_color_purity)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_resource_judge')
        .style({
          strokeWidth: $r('sys.float.ohos_id_text_margin_vertical'),
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus,
          enableScanEffect: this.progress_ring_enableScanEffect_boolean
        })
        .color($r('sys.color.ohos_id_color_background'))
        .backgroundColor($r('sys.color.ohos_id_color_connected'))

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_number')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        })
        .color(this.progress_ring_color_linear_number)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_string')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        })
        .color(this.progress_ring_color_linear_string)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_color')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        })
        .color(this.progress_ring_color_linear_color)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_resource')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        })
        .color(this.progress_ring_color_linear_resource)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_null')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        })
        .color(this.progress_ring_color_linear_null)

      Progress({ value: 60, total: 100, type: ProgressType.Ring })
        .key('progress_ring_linear_undefined')
        .style({
          strokeWidth: this.progress_ring_strokeWidth_number,
          shadow: this.progress_ring_shadow_bool,
          status: this.progress_ring_status_progressStatus
        })
        .color(this.progress_ring_color_linear_undefined)

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_default')

      Progress({ value: 60, total: 100, type: ProgressType.Linear })
        .key('progress_linear_color_number')
        .color(this.progress_ring_color_purity)
        .style({
          enableScanEffect: this.progress_linear_enableScanEffect_boolean,
          enableSmoothEffect: this.progress_linear_enableSmoothEffect_boolean
        })

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
        })

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
        })

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