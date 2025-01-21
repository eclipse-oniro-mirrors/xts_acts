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
struct locationButton_1 {
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
        LocationButton({ icon: LocationIconStyle.LINES, text: LocationDescription.ADD_LOCATION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation2")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.SELECT_LOCATION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation3")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.SHARE_LOCATION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation4")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.SEND_LOCATION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation5")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.LOCATING, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation6")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.LOCATION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation7")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.SEND_CURRENT_LOCATION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation8")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.RELOCATION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation9")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.PUNCH_IN, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation10")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
      Row() {
        LocationButton({ icon: LocationIconStyle.FULL_FILLED, text: LocationDescription.CURRENT_POSITION, buttonType: this.bgType })
          .onClick((event: ClickEvent, result: LocationButtonOnClickResult) => {
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
              console.debug("====>page_LocationButton onclick result:" + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug("====>page_LocationButton emit action state err: " + JSON.stringify(err.message))
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
          .key("keyLocation11")
      }.width('100%').height(this.heightValue).margin(this.marginValue)
    }
  }
}
