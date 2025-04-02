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

import { OverlayManagerOptions, promptAction } from '@kit.ArkUI';

@Entry
@Component
struct overlayManager {
  @State text: string = ''
  @State renderRootOverlay: boolean | null | undefined = true;

  build() {
    Column({ space: 5 }) {
      Text(this.text).id('text')
      Button('set renderRootOverlay ' + this.renderRootOverlay)
        .id('set')
        .height('8%')
        .onClick((event: ClickEvent) => {
          let flag: boolean = this.getUIContext().setOverlayManagerOptions
          ({
            renderRootOverlay: this.renderRootOverlay //初始化
          })
          promptAction.showToast({
            message: 'setOverlayManagerOptions: ' + flag
          })
        })
      Button('change renderRootOverlay false')
        .id('fal')
        .height('8%')
        .onClick(() => {
          this.renderRootOverlay = false
        })
      Button('change renderRootOverlay null')
        .id('nul')
        .height('8%')
        .onClick(() => {
          this.renderRootOverlay = null
        })
      Button('change renderRootOverlay undefined')
        .id('undef')
        .height('8%')
        .onClick(() => {
          this.renderRootOverlay = undefined
        })
      Button('get current option')
        .id('get')
        .height('8%')
        .onClick((event: ClickEvent) => {
          let options: OverlayManagerOptions = this.getUIContext().getOverlayManagerOptions()
          this.text = JSON.stringify(options.renderRootOverlay)
          promptAction.showToast({
            message: 'getOverlayManagerOptions: ' + JSON.stringify(options)
          })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}