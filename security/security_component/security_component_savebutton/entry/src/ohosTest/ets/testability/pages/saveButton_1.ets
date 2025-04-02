/**
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
struct saveButton_1 {
  @State icon: SaveIconStyle = 0
  @State textType: SaveDescription = 0
  @State bgType: ButtonType = ButtonType.Normal
  @State iconSize: number = 16
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
  @State bgColor: number = 0x7dff
  @State borderSty: BorderStyle = BorderStyle.Dashed
  @State borderWid: number = 0
  @State borderCol: number = 0xffffffff
  @State borderRad: number = 0
  @State left: number = 12
  @State right: number = 12
  @State top: number = 4
  @State bottom: number = 4
  @State middle: number = 4
  @State heightValue: number = 4
  marginValue:ESObject = {top:30, bottom:20, left:10, right:10}
  @State isShow: number = 0

  build() {
    Row(){
      Column(){
        Row() {
          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.DOWNLOAD_FILE, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave2")
          }
          .visibility(this.isShow === 0 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.VERTICAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave3")
          }
          .visibility(this.isShow === 1 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_IMAGE, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave4")
          }
          .visibility(this.isShow === 2 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_FILE, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave5")
          }
          .visibility(this.isShow === 3 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD_AND_SHARE, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave6")
          }
          .visibility(this.isShow === 4 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.RECEIVE, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave7")
          }
          .visibility(this.isShow === 5 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.CONTINUE_TO_RECEIVE, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave8")
          }
          .visibility(this.isShow === 6 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_TO_GALLERY, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave9")
          }
          .visibility(this.isShow === 7 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.EXPORT_TO_GALLERY, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave15")
          }
          .visibility(this.isShow === 8 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.QUICK_SAVE_TO_GALLERY, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave16")
          }
          .visibility(this.isShow === 9 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.RESAVE_TO_GALLERY, buttonType: this.bgType })
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      "clickResult": result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.debug("====>page_SaveButton onclick result:" + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.debug("====>page_SaveButton emit action state err: " + JSON.stringify(err.message))
                }
              })
              .iconSize(this.iconSize)
              .layoutDirection(SecurityComponentLayoutDirection.HORIZONTAL)
              .markAnchor({ x: this.anchorX, y: this.anchorY })
              .offset({ x: this.offsetX, y: 0 })
              .fontSize(this.fontSize)
              .fontStyle(this.fontStyle)
              .fontWeight(this.fontWeight)
              .fontFamily(this.fontFamily)
              .fontColor('0xFFFFF000')
              .iconColor(this.iconColor)
              .backgroundColor(this.bgColor)
              .borderStyle(this.borderSty)
              .borderWidth(this.borderWid)
              .borderColor(this.borderCol)
              .borderRadius(this.borderRad)
              .padding({ left: this.left, right: this.right, top: this.top, bottom: this.bottom })
              .textIconSpace(this.middle)
              .key("keySave17")
          }
          .visibility(this.isShow === 10 ? Visibility.Visible : Visibility.None)

          Button('点击切换安全控件')
            .width('50%')
            .height(40)
            .offset({x:-100, y:50})
            .onClick(() => {
              this.isShow++
            })
            .id('switchButton')
        }.width(100)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}
