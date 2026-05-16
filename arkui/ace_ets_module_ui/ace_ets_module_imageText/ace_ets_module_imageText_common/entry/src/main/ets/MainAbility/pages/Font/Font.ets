/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import font from '@ohos.font';
@Entry
@Component
struct FontExample {
  @State adjust: number = 10
  @State fontSetName: string = ''
  @State fallback:string = ''
  build() {
    Column() {
      Text('' + this.adjust).id('adjust_test')
      Text('' + this.fontSetName).id('fontSetName_test')
      Text('' + this.fallback).id('fallback_test')

      Button('getUIFontConfig')
        .width('60%')
        .height('6%')
        .margin(50)
        .id('font_test')
        .onClick(()=>{
          let fontConfig = font.getUIFontConfig();
          this.adjust = fontConfig.generic[0].adjust[0].weight;
          this.fontSetName = fontConfig.fallbackGroups[0].fontSetName;
          this.fallback = fontConfig.fallbackGroups[0].fallback[0].language;

          console.log('adjust' + fontConfig.generic[0].adjust[0].weight);
          console.log('fontSetName:' + fontConfig.fallbackGroups[0].fontSetName);
          console.log('fallback_language:' + ' fallback_family:' + fontConfig.fallbackGroups[0].fallback[0].family);

        })
    }.width('100%')
  }
}