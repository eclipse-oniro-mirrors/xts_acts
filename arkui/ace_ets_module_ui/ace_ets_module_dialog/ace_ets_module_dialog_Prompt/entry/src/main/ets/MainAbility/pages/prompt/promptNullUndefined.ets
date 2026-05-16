/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import prompt from '@ohos.prompt';
import  promptAction from '@ohos.promptAction'
import Prompt from '@system.prompt';

@Entry
@Component
struct promptNullUndefined {

  build() {
    Column() {
      Button('ohos prompt')
        .id('prompt_btn_nullUn')
        .padding(15)
        .margin(5)
        .backgroundColor(0x2788D9)
        .onClick(() => {
          // ========== showToast tests ==========
          try {
            let result = prompt.showToast(null)
            console.info('click showToast: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showToast_null', err.code);
            console.info('click showToast err: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
          try {
            let result = prompt.showToast(undefined)
            console.info('click showToast2: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showToast_undefined', err.code);
            console.info('click showToast err2: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }

          // ========== showDialog tests ==========
          try {
            let result = prompt.showDialog(null)
            console.info('click showDialog: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showDialog_null', err.code);
            console.info('click showDialog err: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
          try {
            let result = prompt.showDialog(undefined)
            console.info('click showDialog2: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showDialog_undefined', err.code);
            console.info('click showDialog err2: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }

          // ========== showActionMenu tests ==========
          try {
            let result = prompt.showActionMenu(null)
            console.info('click showActionMenu: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showActionMenu_null', err.code);
            console.info('click showActionMenu err: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
          try {
            let result = prompt.showActionMenu(undefined)
            console.info('click showActionMenu2: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showActionMenu_undefined', err.code);
            console.info('click showActionMenu err2: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
        })

      Button('system prompt')
        .id('prompt_system_nullUn')
        .padding(15)
        .margin(5)
        .backgroundColor(0x2788D9)
        .onClick(() => {
          // ========== system showToast tests ==========
          try {
            let result = Prompt.showToast(null)
            console.info('click showToast_system: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showToast_system_null', err.code);
            console.info('click showToast_system err: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
          try {
            let result = Prompt.showToast(undefined)
            console.info('click showToast_system2: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showToast_system_undefined', err.code);
            console.info('click showToast_system err2: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }

          // ========== system showDialog tests ==========
          try {
            let result = Prompt.showDialog(null)
            console.info('click showDialog_system: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showDialog_system_null', err.code);
            console.info('click showDialog_system err: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
          try {
            let result = Prompt.showDialog(undefined)
            console.info('click showDialog_system2: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showDialog_system_undefined', err.code);
            console.info('click showDialog_system err2: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }

          // ========== system showActionMenu tests ==========
          try {
            let result = Prompt.showActionMenu(null)
            console.info('click showActionMenu_system: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showActionMenu_system_null', err.code);
            console.info('click showActionMenu_system err: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
          try {
            let result = Prompt.showActionMenu(undefined)
            console.info('click showActionMenu_system2: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('showActionMenu_system_undefined', err.code);
            console.info('click showActionMenu_system err2: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
        })

      Button('get promptAction')
        .id('promptAction_btn_nullUn')
        .padding(15)
        .margin(5)
        .backgroundColor(0x2788D9)
        .onClick(() => {
          // ========== openCustomDialog tests ==========
          try {
            let result = promptAction.openCustomDialog(null)
            console.info('click openCustomDialog: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('openCustomDialog_null', err.code);
            console.info('click openCustomDialog err: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
          try {
            let result = promptAction.openCustomDialog(undefined)
            console.info('click openCustomDialog2: ' + result)
          } catch (err) {
            AppStorage.setOrCreate('openCustomDialog_undefined', err.code);
            console.info('click openCustomDialog err2: ' + err.code + ': ' + JSON.stringify((err as Error)?.message))
          }
        })

    }
    .width('100%')
    .height('100%')
  }
}