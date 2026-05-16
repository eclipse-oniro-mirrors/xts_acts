/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Text,
  Column,
  Component,
  ClickEvent,
  ButtonType,
  SaveButton,
  SaveIconStyle,
  SaveDescription,
  Row,
  SaveButtonOnClickResult,
  SaveButtonCallback,
  Image,
  $r,
  TextInput,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  HorizontalAlign,
  ColorMetrics,
  LengthMetrics,
  Color,
  Dimension,
  SizeOptions,
  Resource,
  BorderRadiuses
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct saveButtonCustomize {
  @State bgType: ButtonType | undefined = ButtonType.Normal
  @State iconSize: Dimension | SizeOptions | undefined = undefined
  @State direct: SecurityComponentLayoutDirection | undefined = SecurityComponentLayoutDirection.HORIZONTAL
  @State positionX: string | undefined = '0'
  @State positionY: string | undefined = '0'
  @State anchorX: string | undefined = '0'
  @State anchorY: string | undefined = '0'
  @State offsetX: string | undefined = '0'
  @State offsetY: string | undefined = '0'
  @State fontSize: number | undefined = 16
  @State fontStyle: FontStyle | undefined = FontStyle.Normal
  @State fontWeight: FontWeight | undefined = FontWeight.Medium
  @State fontColor: string | Color | undefined = '#ffffffff'
  @State iconColor: string | Color | undefined = '#ffffffff'
  @State bgColor: string | Color | undefined = '#ff007dff'
  @State borderSty: BorderStyle | undefined = BorderStyle.Dashed
  @State borderWid: number | undefined = 0
  @State borderCol: string | Color | undefined = '#ffffffff'
  @State borderRad: number | undefined = 0
  @State left: number | undefined = 12
  @State right: number | undefined = 12
  @State top: number | undefined = 4
  @State bottom: number | undefined = 4
  @State middle: number | undefined = 4
  @State clipSet: boolean | undefined = false
  @State columnWidth: string | undefined = '100%'
  @State columnHeight: string | undefined = '100%'
  @State sbAlign: Alignment | undefined = Alignment.Center
  @State customIcon: Resource | undefined = undefined
  @State customText: string | undefined = undefined
  @State iconRadius: number | BorderRadiuses | undefined = undefined
  @State stateEft: boolean | undefined = undefined
  @State iconSizeW: number | undefined = undefined
  @State iconSizeH: number | undefined = undefined

  private stateChangeCallBack: (eventData: events_emitter.EventData) => void = 
    (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != undefined) {
      const data = eventData.data as Record<String, RecordData>
      console.info('====>page_saveButtonCustomize page state change called:' + JSON.stringify(eventData.data));

      if (data['iconSize'] != null) {
        this.iconSize = data['iconSize']  as Double
      }
      if (data['cuIcon'] != null) {
        this.customIcon = data['cuIcon'] as Resource;
      }
      if (data['cuText'] != null) {
        this.customText = data['cuText'] as String;
      }
      if (data['icRadius'] != null) {
        this.iconRadius = data['icRadius'] as Int;
      }
      if (data['stateEffect'] != null) {
        this.stateEft = data['stateEffect'] as Boolean;
      }
      if (data['icSizeW'] != null || data['icSizeH'] != null) {
        this.iconSize = {width: data['icSizeW'] as Double, height: data['icSizeH'] as Double} as SizeOptions;
      }
      if (data['icRadsTl'] != null || data['icRadsTr'] != null || 
        data['icRadsBl'] != null || data['icRadsBr'] != null) {
        this.iconRadius = {
          topLeft: data['icRadsTl'] as Int, 
          topRight: data['icRadsTr'] as Int, 
          bottomLeft: data['icRadsBl'] as Int, 
          bottomRight: data['icRadsBr'] as Int
        } as BorderRadiuses;
      }
    }
  }

  onPageShow() {
    console.debug('====>page_saveButtonCustomize page show called');
    let stateChangeEvent:events_emitter.InnerEvent = {
      eventId: 1,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack);
  }

  onPageHide() {
    console.debug('====>page_saveButtonCustomize page hide called');
    events_emitter.off(1);
  }

  build() {
    Row() {
      Column() {
        Row() {
          SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: this.bgType })
            .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
              try {
                let clickData:events_emitter.EventData = {
                  data: {
                    'clickResult': result,
                  } as Record<string, RecordData>
                }
                let clickEvent:events_emitter.InnerEvent = {
                  eventId: 2,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info('====>page_saveButtonCustomize onclick result:' + JSON.stringify(result));
                events_emitter.emit(clickEvent, clickData)
              } catch (err) {
                err = err as BusinessError;
                console.info('====>page_saveButtonCustomize emit action state err: ' + JSON.stringify(err.message));
              }
            })
            .iconSize(this.iconSize)
            .layoutDirection(this.direct)
            .position({ x: this.positionX, y: this.positionY })
            .markAnchor({ x: this.anchorX, y: this.anchorY })
            .offset({ x: this.offsetX, y: this.offsetY })
            .fontSize(this.fontSize)
            .fontStyle(this.fontStyle)
            .fontWeight(this.fontWeight)
            .fontColor(this.fontColor)
            .iconColor(this.iconColor)
            .backgroundColor(this.bgColor)
            .borderStyle(this.borderSty)
            .borderWidth(this.borderWid)
            .borderColor(this.borderCol)
            .borderRadius(this.borderRad)
            .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
            .textIconSpace(this.middle)
            .align(this.sbAlign)
            .setIcon(this.customIcon)
            .setText(this.customText)
            .iconBorderRadius(this.iconRadius)
            .stateEffect(this.stateEft)
            .id('keySave')
        }.width(100)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}