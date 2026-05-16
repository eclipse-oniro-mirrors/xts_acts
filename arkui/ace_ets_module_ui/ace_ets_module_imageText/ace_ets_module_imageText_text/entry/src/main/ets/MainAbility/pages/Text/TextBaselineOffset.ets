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
 * Text BaselineOffset Test Page
 * 测试 Text 组件的 baselineOffset 属性
 */
@Entry
@Component
struct TextBaselineOffset {
  build() {
    Column({ space: 20 }) {
      Text('Text BaselineOffset Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 测试1: 默认值（未设置 baselineOffset）
      Text('Default BaselineOffset')
        .id('text_baselineoffset_default')
        .height('5%')

      // 测试2: baselineOffset: 10
      Text('BaselineOffset: 10')
        .id('text_baselineoffset_10')
        .baselineOffset(10)
        .height('5%')

      // 测试3: baselineOffset: -5
      Text('BaselineOffset: -5')
        .id('text_baselineoffset_negative')
        .baselineOffset(-5)
        .height('5%')

      // 测试4: baselineOffset: 0
      Text('BaselineOffset: 0')
        .id('text_baselineoffset_zero')
        .baselineOffset(0)
        .height('5%')

      // 测试5: null 参数
      Text('BaselineOffset with null')
        .id('text_baselineoffset_null')
        .baselineOffset(null)
        .height('5%')

      // 测试6: undefined 参数
      Text('BaselineOffset with undefined')
        .id('text_baselineoffset_undefined')
        .baselineOffset(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}