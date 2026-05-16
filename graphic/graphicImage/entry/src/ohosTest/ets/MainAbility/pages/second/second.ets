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
import router from '@system.router';
import webview from '@ohos.web.webview';

@Entry
@Component
struct Second {
  @State surfaceId: string = 'surfaceId';
  private webController: webview.WebviewController = new webview.WebviewController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Web({
        src: 'https://www.baidu.com',
        controller: this.webController
      })
      .width('100%')
      .height(300)
      .borderWidth(2)
      Text(this.surfaceId)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .id('getSurfaceId')
        .onClick(async ()=>{
          console.info('www data strJson click', 111);
          this.surfaceId = await this.webController.getSurfaceId();
          console.info('www data strJson click', this.surfaceId);
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ccc')
  }
}