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
const TAG = '[FocusAxisEvent]';

@Entry
@Component
struct FocusAxisEventAddExample {
  @State name: string = 'GameAddTest';
  @State absVue: boolean = false;
  @State intervalNum: number = 0;
  @State axisValue: string = '轴事件待触发...';
  @State axisEventJson: string = '完整事件信息待触发...';

  @State stepTips: string = '设备使用游戏手柄操作时\n' +
    '操作步骤:\n' + '1、使用游戏手柄获焦在按钮FocusAxisEvent上,查看返回的数据\n' +
    '预期结果：\n' + 
    '1.操作左摇杆时, 左操作的absX的值范围在[-1,0], 右操作的absX的值范围在[0,1], 上操作的absY的值范围在[-1,0], 下操作的absY的值范围在[0,1]\n';
  aboutToAppear(): void {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  aboutToDisappear(): void {
    this.getUIContext()
    .getFocusController()
    .activate(false)
    clearInterval(this.intervalNum)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  onPageShow() {
    this.getUIContext()
    .getFocusController()
    .requestFocus('focesss')
    this.intervalNum = setInterval(() => {

      if (this.axisValue.length > 0) {
        this.absVue = true;
      }

    }, 500)
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.absVue == false) {
      Button({ stateEffect: this.absVue }) {
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
      Button({ stateEffect: this.absVue }) {
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

      Column() {
        Row() {
          Text('当前只支持游戏手柄测试')
          .fontColor(Color.Green)
          .fontSize('18fp')
          .margin({top:15})
        }
        Button('FocusAxisEvent')
          .defaultFocus(true)
          .onFocusAxisEvent((event: FocusAxisEvent) => {
            let absX = event.axisMap.get(AxisModel.ABS_X);
            let absY = event.axisMap.get(AxisModel.ABS_Y);
            let absRx = event.axisMap.get(AxisModel.ABS_RX);
            let absRy = event.axisMap.get(AxisModel.ABS_RY);
            let absThrottle = event.axisMap.get(AxisModel.ABS_THROTTLE);
            let absRudder = event.axisMap.get(AxisModel.ABS_RUDDER);
            let absWheel = event.axisMap.get(AxisModel.ABS_WHEEL);
            let absHat1X = event.axisMap.get(AxisModel.ABS_HAT1X);
            let absHat1Y = event.axisMap.get(AxisModel.ABS_HAT1Y);
            let absHat2X = event.axisMap.get(AxisModel.ABS_HAT2X);
            let absHat2Y = event.axisMap.get(AxisModel.ABS_HAT2Y);
            let absHat3X = event.axisMap.get(AxisModel.ABS_HAT3X);
            let absHat3Y = event.axisMap.get(AxisModel.ABS_HAT3Y);
            this.axisValue = `
            ABS_X = ${absX} | ABS_Y = ${absY}
            ABS_RX = ${absRx} | ABS_RY = ${absRy}
            ABS_HAT1X = ${absHat1X} | ABS_HAT1Y = ${absHat1Y}
            ABS_HAT2X = ${absHat2X} | ABS_HAT2Y = ${absHat2Y}
            ABS_HAT3X = ${absHat3X} | ABS_HAT3Y = ${absHat3Y}
            ABS_RUDDER = ${absRudder} | ABS_THROTTLE = ${absThrottle} | ABS_WHEEL = ${absWheel}
            `;
            this.axisEventJson = `轴事件信息：\n${JSON.stringify(event, null, 2)}`;

          })
          .margin(10)
          .key('focesss')

        Text('轴事件信息')
        .fontSize(18)
        .fontWeight(500)
        Text(this.axisValue)
        .fontSize(14)
        .width('90%')
        .backgroundColor('#f5f5f5')
        .padding(10)
        .borderRadius(5)

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
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}