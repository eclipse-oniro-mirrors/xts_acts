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

import { ThemeControl } from '@kit.ArkUI';

ThemeControl.setDefaultTheme(undefined);

@Entry
@Component
struct SetDefaultThemeNullIndex {

  build() {
    Row() {
      Column() {
        // 文本颜色应用fontPrimary
        Text('这是一段文本')
          .id('text_setDefaultTheme_id')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin('5%')
          .height('10%')
        Button('button')
          .id('btn_setDefaultTheme_id')
          .height('10%')
          .onClick((event: ClickEvent) => {
            ThemeControl.setDefaultTheme(null);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}