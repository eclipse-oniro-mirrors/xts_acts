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
import { SliderModifier } from '@ohos.arkui.modifier'
import { ColumnModifier } from '@ohos.arkui.modifier'
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import { AttributeUpdater } from '@kit.ArkUI';

const TAG = '[AccessibilityOptions]';

let uiContent: UIContext | undefined = undefined;

@Entry
@Component
struct AccessibilityOptions {
  @State name: string = 'AccessibilityOptions';
  @State StepTips: string = '设备支持屏幕朗读时\n' + '操作步骤:\n' + '1、从上到下依次滑动观察屏幕朗读情况\n' + '\n' +
    '预期结果：1、绿框绘制在组件上，屏幕朗读朗读“有accessibility有text优先读accessibility”\n' +
    '2、绿框绘制在组件上，屏幕朗读朗读“accessibility无text 读accessibility按钮”\n' +
    '3、绿框绘制在组件上，屏幕朗读朗读“无accessibility有text 读text按钮”\n' +
    '4、绿框绘制在组件上，屏幕朗读朗读”有accessibility有text优先读accessibility，accessibility无text 读accessibility，无accessibility有text 读text，有accessibility有text btn123，btn123“\n' +
    '5、绿框绘制在组件上，屏幕朗读朗读“有accessibility有text btn123按钮”\n' +
    '6、绿框绘制在组件上，屏幕朗读朗读“btn123按钮”';
  @State vueStatus: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State color: Color = Color.Blue;
  @State currentIndex: number = 0
  @State selectedFontColor: string = '#007DFF'
  @State fontColor: string = '#182431'

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.vueStatus) {
      Button({ stateEffect: this.vueStatus }) {
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
    } else {
      Button({ stateEffect: this.vueStatus }) {
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

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }

  build() {
    Column({ space: 10 }) {
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
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row({ space: 10 }) {
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({ top: 20 })
        }

        Row({ space: 10 }) {
          Column() {
            Button(`不支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .enabled(!this.yesEnable)
              .opacity(!this.yesEnable ? 1 : 0.4)
              .onClick(async () => {
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
                this.vueStatus=true
              })
          }
        }

        Column({ space: 2 }) {
          Text('123456')
            .focusable(true)
            .borderRadius(5)
            .accessibilityText("有accessibility有text优先读accessibility")
            .accessibilityLevel("yes").height('9%')
          Button().accessibilityLevel("yes").accessibilityText("accessibility无text 读accessibility").height('9%')
          Button("无accessibility有text 读text").accessibilityLevel("yes").height('9%')
          Button().height('9%')
          Button('btnl23').accessibilityText("有accessibility有text btn123").accessibilityLevel("yes").height('9%')
          Button('btn123').accessibilityLevel("yes").height('9%')
        }
        .accessibilityGroup(true, { accessibilityPreferred: true })
      }.height('70%')
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
      // .padding(20)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }.width('100%')
    .height('100%')
  }
}