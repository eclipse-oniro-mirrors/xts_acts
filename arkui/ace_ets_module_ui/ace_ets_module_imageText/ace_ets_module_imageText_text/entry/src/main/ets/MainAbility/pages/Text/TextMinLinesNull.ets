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
 * Text MinLines Test Page
 * 测试 Text 组件的 minLines 属性
 */
@Entry
@Component
struct TextMinLines {
  build() {
    Column({ space: 2 }) {
      Text('Text MinLines Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      // 测试1: 默认值（未设置minLines）
      Text('This is default minLines text content for testing default behavior when no minLines is set. This text should wrap normally.')
        .id('text_minlines_default')
        .width('300vp')
        .height('5%')

      // 测试2: null 参数
      Text('This is minLines with null parameter text content for testing null behavior. This text should wrap normally when minLines is null.')
        .id('text_minlines_null')
        .minLines(null)
        .width('300vp')
        .height('5%')

      // 测试3: undefined 参数
      Text('This is minLines with undefined parameter text content for testing undefined behavior. This text should wrap normally when minLines is undefined.')
        .id('text_minlines_undefined')
        .minLines(undefined)
        .width('300vp')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}