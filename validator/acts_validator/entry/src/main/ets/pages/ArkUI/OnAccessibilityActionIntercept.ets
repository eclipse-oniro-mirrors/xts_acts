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
import{ToggleModifier}from '@ohos.arkui.modifier'
import{ColumnModifier}from '@ohos.arkui.modifier'
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import { AttributeUpdater } from '@kit.ArkUI';

const TAG = '[OnAccessibilityActionIntercept]';

class CustomModifierSGXTS extends ToggleModifier {
  applyNormalAttribute(instance: ToggleAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}
class ColumnModifierSGXTS extends ColumnModifier {
  applyNormalAttribute(instance: ColumnAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}
AppStorage.setOrCreate('isOn', false);
let uiContent:UIContext | undefined = undefined;
@Entry
@Component
struct OnAccessibilityActionIntercept {
  @State name: string = 'OnAccessibilityActionIntercept';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n'+'设备支持屏幕朗读时\n' + '操作步骤:\n' +
    '1、点击Origin message Toggle组件，双击Toggle组件\n' +
    '2、点击弹窗确认按钮获焦，双击确认按钮\n' +
    '3、再次双击Origin message Toggle组件，点击弹窗取消按钮获焦，双击取消按钮，弹窗关闭\n' +
    '4、点击Modifier message Toggle组件获焦，双击Toggle组件弹出弹窗\n' +
    '5、点击弹窗确认按钮获焦，双击确认按钮，弹窗关闭\n' +
    '6、再次双击Modifier message Toggle组件，点击弹窗取消按钮获焦，双击取消按钮，弹窗关闭\n' +
    '预期结果：\n' +
    '1、Origin message Toggle组件获焦，弹出弹窗”\n' +
    '2、弹窗关闭，Toggle组件状态变化\n' +
    '3、弹窗关闭，Toggle组件状态不变\n' +
    '4、Modifier message Toggle组件获焦，弹出弹窗”\n' +
    '5、弹窗关闭，Toggle组件状态变化\n' +
    '6、弹窗关闭，Toggle组件状态不变\n'
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
  @State isOn: boolean = false
  @State isOn1: boolean = false
  @State currentIndex: number = 0
  @State selectedFontColor: string = '#007DFF'
  @State fontColor: string = '#182431'
  @State modifierToggle: ToggleModifier = new CustomModifierSGXTS()
    .onAccessibilityActionIntercept((action) => {
    if (action === AccessibilityAction.ACCESSIBILITY_CLICK) {
      console.info('InterceptChild:ok')
      return AccessibilityActionInterceptResult.ACTION_RISE;
    }
    console.info('InterceptChild:no')
    return AccessibilityActionInterceptResult.ACTION_INTERCEPT
  })

  @State modifierColumn: ColumnModifier = new ColumnModifierSGXTS()
    .onAccessibilityActionIntercept((action) => {
    if (action === AccessibilityAction.ACCESSIBILITY_CLICK) {
      if(!!uiContent) {
        console.info('uiContentok')
        uiContent.showAlertDialog({
          title: '标题',
          message: '内容信息',
          primaryButton: {
            value: '确认',
            action: () => {
              const currentIsOn: boolean = AppStorage.get('isOn');
              AppStorage.set('isOn', !currentIsOn);
              this.status3 = true;
              if (this.status1 && this.status2 && this.status3 && this.status4) {
                this.vueStatus = true;
              } else {
                this.vueStatus = false;
              }
            }
          },
          secondaryButton: {
            value: '取消',
            action: () => {
              this.status4 = true;
              if (this.status1 && this.status2 && this.status3 && this.status4) {
                this.vueStatus = true;
              } else {
                this.vueStatus = false;
              }
            }
          }
        })
      }
      console.info('InterceptDadB:ok')
      return AccessibilityActionInterceptResult.ACTION_INTERCEPT
    }
    console.info('InterceptDadB:no')
    return AccessibilityActionInterceptResult.ACTION_CONTINUE;
  })

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.vueStatus) {
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
    NavDestination() {
      Column({ space: 10 }) {
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
              })
          }
        }

        Row({ space: 10 }) {
          Text('Origin message')
          Blank()
          Toggle({
            type: ToggleType.Switch,
            isOn: $$this.isOn1
          })
            .onAccessibilityActionIntercept((action) => {
              if (action === AccessibilityAction.ACCESSIBILITY_CLICK) {
                console.info('InterceptChild:ok')
                return AccessibilityActionInterceptResult.ACTION_RISE;
              }
              console.info('InterceptChild:no')
              return AccessibilityActionInterceptResult.ACTION_INTERCEPT
            })
        }.width('100%').backgroundColor(0xEFEFEF).padding(20)
        .onAccessibilityActionIntercept((action) => {
          if (action === AccessibilityAction.ACCESSIBILITY_CLICK) {
            this.getUIContext().showAlertDialog({
              title: '标题',
              message: '内容信息',
              primaryButton: {
                value: '确认',
                action: () => {
                  this.isOn1 = !this.isOn1;
                  this.status1 = true;
                  if (this.status1 && this.status2 && this.status3 && this.status4) {
                    this.vueStatus = true;
                  } else {
                    this.vueStatus = false;
                  }
                }
                },
              secondaryButton: {
                value: '取消',
                action: () => {
                  this.status2 = true;
                  if (this.status1 && this.status2 && this.status3 && this.status4) {
                    this.vueStatus = true;
                  } else {
                    this.vueStatus = false;
                  }
                }
              }
            })
            console.info('InterceptDadB:ok')
            return AccessibilityActionInterceptResult.ACTION_INTERCEPT
          }
          console.info('InterceptDadB:no')
          return AccessibilityActionInterceptResult.ACTION_CONTINUE;
        })
        Column(){
          Row() {
            Text('Modifier message')
            Blank()
            Toggle({ type: ToggleType.Switch, isOn: $$this.isOn })
              .attributeModifier(this.modifierToggle as CustomModifierSGXTS)
          }.width('100%').backgroundColor(0xEFEFEF).padding(20)
        }
        .height('55%')
        .onAccessibilityActionIntercept((action) => {
          if (action === AccessibilityAction.ACCESSIBILITY_CLICK) {
            this.getUIContext().showAlertDialog({
              title: '标题',
              message: '内容信息',
              primaryButton: {
                value: '确认',
                action: () => {
                  this.isOn = !this.isOn;
                  this.status3 = true;
                  if (this.status1 && this.status2 && this.status3 && this.status4) {
                    this.vueStatus = true;
                  } else {
                    this.vueStatus = false;
                  }
                }
              },
              secondaryButton: {
                value: '取消',
                action: () => {
                  this.status4 = true;
                  if (this.status1 && this.status2 && this.status3 && this.status4) {
                    this.vueStatus = true;
                  } else {
                    this.vueStatus = false;
                  }
                }
              }
            })
            console.info('InterceptDadB:ok')
            return AccessibilityActionInterceptResult.ACTION_INTERCEPT
          }
          console.info('InterceptDadB:no')
          return AccessibilityActionInterceptResult.ACTION_CONTINUE;
        })

        Row({ space: 10 }) {
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
        .padding(20)
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor(Color.Black)
      }.height("16%").width('100%')
    }
  }
}