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

function longPressGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current getTag:' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase:' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node:' + JSON.stringify(info.node))
}

@Entry
@Component
struct LongPressGestureExample {
  @State value: string = ''
  @State name: string = 'LongPressGestureListener';
  @State count: number = 0
  @State stepTips: string = '操作步骤:\n' + '1.点击[点击添加监听]按钮\n' +
    '2.单指长按文本\n' + '3.过滤日志[aaa ---]\n' +
    '4.点击[点击移除监听]按钮\n' + '5.单指长按文本\n' + '6.过滤日志[aaa ---]\n' +
    '预期结果：\n' + '1.添加监听后callback回调日志能够触发\n' +
    '2.添加监听后先触发callback回调日志，再触发onAction start事件日志，再触发callback回调日志，最后触发onAction end事件日志\n' +
    '3.移除监听后callback回调函数不会触发，只会触发onAction和onAction end事件的日志'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
      Image($r('app.media.ic_public_pass'))
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
          result: 'true ', title: this.name,
        }
      });
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
        .size({ width: '10%', height: '10%' })
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
          Text('LongPress onAction:' + this.count)
            .fontSize('5%')
            .width('100%')
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .gesture(
              LongPressGesture({
                fingers: 1,
                duration: 20,
                repeat: true,
                isFingerCountLimited: true
              })
                .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen, SourceTool.MOUSE,
                  SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
                .tag('longPress')
                .onAction((event: GestureEvent) => {
                  if (event && event.repeat) {
                    this.count++
                    console.info(`aaa --- onAction longPress event: ${JSON.stringify(event)}`)
                  }
                })
                .onActionEnd((event: GestureEvent) => {
                  console.info('aaa --- longPress end')
                  console.info(`aaa --- onAction longPress end event: ${JSON.stringify(event)}`)
                })
            )
        }
        .height('30%')
        .width('80%')
        .padding('5%')
        .border({ width: 3 })
        .margin('5%')

        Button('点击添加监听')
          .width('60%')
          .height('10%')
          .margin('5%')
          .onClick(() => {
            let observer = this.getUIContext().getUIObserver();
            observer.addGlobalGestureListener(GestureListenerType.LONG_PRESS,
              { actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END] }, longPressGesture);
            console.info('aaa --- 添加监听')
          })

        Button('点击移除监听')
          .width('60%')
          .height('10%')
          .margin('5%')
          .onClick(() => {
            let observer = this.getUIContext().getUIObserver();
            observer.removeGlobalGestureListener(GestureListenerType.LONG_PRESS, longPressGesture);
            console.info('aaa --- 移除监听')
          })
      }
      .height('70%')
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
      .backgroundColor(Color.Black)
    }
    .width('100%')
    .height('100%')
  }
}