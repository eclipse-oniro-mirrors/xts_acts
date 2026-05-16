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
  TextHeightAdaptivePolicy,
  AlignRuleOption,
  LocalizedAlignRuleOptions,
  Axis,
  ChainStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct saveButtonScenario {
  @State bgType: ButtonType | undefined = ButtonType.Normal
  @State iconSize: number | undefined = 16
  @State direct: SecurityComponentLayoutDirection | undefined = SecurityComponentLayoutDirection.HORIZONTAL
  @State positionX: string | undefined = '0'
  @State positionY: string | undefined = '0'
  @State anchorX: string | undefined = '0'
  @State anchorY: string | undefined = '0'
  @State offsetX: string | undefined = '0'
  @State offsetY: string | undefined = '0'
  @State fontSize: number | undefined = 16
  @State fontStyle: FontStyle | undefined = FontStyle.Normal
  @State fontWeight: FontWeight | int | string | undefined = FontWeight.Medium
  @State fontFamily: string | undefined = 'HarmonyOS Sans'
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
  @State widthT: number = 10
  @State heightT: number = 15
  @State minWidth: number = 20
  @State maxWidth: number = 25
  @State minHeight: number = 30
  @State maxHeight: number = 35
  @State maxFontSize: number | String | undefined = undefined
  @State minFontSize: number | String | undefined = undefined
  @State enable: boolean = true
  @State saveId: string = ''

  private stateChangeCallBack: (eventData: events_emitter.EventData) => void = 
    (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != undefined) {
      const data = eventData.data as Record<String, RecordData>
      console.info('====>page_saveButtonScenario page state change called:' + JSON.stringify(eventData.data));

      if (data['bgType'] != null) {
        this.bgType = data['bgType'] as ButtonType
      }
      if (data['iconSize'] != null) {
        this.iconSize = data['iconSize']  as Int
      }
      if (data['direct'] != null) {
        this.direct = data['direct'] as SecurityComponentLayoutDirection
      }
      if (data['positionX'] != null) {
        this.positionX = data['positionX'] as String
      }
      if (data['positionY'] != null) {
        this.positionY = data['positionY'] as String
      }
      if (data['anchorX'] != null) {
        this.anchorX = data['anchorX'] as String
      }
      if (data['anchorY'] != null) {
        this.anchorY = data['anchorY'] as String
      }
      if (data['offsetX'] != null) {
        this.offsetX = data['offsetX'] as String
      }
      if (data['offsetY'] != null) {
        this.offsetY = data['offsetY'] as String
      }
      if (data['fontSize'] != null) {
        this.fontSize = data['fontSize'] as Int
      }
      if (data['fontStyle'] != null) {
        this.fontStyle = data['fontStyle'] as FontStyle
      }
      if (data['fontWeight'] != null) {
        this.fontWeight = data['fontWeight'] as FontWeight
      } else if (data['fontWeight_N'] != null) {
        this.fontWeight = data['fontWeight_N'] as Int
      } else if (data['fontWeight_S'] != null) {
        this.fontWeight = data['fontWeight_S'] as String
      }
      if (data['fontFamily'] != null) {
        this.fontFamily = data['fontFamily'] as String
      }
      if ((data['fontColor'] != null) && (data['fontColor'] != Color.Transparent)) {
        this.fontColor = data['fontColor'] as String
      } else if ((data['fontColor'] != null) && (data['fontColor'] == Color.Transparent)) {
        this.fontColor = data['fontColor'] as Color
      }
      if ((data['iconColor'] != null) && (data['iconColor'] != Color.Transparent)) {
        this.iconColor = data['iconColor'] as String
      } else if ((data['iconColor'] != null) && (data['iconColor'] == Color.Transparent)) {
        this.iconColor = data['iconColor'] as Color
      }
      if ((data['bgColor'] != null) && (data['bgColor'] != Color.Transparent)) {
        this.bgColor = data['bgColor'] as String
      } else if ((data['bgColor'] != null) && (data['bgColor'] == Color.Transparent)) {
        this.bgColor = data['bgColor'] as Color
      }
      if (data['borderSty'] != null) {
        this.borderSty = data['borderSty'] as BorderStyle
      }
      if (data['borderWid'] != null) {
        this.borderWid = data['borderWid'] as Int
      }
      if ((data['borderCol'] != null) && (data['borderCol'] != Color.Transparent)) {
        this.borderCol = data['borderCol'] as String
      } else if ((data['borderCol'] != null) && (data['borderCol'] == Color.Transparent)) {
        this.borderCol = data['borderCol'] as Color
      }
      if (data['borderRad'] != null) {
        this.borderRad = data['borderRad'] as Int
      }
      if (data['left'] != null) {
        this.left = data['left'] as Int
      }
      if (data['right'] != null) {
        this.right = data['right'] as Int
      }
      if (data['top'] != null) {
        this.top = data['top'] as Int
      }
      if (data['bottom'] != null) {
        this.bottom = data['bottom'] as Int
      }
      if (data['middle'] != null) {
        this.middle = data['middle'] as Int
      }
      if (data['width'] != null) {
        this.widthT = data['width'] as Int
      }
      if (data['height'] != null) {
        this.heightT = data['height'] as Int
      }
      if (data['minWidth'] != null) {
        this.minWidth = data['minWidth'] as Int
      }
      if (data['maxWidth'] != null) {
        this.maxWidth = data['maxWidth'] as Int
      }
      if (data['minHeight'] != null) {
        this.minHeight = data['minHeight'] as Int
      }
      if (data['maxHeight'] != null) {
        this.maxHeight = data['maxHeight'] as Int
      }
      if (data['maxFontSize'] != null) {
        this.maxFontSize = data['maxFontSize'] as String
      }
      if (data['minFontSize'] != null) {
        this.minFontSize = data['minFontSize'] as String
      }
      if (data['enable'] != null) {
        this.enable = data['enable'] as Boolean
      }
      if (data['id'] != null) {
        this.saveId = data['id'] as String
      }
    }
  }

  onPageShow() {
    console.debug('====>page_saveButtonScenario page show called');
    let stateChangeEvent:events_emitter.InnerEvent = {
      eventId: 1,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack);
  }

  onPageHide() {
    console.debug('====>page_saveButtonScenario page hide called');
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
                console.info('====>page_saveButtonScenario onclick result:' + JSON.stringify(result));
                events_emitter.emit(clickEvent, clickData)
              } catch (err) {
                err = err as BusinessError;
                console.info('====>page_saveButtonScenario emit action state err: ' + JSON.stringify(err.message));
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
            .fontFamily(this.fontFamily)
            .fontColor(this.fontColor)
            .iconColor(this.iconColor)
            .backgroundColor(this.bgColor)
            .borderStyle(this.borderSty)
            .borderWidth(this.borderWid)
            .borderColor(this.borderCol)
            .borderRadius(this.borderRad)
            .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
            .textIconSpace(this.middle)
            .width(this.widthT)
            .height(this.heightT)
            .size({ width: this.widthT, height: this.heightT })
            .constraintSize({
              minWidth: this.minWidth,
              maxWidth: this.maxWidth,
              minHeight: this.minHeight,
              maxHeight: this.maxHeight
            })
            .maxFontSize(this.maxFontSize)
            .minFontSize(this.minFontSize)
            .enabled(this.enable)
            .id(this.saveId)
            .key('keySave2')
        }.width(100)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}