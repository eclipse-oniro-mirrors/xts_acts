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
import { CustomContainer } from '../common/CameraFlashContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';
import sensor from '@ohos.sensor';
import BusinessError from "@ohos.base";
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct SensorAccelerometer {
  @State FillColor: string = '#FF000000';
  @State name: string = 'SensorAccelerometer';
  @State StepTips: string = '测试目的：用于测试本机传感器,确定是否有加速度传感器' + '\n操作步骤：\n1.确定设备是否有加速度传感器\n2.如果有该传感器，点击开启并各方向移动设备，观察数值或触发次数是否发生变化\n(若点击开启直接返回上一级，则表示设备无该传感器)'
    + '\n预期结果：观察显示数值或触发次数,跟随移动变化';
  private tag: string = 'Sensor Accelerometer';
  @State Vue: boolean = false;
  @State isSensor: boolean = true;
  @State isHave: boolean = true;
  @State sensorChange: boolean = false;
  @State dataX: string = '';
  @State dataY: string = '';
  @State dataZ: string = '';
  @State nextX: string = '';
  @State nextY: string = '';
  @State nextZ: string = '';
  @State intervalNum: number = 0;
  @State backCount: number = 0;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name)
  }

  openAccelerometer() {
    this.sensorChange = !this.sensorChange
    if (this.sensorChange) {
      // 打开加速度传感器
      Logger.info(this.tag, 'enter')
      try {
        sensor.on(1, (data: sensor.AccelerometerResponse) => {
          this.backCount += 1;
          Logger.info(this.tag, 'Succeeded in invoking on. X-coordinate component: ' + data.x);
          this.dataX = data.x.toFixed(2);
          Logger.info(this.tag, 'Succeeded in invoking on. Y-coordinate component: ' + data.y);
          this.dataY = data.y.toFixed(2);
          Logger.info(this.tag, 'Succeeded in invoking on. Z-coordinate component: ' + data.z);
          this.dataZ = data.z.toFixed(2);
          this.intervalNum = setInterval(() => {
            this.nextX = data.x.toFixed(2);
            this.nextY = data.y.toFixed(2);
            this.nextZ = data.z.toFixed(2);
            if ((this.nextX !== this.dataX || this.nextY !== this.dataY || this.nextY !== this.dataY) ||
             this.backCount > 0) {
              this.Vue = true;
            }
          }, 5000)
        }, { interval: 100000000 });
        setTimeout(() => {
          sensor.off(sensor.SensorId.ACCELEROMETER);
        }, 5000);
      } catch (error) {
        let e: BusinessError.BusinessError = error as BusinessError.BusinessError;
        Logger.error(this.tag, `Failed to invoke on. Code: ${e.code}, message: ${e.message}`);
        if (e) {
          this.isHave = false;
          this.Vue = true;
          promptAction.showToast({
            message: '当前设备暂无加速度传感器'
          })
          router.back({
            url: 'pages/Sensor/Sensor_index',
            params: { result: 'true ', title: this.name }
          })
        }
      }
    } else {
      try {
        // 关闭传感器
        setTimeout(() => {
          sensor.off(sensor.SensorId.ACCELEROMETER);
        }, 100);
      } catch (error) {
        let e: BusinessError.BusinessError = error as BusinessError.BusinessError;
        Logger.error(this.tag, `Failed to invoke on. Code: ${e.code}, message: ${e.message}`);
      }
    }
  }

  onPageHide() {
    // 关闭传感器
    setTimeout(() => {
      sensor.off(sensor.SensorId.ACCELEROMETER);
    }, 100);
    Logger.info(this.tag, 'onPageHide releaseSensor end');
    clearInterval(this.intervalNum)
  }

  build() {
    Column() {
      Scroll(){
        Row({space:20}) {
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
        .height('20%')
        .width('130%')
        .justifyContent(FlexAlign.Center)
      }.scrollable(ScrollDirection.Horizontal).scrollBarColor(Color.Orange)


      Column() {
        Text('X坐标分量: ' + this.dataX)
          .fontColor(Color.White)
          .fontSize('18fp')
          .textAlign(TextAlign.Start)
          .width('100%')

        Text('Y坐标分量: ' + this.dataY)
          .fontColor(Color.White)
          .fontSize('18fp')
          .textAlign(TextAlign.Start)
          .width('100%')

        Text('Z坐标分量: ' + this.dataZ)
          .fontColor(Color.White)
          .fontSize('18fp')
          .textAlign(TextAlign.Start)
          .width('100%')

        Text('触发订阅的次数: ' + this.backCount)
          .fontColor(Color.White)
          .fontSize('18fp')
          .textAlign(TextAlign.Start)
          .width('100%')

      }
      .width('80%')
      .height('15%')

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start, direction: FlexDirection.Column }) {
        Scroll() {
          Column() {
            Text('提示：点击开启按钮，若无该传感器，则自动返回上一级')
              .fontSize('16fp').fontColor(Color.White).margin('20fp')
            Row() {
              Button(this.sensorChange ? '关闭' : '开启').onClick(() => {
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
      .height('30%')
      .margin({ top: '30vp' })

      CustomContainer({
        title: this.name,
        Url: 'pages/Sensor/Sensor_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue,
        isFlash: $isSensor
      })
        
        .width('100%')
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