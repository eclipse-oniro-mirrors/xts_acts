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
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ClickEvent,
  ColumnOptions,
  TextAlign,
  $rawfile,Image,Color,Position,Row,Placement,$r,ResourceStr,ArrowPointPosition,RowOptions,Padding,Dimension,Builder,PopupStateChangeParam,CustomPopupOptions
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,State } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import { RecordData } from '@ohos.base';

interface CustomEventData {
  enableArrow?: boolean; // 可选属性，类型为布尔值

}

@Entry
@Component
struct PopupExample12 {
  @State noHandlePopup: boolean = false;
  @State handlePopup: boolean = false;
  @State customPopup: boolean = false;
  @State enableArrow: boolean = true;
  @State placementOnTop: boolean = false;
  @State arrowWidth: Dimension = '20px';
  @State arrowHeight: Dimension = '20px';
  @State arrowPointPosition: ArrowPointPosition = ArrowPointPosition.START;

  @Builder
  popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom Popup')
        .fontSize(12)
        .key('Custom_popup')
    }
    .width(100)
    .height(50)
    .backgroundColor(Color.White)
  }



  build() {
    Flex({ direction: FlexDirection.Column } as FlexOptions) {
      Button('no handle popup')
        .key('button2')
        .onClick((e:ClickEvent) => {
          this.noHandlePopup = !this.noHandlePopup
          try {
            let backData: events_emitter.EventData = {
              data: {
                "placementOnTop": this.placementOnTop,
                "arrowPointPosition": this.arrowPointPosition,
                "arrowWidth": this.arrowWidth,
                "arrowHeight": this.arrowHeight,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 65,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button2 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.noHandlePopup, {
          builder:this.popupBuilder,
          // placementOnTop: this.placementOnTop,
          enableArrow: true,
          arrowPointPosition: this.arrowPointPosition,
          arrowWidth: this.arrowWidth,
          arrowHeight: this.arrowHeight,
          onStateChange: (e:PopupStateChangeParam) => {
            console.info(e.isVisible.toString())
            if (!e.isVisible) {
              this.noHandlePopup = false
            }
          }
        } as CustomPopupOptions)
        .position({ x: 100, y: 50 } as Position)
    }.width('100%').padding({ top: 5 } as Padding)
  }

  private stateChangCallBack:(eventData: events_emitter.EventData)=>void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("customPopupOption page state change called:" + JSON.stringify(eventData));

      const customData = eventData.data as CustomEventData;

      // 检查 enableArrow 是否存在且为布尔类型
      if (typeof customData.enableArrow === 'boolean') {
        this.enableArrow = customData.enableArrow as boolean; // 类型安全的赋值
      }
    }
  }
}