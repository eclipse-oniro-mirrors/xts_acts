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
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { matrix4 } from '@kit.ArkUI';

const TAG = '[fingerInfos]';

@Entry
@Component
struct fingerInfosDemo {
  @State name: string = 'fingerInfos';
  @State stepTips: string = '操作步骤:\n' + '1.按照每个白色column组件中的文本内容在不同位置进行多次不同的手势操作\n' +
    '2.搜索log"ccc"\n' +
    '预期结果：\n' +
    '1.执行完对应的手势操作后，log中会打印fingerlist和fingerinfos的有关信息,当fingerlist打印出的log中有null时,fingerinfos的log中不应该有null且id不为0\n' +
    '2.在不同位置执行手势操作时,fingerinfos打印的log中的globalDisplayX和globalDisplayY的值应不同\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State count: number = 0
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right })
  @State scaleValue: number = 1
  @State pinchValue: number = 1
  @State pinchX: number = 0
  @State pinchY: number = 0
  @State angle: number = 0
  @State rotateValue: number = 0
  @State rotateAngle: number = 0
  @State speed: number = 1
  @State message: string = '';

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
        Scroll() {
          Column() {
            Column() {
              Text('一只手指长按Column中的红色文本,另一只指手长按外部粉色区域:' + this.count)
                .fontSize(30)
                .fontColor(Color.Red)
                .gesture(
                  LongPressGesture({ repeat: true })
                    .onAction((event: GestureEvent) => {
                      console.log('cccfingerlistsLong' + JSON.stringify(event.fingerList))
                      console.log('cccfingerinfosLong' + JSON.stringify(event.fingerInfos))
                      if (event && event.repeat) {
                        this.count++
                      }
                    })
                    .onActionEnd((event: GestureEvent) => {
                      this.count = 0
                    })
                    .onActionCancel((event: GestureEvent) => {
                      console.log('cccfingerlists' + JSON.stringify(event.fingerList))
                      console.log('cccfingerinfos' + JSON.stringify(event.fingerInfos))
                    })
                )
            }
            .backgroundColor(Color.White)
            .height(300)
            .width(300)
            .padding(20)
            .border({ width: 3 })
            .margin(73)

            Column() {
              Text('一只手指长按粉色区域,另外一只手指左右滑动白色column组件\n')
                .fontSize(30)
            }
            .backgroundColor(Color.White)
            .height(300)
            .width(300)
            .padding(20)
            .border({ width: 3 })
            .margin(73)
            .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
            .gesture(
              PanGesture(this.panOption)
                .onActionStart((event: GestureEvent) => {
                  console.info('Pan start')
                  console.log('cccfingerlistPan' + JSON.stringify(event.fingerList))
                  console.log('cccfingerinfosPan' + JSON.stringify(event.fingerInfos))
                })
                .onActionUpdate((event: GestureEvent) => {
                  if (event) {
                    this.offsetX = this.positionX + event.offsetX
                    this.offsetY = this.positionY + event.offsetY
                  }
                })
                .onActionEnd((event: GestureEvent) => {
                  this.positionX = this.offsetX
                  this.positionY = this.offsetY
                  console.info('Pan end')
                })
                .onActionCancel((event: GestureEvent) => {
                  console.log('cccCANCELlist' + JSON.stringify(event.fingerList))
                  console.log('cccCANCELinfo' + JSON.stringify(event.fingerInfos))
                })
            )

            Column() {
              Text('一只手指长按外部粉色区域,另外两根手指在白色column组件中进行捏合操作\n')
                .fontSize(30)
            }
            .backgroundColor(Color.White)
            .height(300)
            .width(300)
            .padding(20)
            .border({ width: 3 })
            .margin(73)
            .scale({ x: this.scaleValue, y: this.scaleValue, z: 1 })
            .gesture(
              PinchGesture({ fingers: undefined })
                .onActionStart((event: GestureEvent) => {
                  console.info('Pinch start')
                  console.log('cccfingerlistPinch' + JSON.stringify(event.fingerList))
                  console.log('cccfingerinfosPinch' + JSON.stringify(event.fingerInfos))
                })
                .onActionUpdate((event: GestureEvent) => {
                  if (event) {
                    this.scaleValue = this.pinchValue * event.scale
                    this.pinchX = event.pinchCenterX
                    this.pinchY = event.pinchCenterY
                  }
                })
                .onActionEnd((event: GestureEvent) => {
                  this.pinchValue = this.scaleValue
                  console.info('Pinch end')
                })
                .onActionCancel((event: GestureEvent) => {
                  console.log('cccCANCELlist' + JSON.stringify(event.fingerList))
                  console.log('cccCANCELinfo1' + JSON.stringify(event.fingerInfos))
                })
            )

            Column() {
              Text('一只手指长按外部粉色区域,另外两根手指在白色column组件中进行旋转操作\n')
                .fontSize(30)
            }
            .backgroundColor(Color.White)
            .height(300)
            .width(300)
            .padding(20)
            .border({ width: 3 })
            .margin(73)
            .rotate({ angle: this.angle })
            .gesture(
              RotationGesture()
                .onActionStart((event: GestureEvent) => {
                  console.info('Rotation start')
                  console.log('cccfingerListRotation' + JSON.stringify(event.fingerList))
                  console.log('cccfingerInfosRotation' + JSON.stringify(event.fingerInfos))
                })
                .onActionUpdate((event: GestureEvent) => {
                  if (event) {
                    this.angle = this.rotateValue + event.angle
                  }
                })
                .onActionEnd((event: GestureEvent) => {
                  this.rotateValue = this.angle
                  console.info('Rotation end')
                })
                .onActionCancel((event: GestureEvent) => {
                  console.log('cccfingerList' + JSON.stringify(event.fingerList))
                  console.log('cccCfingerInfos' + JSON.stringify(event.fingerInfos))
                })
            )

            Column() {
              Text('分别用两根手指快速同时点击红色文本和外部粉色区域\n')
                .fontSize(30)
                .fontColor(Color.Red)
                .gesture(
                  TapGesture({ count: 1 })
                    .onAction((event: GestureEvent) => {
                      console.log('cccfingerlistTap' + JSON.stringify(event.fingerList))
                      console.log('cccfingerinfosTap' + JSON.stringify(event.fingerInfos))
                    })
                )
            }
            .backgroundColor(Color.White)
            .height(300)
            .width(300)
            .border({ width: 3 })
            .margin(73)

            Column() {
              Text('一根手指长按外部粉色区域，另一根手指在白色column组件中左右滑动\n')
                .fontSize(30)
            }
            .backgroundColor(Color.White)
            .width(300)
            .height(300)
            .borderWidth(2)
            .margin(100)
            .onDragStart(() => {
              this.message = 'drag'
              console.log('Drag start.')
            })
            .gesture(
              TapGesture()
                .tag('tap')
                .onAction((event: GestureEvent) => {
                  this.message = 'tap'
                  console.log('cccfingerlistTap' + JSON.stringify(event.fingerList))
                  console.log('cccfingerinfosTap' + JSON.stringify(event.fingerInfos))
                })
            )
            .gesture(
              SwipeGesture()
                .tag('swipe')
                .onAction((event: GestureEvent) => {
                  this.message = 'swipe'
                  console.log('cccSWIPElist' + JSON.stringify(event.fingerList))
                  console.log('cccSWIPEinfo' + JSON.stringify(event.fingerInfos))
                })
            )
            .gesture(
              PanGesture()
                .tag('pan')
                .onActionStart((event: GestureEvent) => {
                  this.message = 'pan'
                  console.log('cccfingerlistPan' + JSON.stringify(event.fingerList))
                  console.log('cccfingerinfosPan' + JSON.stringify(event.fingerInfos))
                })
            )
            .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
              console.log('cccfingerlist' + JSON.stringify(event.fingerList))
              console.log('cccfingerinfos' + JSON.stringify(event.fingerInfos))
              if (gestureInfo.type == GestureControl.GestureType.SWIPE_GESTURE) {
                let swipeEvent = event as SwipeGestureEvent;
                console.log('angle SWIPE' + swipeEvent.angle)
              }
              if (gestureInfo.type == GestureControl.GestureType.PAN_GESTURE) {
                let panEvent = event as PanGestureEvent;
                console.log('velocity PAN' + panEvent.velocity)
              }
              if (gestureInfo.type == GestureControl.GestureType.DRAG) {
                return GestureJudgeResult.REJECT;
              }
              return GestureJudgeResult.CONTINUE;
            })
          }.backgroundColor(Color.Pink)
        }
      }.height('80%')
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