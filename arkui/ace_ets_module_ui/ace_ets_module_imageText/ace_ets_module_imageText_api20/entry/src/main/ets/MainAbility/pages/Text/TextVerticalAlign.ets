/**
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
struct TextVerticalAlign1 {
  build() {
    Column({ space: 2 }) {
      Text('TextVerticalAlign.BASELINE')
        .height('5%')
        .id('Text_TextVerticalAlign_BASELINE')
        .textVerticalAlign(TextVerticalAlign.BASELINE)
        .borderWidth(1)

      Text('TextVerticalAlign.BOTTOM')
        .height('5%')
        .id('Text_TextVerticalAlign_BOTTOM')
        .textVerticalAlign(TextVerticalAlign.BOTTOM)
        .borderWidth(1)

      Text('TextVerticalAlign.CENTER')
        .height('5%')
        .id('Text_TextVerticalAlign_CENTER')
        .textVerticalAlign(TextVerticalAlign.CENTER)
        .borderWidth(1)

      Text('TextVerticalAlign.TOP')
        .height('5%')
        .id('Text_TextVerticalAlign_TOP')
        .textVerticalAlign(TextVerticalAlign.TOP)
        .borderWidth(1)

      Text('TextVerticalAlign: default')
        .height('5%')
        .id('Text_TextVerticalAlign_default')
        .borderWidth(1)

      Text('TextVerticalAlign: undefined')
        .height('5%')
        .textVerticalAlign(undefined)
        .id('Text_TextVerticalAlign_undefined')
        .borderWidth(1)
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
  }
}