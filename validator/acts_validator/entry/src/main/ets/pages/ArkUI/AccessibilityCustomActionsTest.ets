/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

const TAG = '[AccessibilityCustomActionsTest]';

@Entry
@Component
struct AccessibilityCustomActionsTest {
  @State name: string = 'AccessibilityCustomActionsTest';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n' +
    '设备支持屏幕朗读时\n' +
    '测试目的: 验证 accessibilityCustomActions 接口在不同入参情况下的表现\n' +
    '\n' +
    '操作步骤:\n' +
    '1、开启屏幕朗读功能\n' +
    '2、依次滑动测试以下组件:\n' +
    '   - "单个操作测试"组件: 验证自定义操作"删除"可用，执行删除操作\n' +
    '   - "null入参测试"组件: 验证组件正常显示\n' +
    '   - "undefined入参测试"组件: 验证组件正常显示\n' +
    '   - "空数组入参测试"组件: 验证组件正常显示\n' +
    '3、在"单个操作测试"组件上执行自定义操作"删除"，验证操作正确触发\n' +
    '4、所有测试完成后，点击"通过"按钮\n' +
    '注意事项：列表项删除后如果没有自动聚焦在下个操作项需要手动聚焦\n' +
    '\n' +
    '预期结果:\n' +
    '1、"单个操作测试"组件: 屏幕朗读时提示有自定义操作"删除"，执行操作后回调正确触发，列表项被删除\n' +
    '2、"null入参测试"组件: 组件正常显示，屏幕朗读时无自定义操作提示\n' +
    '3、"undefined入参测试"组件: 组件正常显示，屏幕朗读时无自定义操作提示\n' +
    '4、"空数组入参测试"组件: 组件正常显示，屏幕朗读时无自定义操作提示\n';
  @State vueStatus: boolean = false;
  @State testResult1: boolean = false;
  @State listData: Array<string> = ['列表项1', '列表项2'];
  @State yesEnable: boolean = false;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.vueStatus) {
      Button({ stateEffect: this.vueStatus }) {
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
            result: 'true ',
            title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过',
          duration: 1000
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
          result: 'false',
          title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败',
        duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
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

      Row({ space: 10 }) {
        Text(`是否设备支持屏幕朗读`)
          .fontColor(Color.Green)
          .fontSize('14fp')
          .margin({ top: 10 })
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
            })
        }
      }
      .height('6%')

      Scroll() {
        Column({ space: 8 }) {
          Text('单个操作测试')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          List({ space: 8 }) {
            ForEach(this.listData, (item: string, index: number) => {
              ListItem() {
                Row() {
                  Text(item)
                    .fontSize('14fp')
                  Blank()
                  Text('删除')
                    .fontSize('12fp')
                    .fontColor(Color.Red)
                }
                .width('90%')
                .padding('8vp')
                .margin({ top: '4vp', bottom: '4vp' })
                .borderRadius(8)
                .backgroundColor(0xF1F3F5)
                .onClick(() => {

                })
                .accessibilityLevel('yes')
                .accessibilityCustomActions([
                  {
                    name: '删除',
                    onAction: () => {
                      this.listData.splice(index, 1);
                      this.testResult1 = true;
                      this.vueStatus = true;
                    }
                  }
                ])
              }
            }, (item: string) => item)
          }
          .width('100%')
          .height('25%')
          .scrollBar(BarState.Auto)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('null/undefined/空数组测试')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Column({ space: 6 }) {
            Row() {
              Text('null入参测试')
                .fontSize('14fp')
                .accessibilityLevel('yes')
                .accessibilityCustomActions(null)
            }
            .width('90%')
            .padding('8vp')
            .margin({ top: '4vp', bottom: '4vp' })
            .borderRadius(8)
            .backgroundColor(0xF1F3F5)

            Row() {
              Text('undefined入参测试')
                .fontSize('14fp')
                .accessibilityLevel('yes')
                .accessibilityCustomActions(undefined)
            }
            .width('90%')
            .padding('8vp')
            .margin({ top: '4vp', bottom: '4vp' })
            .borderRadius(8)
            .backgroundColor(0xF1F3F5)

            Row() {
              Text('空数组入参测试')
                .fontSize('14fp')
                .accessibilityLevel('yes')
                .accessibilityCustomActions([])
            }
            .width('90%')
            .padding('8vp')
            .margin({ top: '4vp', bottom: '4vp' })
            .borderRadius(8)
            .backgroundColor(0xF1F3F5)
          }
          .width('100%')
        }
        .width('100%')
        .padding({ left: '8vp', right: '8vp' })
      }
      .scrollBar(BarState.Auto)
      .height('60%')
      .width('100%')

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
    .backgroundColor('#F7F9FC')
  }
}