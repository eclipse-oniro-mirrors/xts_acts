/*
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

@Entry
@Component
struct TextFontColorByNameTest {
  @State colorFromColor: ResourceColor = $r('app.color.' + 'my_color')
  @State colorFromString: ResourceColor = $r('app.string.' + 'my_color_str')
  @State colorFromInteger: ResourceColor = $r('app.integer.' + 'my_color_int')
  @State colorFromFloat: ResourceColor = $r('app.float.' + 'normal_font_size')

  build() {
    Column({ space: 20 }) {
      Text('COLOR from color resource')
        .fontSize(16)
        .fontColor(this.colorFromColor)
        .backgroundColor('#EEEEEE')
        .padding(10)
        .key('textFontColorFromColor')

      Text('COLOR from string resource')
        .fontSize(16)
        .fontColor(this.colorFromString)
        .backgroundColor('#EEEEEE')
        .padding(10)
        .key('textFontColorFromString')

      Text('COLOR from integer resource')
        .fontSize(16)
        .fontColor(this.colorFromInteger)
        .backgroundColor('#EEEEEE')
        .padding(10)
        .key('textFontColorFromInteger')

      Text('Fallback float branch trigger')
        .fontSize($r('app.float.' + 'normal_font_size'))
        .fontColor(this.colorFromFloat)
        .backgroundColor('#EEEEEE')
        .padding(10)
        .key('textFontColorFromFloat')
    }
    .width('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Start)
  }
}
