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
import router from '@ohos.router'
import { BusinessError } from '@ohos.base'

@Entry
@Component
struct router_back012 {
  build() {
    Column({ space: 5 }) {
      Text('back012')

      Button('back')
        .id('router_back012_btn')
        .onClick(() => {
          try {
            router.showAlertBeforeBackPage({
              message: '确定要返回吗？'
            });
          } catch (err) {
            let message = (err as BusinessError).message
            let code = (err as BusinessError).code
            console.error(`Invoke showAlertBeforeBackPage failed, code is ${code}, message is ${message}`);
          }
          router.back(2)
        })

    }.width('100%').height('100%')

  }
}