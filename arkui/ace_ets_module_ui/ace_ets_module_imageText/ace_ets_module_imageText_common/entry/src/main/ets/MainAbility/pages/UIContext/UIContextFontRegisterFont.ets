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
import { Font } from '@kit.ArkUI';

@Entry
@Component
struct UIContextFontRegisterFont {
  @State message: string = 'UIContext Font RegisterFont Test';
  private uiContext: UIContext = this.getUIContext();
  private font1: Font = this.uiContext.getFont();
  private font2: Font = this.uiContext.getFont();

  build() {
    Column() {
      Text(this.message)
        .id('font_register_font_title')
        .fontSize(20)
        .height('5%')

      Button('registerFont null')
        .id('button_registerFont_null')
        .onClick(() => {
          try {
            this.font1.registerFont(null);
            AppStorage.setOrCreate('registerFont_null', 'registerFont null succ');
          } catch (error) {
            console.log(`registerFont null 抛出异常: ${error}`)
          }
        }).height('5%')

      Button('registerFont undefined')
        .id('button_registerFont_undefined')
        .onClick(() => {
          try {
            this.font2.registerFont(undefined);
            AppStorage.setOrCreate('registerFont_undefined', 'registerFont undefined succ');
          } catch (error) {
            console.log(`registerFont undefined 抛出异常: ${error}`)
          }
        }).height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
