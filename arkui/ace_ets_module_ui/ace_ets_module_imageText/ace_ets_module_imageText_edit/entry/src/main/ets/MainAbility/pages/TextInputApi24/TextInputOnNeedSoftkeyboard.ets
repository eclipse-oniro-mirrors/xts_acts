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

@Entry
@Component
struct TextInputOnNeedSoftkeyboard {
  build() {
    Column() {
      TextInput({ placeholder: 'Click to set true' })
        .onClick(() => {
          this.getUIContext().getFocusController().requestFocus('Button_onNeedSoftkeyboard_true')
        })
        .id('Button_onNeedSoftkeyboard_true')
        .fontSize(10)
        .width('80%')
        .height('5%')
        .onNeedSoftkeyboard((): boolean => {
          AppStorage.setOrCreate('onNeedSoftkeyboard_true', 'true')
          console.log('onNeedSoftkeyboard_true: '+ AppStorage.get('onNeedSoftkeyboard_true'))
          return true;
        })
      TextInput({ placeholder: 'Click to set false' })
        .onClick(() => {
          this.getUIContext().getFocusController().requestFocus('Button_onNeedSoftkeyboard_false')
        })
        .id('Button_onNeedSoftkeyboard_false')
        .fontSize(10)
        .width('80%')
        .height('5%')
        .onNeedSoftkeyboard((): boolean => {
          AppStorage.setOrCreate('onNeedSoftkeyboard_false', 'false')
          console.log('onNeedSoftkeyboard_false: '+ AppStorage.get('onNeedSoftkeyboard_false'))
          return false;
        })
      Button('Click to set undefined')
        .onClick(() => {
          this.getUIContext().getFocusController().requestFocus('Button_onNeedSoftkeyboard_undefined')
        })
        .id('Button_onNeedSoftkeyboard_undefined')
        .fontSize(10)
        .width('80%')
        .height('5%')
        .onNeedSoftkeyboard(undefined)

      TextInput({ placeholder: 'TextInput undefined'}).height('5%')
        .id('TextInput_onNeedSoftkeyboard_undefined')
        .onNeedSoftkeyboard(undefined)

      TextInput({ placeholder: 'TextInput default'}).height('5%')
        .id('TextInput_onNeedSoftkeyboard_default')
    }
    .height('100%')
    .width('100%')
  }
}