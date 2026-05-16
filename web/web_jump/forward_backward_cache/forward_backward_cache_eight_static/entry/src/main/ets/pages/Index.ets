/*
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

import { Web, Column, Component, Entry, Button ,Row} from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined)

  build() {
    Row() {
      Column() {
        Button('Config Cookie')
          .onClick(() => {
            try {
              webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          })

        Button('Get All Cookies')
          .onClick(() => {
            webview.WebCookieManager.fetchAllCookies(false).then((cookies) => {
              cookies.forEach((item, idx) => {
                console.info(`cookie[${idx}]:`+ item.name);
                console.info(`cookie[${idx}]:`+ item.value);
              });
            })
          })

        Web({ src: 'https://www.example.com', controller: this.controller})
      }
    }
  }
}