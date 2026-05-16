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
/**
 * Text FontFamily Test Page
 * 测试 Text 组件的 fontFamily 属性
 */
@Entry
@Component
struct TextFontFamily {
  build() {
    Column({ space: 20 }) {
      Text('Text FontFamily Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 测试1: 默认值（未设置fontFamily）
      Text('Default fontFamily text content for testing default behavior.')
        .id('text_fontfamily_default')
        .height('5%')

      // 测试2: null 参数
      Text('FontFamily with null parameter text content for testing null behavior.')
        .id('text_fontfamily_null')
        .fontFamily(null)
        .height('5%')

      // 测试3: undefined 参数
      Text('FontFamily with undefined parameter text content for testing undefined behavior.')
        .id('text_fontfamily_undefined')
        .fontFamily(undefined)
        .height('5%')

      // 测试4: 空字符串参数
      Text('FontFamily with empty string parameter text content for testing empty string behavior.')
        .id('text_fontfamily_empty')
        .fontFamily('')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}