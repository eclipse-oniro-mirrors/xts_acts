/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
@Entry
@Component
struct TipsExample {
  @State types: (TipsAnchorType | undefined | null)[] = [
    undefined,
    null,
    TipsAnchorType.TARGET,
    TipsAnchorType.CURSOR,
    -9
  ]
  @State typeIndex: number  = 0;


  build() {
      Column(){
        Button('跟随')
          .id('showAtAnchorBth')
          .width('100%')
          .height('10%')
          .onClick(() => {
            this.typeIndex = (this.typeIndex + 1) % this.types.length;
          })
        Button('ori tips')
          .id('oriBtn')
          .width('100%')
          .height('70%')
          .bindTips('hover tips', {
            enableArrow:true,
            showAtAnchor: this.types[this.typeIndex]
          })
      }
  }
}