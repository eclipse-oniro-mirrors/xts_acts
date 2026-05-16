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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import nativeKeyEvent from "libnativeKeyEvent.so";
import FirstDialog from '../model/FirstDialog';

const TAG = '[CapiKeyEvent]';
let params = LocalStorage.getShared();

@Entry(params)
@Component
struct CapiKeyEvent {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CapiKeyEvent';
  @State StepTips: string = '设备支持CAPI键盘灯状态获取\n 操作步骤：连接键盘，使用键盘点击CapsLock、NumLock键' + '\n' + '预期结果：键盘指示灯亮起，页面显示CapsLock：ON,NumLock: ON'+ '\n' +'键盘指示灯关闭，页面显示CapsLock：OFF,NumLock: OFF';
  @State CapiKeyEventVue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  @State color: Color = Color.Blue;
  @State text1: string = ""
  @State text2: string = ""
  @State text: string = ''

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.CapiKeyEventVue }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'true ', title: this.name,
        }
      })
      promptAction.showToast({
        message: '通过', duration: 1000
      });
    })
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.text1 === '0' && this.text2 === '0') {
        this.CapiKeyEventVue = true;
      }
    }, 500)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column({ space: 12 }) {
        Row() {
          Text(`设备支持CAPI键盘灯状态获取`).fontColor(Color.Green).fontSize('18fp').margin({ top: 20 })
        }

        // 业务代码
        Column() {
          XComponent({
            id: 'xcomponentId',
            type: "node",
            libraryname: 'nativeKeyEvent'
          })
            .onAppear(() => {
              nativeKeyEvent.createNativeNode("xcomponentId", this.getUIContext());
              this.text1 = '0';
              this.text2 = '0';
            })
            .id('xcomponent')
            .focusable(true)
            .focusOnTouch(true)

            .width('100%')
            .height('50%')
        }
        .focusable(true)
        .defaultFocus(true)
      }.height('80%')
      .width('100%')
      .backgroundColor('#FFFAFA')



      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .margin({ bottom: '20vp' })
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })

        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}