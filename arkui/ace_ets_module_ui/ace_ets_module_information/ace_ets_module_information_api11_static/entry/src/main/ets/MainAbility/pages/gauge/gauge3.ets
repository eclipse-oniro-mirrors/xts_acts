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
import {MessageManager,Callback, Message} from '../../common/MessageManager';
import { Entry, Component, Column, Gauge, Margin,Length, Flex, FlexOptions, ResourceColor, ColumnOptions, FlexDirection, ItemAlign, FlexAlign, Alignment, TextAlign, TextOverflow, LinearGradient,
 Color, Resource, } from '@ohos.arkui.component'
import { State,  AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct Gauge3Example {
  @StoragePropRef('startAngle') startAngle:number = 0;
  @StoragePropRef('endAngle') endAngle:number = 0;
  @StoragePropRef('colors') colors: Array<[ResourceColor | LinearGradient , number]>= [[0x317AF7, 0.1], [0x5BA854, 0.2], [0xE08C3A, 0.3], [0x9C554B, 0.4]] as Array<[ResourceColor | LinearGradient , number]>
  @StoragePropRef('strokeWidth') strokeWidth:Length = 0;
  @StoragePropRef('value') value:number = 30;
  @StoragePropRef('min') min:number = 0;
  @StoragePropRef('max') max:number = 100;
  @StoragePropRef('wth') wth:Length = 100;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      // 使用默认的min和max为0-100，角度范围默认0-360，value值设置
      // 参数中设置当前值为75
      Gauge({ value: 75 })
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      // 参数设置当前值为75，属性设置值为25，属性设置优先级高
      Gauge({ value: 75 })
        .value(25) // 属性和参数都设置时以参数为准
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      // 210--150度环形图表
      Gauge({ value: this.value, min: this.min, max: this.max })
        .startAngle(this.startAngle)
        .endAngle(this.endAngle)
        .colors(this.colors)
        .strokeWidth(this.strokeWidth)
        .width(this.wth)
        .height(200).key('guage')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}