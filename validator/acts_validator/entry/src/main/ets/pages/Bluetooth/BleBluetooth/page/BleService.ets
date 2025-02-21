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
import fs from '@ohos.file.fs';

import Log from '../../../model/Logger';
import advertiserBluetoothViewModel from '../model/AdvertiserBluetoothViewModel';
import MathUtils from '../util/MathUtils';
import Logger from '../../../model/Logger';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import FirstDialog from '../../../model/FirstDialog';
import { BusinessError } from '@ohos.base';

const TAG = '[Sample_Main]';

@Entry
@Component
struct Main {
  @StorageLink('deviceId') @Watch('onDeviceIdChange') deviceId: string = '';
  @StorageLink('bluetoothEnable') @Watch('onBluetoothEnableChange') bluetoothEnable: boolean = false;
  @State localName: string = '';
  @State heartRate: number = -1;
  @State name: string = 'BleService';
  @State intervalNum: number = 0;
  @State StepTips: string = '操作步骤：\n1、点击按钮开启广播' + '\n预期结果：能够发送数据则通过';
  @State Vue: boolean = false;
  @State startAdvertiserState: boolean = false;
  private mIntervalId: number;

  onDeviceIdChange() {
    Log.info(TAG, `onDeviceIdChange: deviceId = ${this.deviceId}`);
  }

  onBluetoothEnableChange() {
    Log.info(TAG, `onBluetoothEnableChange: bluetoothEnable = ${this.bluetoothEnable}`);
    if (this.bluetoothEnable) {
      this.toggleAdvertiser();
    }
  }

  toggleAdvertiser() {
    Log.info(TAG, `toggleAdvertiser: startAdvertiserState = ${this.startAdvertiserState}`)
    if (this.startAdvertiserState) {
      advertiserBluetoothViewModel.stopAdvertiser();
      this.toggleHeartRate(false);
      this.startAdvertiserState = false;
    } else {
      let ret = advertiserBluetoothViewModel.startAdvertiser()
      if (ret) {
        this.localName = advertiserBluetoothViewModel.getLocalName();
        this.toggleHeartRate(true);
        this.startAdvertiserState = true;
      } else {
        Log.error(TAG, `toggleAdvertiser: ret = ${ret}`);
      }
    }
  }

  toggleHeartRate(open: boolean) {
    Log.info(TAG, `toggleHeartRate: open = ${open}, deviceId = ${this.deviceId}`);

    clearInterval(this.mIntervalId)

    if (open) {
      this.mIntervalId = setInterval(() => {
        this.heartRate = MathUtils.getRandomInt(40, 200)
        if (this.deviceId) {
          advertiserBluetoothViewModel.notifyCharacteristicChanged(this.deviceId, this.heartRate)
        } else {
          Log.warn(TAG, `toggleHeartRate: deviceId is null`)
        }
      }, 1000)
    }
  }

  aboutToDisappear() {
    Log.info(TAG, `aboutToDisappear`)
    advertiserBluetoothViewModel.stopAdvertiser()
    clearInterval(this.intervalNum)
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.heartRate > 1) {
        this.Vue = true
      }
    }, 1000)
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
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
    else {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/Bluetooth/BlueTooth_index',
          params: { result: 'true ', title: this.name, }
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
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/Bluetooth/BlueTooth_index',
        params: { result: 'false', title: this.name, }
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
            url: 'pages/Bluetooth/BlueTooth_index',
            params: { result: 'None', }
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
          Button(this.startAdvertiserState ? '关闭BLE广播' : '开启BLE广播')
            .onClick(() => {
              this.toggleAdvertiser()
            })
        }
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: 24 })

        Row() {
          Text('蓝牙名称: ')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)

          Text(this.localName === '' ? '-' : this.localName)
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .margin({ top: 48 })

        Row() {
          Text('发送数据: ')
            .fontSize(28)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)

          Text(this.heartRate.toString() === '-1' ? '-' : this.heartRate.toString())
            .fontSize(28)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
        .margin({ top: 24 })
      }
      .width('100%')
      .height('80%')

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
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
      .align(Alignment.Bottom)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceAround)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Bluetooth/BlueTooth_index',
      params: {
        'Vue': this.Vue
      }
    })
  }
}