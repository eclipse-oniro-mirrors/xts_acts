/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct TextCaretColorExample3 {
  @State text: string = ''

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      // 超出maxLines截断内容展示
      Text('这是一段测试文本')
        .textOverflow({ overflow: TextOverflow.Clip })
        .maxLines(1)
        .copyOption(CopyOptions.InApp)
        .caretColor(Color.Red)
        .selectedBackgroundColor(Color.Green)
        .id('textTextCaretColor')

      Text(this.text)

    }.height(600).width('100%').padding({ left: 35, right: 35, top: 35 })
  }
}