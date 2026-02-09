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
  PasteButton,
  PasteIconStyle,
  PasteDescription,
  Row,
  PasteButtonOnClickResult,
  PasteButtonCallback,
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
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct pasteButton {
  @State bgType: ButtonType | undefined = ButtonType.Normal
  @State iconSize: number | undefined = 16
  @State direct: SecurityComponentLayoutDirection | undefined = SecurityComponentLayoutDirection.HORIZONTAL
  @State positionX: number | undefined = 0
  @State positionY: number | undefined = 0
  @State anchorX: number | undefined = 0
  @State anchorY: number | undefined = 0
  @State offsetX: number | undefined = 0
  @State offsetY: number | undefined = 0
  @State fontSize: number | undefined = 16
  @State fontStyle: FontStyle | undefined = FontStyle.Normal
  @State fontWeight: FontWeight | undefined = FontWeight.Medium
  @State fontFamily: string | undefined = 'HarmonyOS Sans'
  @State fontColor: string | undefined = '#ffffffff'
  @State iconColor: string | undefined = '#ffffffff'
  @State bgColor: string | undefined = '#ff007dff'
  @State borderSty: BorderStyle | undefined = BorderStyle.Dashed
  @State borderWid: number | undefined = 0
  @State borderCol: string | undefined = '#ffffffff'
  @State borderRad: number | undefined = 0
  @State left: number | undefined = 12
  @State right: number | undefined = 12
  @State top: number | undefined = 4
  @State bottom: number | undefined = 4
  @State middle: number | undefined = 4
  @State compWidth: number|undefined = undefined
  @State compHeight: number|undefined = undefined
  @State clipSet: boolean | undefined = false
  @State rowWidth: number | undefined = 100
  @State rowHeight: number|undefined = undefined
  @State pbAlign: Alignment | undefined = Alignment.Center
  @State strokeMargin: number = 0
  @State strokeColorR: number = 0
  @State strokeColorG: number = 0
  @State strokeColorB: number = 0
  @State strokeWidth: number = 0
  private stateChangeCallBack: (eventData:events_emitter.EventData) => void =
    (eventData:events_emitter.EventData) => {
    if (eventData != null && eventData.data != undefined) {
      const data = eventData.data as Record<String,RecordData>
      console.info('====>page_pasteButton page state change called:' + JSON.stringify(eventData));

      if (data['bgType'] != null) {
        this.bgType = (data['bgType'] as Object) as ButtonType
      }
      if (data['iconSize'] != null) {
        this.iconSize = data['iconSize'] as Int
      }
      if (data['direct'] != null) {
        this.direct = (data['direct'] as Object) as SecurityComponentLayoutDirection
      }
      if (data['positionX'] != null) {
        this.positionX = data['positionX'] as Int
      }
      if (data['positionY'] != null) {
        this.positionY = data['positionY'] as Int
      }
      if (data['anchorX'] != null) {
        this.anchorX = data['anchorX'] as Int
      }
      if (data['anchorY'] != null) {
        this.anchorY = data['anchorY'] as Int
      }
      if (data['offsetX'] != null) {
        this.offsetX = data['offsetX'] as Int
      }
      if (data['offsetY'] != null) {
        this.offsetY = data['offsetY'] as Int
      }
      if (data['fontSize'] != null) {
        this.fontSize = data['fontSize'] as Int
      }
      if (data['fontStyle'] != null) {
        this.fontStyle = (data['fontStyle'] as Object) as FontStyle
      }
      if (data['fontWeight'] != null) {
        this.fontWeight = (data['fontWeight'] as Object) as FontWeight
      }
      if (data['fontFamily'] != null) {
        this.fontFamily = data['fontFamily'] as String
      }
      if (data['fontColor'] != null) {
        this.fontColor = data['fontColor'] as String
      }
      if (data['iconColor'] != null) {
        this.iconColor = data['iconColor'] as String
      }
      if (data['bgColor'] != null) {
        this.bgColor = data['bgColor'] as String
      }
      if (data['borderSty'] != null) {
        this.borderSty = (data['borderSty'] as Object) as BorderStyle
      }
      if (data['borderWid'] != null) {
        this.borderWid = data['borderWid'] as Int
      }
      if (data['borderCol'] != null) {
        this.borderCol = data['borderCol'] as String
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
      if (data['buWidth'] != null) {
        this.compWidth = data['buWidth'] as Int
      }else{
        this.compWidth = undefined
      }
      if (data['buHeight'] != null) {
        this.compHeight = data['buHeight'] as Int
      }else{
        this.compHeight = undefined
      }
      if (data['clipSet'] != null) {
        this.clipSet = data['clipSet'] as Boolean
      }
      if (data['rowWidth'] != null) {
        this.rowWidth = data['rowWidth'] as Int
      }else{
        this.rowWidth = 100
      }
      if (data['rowHeight'] != null) {
        this.rowHeight = data['rowHeight'] as Int
      }else{
        this.rowHeight = undefined
      }
      if (data['align'] != null) {
        this.pbAlign = (data['align'] as Object) as Alignment
      }
      if (data['strokeMag'] != null) {
        this.strokeMargin = data['strokeMag'] as Int
      }
      if (data['strokeColR'] != null) {
        this.strokeColorR = data['strokeColR'] as Int
      }
      if (data['strokeColG'] != null) {
        this.strokeColorG = data['strokeColG'] as Int
      }
      if (data['strokeColB'] != null) {
        this.strokeColorB = data['strokeColB'] as Int
      }
      if (data['strokeWth'] != null) {
        this.strokeWidth = data['strokeWth'] as Int
      }
    }
  }

  onPageShow() {
    console.info('====>page_pasteButton page show called');
    let stateChangeEvent:events_emitter.InnerEvent = {
      eventId: 1,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack);
  }

  onPageHide() {
    console.info('====>page_pasteButton page hide called');
    events_emitter.off(1);
  }

  build() {
    Row() {
      Column() {
        Row() {
          PasteButton({ icon: PasteIconStyle.LINES, text: PasteDescription.PASTE, buttonType: this.bgType })
            .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
              try {
                let clickData:events_emitter.EventData = {
                  data: {
                    'clickResult': result,
                  } as Record<String,RecordData>
                }
                let clickEvent:events_emitter.InnerEvent = {
                  eventId: 2,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info('====>page_pasteButton onclick result: ' + JSON.stringify(result))
                events_emitter.emit(clickEvent, clickData)
              } catch (err) {
                err = err as BusinessError
                console.info('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
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
            .size({width: this.compWidth, height: this.compHeight})
            .align(this.pbAlign)
            .focusBox({
              margin: new LengthMetrics(this.strokeMargin),
              strokeColor: ColorMetrics.rgba(this.strokeColorR, this.strokeColorG, this.strokeColorB),
              strokeWidth: LengthMetrics.px(this.strokeWidth)
            })
            .id('keyPaste')
            .key('keyPaste')
        }.width(this.rowWidth).height(this.rowHeight)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}
