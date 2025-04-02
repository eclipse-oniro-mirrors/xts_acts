/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

const TAG = '[AccessibilityProperty]';

@Entry
@Component
struct AccessibilityProperty {
  @State FillColor: string = '#FF000000';
  @State name: string = 'AccessibilityProperty';
  @State StepTips: string =  '设备支持屏幕朗读时\n' + '操作步骤:\n' + '1、从上到下依次滑动观察屏幕朗读情况\n'+'\n'+
    '预期结果：1、绿框绘制在组件上，屏幕朗读朗读”已选中checkable测试(true)“\n' +
    '2、绿框绘制在组件上，屏幕朗读朗读“未选中checkable测试(false)”\n' +
    '3、绿框绘制在组件上，屏幕朗读朗读“checkable测试(undefined)”\n' +
    '4、绿框绘制在组件上，屏幕朗读朗读“已选中accessibilitySelected true”\n' +
    '5、绿框绘制在组件上，屏幕朗读朗读“accessibilitySelected false”\n' +
    '6、绿框绘制在组件上，屏幕朗读朗读“accessibilitySelected undefined”\n' +
    '7、勾选不勾选Checkbox，屏幕朗读的都是“已选中”，聚焦到后面的文本内容，朗读的是“accessbilityChecked true Select undefined”\n' +
    '8、勾选不勾选Checkbox，屏幕朗读的都是“未选中”，聚焦到后面的文本内容，朗读的是“accessbilityChecked false Select undefined”\n' +
    '9、勾选Checkbox，屏幕朗读的都是“已选中”，不勾选的时候朗读的是“未选中”，聚焦到后面的文本内容，朗读的是“accessbilityChecked undefined Select undefined”\n' +
    '10、绿框绘制在组件上，屏幕朗读朗读“已选中accessibilitySelected true Checked undefined”\n' +
    '11、绿框绘制在组件上，屏幕朗读朗读“accessibilitySelected false Checked undefined”\n' +
    '12、绿框绘制在组件上，屏幕朗读朗读“accessibilitySelected undefined Checked undefined”';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State hoverText: string = 'no hover';
  @State color: Color = Color.Blue;
  @State text1: string = ""
  @State text2: string = ""
  @State text3: string = ""
  @State text4: string = ""

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
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
      Button({ stateEffect: this.Vue }) {
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
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.text1 === 'HOVER_ENTER' && this.text2 === 'HOVER_MOVE' && this.text3 === 'HOVER_EXIT' &&this.text4 === 'HOVER_CANCEL') {
        this.Vue = true;
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
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({top:20})
        }
        Row() {
          Column() {
            Button(`不支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .enabled(!this.yesEnable)
              .opacity(!this.yesEnable ? 1 : 0.4)
              .onClick(async () => {
                this.Vue = true
              })
          }

          Column() {
            Button(`支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .onClick(async () => {
                this.yesEnable = true
                this.onAccessibilityHoverEnable = true
              })
          }
        }
        Text('checkable测试(true)').accessibilityChecked(true);
        Text('checkable测试(false)').accessibilityChecked(false);
        Text('checkable测试(undefined)').accessibilityChecked(undefined);

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Text('accessibilitySelected true')
            .accessibilitySelected(true)
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Text('accessibilitySelected false')
            .accessibilitySelected(false)
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Text('accessibilitySelected undefined')
            .accessibilitySelected(undefined)
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox change is' + value)
            })
            .width(30)
            .height(30)
            .accessibilityChecked(true)
            .accessibilitySelected(undefined)
          Text('accessibilityChecked true Select undefined')
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox change is' + value)
            })
            .width(30)
            .height(30)
            .accessibilityChecked(false)
            .accessibilitySelected(undefined)
          Text('accessibilityChecked false Select undefined')
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox change is' + value)
            })
            .width(30)
            .height(30)
            .accessibilityChecked(undefined)
            .accessibilitySelected(undefined)
          Text('accessibilityChecked undefined Select undefined')
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Text('accessibilitySelected true Checked undefined')
            .accessibilitySelected(true)
            .accessibilityChecked(undefined)
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Text('accessibilitySelected false Checked undefined')
            .accessibilitySelected(false)
            .accessibilityChecked(undefined)
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Text('accessibilitySelected undefined Checked undefined')
            .accessibilitySelected(undefined)
            .accessibilityChecked(undefined)
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