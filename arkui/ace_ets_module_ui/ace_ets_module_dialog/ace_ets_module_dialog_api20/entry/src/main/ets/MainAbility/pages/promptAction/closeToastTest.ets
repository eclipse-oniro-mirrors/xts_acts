/**
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
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct closeToastTest {
  @State toastId: number = 0;

  build() {
    Column({ space: 10 }) {
      Button('Open Toast')
        .id('open')
        .onClick(() => {
          promptAction.openToast({
            message: 'Toast Massage',
            duration: 10000,
          }).then((toastId: number) => {
            this.toastId = toastId;
          })
            .catch((error: BusinessError) => {
              console.error(`openToast error code is ${error.code}, message is ${error.message}`)
            })
          setTimeout(() => {
            try {
              promptAction.closeToast(0);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          }, 1500)
          setTimeout(() => {
            try {
              promptAction.closeToast(undefined);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          }, 3000)
          setTimeout(() => {
            try {
              promptAction.closeToast(null);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          }, 4500)
        })
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}