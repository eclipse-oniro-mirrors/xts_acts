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
import { promptAction } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct showToastHoverMode {
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Text('enableHoverMode ' + this.enableHoverMode).id('text')
        Text('hoverModeArea ' + this.hoverModeArea).id('text1')
        Text('enableHoverMode ' + this.enableHoverMode + ' hoverModeArea ' + this.hoverModeArea).id('text2')
        Button('default hoverModeArea')
          .height('8%')
          .id('showToast1')
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Hello World',
                duration: 2000,
                enableHoverMode: this.enableHoverMode,
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showToast args error code is ${code}, message is ${message}`);
            }
          })
        Button('Show toast')
          .height('8%')
          .id('showToast')
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Hello World',
                duration: 2000,
                enableHoverMode: this.enableHoverMode,
                hoverModeArea: this.hoverModeArea
              });
            } catch (error) {
              let message = (error as BusinessError).message
              let code = (error as BusinessError).code
              console.error(`showToast args error code is ${code}, message is ${message}`);
            }
          })
        Button('init').id('init')
          .height('8%')
          .onClick(() => {
            this.enableHoverMode = false
            this.hoverModeArea = HoverModeAreaType.TOP_SCREEN
          })
        Button('change enableHoverMode ' + this.enableHoverMode)
          .height('8%')
          .id('changeEnableHoverMode')
          .onClick(() => {
            this.enableHoverMode = !this.enableHoverMode
          })
        Button('change hoverModeArea ' + this.hoverModeArea)
          .height('8%')
          .id('changeHoverModeArea')
          .onClick(() => {
            this.hoverModeArea = HoverModeAreaType.BOTTOM_SCREEN
          })
      }.justifyContent(FlexAlign.Center)
    }
    .height('100%').width('100%')
  }
}