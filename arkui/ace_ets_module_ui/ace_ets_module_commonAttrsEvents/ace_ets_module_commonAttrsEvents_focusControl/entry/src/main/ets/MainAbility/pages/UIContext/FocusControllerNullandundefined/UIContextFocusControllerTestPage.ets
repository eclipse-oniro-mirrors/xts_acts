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
import router from '@ohos.router';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct UIContextFocusControllerTestPage {
  @State message: string = 'UIContext FocusController Test Page';

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .width('90%')
        .height('5%')
        .margin({ top: '2%', bottom: '2%' })

      // requestFocus tests
      Text('requestFocus Tests')
        .fontSize(18)
        .width('90%')
        .height('4%')
        .margin({ top: '1%', bottom: '1%' })
        .fontWeight(FontWeight.Bold)

      Button('Test requestFocus with empty string')
        .id('btn_request_focus_empty')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().requestFocus('');
            AppStorage.setOrCreate('request_focus_empty', 'success');
          } catch (err) {
            let errorCode = (err as Record<string, string>).code || 'unknown';
            AppStorage.setOrCreate('request_focus_empty', errorCode);
          }
        })

      Button('Test requestFocus with null')
        .id('btn_request_focus_null')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().requestFocus(null);
            AppStorage.setOrCreate('request_focus_null', 'success');
          } catch (err) {
            let errorCode = (err as Record<string, string>).code || 'unknown';
            AppStorage.setOrCreate('request_focus_null', errorCode);
          }
        })

      Button('Test requestFocus with undefined')
        .id('btn_request_focus_undefined')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().requestFocus(undefined);
            AppStorage.setOrCreate('request_focus_undefined', 'success');
          } catch (err) {
            let errorCode = (err as Record<string, string>).code || 'unknown';
            AppStorage.setOrCreate('request_focus_undefined', errorCode);
          }
        })

      Divider()
        .width('90%')
        .height('1%')
        .margin({ top: '2%', bottom: '2%' })

      // setAutoFocusTransfer tests
      Text('setAutoFocusTransfer Tests')
        .fontSize(18)
        .width('90%')
        .height('4%')
        .margin({ top: '1%', bottom: '1%' })
        .fontWeight(FontWeight.Bold)

      Button('Test setAutoFocusTransfer with true')
        .id('btn_set_auto_focus_true')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().setAutoFocusTransfer(true);
            AppStorage.setOrCreate('set_auto_focus_true', 'success');
          } catch (err) {
            AppStorage.setOrCreate('set_auto_focus_true', 'error');
          }
        })

      Button('Test setAutoFocusTransfer with false')
        .id('btn_set_auto_focus_false')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().setAutoFocusTransfer(false);
            AppStorage.setOrCreate('set_auto_focus_false', 'success');
          } catch (err) {
            AppStorage.setOrCreate('set_auto_focus_false', 'error');
          }
        })

      Divider()
        .width('90%')
        .height('1%')
        .margin({ top: '2%', bottom: '2%' })

      // setKeyProcessingMode tests
      Text('setKeyProcessingMode Tests')
        .fontSize(18)
        .width('90%')
        .height('4%')
        .margin({ top: '1%', bottom: '1%' })
        .fontWeight(FontWeight.Bold)

      Button('Test setKeyProcessingMode with null')
        .id('btn_set_key_mode_null')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().setKeyProcessingMode(null);
            AppStorage.setOrCreate('set_key_mode_null', 'success');
          } catch (err) {
            AppStorage.setOrCreate('set_key_mode_null', 'error');
          }
        })

      Button('Test setKeyProcessingMode with undefined')
        .id('btn_set_key_mode_undefined')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().setKeyProcessingMode(undefined);
            AppStorage.setOrCreate('set_key_mode_undefined', 'success');
          } catch (err) {
            AppStorage.setOrCreate('set_key_mode_undefined', 'error');
          }
        })

      Button('Test clear')
        .id('FocusControllerClearFocus')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            uiContext.getFocusController().setAutoFocusTransfer(true);
            uiContext.getFocusController().setKeyProcessingMode(undefined);
            this.getUIContext().getFocusController().clearFocus()
          } catch (err) {
            console.log('clear' + err)
          }
        })

      Divider()
        .width('90%')
        .height('1%')
        .margin({ top: '2%', bottom: '2%' })

      Button('Back')
        .id('btn_back')
        .width('50%')
        .height('5%')
        .margin({ top: '2%' })
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .padding('2%')
  }
}
