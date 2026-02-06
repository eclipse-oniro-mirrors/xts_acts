/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import Logger from '../model/Logger'
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';
import sensor from '@ohos.sensor';
import BusinessError from "@ohos.base";
import fs from '@ohos.file.fs';
import promptAction from '@ohos.promptAction';

const TAG = '[HeartRate]';

@Entry
@Component
struct HeartRate {
  @State FillColor: string = '#FF000000';
  @State name: string = 'HeartRate';
  @State StepTips: string = '测试目的：用于测试本机传感器,确定是否有心率传感器' + '\n操作步骤：\n1.确定设备是否有心率传感器\n2.如果有该传感器，点击开启并佩戴设备，观察心率值或触发次数是否发生变化\n(若点击开启直接返回上一级，则表示设备无该传感器)\n'
    + '\n预期结果：数值或触发次数发生变化';
  @State Vue: boolean = false;
  @State isHave: boolean = true;
  @State sensorChange: boolean = false;
  @State dataHeartRate: string = '';
  @State nextHeartRate: string = '';
  @State intervalNum: number = 0;
  @State backCount: number = 0;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name)
  }

  openAccelerometer() {
    this.sensorChange = !this.sensorChange
    if (this.sensorChange) {
      // 打开心率传感器
      Logger.info(TAG, 'enter')
      try {
        sensor.on(sensor.SensorId.HEART_RATE, (data: sensor.HeartRateResponse) => {
          this.backCount += 1;
          console.info('Succeeded in invoking on. HeartRate: ' + data.heartRate);
          this.dataHeartRate = data.heartRate.toFixed(2);
          this.intervalNum = setInterval(() => {
            this.nextHeartRate = data.heartRate.toFixed(2);
            if (this.nextHeartRate !== this.dataHeartRate || this.backCount > 0) {
              this.Vue = true;
            }
          }, 100)
        }, { interval: 100000000 });
        setTimeout(() => {
          sensor.off(sensor.SensorId.HEART_RATE);
        }, 5000);
      } catch (error) {
        let e: BusinessError.BusinessError = error as BusinessError.BusinessError;
        if (e) {
          this.isHave = false;
          this.Vue = false;
          promptAction.showToast({
            message: '当前设备暂无心率传感器'
          })
          router.back({
            url: 'pages/Sensor/Sensor_index',
            params: { result: 'true ', title: this.name }
          })
        }
        console.error(TAG, `Failed to invoke on. Code: ${e.code}, message: ${e.message}`);
      }
    } else {
      try {
        // 关闭传感器
        setTimeout(() => {
          sensor.off(sensor.SensorId.HEART_RATE);
        }, 100);
      } catch (error) {
        let e: BusinessError.BusinessError = error as BusinessError.BusinessError;
        Logger.error(TAG, `sensor off Failed to invoke on. Code: ${e.code}, message: ${e.message}`);
      }
    }
  }

  async onPageHide() {
    if (!this.isHave) {
      Logger.info(TAG, 'onPageHide this.isHave' + this.isHave);
    } else {
      try {
        // 关闭传感器
        sensor.off(sensor.SensorId.HEART_RATE);
        Logger.info(TAG, 'onPageHide releaseSensor end');
        clearInterval(this.intervalNum)
      } catch (err) {
        Logger.info(TAG + 'catch error 关闭传感器:' + err.message)
      }
    }
  }

  async aboutToDisappear() {
    clearInterval(this.intervalNum)
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
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
    else {
      Button({ stateEffect: this.Vue }) {
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
          url: 'pages/Sensor/Sensor_index',
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
        url: 'pages/Sensor/Sensor_index',
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
            url: 'pages/Sensor/Sensor_index',
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
        Text('心率值: ' + this.dataHeartRate)
          .fontColor(Color.White)
          .fontSize('18fp')
          .textAlign(TextAlign.Start)
          .width('100%')
          .margin({ bottom: 24 })
        Text('触发订阅的次数: ' + this.backCount)
          .fontColor(Color.White)
          .fontSize('18fp')
          .textAlign(TextAlign.Start)
          .width('100%')
          .margin({ bottom: 24 })
      }
      .width('80%')
      .height('30%')

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start, direction: FlexDirection.Column }) {
        Scroll() {
          Column() {
            Text('提示：点击开启按钮，若无该传感器，则自动返回上一级')
              .fontSize('16fp')
              .fontColor(Color.White)
              .margin('20fp')
            Row() {
              Button(this.sensorChange ? '关闭' : '开启')
                .onClick(() => {
                  this.openAccelerometer();
                })
            }
            .justifyContent(FlexAlign.SpaceEvenly)
            .width('100%')
            .margin('20fp')
          }
        }
        .scrollBarColor(Color.White) // 滚动条颜色
        .scrollBarWidth(10)
      }
      .width('80%')
      .height('50%')

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
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Sensor/Sensor_index'
    })
  }
}