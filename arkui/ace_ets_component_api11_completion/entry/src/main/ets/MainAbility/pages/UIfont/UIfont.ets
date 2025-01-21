/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import font from '@ohos.font';

@Entry
@Component
struct UIfont {
  @State types: TextDataDetectorType[] = [];
  @State text: string = ''
  @State text1: string = ''
  private selectedTime: Date = new Date('2022-07-22T08:00:00')

  build() {
    Column() {

      Text(this.text).margin(70).id('UIfont_Text')

      Button("fontDir")
        .width('60%')
        .height('6%')
        .margin(10)
        .id('UIfont_fontDir')
        .onClick(()=>{
          let fontConfig = font.getUIFontConfig();
          console.log("font-dir -----------" + String(fontConfig.fontDir.length));
          if (fontConfig.fontDir.length) {
            this.text = '1'
          }
        })

      Button("generic")
        .width('60%')
        .height('6%')
        .margin(10)
        .id('UIfont_generic')
        .onClick(()=>{
          let fontConfig = font.getUIFontConfig();
          if (fontConfig.generic.length) {
            this.text = '3'
          }
        })

      Button("fallbackGroups")
        .width('60%')
        .height('6%')
        .margin(10)
        .id('UIfont_fallbackGroups')
        .onClick(()=>{
          let fontConfig = font.getUIFontConfig();
          console.log("fallback------------" + String(fontConfig.fallbackGroups.length));
          if (fontConfig.fallbackGroups.length) {
            this.text = '1'
          }
        })

      Button("alias")
        .width('60%')
        .height('6%')
        .margin(10)
        .id('UIfont_alias')
        .onClick(()=>{
          let fontConfig = font.getUIFontConfig();
          for (let i = 0; i < fontConfig.generic.length; i ++){
            console.log("family:" + fontConfig.generic[i].family);
            if (fontConfig.generic[i].alias.length) {
              this.text = '5'
            }

          }
        })





    }
  }
}