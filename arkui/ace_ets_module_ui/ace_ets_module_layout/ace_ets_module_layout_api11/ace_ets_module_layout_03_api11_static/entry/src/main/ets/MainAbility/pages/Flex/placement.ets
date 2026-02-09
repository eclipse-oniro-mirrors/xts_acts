'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Entry, Component,Builder, PopupStateChangeParam,Row,ClickEvent,Position,Padding,CustomPopupOptions,RowOptions,Color,Column,Button,ColumnOptions,Text,Flex,Direction,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin,Placement } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PlacementExample {
  @State customPopup: boolean = false
  @State customPopupOne: boolean = false
  @State customPopupTwo: boolean = false
  @State customPopupThree: boolean = false
  @State placement: Placement = Placement.TopLeft
  @State placementOne: Placement = Placement.TopRight
  @State placementTwo: Placement = Placement.BottomLeft
  @State placementThree: Placement = Placement.BottomRight

  @Builder popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom Popup').fontSize(12)
    }.width(100).height(50).backgroundColor(Color.White).key('image')
  }
  @Builder popupBuilderOne() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom PopupOne').fontSize(12)
    }.width(100).height(50).backgroundColor(Color.White).key('image1')
  }
  @Builder popupBuilderTwo() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom PopupTwo').fontSize(12)
    }.width(100).height(50).backgroundColor(Color.White).key('image2')
  }
  @Builder popupBuilderThree() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom PopupThree').fontSize(12)
    }.width(100).height(50).backgroundColor(Color.White).key('image3')
  }

  build() {
    Flex({ direction: FlexDirection.Column } as FlexOptions) {
      Button('custom popup')
        .key('button')
        .onClick((e:ClickEvent) => {
          this.customPopup = !this.customPopup
          try{
            let backData: events_emitter.EventData = {
              data:{
                "placement":this.placement
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 157,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("PlacementExample button start to emit action state")
            events_emitter.emit(backEvent, backData)
          }catch(err){
            console.info("button emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: this.placement,
          popupColor: Color.White,
          enableArrow: true,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        } as CustomPopupOptions)
        .position({ x: 100, y: 50 } as Position)

      Button('custom popupOne')
        .key('button1')
        .onClick((e:ClickEvent) => {
          this.customPopupOne = !this.customPopupOne
          try{
            let backDataOne: events_emitter.EventData = {
              data:{
                "placement":this.placementOne
              } as Record<String,RecordData>
            }
            let backEventOne: events_emitter.InnerEvent = {
              eventId: 158,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("custom popupOne button1 start to emit action state")
            events_emitter.emit(backEventOne, backDataOne)
          }catch(err){
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.customPopupOne, {
          builder: this.popupBuilderOne,
          placement: this.placementOne,
          
          popupColor: Color.White,
          enableArrow: true,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopupOne = false
            }
          }
        } as CustomPopupOptions)
        .position({ x: 100, y: 150 } as Position)

      Button('custom popupTwo')
        .key('button2')
        .onClick((e:ClickEvent) => {
          this.customPopupTwo = !this.customPopupTwo
          try{
            let backDataTwo: events_emitter.EventData = {
              data:{
                "placement":this.placementTwo
              } as Record<String,RecordData>
            }
            let backEventTwo: events_emitter.InnerEvent = {
              eventId: 159,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button2 start to emit action state")
            events_emitter.emit(backEventTwo, backDataTwo)
          }catch(err){
            console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.customPopupTwo, {
          builder: this.popupBuilderTwo,
          placement: this.placementTwo,
          
          popupColor: Color.White,
          enableArrow: true,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopupTwo = false
            }
          }
        } as CustomPopupOptions)
        .position({ x: 100, y: 250 } as Position)

      Button('custom popupThree')
        .key('button3')
        .onClick((e:ClickEvent) => {
          this.customPopupThree = !this.customPopupThree
          try{
            let backDataThree: events_emitter.EventData = {
              data:{
                "placement":this.placementThree
              } as Record<String,RecordData>
            }
            let backEventThree: events_emitter.InnerEvent = {
              eventId: 160,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button3 start to emit action state")
            events_emitter.emit(backEventThree, backDataThree)
          }catch(err){
            console.info("button3 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.customPopupThree, {
          builder: this.popupBuilderThree,
          placement: this.placementThree,
          
          popupColor: Color.White,
          enableArrow: true,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopupThree = false
            }
          }
        } as CustomPopupOptions)
        .position({ x: 100, y: 550 } as Position)
    }.width('100%').padding({ top: 5 } as Padding)
  }
}