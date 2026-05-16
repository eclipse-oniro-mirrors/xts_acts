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
 * Text Decoration Test Page
 * 测试 Text 组件的 decoration 属性
 */
@Entry
@Component
struct TextDecoration {
  build() {
    Column({ space: 20 }) {
      Text('Text Decoration Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 测试1: 默认值（未设置decoration）
      Text('Default decoration text content for testing default behavior when no decoration is set.')
        .id('text_decoration_default')
        .height('5%')

      // 测试2: null 参数
      Text('Decoration with null parameter text content for testing null behavior.')
        .id('text_decoration_null')
        .decoration(null)
        .height('5%')

      // 测试3: undefined 参数
      Text('Decoration with undefined parameter text content for testing undefined behavior.')
        .id('text_decoration_undefined')
        .decoration(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}