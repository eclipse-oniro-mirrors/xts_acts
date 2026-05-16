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
@Entry
@Component
struct TextMinFontScaleMaxFontScale {
  build() {
    Column({ space: 2 }) {
      Row(){
        Text('Text MinFontScale MaxFontScale Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('5%')

        // 测试1: minFontScale 默认值（作为基准）
        Text('Text with minFontScale default')
          .id('text_minfontscale_default')
          .fontSize(16)
          .height('5%')

        // 测试2: minFontScale null 参数
        Text('Text with minFontScale null')
          .id('text_minfontscale_null')
          .fontSize(16)
          .minFontScale(null)
          .height('5%')
      }
      
      Row(){
        // 测试3: minFontScale undefined 参数
        Text('Text with minFontScale undefined')
          .id('text_minfontscale_undefined')
          .fontSize(16)
          .minFontScale(undefined)
          .height('5%')

        // 测试4: maxFontScale 默认值（作为基准）
        Text('Text with maxFontScale default')
          .id('text_maxfontscale_default')
          .fontSize(16)
          .height('5%')

        // 测试5: maxFontScale null 参数
        Text('Text with maxFontScale null')
          .id('text_maxfontscale_null')
          .fontSize(16)
          .maxFontScale(null)
          .height('5%')
      }

      // 测试6: maxFontScale undefined 参数
      Text('Text with maxFontScale undefined')
        .id('text_maxfontscale_undefined')
        .fontSize(16)
        .maxFontScale(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}