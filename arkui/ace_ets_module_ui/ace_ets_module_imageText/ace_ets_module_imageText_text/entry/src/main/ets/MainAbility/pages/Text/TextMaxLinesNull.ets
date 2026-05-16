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
 * Text MaxLines Test Page
 * 测试 Text 组件的 maxLines 属性
 */
@Entry
@Component
struct TextMaxLines {
  build() {
    Column({ space: 20 }) {
      Text('Text MaxLines Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 测试1: 默认值（未设置maxLines）
      Text('This is default maxLines text content for testing default behavior when no maxLines is set. This text should wrap normally without line limit.')
        .id('text_maxlines_default')
        .width('300vp')
        .height('5%')

      // 测试2: null 参数
      Text('This is maxLines with null parameter text content for testing null behavior. This text should wrap normally when maxLines is null.')
        .id('text_maxlines_null')
        .maxLines(null)
        .width('300vp')
        .height('5%')

      // 测试3: undefined 参数
      Text('This is maxLines with undefined parameter text content for testing undefined behavior. This text should wrap normally when maxLines is undefined.')
        .id('text_maxlines_undefined')
        .maxLines(undefined)
        .width('300vp')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}