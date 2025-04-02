/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct bindSheetHoverMode {
  @State isShow: boolean = false
  @State sheetHeight: number = 350;
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN

  @Builder
  myBuilder() {
    Column({ space: 10 }) {
      Text('enableHoverMode ' + this.enableHoverMode + ' hoverModeArea ' + this.hoverModeArea).id('text')

      Button('init').id('init').onClick(() => {
        this.enableHoverMode = false
        this.hoverModeArea = HoverModeAreaType.TOP_SCREEN
      })
      Button('change enableHoverMode ' + this.enableHoverMode)
        .id('changeEnableHoverMode')
        .onClick(() => {
          this.enableHoverMode = !this.enableHoverMode
        })
      Button('change hoverModeArea ' + this.hoverModeArea)
        .id('changeHoverModeArea')
        .onClick(() => {
          this.hoverModeArea = HoverModeAreaType.BOTTOM_SCREEN
        })
      Button('close modal')
        .id('close')
        .onClick(() => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
  }


  build() {
    Column() {
      Button('transition modal')
        .id('sheet')
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          height: this.sheetHeight,
          backgroundColor: Color.Green,
          enableHoverMode: this.enableHoverMode,
          hoverModeArea: this.hoverModeArea,
          onWillAppear: () => {
            console.log('BindSheet onWillAppear.')
          },
          onAppear: () => {
            console.log('BindSheet onAppear.')
          },
          onWillDisappear: () => {
            console.log('BindSheet onWillDisappear.')
          },
          onDisappear: () => {
            console.log('BindSheet onDisappear.')
          }
        })
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}