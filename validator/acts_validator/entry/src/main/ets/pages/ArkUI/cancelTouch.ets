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

const TAG = '[cancelTouch]';

@Entry
@Component
struct cancelTouchDemo {
  @State name: string = 'cancelTouch';
  @State stepTips: string = '操作步骤:\n' + '1.长按"Scroll Area -- 子组件"文本所在区域触发长按事件\n' +
    '2.搜索log"===fy==="\n' +
    '预期结果：\n' + '1.触发长按手势的过程中会同时打印有关父组件outer和子组件inner的Touch事件相关的log\n' +
    '2.当log中出现"长按事件触发成功 子组件的touch事件已被阻止"以后,子组件inner的touch事件被取消,log中将只会打印有关父组件outer的log信息\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  scroller: Scroller = new Scroller();
  scroller2: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  private childRecognizer: GestureRecognizer = new GestureRecognizer();
  private currentRecognizer: GestureRecognizer = new GestureRecognizer();
  private lastOffset: number = 0;

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
        Stack({ alignContent: Alignment.TopStart }) {
          Scroll(this.scroller) {
            Column() {
              Text('Scroll Area -- 父组件')
                .width('90%')
                .height(150)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
              Scroll(this.scroller2) {
                Column() {
                  Text('Scroll Area -- 子组件')
                    .width('90%')
                    .height(150)
                    .backgroundColor(0xFFFFFF)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 10 })
                  Column() {
                    ForEach(this.arr, (item: number) => {
                      Text(item.toString())
                        .width('90%')
                        .height(150)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                        .margin({ top: 10 })
                    }, (item: string) => item)
                  }.width('100%')
                }
              }
              .id('inner')
              .width('100%')
              .height(800)
              .onTouch((event) => {
                console.log('===fy=== inner onTouch, id is: ', event.target.id)
                console.log('===fy=== inner onTouch, type is: ', event.type)
              })
            }.width('100%')
          }
          .id('outer')
          .height(600)
          .scrollable(ScrollDirection.Vertical)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Gray) 
          .scrollBarWidth(10) 
          .edgeEffect(EdgeEffect.None)
          .shouldBuiltInRecognizerParallelWith((current: GestureRecognizer, others: Array<GestureRecognizer>) => {
            for (let i = 0; i < others.length; i++) {
              let target = others[i].getEventTargetInfo();
              if (target) {
                if (target.getId() == 'inner' && others[i].isBuiltIn() &&
                  others[i].getType() == GestureControl.GestureType.LONG_PRESS_GESTURE) { 
                  this.currentRecognizer = current; 
                  this.childRecognizer = others[i]; 
                  return others[i]; 
                }
              }
            }
            return undefined;
          })
          .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
            others: Array<GestureRecognizer>,
            touchRecognizers?: Array<TouchRecognizer>) => { 
            if (current && touchRecognizers) {
              let target = current.getEventTargetInfo();
              if (target) {
                if (target.getId() == 'outer' && current.isBuiltIn() &&
                  current.getType() == GestureControl.GestureType.LONG_PRESS_GESTURE) {
                  return GestureJudgeResult.CONTINUE
                }
                console.log('===fy=== onGestureRecognizerJudgeBegin touchRecognizers.length is: ',
                  touchRecognizers.length)
                for (let index = 0; index < touchRecognizers.length; index++) {
                  const element = touchRecognizers![index];
                  let touchTarget = element.getEventTargetInfo()
                  console.log('===fy=== onGestureRecognizerJudgeBegin element id is: ', touchTarget.getId())
                  if (touchTarget && touchTarget.getId() == 'inner') {
                    console.log('===fy=== onGestureRecognizerJudgeBegin %s will cancelTouch', touchTarget.getId())
                    element.cancelTouch()
                    console.log('===fy=== 长按事件触发成功 子组件的touch事件已被阻止')
                  }
                }
              }
            }
            return GestureJudgeResult.CONTINUE;
          })
          .onTouch((event) => {
            console.log('===fy=== outer onTouch, id is: ', event.target.id)
            console.log('===fy=== outer onTouch, type is: ', event.type)
          })
          .parallelGesture( 
            LongPressGesture()
              .onAction((event: GestureEvent) => {
                if (this.childRecognizer.getState() != GestureRecognizerState.SUCCESSFUL ||
                  this.currentRecognizer.getState() != GestureRecognizerState.SUCCESSFUL) { 
                  return;
                }
                let target = this.childRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
                let currentTarget = this.currentRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
                if (target instanceof ScrollableTargetInfo && currentTarget instanceof ScrollableTargetInfo) {
                  if (target.isEnd()) { 
                    if ((event.offsetY - this.lastOffset) < 0) {
                      this.childRecognizer.setEnabled(false)
                      if (currentTarget.isEnd()) {
                        this.currentRecognizer.setEnabled(false)
                      } else {
                        this.currentRecognizer.setEnabled(true)
                      }
                    } else {
                      this.childRecognizer.setEnabled(true)
                      this.currentRecognizer.setEnabled(false)
                    }
                  } else if (target.isBegin()) {
                    if ((event.offsetY - this.lastOffset) > 0) {
                      this.childRecognizer.setEnabled(false)
                      if (currentTarget.isBegin()) {
                        this.currentRecognizer.setEnabled(false)
                      } else {
                        this.currentRecognizer.setEnabled(true)
                      }
                    } else {
                      this.childRecognizer.setEnabled(true)
                      this.currentRecognizer.setEnabled(false)
                    }
                  } else {
                    this.childRecognizer.setEnabled(true)
                    this.currentRecognizer.setEnabled(false)
                  }
                }
                this.lastOffset = event.offsetY
              })
          )
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