/**
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

import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct pasteButton_1 {
  @State bgType: ButtonType = ButtonType.Normal
  @State iconSize: number = 16
  @State direct: SecurityComponentLayoutDirection = 0
  @State positionX: number = 0
  @State positionY: number = 0
  @State anchorX: number = 0
  @State anchorY: number = 0
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State fontSize: number = 16
  @State fontStyle: FontStyle = FontStyle.Normal
  @State fontWeight: FontWeight = FontWeight.Medium
  @State fontFamily: string = 'HarmonyOS Sans'
  @State fontColor: number = 0xffffffff
  @State iconColor: number = 0xffffffff
  @State bgColor: number = 0xff007dff
  @State borderSty: BorderStyle = BorderStyle.Dashed
  @State borderWid: number = 0
  @State borderCol: number = 0xffffffff
  @State borderRad: number = 0
  @State left: number = 24
  @State right: number = 24
  @State top: number = 8
  @State bottom: number = 8
  @State middle: number = 4
  @State clipSet: boolean = false
  @State columnWidth: string = '100%'
  @State columnHeight: string = '100%'
  @State widthT: number = 10
  @State heightT: number = 15
  @State minWidth: number = 20
  @State maxWidth: number = 25
  @State minHeight: number = 30
  @State maxHeight: number = 35
  private stateChangeCallBack = (eventData) => {
    if (eventData != null) {
      console.info("====>page_pasteButton_1 page state change called:" + JSON.stringify(eventData));
      if (eventData.data.bgType != null) {
        this.bgType = eventData.data.bgType;
      }
      if (eventData.data.iconSize != null) {
        this.iconSize = eventData.data.iconSize;
      }
      if (eventData.data.direct != null) {
        this.direct = eventData.data.direct;
      }
      if (eventData.data.positionX != null) {
        this.positionX = eventData.data.positionX;
      }
      if (eventData.data.positionY != null) {
        this.positionY = eventData.data.positionY;
      }
      if (eventData.data.anchorX != null) {
        this.anchorX = eventData.data.anchorX;
      }
      if (eventData.data.anchorY != null) {
        this.anchorY = eventData.data.anchorY;
      }
      if (eventData.data.offsetX != null) {
        this.offsetX = eventData.data.offsetX;
      }
      if (eventData.data.offsetY != null) {
        this.offsetY = eventData.data.offsetY;
      }
      if (eventData.data.fontSize != null) {
        this.fontSize = eventData.data.fontSize;
      }
      if (eventData.data.fontStyle != null) {
        this.fontStyle = eventData.data.fontStyle;
      }
      if (eventData.data.fontWeight != null) {
        this.fontWeight = eventData.data.fontWeight;
      }
      if (eventData.data.fontFamily != null) {
        this.fontFamily = eventData.data.fontFamily;
      }
      if (eventData.data.fontColor != null) {
        this.fontColor = eventData.data.fontColor;
      }
      if (eventData.data.iconColor != null) {
        this.iconColor = eventData.data.iconColor;
      }
      if (eventData.data.bgColor != null) {
        this.bgColor = eventData.data.bgColor;
      }
      if (eventData.data.borderSty != null) {
        this.borderSty = eventData.data.borderSty;
      }
      if (eventData.data.borderWid != null) {
        this.borderWid = eventData.data.borderWid;
      }
      if (eventData.data.borderCol != null) {
        this.borderCol = eventData.data.borderCol;
      }
      if (eventData.data.borderRad != null) {
        this.borderRad = eventData.data.borderRad;
      }
      if (eventData.data.left != null) {
        this.left = eventData.data.left;
      }
      if (eventData.data.right != null) {
        this.right = eventData.data.right;
      }
      if (eventData.data.top != null) {
        this.top = eventData.data.top;
      }
      if (eventData.data.bottom != null) {
        this.bottom = eventData.data.bottom;
      }
      if (eventData.data.middle != null) {
        this.middle = eventData.data.middle;
      }
      if (eventData.data.clipSet != null) {
        this.clipSet = eventData.data.clipSet;
      }
      if (eventData.data.columnWidth != null) {
        this.columnWidth = eventData.data.columnWidth;
      }
      if (eventData.data.columnHeight != null) {
        this.columnHeight = eventData.data.columnHeight;
      }
      if (eventData.data.width != null) {
        this.widthT = eventData.data.width;
      }
      if (eventData.data.height != null) {
        this.heightT = eventData.data.height;
      }
      if (eventData.data.minWidth != null) {
        this.minWidth = eventData.data.minWidth;
      }
      if (eventData.data.maxWidth != null) {
        this.maxWidth = eventData.data.maxWidth;
      }
      if (eventData.data.minHeight != null) {
        this.minHeight = eventData.data.minHeight;
      }
      if (eventData.data.maxHeight != null) {
        this.maxHeight = eventData.data.maxHeight;
      }
    }
  }

  onPageShow() {
    console.info('====>page_pasteButton_1 page show called');
    var stateChangeEvent = {
      eventId: 1,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack);
  }

  onPageHide() {
    console.info('====>page_pasteButton_1 page hide called');
    events_emitter.off(1);
  }

  build() {
    Row() {
      Column() {
        PasteButton({ icon: PasteIconStyle.LINES, text: PasteDescription.PASTE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
            try {
              var clickData = {
                data: {
                  "clickResult": result,
                }
              }
              var clickEvent = {
                eventId: 2,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("====>page_pasteButton_1 onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.info("====>page_pasteButton_1 emit action state err: " + JSON.stringify(err.message))
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
          .key("keyPaste2")
          .width(this.widthT)
          .height(this.heightT)
          .size({ width: this.widthT, height: this.heightT })
          .constraintSize({
            minWidth: this.minWidth,
            maxWidth: this.maxWidth,
            minHeight: this.minHeight,
            maxHeight: this.maxHeight
          })
        Button() {
          Text('--------------------')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .margin({
          top: 200,
          bottom:60
        }).backgroundColor('#00000000')
        PasteButton({ icon: PasteIconStyle.LINES, text: PasteDescription.PASTE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
            try {
              var clickData = {
                data: {
                  "clickResult": result
                }
              }
              var clickEvent = {
                eventId: 2,
                priority: events_emitter.EventPriority.LOW
              }
              console.debug("====>page_pasteButton_1 onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_pasteButton_1 emit action state err: " + JSON.stringify(err.message))
            }
          })
          .iconSize(this.iconSize)
          .layoutDirection(this.direct)
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
          .key("keyPaste1")
      }.width(this.columnWidth).height(this.columnHeight).clip(this.clipSet)
    }.height('100%')
  }
}
