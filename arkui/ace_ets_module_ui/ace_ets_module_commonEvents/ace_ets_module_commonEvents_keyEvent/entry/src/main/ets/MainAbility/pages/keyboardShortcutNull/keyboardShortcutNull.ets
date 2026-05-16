/*
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

@Entry
@Component
struct keyboardShortcutNull {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('resultTextKeyboardShortcut')
        Button('Test short cut 1').onClick((event: ClickEvent) => {
          this.message = 'I clicked Button 1';
        }).keyboardShortcut(null, [ModifierKey.SHIFT, ModifierKey.CTRL, ModifierKey.ALT])
          .height('5%')
        Button('Test short cut 2').onClick((event: ClickEvent) => {
          this.message = 'I clicked Button 2';

        }).keyboardShortcut(undefined, [ModifierKey.CTRL]).height('5%')
        Button('Test short cut 3').onClick((event: ClickEvent) => {
          this.message = 'I clicked Button 3';

        }).keyboardShortcut('', [ModifierKey.SHIFT]).height('5%')
        Button('Test short cut 4').onClick((event: ClickEvent) => {
          this.message = 'I clicked Button 4';

        }).keyboardShortcut('a', null).height('5%')
        Button('Test short cut 5').onClick((event: ClickEvent) => {
          this.message = 'I clicked Button 5';

        }).keyboardShortcut('b', undefined).height('5%')

      }
      .width('100%')
    }
    .height('100%')
  }
}