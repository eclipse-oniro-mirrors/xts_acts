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
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

const TAG = '[moveList]';

@Entry
@Component
struct moveListExample {
  @State name: string = 'moveList';
  @State stepTips: string = '操作步骤：长按子组件List_0并拖拽到List_1的位置' + '\n' +
    '预期结果：触发onMove回调，onLongPress: 0，onMoveThrough: 0/1，onDragStart: 0，onDrop: 1';
  @State isVue: boolean = false;
  @State intervalNum: number = 0;
  private data: number[] = [];
  @State t0:string = 'start'
  @State t1:string = 'start'
  @State t2:string = 'start'
  @State t3:string = 'start'

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
      .opacity(0.4)
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
    for (let i = 0; i < 6; i++) {
      Logger.info(TAG, 'data.push i =>' + i)
      this.data.push(i)
    }
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.t1 !== 'start') {
        this.isVue = true
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
            .height('15vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '20vp' })
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
        Column(){
          Text(this.t0)
            .fontColor(Color.Red)
          Text(this.t1)
            .fontColor(Color.Red)
          Row(){
            Text(this.t2)
              .fontColor(Color.Red)
              .margin({ right: 10 })
            Text(this.t3)
              .fontColor(Color.Red)
          }
        }
        .width('90%')
        .justifyContent(FlexAlign.Start)

        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.data, (item: string) => {
            ListItem() {
              Text('List_' + item)
                .width('100%')
                .height('30%')
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(Color.Pink)
            }
          }, (item: string) => item)
            .onMove((from: number, to: number) => {
              let tmp = this.data.splice(from, 1);
              this.data.splice(to, 0, tmp[0]);
              console.log('List onMove From: ' + from);
              console.log('List onMove To: ' + to);
            },
              {
                onLongPress: (index: number) => {
                  this.t0 = 'onLongPress: ' + index
                  console.log('List onLongPress: ' + index);
                },
                onMoveThrough: (from: number, to: number) => {
                  this.t1 = 'onMoveThrough: ' + from + '/' + to
                  console.log('List onMoveThrough From: ' + from);
                  console.log('List onMoveThrough To: ' + to);
                },
                onDragStart: (index: number) => {
                  this.t2 = 'onDragStart: ' + index
                  console.log('List onDragStart: ' + index);
                },
                onDrop: (index: number) => {
                  this.t3 = 'onDrop: ' + index
                  console.log('List onDrop: ' + index);
                }
              }
            )
        }
        .width('90%')
        .height('50%')
        .scrollBar(BarState.Off)
        .borderWidth(1)
      }

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
      .margin({ bottom: '20vp' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}