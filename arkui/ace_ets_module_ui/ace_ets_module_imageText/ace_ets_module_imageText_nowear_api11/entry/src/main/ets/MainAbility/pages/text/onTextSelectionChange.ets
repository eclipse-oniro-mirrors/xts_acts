/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct OnTextSelectionChange1 {
  @State flag: string = 'init'

  build() {
    Column({ space:5 }) {
      Text('Hello World')
        .id('OnTextSelectionChange_text')
        .height('10%')
        .borderWidth(1)
        .copyOption(CopyOptions.InApp)
        .selection(3, 8)
        .textSelectable(TextSelectableMode.SELECTABLE_FOCUSABLE)
        .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
          console.info(`文本选中区域变化回调, selectionStart: ${selectionStart}, selectionEnd: ${selectionEnd}`);
          this.flag = `OnTextSelectionChange, selectionStart: ${selectionStart}, selectionEnd: ${selectionEnd}`
          AppStorage.setOrCreate('OnTextSelectionChange', `start:${selectionStart},end:${selectionEnd}`)
        })

      Text(this.flag).margin(50)
    }.width('100%')
  }
}