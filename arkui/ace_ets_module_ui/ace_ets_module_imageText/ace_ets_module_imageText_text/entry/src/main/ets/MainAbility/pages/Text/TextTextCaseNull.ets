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
 * Text TextCase Test Page
 * 测试 Text 组件的 textCase 属性
 */
@Entry
@Component
struct TextTextCase {
  build() {
    Column({ space: 2 }) {
      Text('Text TextCase Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      // 测试1: 默认值（未设置 textCase）
      Text('Default TextCase')
        .id('text_textcase_default')
        .height('5%')

      // 测试2: TextCase.Normal
      Text('TextCase.Normal')
        .id('text_textcase_normal')
        .textCase(TextCase.Normal)
        .height('5%')

      // 测试3: TextCase.UpperCase
      Text('TextCase.UpperCase')
        .id('text_textcase_uppercase')
        .textCase(TextCase.UpperCase)
        .height('5%')

      // 测试4: TextCase.LowerCase
      Text('TextCase.LowerCase')
        .id('text_textcase_lowercase')
        .textCase(TextCase.LowerCase)
        .height('5%')

      // 测试5: null 参数
      Text('TextCase with null')
        .id('text_textcase_null')
        .textCase(null)
        .height('5%')

      // 测试6: undefined 参数
      Text('TextCase with undefined')
        .id('text_textcase_undefined')
        .textCase(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}