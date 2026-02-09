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
import { 
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, Span,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { LengthUnit, LengthMetrics } from '@ohos.arkui.node';
@Entry
@Component
struct LengthUnitTest {
  @State span_px: string = ''

  build() {
    Row() {
      Column() {
        Text(){
          Span('20PX')
            .baselineOffset(new LengthMetrics(20,LengthUnit.PX))
            //.border({ width: 1 })
            .id('span_px')
          Span('20FP')
            .baselineOffset(new LengthMetrics(20,LengthUnit.FP))
            //.border({ width: 1 })
            .id('span_fp')
          Span('20PERCENT')
            .baselineOffset(new LengthMetrics(20,LengthUnit.PERCENT))
            //.border({ width: 1 })
            .id('span_percent')
          Span('20LPX')
            .baselineOffset(new LengthMetrics(20,LengthUnit.LPX))
            //.border({ width: 1 })
            .id('span_lpx')
        }
        .size({ width: 300, height: 300 })
        .backgroundColor(Color.Pink)
      }
      .width('100%')
    }
    .height('100%')
  }
}