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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';

const TAG = '[bindSheetTest]';

@Entry
@Component
struct bindSheetTest {
  @State name: string = 'bindSheetTest';
  @State stepTips: string =
    '操作步骤:\n' +
      '1、点击BOTTOM按钮弹出模态框，切换不同EffecEdge值，滑动内容区域，观察模态框内容在上下边的回弹效果是否正常\n' +
      '2、点击CENTER按钮弹出模态框，切换不同EffecEdge值，滑动内容区域，观察模态框内容在上下边的回弹效果是否正常\n' + '\n' +
      '3、点击POPUP按钮弹出模态框，切换不同EffecEdge值，滑动内容区域，观察模态框内容在上下边的回弹效果是否正常\n' + '\n' +
      '预期结果：可以按照设置的EffecEdge值，正常实现模态框内容的回弹效果\n';
  @State isVue: boolean = false;
  @State intervalNum: number = 0;
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false
  @State sheetHeight: number = 500;
  @State sheetType: SheetType = SheetType.BOTTOM;
  @State sheetScrollModeSize: ScrollSizeMode = ScrollSizeMode.FOLLOW_DETENT
  @State sheetEffectEdge: EffectEdge | null | undefined = EffectEdge.START | EffectEdge.END

  @Builder
  myBuilder() {
    Column() {
      Text('scrollsizemode（刷新机制）：')
      Button('FOLLOW_DETENT（离手刷新）')
        .onClick(() => {
          this.sheetScrollModeSize = ScrollSizeMode.FOLLOW_DETENT
        })
      Button('CONTINUOUS（上滑跟手实时刷新）')
        .onClick(() => {
          this.sheetScrollModeSize = ScrollSizeMode.CONTINUOUS
        })

      Text('------------------------------')
        .margin(20)

      Text('EffectEdge值（边缘生效）：')
      Button('START（仅上边缘生效）')
        .onClick(() => {
          this.sheetEffectEdge = EffectEdge.START
        })
      Button('END（仅下边缘生效）')
        .onClick(() => {
          this.sheetEffectEdge = EffectEdge.END
        })
      Button('END&START（双边不生效）')
        .onClick(() => {
          this.sheetEffectEdge = EffectEdge.END & EffectEdge.START
        })
      Button('END|START（双边生效）')
        .onClick(() => {
          this.sheetEffectEdge = EffectEdge.END | EffectEdge.START
        })

      Text('-----------')
        .margin(5)

      Button('-2（异常值，双边生效）')
        .onClick(() => {
          this.sheetEffectEdge = -2
        })
      Button('0（异常值，双边生效）')
        .onClick(() => {
          this.sheetEffectEdge = -2
        })
      Button('null（异常值，双边生效）')
        .onClick(() => {
          this.sheetEffectEdge = null
        })
      Button('undefined（异常值，双边生效）')
        .onClick(() => {
          this.sheetEffectEdge = undefined
        })

      Text('------------------------------')
        .margin(20)

      Text('半模态高度：')
      Button('height 700')
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 700;
        })
      Button('height 500')
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 500;
        })
      Button('height 300')
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 300;
        })

      TextArea().width('100%')
        .height(50)
      Text('弹窗类型切换按钮：')
      Button('CENTER11')
        .onClick(() => {
          this.sheetType = SheetType.CENTER
        })
      Button('BOTTOM11')
        .onClick(() => {
          this.sheetType = SheetType.BOTTOM
        })
      Button('POPUP111')
        .onClick(() => {
          this.sheetType = SheetType.POPUP
        })

      Text('------------------------------')
        .margin(20)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')

  }

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

      Column({ space: 5 }) {
        Button('BOTTOM')
          .onClick(() => {
            this.isShow = true
          })
          .fontSize(20)
          .bindSheet($$this.isShow, this.myBuilder(), {
            height: this.sheetHeight,
            preferType: SheetType.BOTTOM,
            effectEdge: this.sheetEffectEdge,
            onAppear: () => {
              console.log('BindSheet onAppear.')
            },
            onDisappear: () => {
              console.log('BindSheet onDisappear.')
            },
            scrollSizeMode: this.sheetScrollModeSize,
            onWillDismiss: ((DismissSheetAction: DismissSheetAction) => {
              if (DismissSheetAction.reason != DismissReason.SLIDE_DOWN) {
                DismissSheetAction.dismiss()
              }
            }),
          })

        Button('CENTER')
          .onClick(() => {
            this.isShow1 = true
          })
          .fontSize(20)
          .bindSheet($$this.isShow1, this.myBuilder(), {
            height: this.sheetHeight,
            preferType: SheetType.CENTER,
            effectEdge: this.sheetEffectEdge,
            onAppear: () => {
              console.log('BindSheet onAppear.')
            },
            onDisappear: () => {
              console.log('BindSheet onDisappear.')
            },
            scrollSizeMode: this.sheetScrollModeSize,
            onWillDismiss: ((DismissSheetAction: DismissSheetAction) => {
              if (DismissSheetAction.reason != DismissReason.SLIDE_DOWN) {
                DismissSheetAction.dismiss()
              }
            }),
          })

        Button('POPUP')
          .onClick(() => {
            this.isShow2 = true
          })
          .fontSize(20)
          .bindSheet($$this.isShow2, this.myBuilder(), {
            height: this.sheetHeight,
            preferType: SheetType.POPUP,
            effectEdge: this.sheetEffectEdge,
            onAppear: () => {
              console.log('BindSheet onAppear.')
            },
            onDisappear: () => {
              console.log('BindSheet onDisappear.')
            },
            scrollSizeMode: this.sheetScrollModeSize,
            onWillDismiss: ((DismissSheetAction: DismissSheetAction) => {
              if (DismissSheetAction.reason != DismissReason.SLIDE_DOWN) {
                DismissSheetAction.dismiss()
              }
            }),
          })
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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}