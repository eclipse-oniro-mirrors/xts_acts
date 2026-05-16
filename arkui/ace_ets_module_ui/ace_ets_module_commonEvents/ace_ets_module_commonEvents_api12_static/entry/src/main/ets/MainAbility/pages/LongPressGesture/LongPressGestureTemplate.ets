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
  Entry,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroll,
  GestureEvent,
  LongPressGesture,
  TapGesture,
  ClickEvent,
  FlexAlign,
  GestureInfo,
  BaseGestureEvent,
  DragEvent,
  GestureControl,
  GestureJudgeResult,
  PanGestureOptions,
  PanGesture,
  HorizontalAlign,
  Padding,
  SourceTool
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct LongPressGestureTemplate {
  @State offsetX: string = 'init'
  @State offsetY: string = 'init'
  @State pinchCenterX: string = 'init'
  @State pinchCenterY: string = 'init'
  @State fingerList_id: string = 'init'
  @State fingerList_globalX: string = 'init'
  @State fingerList_globalY: string = 'init'
  @State fingerList_localX: string = 'init'
  @State fingerList_localY: string = 'init'
  @State target_area_width: string = 'init'
  @State target_area_height: string = 'init'
  @State target_area_position_x: string = 'init'
  @State target_area_position_y: string = 'init'
  @State target_area_globalPosition_x: string = 'init'
  @State target_area_globalPosition_y: string = 'init'
  @State time: number = 0
  @State timestamp: number = 0
  @State timestampArr: Array<number> = new Array<number>(0,0)

  build() {
    Column({space:10} as ColumnOptions) {
      Text('LongPressGesture').fontSize(20).width(240).height(80).margin({left:0,top:0} as Margin).padding({left:0,top:0} as Padding).backgroundColor(Color.Yellow).id('LongPressGestureTemplate_Click')
        .draggable(false)
        .gesture(
          LongPressGesture({ repeat: false })
            .onAction((event: GestureEvent) => {
              console.log('LongPressGesture page in one')
              if (event) {
                console.log('LongPressGesture page in two')
                if (this.timestampArr[0] == 0) {
                  console.log('LongPressGesture page in three')
                  this.timestampArr[0] = event.timestamp
                } else {
                  console.log('LongPressGesture page in four')
                  this.timestampArr[1] = event.timestamp
                }
                this.time = Date.now()
                this.timestamp = event.timestamp
                this.offsetX = event.offsetX + ''
                this.offsetY = event.offsetY + ''
                this.pinchCenterX = event.pinchCenterX + ''
                this.pinchCenterY = event.pinchCenterY + ''
                this.fingerList_id = event.fingerList[0].id + ''
                this.fingerList_globalX = event.fingerList[0].globalX + ''
                this.fingerList_globalY = event.fingerList[0].globalY + ''
                this.fingerList_localX = event.fingerList[0].localX + ''
                this.fingerList_localY = event.fingerList[0].localY + ''
                this.target_area_width = event.target.area.width + ''
                this.target_area_height = event.target.area.height + ''
                this.target_area_position_x = event.target.area.position.x + ''
                this.target_area_position_y = event.target.area.position.y + ''
                this.target_area_globalPosition_x = event.target.area.globalPosition.x + ''
                this.target_area_globalPosition_y = event.target.area.globalPosition.y + ''

                console.log('LongPressGesture page in five')

              }
              console.log('LongPressGesture page in six')
            })
        )

      Text(`${this.timestampArr[0]}`).key('LongPressGestureTemplate_Text01')
      Text(`${this.timestampArr[1]}`).key('LongPressGestureTemplate_Text02')

    }.alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('LongPressGestureTemplate_Father')
  }
}
