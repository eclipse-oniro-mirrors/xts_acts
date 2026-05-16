'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import Log from '../../common/Log';
import {
  Alignment,
  AlignRuleOption,
  Axis,
  BlurStyle,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  CommonMethod,
  Component,
  Configuration,
  ConstraintSizeOptions,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  GeometryInfo,
  GradientDirection,
  HitTestMode,
  HorizontalAlign,
  HoverEffect,
  Image,
  ItemAlign,
  KeyEvent,
  KeyType,
  Layoutable,
  List,
  ListItem,
  LocalizedAlignRuleOptions,
  Margin,
  Measurable,
  MeasureResult,
  Navigation,
  NavigationTitleMode,
  RepeatMode,
  Row,
  Search,
  SizeResult,
  Stack,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  TripleLengthDetents,
  VerticalAlign
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

const TAG = 'ets_panel_add';

@Entry
@Component
struct PanelBackgroundMask {
  // @State mode: PanelMode = PanelMode.Full
  // @State navBarPosition: PanelMode = PanelMode.Full
  @State sheet_show: boolean = false

  @Builder
  SheetBuilder() {
    Text('替代panel')
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PanelBackgroundMask start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PanelBackgroundMask end`)
  }

  build() {
    Column() {

      Text("panel-OnHeightChange")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onHeightChangeText")
        .onClick((e: ClickEvent) => {
          // this.mode = PanelMode.Half
          // this.navBarPosition = PanelMode.Half
        })

      Button("sheet_show")
        .onClick((e: ClickEvent) => {
          this.sheet_show = !this.sheet_show;
        })
        .bindSheet(this.sheet_show, this.SheetBuilder, {
          dragBar: false,
          detents: [500, 650, 800] as TripleLengthDetents,
          onHeightDidChange: (value: int) => {
            Log.showInfo(TAG, 'onHeightChange: ' + value)
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "result": "success"
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 10111,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("onHeightChange start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err: Error) {
              console.info("testpanelOnHeightChange0002 emit action state err: " +
              JSON.stringify((err as Error)?.message))
            }
          }
        })
        .key("panel")
    }.width("100%").height("100%")
  }
}
