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
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct RouterPushUrlReplaceUrlNullUndefined {
  @State errorMessage: string = '';

  build() {
    Column() {
      Text('Router PushUrl/ReplaceUrl Null/Undefined Test')
        .fontSize(20)
        .height('3%')

      Button('Test pushUrl with null')
        .id('RouterPushUrlNullUndefined_Button_PushUrlNull')
        .onClick(() => {
          try {
            router.pushUrl(null, router.RouterMode.Standard)
              .then(() => {
                this.errorMessage = 'pushUrl null success';
              })
              .catch((err: BusinessError) => {
                this.errorMessage = `pushUrl null error: ${err.code} - ${err.message}`;
              });
          } catch (e) {
            this.errorMessage = `pushUrl null catch: ${e}`;
          }
          AppStorage.setOrCreate('pushUrl_Null', this.errorMessage);
        }).height('5%')

      Button('Test pushUrl with undefined')
        .id('RouterPushUrlNullUndefined_Button_PushUrlUndefined')
        .height('3%')
        .onClick(() => {
          try {
            router.pushUrl(undefined, router.RouterMode.Single)
              .then(() => {
                this.errorMessage = 'pushUrl undefined success';
              })
              .catch((err: BusinessError) => {
                this.errorMessage = `pushUrl undefined error: ${err.code} - ${err.message}`;
              });
          } catch (e) {
            this.errorMessage = `pushUrl undefined catch: ${e}`;
          }
          AppStorage.setOrCreate('pushUrl_undefined', this.errorMessage);
        })

      Button('Test pushUrl with empty url')
        .id('RouterPushUrlNullUndefined_Button_PushUrlEmpty')
        .height('3%')
        .onClick(() => {
          try {
            router.pushUrl({ url: '' })
              .then(() => {
                this.errorMessage = 'pushUrl empty url success';
              })
              .catch((err: BusinessError) => {
                this.errorMessage = `pushUrl empty url error: ${err.code} - ${err.message}`;
              });
          } catch (e) {
            this.errorMessage = `pushUrl empty url catch: ${e}`;
          }
          AppStorage.setOrCreate('pushUrl_empty', this.errorMessage);
        })

      Button('Test replaceUrl with null')
        .id('RouterPushUrlNullUndefined_Button_ReplaceUrlNull')
        .height('3%')
        .onClick(() => {
          try {
            router.replaceUrl(null)
              .then(() => {
                this.errorMessage = 'replaceUrl null success';
              })
              .catch((err: BusinessError) => {
                this.errorMessage = `replaceUrl null error: ${err.code} - ${err.message}`;
              });
          } catch (e) {
            this.errorMessage = `replaceUrl null catch: ${e}`;
          }
          AppStorage.setOrCreate('replaceUrl_null', this.errorMessage);
        })

      Button('Test replaceUrl with undefined')
        .id('RouterPushUrlNullUndefined_Button_ReplaceUrlUndefined')
        .height('3%')
        .onClick(() => {
          try {
            router.replaceUrl(undefined)
              .then(() => {
                this.errorMessage = 'replaceUrl undefined success';
              })
              .catch((err: BusinessError) => {
                this.errorMessage = `replaceUrl undefined error: ${err.code} - ${err.message}`;
              });
          } catch (e) {
            this.errorMessage = `replaceUrl undefined catch: ${e}`;
          }
          AppStorage.setOrCreate('replaceUrl_undefined', this.errorMessage);
        })

      Button('Test replaceUrl with empty url')
        .id('RouterPushUrlNullUndefined_Button_ReplaceUrlEmpty')
        .height('3%')
        .onClick(() => {
          try {
            router.replaceUrl({ url: '', recoverable:false })
              .then(() => {
                this.errorMessage = 'replaceUrl empty url success';
              })
              .catch((err: BusinessError) => {
                this.errorMessage = `replaceUrl empty url error: ${err.code} - ${err.message}`;
              });
          } catch (e) {
            this.errorMessage = `replaceUrl empty url catch: ${e}`;
          }
          AppStorage.setOrCreate('replaceUrl_empty', this.errorMessage);
        })

      Button('Test replaceUrl with recoverable true')
        .id('RouterPushUrlNullUndefined_Button_recoverableTrue')
        .height('3%')
        .onClick(() => {
          try {
            router.replaceUrl({ url: '', recoverable:true})
              .then(() => {
                this.errorMessage = 'replaceUrl recoverable true success';
              })
              .catch((err: BusinessError) => {
                this.errorMessage = `replaceUrl recoverable true error: ${err.code} - ${err.message}`;
              });
          } catch (e) {
            this.errorMessage = `replaceUrl recoverable true catch: ${e}`;
          }
          AppStorage.setOrCreate('replaceUrl_recoverable_true', this.errorMessage);
        })

      Text(this.errorMessage)
        .id('RouterPushUrlNullUndefined_Text_ErrorMessage')
        .fontSize(16)
        .width('80%')
        .height('3%')
    }
    .width('100%')
    .height('100%')
  }
}
