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
import FirstDialog from '../model/FirstDialog';
import { AttributeUpdater } from '@kit.ArkUI';

const TAG = '[AccessibilityFocusDrawLevel]';

class MyAccessibilityModifier extends AttributeUpdater<CommonAttribute> {
}

@Entry
@Component
struct AccessibilityOptions {
  @State name: string = 'AccessibilityFocusDrawLevel';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n'+'设备支持屏幕朗读时\n' + '操作步骤:\n' +
    '1、"By Modifier"Text组件获焦\n' +
    '2、点击"ChangeTextModifier_TOP"按钮，"By Modifier"Text组件再次获焦\n' +
    '3、点击"ChangeTextModifier_SELF"按钮，"By Modifier"Text组件再次获焦\n' +
    '4、"By State"Text组件获焦\n' +
    '5、点击"Change state focusDrawLevel to TOP"按钮，"By State"Text组件再次获焦\n' +
    '6、点击"Change state focusDrawlevel to SELF"按钮，"By State"Text组件再次获焦\n' +
    '预期结果：\n' +
    '1、绿框绘制在组件上，绿框绘制被裁切,屏幕朗读朗读“By Modifier”\n' +
    '2、绿框绘制在组件上，绿框绘制正常,屏幕朗读朗读“By Modifier”\n' +
    '3、绿框绘制在组件上，绿框绘制被裁切,屏幕朗读朗读“By Modifier”\n' +
    '4、绿框绘制在组件上，绿框绘制被裁切,屏幕朗读朗读“By State”\n' +
    '5、绿框绘制在组件上，绿框绘制正常,屏幕朗读朗读“By State”\n' +
    '6、绿框绘制在组件上，绿框绘制被裁切,屏幕朗读朗读“By State”\n'
  @State vueStatus: boolean = false;
  @State status1: boolean = false;
  @State status2: boolean = false;
  @State status3: boolean = false;
  @State status4: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State hoverText: string = 'no hover';
  @State color: Color = Color.Blue;
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  private modifier: MyAccessibilityModifier = new MyAccessibilityModifier
  @State focusDrawLevel: FocusDrawLevel = FocusDrawLevel.SELF

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.vueStatus == false) {
      Button({ stateEffect: this.vueStatus }) {
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
      Button({ stateEffect: this.vueStatus }) {
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
      if (this.text1 === 'HOVER_ENTER' && this.text2 === 'HOVER_MOVE' && this.text3 === 'HOVER_EXIT' &&
        this.text4 === 'HOVER_CANCEL') {
        this.vueStatus = true;
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
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({ top: 20 })
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

        Column({ space: 10 }) {
          Column() {
            Column() {
              Text('By Modifier')
                .accessibilityLevel('yes')
                .fontSize('50fp')
                .fontWeight(FontWeight.Bold)
                .attributeModifier(this.modifier)
                .focusable(true)
            }
            .borderRadius(50)
            .borderWidth(1)
            .borderColor(Color.Blue)
            .clip(true)

            Button('ChangeTextModifier_TOP')
              .accessibilityLevel('yes')
              .onClick(() => {
                this.status1 = true;
                this.modifier.attribute?.accessibilityFocusDrawLevel(FocusDrawLevel.TOP)
                if(this.status1&&this.status2&&this.status3&&this.status4){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
              .margin(20)
            Button('ChangeTextModifier_SELF')
              .accessibilityLevel('yes')
              .onClick(() => {
                this.status2 = true;
                this.modifier.attribute?.accessibilityFocusDrawLevel(FocusDrawLevel.SELF)
                if(this.status1&&this.status2&&this.status3&&this.status4){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
              .margin(20)
            Column() {
              Text('By State')
                .accessibilityLevel('yes')
                .key('State')
                .fontSize('50fp')
                .fontWeight(FontWeight.Bold)
                .focusable(true)
                .accessibilityFocusDrawLevel(this.focusDrawLevel)
            }
            .borderRadius(50)
            .clip(true)
            .borderWidth(1)
            .borderColor(Color.Blue)

            Button('Change state focusDrawLevel to TOP')
              .accessibilityLevel('yes')
              .onClick(() => {
                this.status3 = true;
                this.focusDrawLevel = FocusDrawLevel.TOP;
                if(this.status1&&this.status2&&this.status3&&this.status4){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
              .margin(20)
            Button('Change state focusDrawlevel to SELF')
              .accessibilityLevel('yes')
              .onClick(() => {
                this.status4 = true;
                this.focusDrawLevel = FocusDrawLevel.SELF;
                if(this.status1&&this.status2&&this.status3&&this.status4){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
              .margin(20)
          }
        }
        .accessibilityGroup(true, { accessibilityPreferred: true })
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