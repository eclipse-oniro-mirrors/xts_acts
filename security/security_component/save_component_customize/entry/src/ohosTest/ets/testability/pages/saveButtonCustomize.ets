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

@Entry
@Component
struct saveButtonCustomize {
  @State bgType: ButtonType = ButtonType.Normal
  @State iconSize: number | SizeOptions | undefined = undefined
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
  @State fontColor: number = 0xffffffff
  @State iconColor: number = 0xffffffff
  @State bgColor: number = 0xff007dff
  @State borderSty: BorderStyle = BorderStyle.Dashed
  @State borderWid: number = 0
  @State borderCol: number = 0xffffffff
  @State borderRad: number = 0
  @State left: number = 12
  @State right: number = 12
  @State top: number = 4
  @State bottom: number = 4
  @State middle: number = 4
  @State clipSet: boolean = false
  @State columnWidth: string = '100%'
  @State columnHeight: string = '100%'
  @State sbAlign: Alignment = Alignment.Center
  @State customIcon: Resource | undefined = undefined
  @State customText: string | undefined = undefined
  @State iconRadius: number | BorderRadiuses | undefined = undefined
  @State stateEft: boolean | undefined = undefined
  @State iconSizeW: number | undefined = undefined
  @State iconSizeH: number | undefined = undefined
  @State iconRadiusTl: number | undefined = undefined
  @State iconRadiusTr: number | undefined = undefined
  @State iconRadiusBl: number | undefined = undefined
  @State iconRadiusBr: number | undefined = undefined

  private stateChangeCallBack = (eventData:events_emitter.EventData) => {
    if (eventData != null && eventData.data != undefined) {
      console.debug('====>saveButtonCustomize page state change called:' + JSON.stringify(eventData));
      if (eventData.data.iconSize != null) {
        this.iconSize = eventData.data.iconSize;
      }
      if (eventData.data.cuIcon != null) {
        this.customIcon = eventData.data.cuIcon;
      }
      if (eventData.data.cuText != null) {
        this.customText = eventData.data.cuText;
      }
      if (eventData.data.icRadius != null) {
        this.iconRadius = eventData.data.icRadius;
      }
      if (eventData.data.stateEffect != null) {
        this.stateEft = eventData.data.stateEffect;
      }
      if (eventData.data.icSizeW != null || eventData.data.icSizeH != null) {
        this.iconSize = {width: eventData.data.icSizeW, height: eventData.data.icSizeH};
      }
      if (eventData.data.icRadsTl != null || eventData.data.icRadsTr != null || 
        eventData.data.icRadsBl != null || eventData.data.icRadsBr != null) {
        this.iconRadius = {
          topLeft: eventData.data.icRadsTl, 
          topRight: eventData.data.icRadsTr, 
          bottomLeft: eventData.data.icRadsBl, 
          bottomRight: eventData.data.icRadsBr
        };
      }
    }
  }

  onPageShow() {
    console.debug('====>page_saveButton page show called');
    let stateChangeEvent:events_emitter.InnerEvent = {
      eventId: 1,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack);
  }

  onPageHide() {
    console.debug('====>page_saveButton page hide called');
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
                  }
                }
                let clickEvent:events_emitter.InnerEvent = {
                  eventId: 2,
                  priority: events_emitter.EventPriority.LOW
                }
                console.debug('====>page_saveButton onclick result:' + JSON.stringify(result))
                events_emitter.emit(clickEvent, clickData)
              } catch (err) {
                console.debug('====>page_saveButton emit action state err: ' + JSON.stringify(err.message))
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
