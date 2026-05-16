/*
* Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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
import FirstDialog from '../model/FirstDialog';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct BindContentCoverOption {
  @State name: string = 'BindContentCoverOption';
  @State stepTips: string = '预置条件：\n设置->系统->开发者选项->过渡动画缩放5x\n操作步骤：\n' +
    '1、点击按钮transition modal 1,点击close modal1按钮 \n2、点击按钮transition modal 2,点击close modal2按钮' +
    '\n3、点击按钮transition modal 3,点击close modal3按钮' +
    '\n' + '预期结果：\n1、点击transition modal 1 模态进场有从下到上的动画效果\n2、点击transition modal 2 模态进场有渐变的动画效果' +
    '\n3、点击transition modal 3 模态进场无动画效果';
  @State isVue: boolean = false;
  @State intervalNum: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.isVue == false) {
      Button({ stateEffect: this.isVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {
      })
    } else {
      Button({ stateEffect: this.isVue }) {
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
    FirstDialog.ChooseDialog(this.stepTips, this.name);
    console.log('dafaf')
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      this.isVue = true;
    }, 1000)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }

  @State isShow: boolean = false;
  @State isShow2: boolean = false;
  @State isShow3: boolean = false;

  @Builder
  myBuilder1() {
    Column() {
      Button('content 1')
        .margin(10)

      Button('close modal 1')
        .margin(10)
        .onClick(() => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  myBuilder2() {
    Column() {
      Button('content 2')
        .margin(10)
      Button('close modal 2')
        .margin(10)
        .onClick(() => {
          this.isShow2 = false;
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  myBuilder3() {
    Column() {
      Button('content 3')
        .margin(10)

      Button('close modal 3')
        .margin(10)
        .onClick(() => {
          this.isShow3 = false;
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
    .justifyContent(FlexAlign.Center)
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
      Column() {
        Button('transition modal 1')
          .onClick(() => {
            this.isShow = true;
          })
          .margin(10)
          .bindContentCover(this.isShow,this.myBuilder1(),{
            modalTransition: ModalTransition.DEFAULT,
            backgroundColor: Color.Pink})

        Button('transition modal 2')
          .onClick(() => {
            this.isShow2 = true;
          })
          .margin(10)
          .bindContentCover(this.isShow2, this.myBuilder2(),  {modalTransition: ModalTransition.ALPHA,
            backgroundColor: Color.Pink})
        Button('transition modal 3')

          .onClick(() => {
            this.isShow3 = true;
          })
          .margin(10)
          .bindContentCover(this.isShow3, this.myBuilder3(), { modalTransition:ModalTransition.NONE,
            backgroundColor:Color.Blue })
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.White)

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
              message: this.stepTips,
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
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}