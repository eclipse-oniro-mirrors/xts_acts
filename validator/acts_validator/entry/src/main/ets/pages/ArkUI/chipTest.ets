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
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { Chip, ChipSize, SymbolGlyphModifier } from '@kit.ArkUI';
const TAG = '[chipTest]';
@Builder
function defaultFunction(): void {
}

@Component
struct SectionGroup {
  @Prop
  @Require
  title: ResourceStr;
  @BuilderParam
  @Require
  content: () => void = defaultFunction;

  build() {
    Column({ space: 4 }) {
      Text(this.title)
        .fontColor('#FF666666')
        .fontSize(12)
      Column({ space: 8 }) {
        this.content()
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}

@Component
struct SectionItem {
  @Prop
  @Require
  title: ResourceStr;
  @BuilderParam
  @Require
  content: () => void = defaultFunction;

  build() {
    Column({ space: 12 }) {
      Text(this.title)
      this.content()
    }
    .backgroundColor('#FFFFFFFF')
    .borderRadius(12)
    .padding(12)
    .width('100%')
  }
}

@Entry
@Component
struct chipTest {
  @State name: string = 'chipTest';
  @State StepTips: string =  '设备支持屏幕朗读时\n' + '操作步骤:\n' + '1、点击closeOPtions下chip组件的删除符号，观察朗读内容\n'+
    '2、分别点击后缀Symbol播报下激活态和未激活态的后缀图标，观察朗读内容\n' +'\n'+
    '预期结果：1、朗读内容为：删除，按钮，删除文本\n' +
    '2、朗读内容为：已激活音乐，按钮，新手提醒\n' +
    '3、朗读内容为：未激活音乐，按钮，新手提醒\n';
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

        Column() {
          SectionGroup({ title: 'closeOptions播报' }) {
            SectionItem({ title: 'closeOptions播报' }) {
              Chip({
                prefixIcon: {
                  src: $r('app.media.icon'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Blue
                },
                label: {
                  text: '操作块',
                  fontSize: 12,
                  fontColor: Color.Blue,
                  labelMargin: { left: 20, right: 30 }
                },
                closeOptions:{
                  accessibilityText:'删除',
                  accessibilityDescription:'删除文本',
                  accessibilityLevel:'yes'
                },
                size: ChipSize.SMALL,
                allowClose: true,
                enabled: true,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
                borderRadius: $r('sys.float.ohos_id_corner_radius_button'),
                onClose:()=>{
                  console.log('chip on close')
                }
              })
              Chip({
                prefixIcon: {
                  src: $r('app.media.icon'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Blue
                },
                label: {
                  text: '操作块',
                  fontSize: 12,
                  fontColor: Color.Blue,
                  labelMargin: { left: 20, right: 30 }
                },
                closeOptions:{
                  accessibilityText:'删除',
                  accessibilityDescription:'删除文本',
                  accessibilityLevel:'yes'
                },
                size: ChipSize.SMALL,
                allowClose: true,
                enabled: true,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
                borderRadius: $r('sys.float.ohos_id_corner_radius_button'),
                onClose:()=>{
                  console.log('chip on close')
                }
              })
            }
          }
          SectionGroup({ title: '后缀Symbol播报' }) {
            SectionItem({ title: 'activatedAccessibility' }) {
              Chip({
                label: { text: '操作块' },
                activated: true,
                suffixSymbol: {
                  activated: new SymbolGlyphModifier($r('sys.symbol.media_sound'))
                    .fontSize(72),
                },
                suffixSymbolOptions: {
                  activatedAccessibility: {
                    accessibilityText: '已激活音乐',
                    accessibilityDescription: '新手提醒',
                    accessibilityLevel:'auto'
                  },
                  action: () => {
                    this.getUIContext().getPromptAction().showToast({
                      message: '后缀Symbol被点击！'
                    });
                  }
                },
                onClicked: () => {
                  this.getUIContext().getPromptAction().showToast({
                    message: '操作块被点击！'
                  });
                }
              })
            }
            SectionItem({ title: 'normalAccessibility' }) {
              Chip({
                label: { text: '操作块' },
                suffixSymbol: {
                  normal: new SymbolGlyphModifier($r('sys.symbol.media_sound'))
                    .fontSize(72),
                },
                suffixSymbolOptions: {
                  normalAccessibility: {
                    accessibilityText: '未激活音乐',
                    accessibilityDescription: '新手提醒',
                    accessibilityLevel:'auto'
                  },
                  action: () => {
                    this.getUIContext().getPromptAction().showToast({
                      message: '后缀Symbol被点击！'
                    });
                  }
                },
                onClicked: () => {
                  this.getUIContext().getPromptAction().showToast({
                    message: '操作块被点击！'
                  });
                }
              })
            }
          }
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
      // .padding(20)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }.width('100%')
    .height('100%')
  }
}