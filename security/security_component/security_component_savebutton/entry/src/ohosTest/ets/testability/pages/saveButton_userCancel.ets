/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct saveButton_userCancel {
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
  @State compWidth: number|undefined = undefined
  @State compHeight: number|undefined = undefined
  @State clipSet: boolean = false
  @State rowWidth: number = 100
  @State rowHeight: number|undefined = undefined
  @State sbAlign: Alignment = Alignment.Center
  @State maxFontSize: number | undefined = undefined
  @State minFontSize: number | undefined = undefined
  @State maxFontScale: number | undefined = undefined
  @State minFontScale: number | undefined = undefined
  @State enable: boolean | undefined = undefined
  @State heightAdaptivePolicy: number | undefined = undefined
  @State maxLines: number | undefined = undefined
  @State alignRule: AlignRuleOption | LocalizedAlignRuleOptions | undefined = undefined
  @State chainDirection: Axis | undefined = undefined
  @State chainStyle: ChainStyle | undefined = undefined
  @State userEvent: boolean | undefined = false
  private stateChangeCallBack = (eventData:events_emitter.EventData) => {
    if (eventData != null && eventData.data != undefined) {
      console.debug('====>page_saveButton page state change called:' + JSON.stringify(eventData));
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
      if (eventData.data.buWidth != null) {
        this.compWidth = eventData.data.buWidth;
      }else{
        this.compWidth = undefined
      }
      if (eventData.data.buHeight != null) {
        this.compHeight = eventData.data.buHeight;
      }else{
        this.compHeight = undefined
      }
      if (eventData.data.clipSet != null) {
        this.clipSet = eventData.data.clipSet;
      }
      if (eventData.data.rowWidth != null) {
        this.rowWidth = eventData.data.rowWidth;
      }else{
        this.rowWidth = 100
      }
      if (eventData.data.rowHeight != null) {
        this.rowHeight = eventData.data.rowHeight;
      }else{
        this.rowHeight = undefined
      }
      if (eventData.data.columnHeight != null) {
        this.sbAlign = eventData.data.align;
      }
      if (eventData.data.userEve != null) {
        this.userEvent = eventData.data.userEve;
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
            .size({width: this.compWidth, height: this.compHeight})
            .align(this.sbAlign)
            .maxLines(this.maxLines)
            .maxFontSize(this.maxFontSize)
            .minFontSize(this.minFontSize)
            .maxFontScale(this.maxFontScale)
            .minFontScale(this.minFontScale)
            .heightAdaptivePolicy(this.heightAdaptivePolicy)
            .enabled(this.enable)
            .alignRules(this.alignRule)
            .chainMode(this.chainDirection, this.chainStyle)
            .userCancelEvent(this.userEvent)
            .id('keySaveCancel')
        }.width(this.rowWidth).height(this.rowHeight)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}