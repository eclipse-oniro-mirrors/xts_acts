/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { display } from '@kit.ArkUI';
import window from '@ohos.window';
@Entry
@Component
struct CustomAvoidPopup {
  @State handlePopup: boolean = false;
  @State message: string = 'This is a custom popup This is a custom popup This is a custom popup ' +
    'This is a custom popup This is a custom popup This is a custom popup';
  @State maxH: number = 365;
  @State maxW: number = 365;
  @Builder
  popupBuilder() {
    Column({ space: 2 }) {
      TextArea()
      Text(this.message).fontSize(10)
    }
  }
  
  onPageShow(): void {
    window.getLastWindow(getContext()).then(windowObj => {
      let properties = windowObj.getWindowProperties();
      console.log('Window Width:', properties.windowRect.width);
      this.maxW = properties.windowRect.width / display.getDefaultDisplaySync().densityPixels;
      this.maxH = properties.windowRect.height / display.getDefaultDisplaySync().densityPixels;
    });
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Button('handlePopup')
        .onClick(() => {
          this.handlePopup = !this.handlePopup;
        })
        .id('customPopup')
        .width(this.maxW - 45)
        .height(this.maxH - 150)
        .bindPopup(this.handlePopup, {
          builder: this.popupBuilder,
          width: 100,
          targetSpace: 1,
          avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
          onStateChange: (e) => {
            console.info(JSON.stringify(e.isVisible));
            if (!e.isVisible) {
              this.handlePopup = false;
            }
          }
        })
    }.width('100%').height('100%')
  }
}