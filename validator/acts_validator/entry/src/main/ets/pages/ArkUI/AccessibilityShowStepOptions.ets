/*
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
import FirstDialog from '../model/FirstDialog';
const TAG = '[AccessibilityShowStepOptions]';
class SliderBlockBorderColorModifier1 implements AttributeModifier<SliderAttribute> {
  private optionMap11s: Map<number, SliderStepItemAccessibility> = new Map()
    .set(1, { text: '' })
    .set(2, { text: '自定义内容1' })
    .set(3, { text: $r('app.string.app_name') })
    .set(4, { text: 'moeeeeee' })
    .set(5, { text: 'mo%￥' })
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.showSteps(true, { stepsAccessibility: this.optionMap11s })
  }
}

@Entry
@Component
struct AccessibilityShowStepOptionsExample {
  @State text: string = '';
  @State axisValue: string = '';
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false;
  @State outSetValueOne: number = 5;
  @State outSetValueTwo: number = 5;
  @State show: boolean = true;
  @State optionMaps: Map<number, SliderStepItemAccessibility> = new Map();
  @State checkList: number[] = [0, 1, 2, 3, 4, 5];
  @State isCheck1: boolean = false;
  @State isCheck2: boolean = false;
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State name: string = 'AccessibilityShowStepOptions';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n' + '设备支持屏幕朗读时\n' +
    '测试内容:SliderShowStepOptions接口支持开发者自定义实现Slider刻度点的无障碍信息\n' +
    '操作步骤: 开启屏幕朗读\n' +
    '1、点击slider 设置刻度点播报文字内容下的Slider组件,听播报内容\n' +
    '2、单指向下轻扫,使Slider组件刻度滑到刻度4,听播报内容\n' +
    '3、单指向下轻扫,使Slider组件刻度滑到刻度3,听播报内容\n' +
    '4、单指向下轻扫,使Slider组件刻度滑到刻度2,听播报内容\n' +
    '5、单指向下轻扫,使Slider组件刻度滑到刻度1,听播报内容\n' +
    '6、单指向下轻扫,使Slider组件刻度滑到刻度0,听播报内容\n' +
    '7、单击检查所有点是否都点过按钮,单指双击按钮\n' +
    '8、单指双击按钮重新校验\n' +
    '9、点击modifier-slider 设置刻度点播报内容文字内容下的Slider组件,听播报内容\n' +
    '10、单指向下轻扫,使Slider组件刻度滑到刻度4,听播报内容\n' +
    '11、单指向下轻扫,使Slider组件刻度滑到刻度3,听播报内容\n' +
    '12、单指向下轻扫,使Slider组件刻度滑到刻度2,听播报内容\n' +
    '13、单指向下轻扫,使Slider组件刻度滑到刻度1,听播报内容\n' +
    '14、单指向下轻扫,使Slider组件刻度滑到刻度0,听播报内容\n' +
    '15、单击按钮检查所有点是否都点过,双击按钮\n' +
    '预期结果：\n' +
    '1、播报:百分号人民币,进度条,可调,单指上下轻扫调整值\n' +
    '2、播报:4\n' +
    '3、播报:ActsValidator\n' +
    '4、播报:十十\n' +
    '5、播报:1\n' +
    '6、播报:000\n'+
    '7、按钮聚焦,双击后按钮中false变为true\n'+
    '8、Slider组件上方显示数组变为[0,1,2,3,4,5]\n'+
    '9、播报:mo%￥,进度条,可调,单指上下轻扫调整值\n'+
    '10、播报:moeeeeee\n'+
    '11、播报:ActsValidator\n'+
    '12、播报:自定义内容1\n'+
    '13、播报:1\n'+
    '14、播报:0\n'+
    '15、按钮聚焦,双击后按钮中false变为true\n';

  private slider: SliderBlockBorderColorModifier1 = new SliderBlockBorderColorModifier1();
  aboutToAppear(): void {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
    this.optionMaps.set(0, { text: '000' });
    this.optionMaps.set(1, { text: '' });
    this.optionMaps.set(2, { text: '十十' });
    this.optionMaps.set(3, { text: $r('app.string.app_name') });
    this.optionMaps.set(5, { text: '%￥' });
  }
  @State currentOptionMap: Map<number, SliderStepItemAccessibility> = this.optionMaps;
  changeOptionMap(index: number) {
    switch (index) {
      case 1:
        this.currentOptionMap = this.optionMaps;
        break;
    }
  }
  aboutToDisappear(): void {
    clearInterval(this.intervalNum)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.isCheck1 === true &&
        this.isCheck2 === true) {
        this.isOk = true;
      }
    }, 500)
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.isOk === false) {
      Button({ stateEffect: this.isOk }) {
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

  build() {
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
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column({ space: 12 }) {
        Row({ space: 10 }) {
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp')
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
                this.yesEnable = true;
                this.onAccessibilityHoverEnable = true;
              })
          }
        }.height('10%')

        Column({ space: 2 }) {
          Text('slider 设置刻度点播报内容').fontSize(15).fontColor(0xCCCCCC).width('90%').margin(15)
          Text(JSON.stringify(this.checkList))
          Row(){
            Slider({
              value: this.outSetValueOne,
              min: 0,
              max: 5,
              style: SliderStyle.InSet
            })
              .showSteps(true, { stepsAccessibility: this.currentOptionMap })
              .width('85%')
              .onChange((value: number) => {
                this.checkList = this.checkList.filter(item => item !== value);
                this.outSetValueOne = value;
              })
          }
          Button('检查所有点是否都点过:' + this.isCheck1)
            .onClick(() => {
              if (this.checkList.length === 0) {
                this.isCheck1 = true;
              }
            })
          Button('重新校验')
            .onClick(() => {
              this.checkList = [0, 1, 2, 3, 4, 5];
            })
          Text('modifier-slider 设置刻度点播报内容')
            .fontSize(15).fontColor(0xCCCCCC).width('90%').margin(15);
          Row() {
            Slider({
              value: this.outSetValueTwo,
              min: 0,
              max: 5,
              style: SliderStyle.InSet,
            })
              .attributeModifier(this.slider)
              .width('85%')
              .onChange((value: number) => {
                this.checkList = this.checkList.filter(item => item !== value);
                this.outSetValueTwo = value;
              })
          }
          Button('检查所有点是否都点过:' + this.isCheck2)
            .onClick(() => {
              if (this.checkList.length === 0) {
                this.isCheck2 = true;
              }
            })
        }
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
      .margin({ bottom: '20vp' })

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}