// @ts-nocheck
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
struct SearchExample {
  @State changevalue: string= ''
  @State submitvalue: string= ''
  @State textFont:Font = {
          size: 10,
          weight: 10,
          family: 'serif', 
          style: FontStyle.Normal
        }
  @State searchButton:string = "10"
  @State maxLength: nubmer = 19
  @State copyOption:CopyOptions = CopyOptions.Local
  controller: SearchController= new SearchController()
  controller2: SearchController= new SearchController()
  @State caretIndex : number = 9999
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 9999, x: 0, y: 0 }

  private stateChangCallBack = (eventData) => {
    console.info("search page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      if (eventData.data.textFont != null) {
        this.textFont = eventData.data.textFont;
      }
      if (eventData.data.searchButton != null) {
        this.searchButton = eventData.data.searchButton;
      }
      if (eventData.data.text != null) {
        this.text = eventData.data.text;
      }
      if (eventData.data.maxLength != null) {
        this.maxLength = eventData.data.maxLength;
      }
      if (eventData.data.copyOption != null) {
        this.copyOption = eventData.data.copyOption;
      }
    }
  }

  onPageShow() {
    console.info('search page show called');
    var stateChangeEvent = {
      eventId: 190,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text(this.submitvalue)
      Text(this.changevalue)
      Search({ value: '', placeholder: 'input content', controller: this.controller })
        .searchButton('search')
        .textFont(this.textFont)
        .searchButton(this.searchButton)
        .maxLength(this.maxLength)
        .copyOption(this.copyOption)
        .key('search')
        .placeholderColor(Color.Red)
        .placeholderFont({
          size: 10,
          weight: 10,
          family: 'serif',
          style: FontStyle.Normal
        })
        .onSubmit((value: string) => {
          this.submitvalue = value
        })
        .onChange((value: string) => {
          this.changevalue = value
        })

      Search({ value: this.text, placeholder: 'input content', controller: this.controller2 })
        .textFont(this.textFont)
        .key('mySearch')
        .placeholderColor(Color.Red)
        .maxLength(10)
        .placeholderFont({
          size: 10,
          weight: 10,
          family: 'serif',
          style: FontStyle.Normal
        })

      Button('caretoffset')
        .backgroundColor('#00FF00')
        .margin(15)
        .onClick(() => {
          console.info('text length:' + this.text.length)
          this.controller2.caretPosition(this.text.length)
          this.positionInfo = this.controller2.getCaretOffset()
          console.info("index:" + this.positionInfo.index)
          this.caretIndex = this.positionInfo.index
        })
        .key('caretOffsetBtn')

      Text("Index" + this.caretIndex).key('caretOffsetText')
    }
  }
}











