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

const TAG = '[AccessibilityOptionsObjectDescription]';

let uiContent: UIContext | undefined = undefined;

@Entry
@Component
struct AccessibilityOptionsObjectDescription {
  @State name: string = 'AccessibilityOptionsObjectDescription';
  @State StepTips: string = '测试目的：验证无障碍接口AccessibilityOptions对象:stateControllerRoleType,stateControllerId,actionControllerRoleType,actionControllerId。\n' +
    '\n' +
    '设备支持屏幕朗读时\n' + '操作步骤:\n' + '1、开启屏幕朗读，从上到下依次滑动并按照语音提示操作观察屏幕朗读情况\n' + '\n' +
    '预期结果：1、绿框绘制聚焦在第一个优先级组件上，屏幕朗读播报“已选中，匹配Id一致的，复选框，单指双击即可取消选中”，双击绿框，播报“未选中”，复选框取消选中\n' +
    '2、绿框绘制聚焦在第二个优先级组件上，屏幕朗读播报“开启，匹配类型一致的，checkbox3，开关，单指双击即可关闭”，双击绿框，播报“关闭”，开关关闭;\n' +
    '若不支持屏幕朗读，直接按照失败处理走豁免。';
  @State checkbox1Flag: boolean = true;
  @State checkbox2Flag: boolean = true;
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
          Column() {
            Text("优先级 优先匹配ID一致的")
            Column() {
              Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
                Text("匹配Id一致的")
                Toggle({ type: ToggleType.Switch, isOn: true })
                  .selectedColor('#007DFF')
                  .switchPointColor('#FFFFFF')
                  .onChange((isOn: boolean) => {
                    console.info('Component status:' + isOn);
                  })
                  .id("toggleTest1")
                Checkbox({ name: 'checkbox3', group: 'checkboxGroup3' })
                  .select(true)
                  .selectedColor(0xed6f21)
                  .shape(CheckBoxShape.CIRCLE)
                  .onChange((value: boolean) => {
                    console.info('Checkbox3 change is' + value);
                    this.vueStatus=true
                  })
                  .id("checkBoxTest1")
              }
            }.width('70%')
            .accessibilityGroup(true, {
              stateControllerRoleType: AccessibilityRoleType.TOGGLER,
              actionControllerRoleType: AccessibilityRoleType.TOGGLER,
              stateControllerId: "checkBoxTest1",
              actionControllerId: "checkBoxTest1"
            })
            .border({ color: Color.Black, width: 2 }).padding(10)
          }

          Column() {
            Text("优先级 优先匹配ID一致的， ID 不存在时，按类型匹配")
            Column() {
              Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
                Text("匹配类型一致的")
                Checkbox({ name: 'checkbox3', group: 'checkboxGroup3' })
                  .select(true)
                  .selectedColor(0xed6f21)
                  .shape(CheckBoxShape.CIRCLE)
                  .onChange((value: boolean) => {
                    console.info('Checkbox3 change is' + value);
                    this.vueStatus=true
                  })
                Toggle({ type: ToggleType.Switch, isOn: true })
                  .selectedColor('#007DFF')
                  .switchPointColor('#FFFFFF')
                  .onChange((isOn: boolean) => {
                    console.info('Component status:' + isOn);
                    this.vueStatus=true
                  })
                  .id("toggleTest1")

              }
            }.width('80%')
            .accessibilityGroup(true, {
              stateControllerRoleType: AccessibilityRoleType.TOGGLER,
              actionControllerRoleType: AccessibilityRoleType.TOGGLER,
              stateControllerId: "checkBoxTest1",
              actionControllerId: "checkBoxTest1"
            })
            .border({ color: Color.Black, width: 2 }).padding(10)
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