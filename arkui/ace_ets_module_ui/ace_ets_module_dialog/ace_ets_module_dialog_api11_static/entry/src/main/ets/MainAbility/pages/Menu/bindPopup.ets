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
import emitter from '@ohos.events.emitter'
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  ResourceColor,
  Builder,
  Padding,
  FlexDirection,
  PopupOptions,
  CustomPopupOptions,
  Position,
  RowOptions,
  Image,
  $rawfile,
  Placement,
  PopupOptions,
  CustomPopupOptions,
  PopupStateChangeParam,
  PopupMaskType
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PopupExample {
  @State noHandlePopup: boolean = false
  @State handlePopup: boolean = false
  @State customPopup: boolean = false
  @State maskColor: ResourceColor = 0x33000000 as ResourceColor
  @State enableArrow: boolean = true
  @State placementOnTop: boolean = false

  @Builder
  popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Image($rawfile('ic_health_heart.png')).width(24).height(24).margin({ left: -5 } as Margin).key('image')
      Text('Custom Popup').fontSize(12).key('text')
    }.width(100).height(50).backgroundColor(Color.White)
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Button('no handle popup')
        .key('button2')
        .onClick((e: ClickEvent) => {
          this.noHandlePopup = !this.noHandlePopup
          try {
            let backData: emitter.EventData = {
              data: {
                "placementOnTop": this.placementOnTop,
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 65,
              priority: emitter.EventPriority.LOW
            }
            console.info("button2 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.noHandlePopup, {
          message: 'content1 content1',
          // placement: this.placementOnTop,   //  源代码逻辑问题，Boolean 与 Placement不匹配
          onStateChange: (e:PopupStateChangeParam) => {
            console.info(e.isVisible.toString())
            if (!e.isVisible) {
              this.noHandlePopup = false
            }
          }
        } as PopupOptions)
        .position({ x: 100, y: 50 } as Position)

      Button('custom popup 1')
        .key('button1')
        .onClick((e: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "maskColor": this.maskColor,
                "enableArrow": this.enableArrow
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 66,
              priority: emitter.EventPriority.LOW
            }
            console.info("button1 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .position({ x: 100, y: 200 } as Position)

      Button('custom popup')
        .key('button')
        .onClick((e: ClickEvent) => {
          this.customPopup = !this.customPopup
          try {
            let backData: emitter.EventData = {
              data: {
                "maskColor": this.maskColor,
                "enableArrow": this.enableArrow
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 67,
              priority: emitter.EventPriority.LOW
            }
            console.info("button start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Bottom,
          mask: { color: this.maskColor },
          popupColor: Color.White,
          enableArrow: this.enableArrow,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        } as CustomPopupOptions)
        .position({ x: 100, y: 350 } as Position)
    }.width('100%').padding({ top: 5 } as Padding)
  }

  onPageShow() {
    console.info('customPopupOption page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 68,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
 	     console.info('hzj_popup: stateChangCallBack')
 	     if (eventData != null) {
 	       console.info("hzj_popup: customPopupOption page state change called:" + JSON.stringify(eventData.data));
 	       this.maskColor = ((eventData.data) as Record<String,RecordData>)?.['maskColor'] as ResourceColor;
 	       this.enableArrow = ((eventData.data) as Record<String,RecordData>)?.['enableArrow'] as boolean;
    }
  }
}