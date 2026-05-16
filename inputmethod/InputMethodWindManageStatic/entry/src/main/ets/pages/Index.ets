/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, TextArea, KeyboardAppearance } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  @State inputValue: string = 'inputMethodEngine1inputMethodEngine2inputMethodEngine3inputMethodEngine' +
    'inputMethodEngine4inputMethodEngine5inputMethodEngine6inputMethodEngine7inputMethodEngine8inputMethodEn' +
    'gine9inputMethodEngine10inputMethodEngine11inputMethodEngine12inputMethodEngine13inputMethodEngine14inputMet' +
    'hodEngine15inputMethodEngine16inputMethodEngine17inputMethodEngine18inputMethodEngine19inputMethodEngine20input' +
    'MethodEngine21inputMethodEngine22inputMethodEngine23inputMethodEngine24inputMethodEngine25inputMethodEngine26inp' +
    'utMethodEngine27inputMethodEngine28inputMethodEngine29inputMethodEngine30inputMethodEngine31inputMethodEngine32i' +
    'nputMethodEngine33inputMethodEngine34inputMethodEngine35inputMethodEngine36inputMethodEngine37inputMethodEngine3' +
    '8inputMethodEngine39inputMethodEngine40inputMethodEngine41inputMethodEngine42inputMethodEngine43inputMethodEngine' +
    '44inputMethodEngine45inputMethodEngine46inputMethodEngine47inputMethodEngine48inputMethodEngine49inputMethodEngi' +
    'ne50';
    
  build() {
    Column(undefined) {
      TextArea({ text: this.inputValue })
        .height('90%')
        .enablePreviewText(false)
        .keyboardAppearance(KeyboardAppearance.LIGHT_IMMERSIVE)
        .onChange((value: string) => {
          this.inputValue = value;
        })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
