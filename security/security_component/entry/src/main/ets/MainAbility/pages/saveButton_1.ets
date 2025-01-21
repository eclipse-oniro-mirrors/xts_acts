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
  @State left: number = 24
  @State right: number = 24
  @State top: number = 8
  @State bottom: number = 8
  @State middle: number = 4
  @State heightValue: number = 4
  marginValue = {top:30, bottom:20, left:10, right:10}

  build() {
    Column() {
      Row() {
        SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.DOWNLOAD_FILE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_IMAGE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_FILE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD_AND_SHARE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.RECEIVE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.CONTINUE_TO_RECEIVE, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_TO_GALLERY, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.EXPORT_TO_GALLERY, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.QUICK_SAVE_TO_GALLERY, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.RESAVE_TO_GALLERY, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
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
      }.width('100%').height(this.heightValue).margin(this.marginValue)
    }
  }
}
