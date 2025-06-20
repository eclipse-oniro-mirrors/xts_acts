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
struct bindSheetShowClose {
  @State isShow: boolean = false
  @State showClose: boolean = true
  @State sheetHeight: number = 300;

  @Builder
  myBuilder() {
    Column() {
      Text('' + this.showClose)
      Button('change showClose')
        .id('showClose')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.showClose = !this.showClose;
        })

      Button('close modal 1')
        .id('close')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow = false;
        })
      
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  myTitle() {
    Row() {
      Text('bindSheet Title').width('100%').height('100%').backgroundColor(Color.Pink)
    }
    .id('row')
    .width('100%')
    .height(60)
  }

  build() {
    Column() {
      Button('transition modal 1')
        .id('btn')
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          title: this.myTitle(),
          showClose: this.showClose,
          height: this.sheetHeight,
          backgroundColor: Color.Green,
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
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
