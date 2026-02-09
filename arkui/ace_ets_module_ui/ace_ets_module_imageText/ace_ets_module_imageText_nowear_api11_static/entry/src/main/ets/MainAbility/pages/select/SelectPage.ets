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
import { Entry, Text, Column, Component, Select, Font, Color,ResourceColor } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { AppStorage } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct SelectPage {
  @State optionValue: string = 'aaa'
  @State icon: string = "/resources/base/media/star_1.png"
  @State selected: int = 0
  @State selectValue: string = 'SelectButton'
  @State selectFont: Font = { size: 16, weight: 500 } as Font
  @State fontColor: ResourceColor = Color.Black
  @State selectedOptionBgColor: ResourceColor = Color.Grey
  @State selectedOptionFont: Font = { size: 16, weight: 400 } as Font
  @State selectedOptionFontColor: ResourceColor = Color.Red
  @State optionBgColor: ResourceColor = Color.White
  @State optionFont: Font = { size: 16, weight: 400 } as Font
  @State optionFontColor: ResourceColor = Color.Green
  @State indexValue: string = ''
  stateChangCallBack:(eventData: events_emitter.EventData) => void =  (eventData: events_emitter.EventData) =>  {
    let eventD = eventData.data as Record<String,RecordData>
    if (eventData != null && eventD != null) {
      if (eventD!['selected']) {
        this.selected = eventD!['selected'] as int
      } else if (eventD!['selectValue']!= null) {
        this.selectValue =  eventD!['selectValue'] as string
      } else if (eventD!['selectFont']!= null) {
        this.selectFont = eventD!['selectFont'] as Font

      } else if (eventD!['selectedOptionBgColor']!= null) {
        this.selectedOptionBgColor = eventD!['selectedOptionBgColor'] as ResourceColor
      } else if (eventD!['selectedOptionFont']!= null) {
        this.selectedOptionFont = eventD!['selectedOptionFont'] as Font
      } else if (eventD!['selectedOptionFontColor']!= null) {
        this.selectedOptionFontColor = eventD!['selectedOptionFontColor'] as ResourceColor
      }else if (eventD!['optionBgColor']!= null) {
        this.optionBgColor = eventD!['optionBgColor'] as ResourceColor
      }else if (eventD!['optionFont']!= null) {
        this.optionFont = eventD!['optionFont'] as Font
      }else if (eventD!['optionFontColor']!= null) {
        this.optionFontColor = eventD!['optionFontColor'] as ResourceColor
      }else if (eventD!['fontColor']!= null) {
        this.fontColor = eventD!['fontColor'] as ResourceColor
      }else if (eventD!['optionValue']!= null) {
        this.optionValue = eventD!['optionValue'] as string
      }else if (eventD!['icon']!= null) {
        this.icon = eventD!['icon'] as string
      }else if (eventD!['indexValue']!= null) {
        this.indexValue = eventD!['indexValue'] as string
      }
    }
  }
  onPageShow() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 25,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

  }

  build() {
    Column() {
      Text('indexValue:' + this.indexValue).fontSize(18).margin(15).key('indexValue')
      Select([{ value: this.optionValue, icon: this.icon },
              { value: 'bbb', icon: "/resources/base/media/star_1.png" },
              { value: 'ccc', icon: "/resources/base/media/star_1.png" }])
        .selected(this.selected)
        .value(this.selectValue)
        .font(this.selectFont)
        .key('select')
        .fontColor(this.fontColor)
        .selectedOptionBgColor(this.selectedOptionBgColor)
        .selectedOptionFont(this.selectedOptionFont)
        .selectedOptionFontColor(this.selectedOptionFontColor)
        .optionBgColor(this.optionBgColor)
        .optionFont(this.optionFont)
        .optionFontColor(this.optionFontColor)
        .onSelect((index: int) :void => {
          this.indexValue = String(index)
          console.info('Select:' + index)
        })
    }.width('100%')
  }
}