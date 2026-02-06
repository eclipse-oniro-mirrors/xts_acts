/*
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
import { GestureTriggerInfo } from '@ohos.arkui.UIContext'
import { GestureActionPhase, GestureListenerType } from '@kit.ArkUI'
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

function tapGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current getTag:' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase:' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node:' + JSON.stringify(info.node))
}

@Entry
@Component
struct TapGestureExample {
  @State value: string = ''
  @State name: string = 'TapGestureListener';
  @State stepTips: string = '操作步骤:\n' + '1.点击[点击添加监听]按钮\n' +
    '2.单指点击[Click once]文本\n' + '3.过滤日志[aaa ---]\n' +
    '4.点击[点击移除监听]按钮\n' + '5.单指点击[Click once]文本\n' + '6.过滤日志[aaa ---]\n' +
    '预期结果：\n' + '1.添加监听后callback回调日志能够触发\n' +
    '2.添加监听后callback回调触发后触发onAction事件日志\n' +
    '3.移除监听后callback回调函数不会触发，只会触发onAction事件的日志'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
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
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
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
          });
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
        Column() {
          Text('Click once').fontSize(28)
            .gesture(
              TapGesture({
                count: 1,
                fingers: 1,
                isFingerCountLimited: false,
                distanceThreshold: 2
              })
                .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen, SourceTool.MOUSE,
                  SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
                .tag('tap')
                .onAction((event: GestureEvent) => {
                  if (event) {
                    this.value = JSON.stringify(event.fingerList[0])
                    console.info(`aaa --- onAction tap event: ${JSON.stringify(event)}`)
                  }
                })
            )
          Text(this.value)
        }
        .height(200)
        .width(300)
        .padding(20)
        .border({ width: 3 })
        .margin(30)

        Button('点击添加监听').onClick(() => {
          let observer = this.getUIContext().getUIObserver();
          observer.addGlobalGestureListener(GestureListenerType.TAP,
            { actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END] }, tapGesture);
          console.info('aaa --- 添加监听')
        })

        Button('点击移除监听').onClick(() => {
          let observer = this.getUIContext().getUIObserver();
          observer.removeGlobalGestureListener(GestureListenerType.TAP, tapGesture);
          console.info('aaa --- 移除监听')
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
    }
    .width('100%')
    .height('100%')
  }
}