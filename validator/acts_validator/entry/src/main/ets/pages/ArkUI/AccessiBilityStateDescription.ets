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

const TAG = '[AccessibilityStateDescription]';

class Checkbox1Modifier implements AttributeModifier<CheckboxAttribute> {
  public flag: boolean = true;

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.accessibilityStateDescription(this.flag ? 'modifier text1' : 'modifier text2')
  }
}

let uiContent: UIContext | undefined = undefined;

@Entry
@Component
struct OnAccessibilityActionIntercept {
  @State name: string = 'OnAccessibilityStateDescription';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n' + '设备支持屏幕朗读时\n' +
    '测试内容:支持配置无障碍自定义状态播报文本\n' +
    '操作步骤: 开启屏幕朗读\n' +
    '1、点击checkbox-普通英文组件，双击切换状态2次，再次单击checkbox组件，听播报内容\n' +
    '2、点击checkbox-Resource组件，双击切换状态2次，再次单击checkbox组件，听播报内容\n' +
    '3、点击checkbox-undefined组件，双击切换状态2次，再次单击checkbox组件，听播报内容\n' +
    '4、点击checkbox-Modifier组件，双击切换状态2次，再次单击checkbox组件，听播报内容\n' +
    '5、测试完成，单击选中绿色对号按钮后双击，结束测试\n' +
    '预期结果：\n' +
    '1、播报:$%welcome checkbox point +......\n' +
    '2、播报:resource自定义文本 +......\n' +
    '3、播报内容中无自定义文本\n' +
    '4、播报:modifier text2 +......\n' +
    '5、返回菜单，测试结束\n';
  @State checkbox1Modifier: Checkbox1Modifier = new Checkbox1Modifier()
  @State checkbox1Flag: boolean = true;
  @State checkbox2Flag: boolean = true;
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
  @State color: Color = Color.Blue;
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
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


        Column() {
          Row() {
            Text('Checkbox普通英文')
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
              .selectedColor('#007DFF')
              .accessibilityStateDescription(this.checkbox1Flag ? 'hello checkbox point' : '$%welcome checkbox point')
              .onChange((isOn: boolean) => {
                this.checkbox1Flag = isOn;
                this.status2 = true;
                if (this.status1 && this.status2 && this.status3 && this.status4) {
                  this.vueStatus = true;
                } else {
                  this.vueStatus = false;
                }
                this.text1 = '$%welcome checkbox point';
              })
          }
          .width('80%')
        }

        Column() {

          Row() {
            Text('Checkbox-Resource')
            Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
              .accessibilityStateDescription(this.checkbox2Flag ? 'hello checkbox point' : $r('app.string.ziyuan'))
              .onChange((isOn: boolean) => {
                this.checkbox2Flag = isOn;
                this.text1 = '$r(\'app.string.ziyuan)';
                this.status3 = true;
                if (this.status1 && this.status2 && this.status3 && this.status4) {
                  this.vueStatus = true;
                } else {
                  this.vueStatus = false;
                }
              })
          }
          .width('80%')
        }

        Column() {
          Row() {
            Text('Checkbox-undefined')
            Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
              .accessibilityStateDescription(this.checkbox2Flag ? 'hello checkbox point' : undefined)
              .onChange((isOn: boolean) => {
                this.checkbox2Flag = isOn;
                this.text1 = 'undefined';
                this.status1 = true;
                if (this.status1 && this.status2 && this.status3 && this.status4) {
                  this.vueStatus = true;
                } else {
                  this.vueStatus = false;
                }
              })
          }
          .width('80%')
        }


        Column() {
          Row() {
            Text('Checkbox modifier')
            Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
              .attributeModifier(this.checkbox1Modifier)
              .onChange((isOn: boolean) => {
                this.checkbox1Modifier.flag = isOn;
                this.text1 = 'modifier text2';
                this.status4 = true;
                if (this.status1 && this.status2 && this.status3 && this.status4) {
                  this.vueStatus = true;
                } else {
                  this.vueStatus = false;
                }
              })
          }
          .width('80%')
        }
      }
      .height('90%')


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
      // .padding(20)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }.width('100%')
  }
}