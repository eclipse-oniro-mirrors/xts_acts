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

import router from '@ohos.router';
import promptAction, { ImmersiveMode, LevelMode } from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';


const TAG = '[dialogModeTest]';
let dialogController1: CustomDialogController | null = null

@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column({ space: 5 }) {
      Text('自定义弹窗')
        .fontSize(30)
      TextInput()
      Button('点我关闭弹窗')
        .onClick(() => {
          dialogController1?.close();
        })
    }
    .margin(10)
  }
}

@Entry
@Component
struct dialogModeTest {
  @State name: string = 'dialogModeTest';
  @State stepTips: string =
    '操作步骤:\n' +
      '1、分别点击上方三个按钮切换immersiveMode的值，再分别点击下方橙色按钮弹出弹窗，并观察各类弹窗的蒙层效果\n' +
      '预期结果：\n' +
      '1、非自由子窗口中，当immersiveMode的值为EXTEND(1)时弹窗蒙层可扩展至覆盖状态栏和导航条，其余情况避开状态栏和导航条\n' +
      '2、自由窗口设备（PC端）直接按照失败处理走豁免'
  @State isVue: boolean = false;
  @State intervalNum: number = 0;
  @State immersiveMode: ImmersiveMode | undefined = 0

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.isVue == false) {
      Button({ stateEffect: this.isVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.3)
      .onClick(() => {

      })
    } else {
      Button({ stateEffect: this.isVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
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
            .margin({ left: '10vp', right: '10vp' })
        }
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text(this.name)
          .fontColor(Color.Black)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column({ space: 10 }) {
        Column({ space: 5 }) {
          Text('此用例在非自由子窗口下生效,自由窗口设备（PC端）直接按照失败处理走豁免')
            .fontSize(20)
            .fontColor(Color.Red)

          Text('immersiveMode: ' + this.immersiveMode)
          Button('immersiveMode:DEFAULT')
            .backgroundColor(this.immersiveMode == 0 ? '#0957f5' : '#259cba')
            .onClick((event: ClickEvent) => {
              this.immersiveMode = ImmersiveMode.DEFAULT
            })


          Button('immersiveMode:EXTEND')
            .backgroundColor(this.immersiveMode == 1 ? '#0957f5' : '#259cba')
            .onClick((event: ClickEvent) => {
              this.immersiveMode = ImmersiveMode.EXTEND
            })


          Button('immersiveMode:undefined')
            .backgroundColor(this.immersiveMode == undefined ? '#0957f5' : '#259cba')
            .onClick((event: ClickEvent) => {
              this.immersiveMode = undefined
            })
        }

        Column({ space: 5 }) {
          Text(`showDialog`)
            .fontSize(15)
            .backgroundColor(Color.Orange)
            .margin(3)
            .padding(3)
            .borderWidth(1.0)
            .onClick(() => {
              this.getUIContext().getPromptAction().showDialog({
                levelMode: LevelMode.EMBEDDED,
                immersiveMode: this.immersiveMode,

                showInSubWindow: false,
                isModal: true,
                title: 'Title Info',
                message: 'Message Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  },
                  {
                    text: 'button2',
                    color: '#000000'
                  }
                ],
              })
            })

          Text(`警告弹窗`)
            .fontSize(15)
            .backgroundColor(Color.Orange)
            .margin(3)
            .padding(3)
            .borderWidth(1.0)
            .onClick(() => {
              this.getUIContext().showAlertDialog(
                {
                  levelMode: LevelMode.EMBEDDED,
                  immersiveMode: this.immersiveMode,

                  showInSubWindow: false,
                  isModal: true,

                  title: 'title',
                  subtitle: 'subtitle',
                  message: 'text',
                  autoCancel: true,
                  alignment: DialogAlignment.Bottom,
                  gridCount: 4,
                  offset: { dx: 0, dy: -20 },
                  primaryButton: {
                    value: 'cancel',
                    action: () => {
                      console.info('Callback when the first button is clicked')
                    }
                  },
                  secondaryButton: {
                    enabled: true,
                    defaultFocus: true,
                    style: DialogButtonStyle.HIGHLIGHT,
                    value: 'ok',
                    action: () => {
                      console.info('Callback when the second button is clicked')
                    }
                  },

                  cancel: () => {
                    console.info('Closed callbacks')
                  },
                }
              )
            })

          Text(`showActionMenu`)
            .fontSize(15)
            .backgroundColor(Color.Orange)
            .margin(3)
            .padding(3)
            .borderWidth(1.0)
            .onClick(() => {
              this.getUIContext().getPromptAction().showActionMenu({
                levelMode: LevelMode.EMBEDDED,
                immersiveMode: this.immersiveMode,

                showInSubWindow: false,
                isModal: true,

                title: 'Title Info',
                buttons: [
                  {
                    text: 'button1',
                    color: '#000000'
                  },
                  {
                    text: 'button2',
                    color: '#000000'
                  }
                ],
              })
            })


          Text(`列表选择弹窗`)
            .fontSize(15)
            .backgroundColor(Color.Orange)
            .margin(3)
            .padding(3)
            .borderWidth(1.0)
            .onClick(() => {
              this.getUIContext().showActionSheet({
                levelMode: LevelMode.EMBEDDED,
                immersiveMode: this.immersiveMode,
                showInSubWindow: false,
                isModal: true,

                title: 'ActionSheet title',
                subtitle: 'ActionSheet subtitle',
                message: 'message',
                autoCancel: true,
                confirm: {
                  defaultFocus: true,
                  value: 'Confirm button',
                  action: () => {
                    console.log('Get Alert Dialog handled')
                  }
                },
                cancel: () => {
                  console.log('actionSheet canceled')
                },
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -10 },
                sheets: [
                  {
                    title: 'apples',
                    action: () => {
                      console.log('apples')
                    }
                  },
                  {
                    title: 'bananas',
                    action: () => {
                      console.log('bananas')
                    }
                  },
                  {
                    title: 'pears',
                    action: () => {
                      console.log('pears')
                    }
                  }
                ],
                backgroundColor: Color.Orange,
                backgroundBlurStyle: BlurStyle.NONE
              })
            })

          Text(`自定义弹窗`)
            .fontSize(15)
            .backgroundColor(Color.Orange)
            .margin(3)
            .padding(3)
            .borderWidth(1.0)
            .onClick(() => {
              dialogController1 = new CustomDialogController({
                builder: CustomDialogExample({}),
                levelMode: LevelMode.EMBEDDED,
                immersiveMode: this.immersiveMode,

                showInSubWindow: false,
                isModal: true,

                autoCancel: true,

                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -20 },
                gridCount: 4,
                customStyle: false,

                backgroundColor: Color.Orange,
                backgroundBlurStyle: BlurStyle.NONE
              })

              if (dialogController1 != null) {
                dialogController1.open();
              }
            })
        }
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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}