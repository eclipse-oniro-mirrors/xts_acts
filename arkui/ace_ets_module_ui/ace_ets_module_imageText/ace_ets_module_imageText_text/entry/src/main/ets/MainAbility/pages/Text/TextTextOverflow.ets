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
 * Text TextOverflow Test Page
 * 测试 Text 组件的 textOverflow 属性
 */
@Entry
@Component
struct TextTextOverflow {
  build() {
    Column({ space: 2 }) {
      Text('Text TextOverflow Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('3%')

      // 测试1: 默认值（未设置textOverflow）
      Text('This is default textOverflow content for testing default behavior when no textOverflow is set.')
        .id('text_textoverflow_default')
        .maxLines(2)
        .height('5%')

      // 测试2: null 参数
      Text('This is textOverflow with null parameter content for testing null behavior.')
        .id('text_textoverflow_null')
        .maxLines(2)
        .textOverflow(null)
        .height('5%')

      // 测试3: undefined 参数
      Text('This is textOverflow with undefined parameter content for testing undefined behavior.')
        .id('text_textoverflow_undefined')
        .maxLines(2)
        .textOverflow(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}