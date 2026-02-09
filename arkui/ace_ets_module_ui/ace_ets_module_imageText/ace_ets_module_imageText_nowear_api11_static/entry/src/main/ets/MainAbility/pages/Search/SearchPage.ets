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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute,CopyOptions,
  ClickEvent, Image,ImageFit,Color, TextAlign, CopyOptions, SearchController, Font, Search,ResourceColor } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct SearchPage {
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State copyValue: string = ''
  @State cutValue: string = ''
  @State pasteValue: string = ''
  @State positionValue: int = 1
  @State placeholder: string = 'Type to search...'
  @State searchIcon: string = ''
  @State searchButton: string = 'SEARCH'
  @State placeholderColor: ResourceColor = Color.Grey
  @State placeholderFont: Font = { size: 14, weight: 400 } as Font
  @State textFont: Font | undefined = { size: 14, weight: 400 } as Font
  @State textAlign: TextAlign = TextAlign.Start
  @State copyOption: CopyOptions = CopyOptions.InApp
  controller: SearchController = new SearchController()
  private stateChangCallBack : (eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      let eventD = eventData.data as Record<String,RecordData>
      if (eventD!['searchIcon'] != null) {
        console.info("[SearchPage page]" + eventD!['searchIcon']);
        this.searchIcon =  eventD!['searchIcon'] as string;
      }
      if (eventD!['searchButton'] != null) {
        console.info("[SearchPage page]" + eventD!['searchButton']);
        this.searchButton =  eventD!['searchButton'] as string;
      }
      if (eventD!['placeholderColor'] != null) {
        console.info("[SearchPage page]" + eventD!['placeholderColor']);
        this.placeholderColor =  eventD!['placeholderColor'] as ResourceColor;
      }
      if (eventD!['changeValue'] != null) {
        console.info("[SearchPage page]" + eventD!['changeValue']);
        this.changeValue =  eventD!['changeValue'] as string;
      }if (eventD!['placeholder'] != null) {
        console.info("[SearchPage page]" + eventD!['placeholder']);
        this.placeholder =  eventD!['placeholder'] as string;
      }if (eventD!['textFont'] != null) {
        console.info("[SearchPage page]" + eventD!['textFont']);
        this.textFont =  eventD!['textFont'] as Font | undefined;
      }if (eventD!['textAlign'] != null) {
        console.info("[SearchPage page]" + eventD!['textAlign']);
        this.textAlign =  eventD!['textAlign'] as TextAlign;
      }
      if (eventD!['copyOption'] != null) {
        console.info("[SearchPage page]" + eventD!['copyOption']);
        this.copyOption =  eventD!['copyOption'] as CopyOptions;
      }
      if (eventD!['placeholderFont'] != null) {
        console.info("[SearchPage page]" + eventD!['placeholderFont']);
        this.placeholderFont =  eventD!['placeholderFont'] as Font;
      }
      if (eventD!['positionValue'] != null) {
        this.positionValue = eventD!['positionValue'] as int
      }
    }
  }
  onPageShow() {
    console.info('SearchPage onPageShow')
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 811,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text('onSubmit:' + this.submitValue).fontSize(10).key('submit').height('5%').textAlign(TextAlign.Center)
      Text('onChange:' + this.changeValue).fontSize(10).key('change').height('5%').textAlign(TextAlign.Center)
      Text('onCopy:' + this.copyValue).fontSize(10).key('copy').height('5%').textAlign(TextAlign.Center)
      Text('onCut:' + this.cutValue).fontSize(10).key('cut').height('5%').textAlign(TextAlign.Center)
      Text('onPaste:' + this.pasteValue).fontSize(10).key('paste').height('5%').textAlign(TextAlign.Center)
      Search({ value: this.changeValue, placeholder: this.placeholder, icon: this.searchIcon, controller: this.controller })
        .searchButton(this.searchButton, {fontSize: 10}).id("searchButton")
        .width('80%')
        .height('10%')
        .key('search')
        .backgroundColor(Color.White)
        .placeholderColor(this.placeholderColor)
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .textAlign(this.textAlign)
        .copyOption(this.copyOption)
        .onSubmit((value: string): void => {
          this.submitValue = value
        })
        .onChange((value: string): void => {
          this.changeValue = value
        })
        .onCopy((value: string): void => {
          this.copyValue = value
        })
        .onCut((value: string): void => {
          this.cutValue = value
        })
        .onPaste((value: string): void => {
          this.pasteValue = value
        })
        .margin(20)
      Button('Set caretPosition ' + this.positionValue)
        .onClick((): void => {
          // 设置光标位置到输入的第一个字符后
          this.controller.caretPosition(this.positionValue)
        }).key('button').height('5%')
    }.width('100%')
  }
}