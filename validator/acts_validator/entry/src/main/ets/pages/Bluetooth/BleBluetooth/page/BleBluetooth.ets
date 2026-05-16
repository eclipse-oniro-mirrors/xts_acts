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

import router from '@ohos.router';
import fs from '@ohos.file.fs';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../../../model/FirstDialog';
import Logger from '../../../model/Logger';
import ble from '@ohos.bluetooth.ble';
import bluetoothViewModel, { ConnectionState } from '../model/BluetoothViewModel';
import BluetoothDevice from '../model/BluetoothDevice';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';

const TAG = '[Screenshot]';
const isCore = canIUse('SystemCapability.Communication.Bluetooth.Core');

@Entry
@Component
struct Ble {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'BleBluetooth';
  @State StepTips: string = '操作步骤：\n1、点击右侧的按钮，开启ble蓝牙扫描' + '\n预期结果：能够搜索到周边的ble设备';
  @State Vue: boolean = false;
  @State btnState: boolean = false;
  @State isOn: boolean = false
  @State isConnect: boolean = false;
  @State data: string = ''
  @State intervalNum: number = 0;
  @State deviceList: Array<string> = []
  @State discoveryList: Array<string> = []
  @StorageLink('availableDevices') @Watch('onAvailableDevicesChange') availableDevices: Array<BluetoothDevice> = []
  @StorageLink('connectBluetoothDevice') @Watch('onConnectBluetoothDeviceChange') connectBluetoothDevice: BluetoothDevice = {
  }
  @State connectBluetoothDevice1: BluetoothDevice = {}

  onAvailableDevicesChange() {
    Logger.info(TAG, `onAvailableDevicesChange: availableDevices = ${JSON.stringify(this.availableDevices)}`)
  }

  onConnectBluetoothDeviceChange() {
    Logger.info(TAG, `onConnectBluetoothDeviceChange: connectBluetoothDevice = ${JSON.stringify(this.connectBluetoothDevice)}`)
    this.connectBluetoothDevice1 = this.connectBluetoothDevice
  }

  handlerClickButton = () => {
    let context : ESObject = getContext(this) as ESObject
    context.terminateSelf()
  }
  scroller: Scroller = new Scroller();

  async aboutToAppear() {
    if (isCore) {
      await FirstDialog.ChooseDialog(this.StepTips, this.name);
    } else {
      setTimeout(() => {
        promptAction.showToast({
          message: '该设备没有蓝牙相关模块',
          duration: 2000
        })
        router.back({
          url: 'pages/Bluetooth/BlueTooth_index',
          params: { result: 'true ', title: this.name, }
        })
      }, 2000)
    }
  }

  async onPageHide() {
    Logger.info("enter onPageHide");
    clearInterval(this.intervalNum)
  }

  async aboutToDisappear() {
    clearInterval(this.intervalNum)
    bluetoothViewModel.close()
  }

  async onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.availableDevices.length > 0) {
        this.Vue = true
      }
    }, 500)

    let innerEvent: emitter.InnerEvent = {
      eventId: 12
    };

    emitter.on(innerEvent, (res) => {
      if (res.data !== undefined) {
        this.data = res.data.content
        console.info('emitter.on =11= ' + this.data);
        if (this.data.toString() === 'undefined') {
          console.log('onPageShow =this.data.toString()==> ' + this.data.toString())
        } else {
          this.Vue = true
          promptAction.showToast({
            message: '收到数据为：' + this.data,
            duration: 1000
          })
        }
      }
    });
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
      .width('20%')
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
      .width('20%')
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
    .margin({ bottom: '20vp' })
    .width('20%')
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
          .height('20%')
          .width('130%')
          .justifyContent(FlexAlign.Center)
        }.scrollable(ScrollDirection.Horizontal).scrollBarColor(Color.Orange)


        Row() {
          Column() {
            Text('BLE蓝牙')
              .fontColor(Color.White)
              .fontSize(24)
              .margin({ top: 20 })
              .alignSelf(ItemAlign.Start)
            if (true === this.isOn) {
              Text('当前可被附近的设备发现')
                .fontSize(20)
                .fontColor(Color.White)
                .alignSelf(ItemAlign.Start)
            }
          }

          Blank()

          Column() {
            Toggle({ type: ToggleType.Switch, isOn: this.isOn })
              .selectedColor('#ff2982ea')
              .switchPointColor('#FFFFFF')
              .size({ width: 40, height: 25 })
              .onChange((isOn: boolean) => {
                if (isOn) {
                  Logger.info(TAG, 'enter onChange isOn true')
                  this.isOn = true
                  try {
                    let ret = bluetoothViewModel.startBLEScan()
                  } catch (err) {
                    Logger.info(TAG, 'onChange  =' + JSON.stringify(err.message))
                  }
                } else {
                  Logger.info(TAG, 'enter onChange isOn false')
                  this.isOn = false
                  this.deviceList = []
                  this.discoveryList = []
                }
              })
              .borderWidth(1)
              .borderColor(Color.White)
              .borderRadius(12)
          }
          .id('toggleBtn')
        }
        .height('15%')
        .width('90%')

        if (this.availableDevices && this.availableDevices.length > 0 && this.isOn) {
          Scroll() {
            List({ space: 20, initialIndex: 0 }) {
              ForEach(this.availableDevices, (item: BluetoothDevice, index: number) => {
                ListItem() {
                  if (item.deviceId === this.connectBluetoothDevice1.deviceId) {
                    Item({
                      bluetoothDevice: this.connectBluetoothDevice1,
                      index: index,
                      isConnect: $isConnect
                    })
                  } else {
                    Item({
                      bluetoothDevice: item,
                      index: index,
                      isConnect: $isConnect
                    })
                  }
                }
                .width('100%')
                .height(76)
                .borderRadius(16)
                .backgroundColor(Color.White)
              })
            }
            .padding({ left: 16, top: 16, right: 16, bottom: 0 })
            .width('100%')
            .height('58%')
          }
          .scrollBarWidth(10)
          .scrollBarColor(Color.White)
          .scrollBar(BarState.Auto)
        } else {
          Row()
            .layoutWeight(1)
        }

        Scroll(){
          Row({space:12}) {
            this.PassBtn($r('app.string.btn_fullscreen'), true);
            Button() {
              Image($r('app.media.ic_public_help'))
                .width('20vp')
                .height('20vp')
            }
            .margin({ bottom: '20vp' })
            .width('20%')
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
          .height('22%')
          .width('130%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor(Color.Black)
          .align(Alignment.Bottom)
        }.scrollable(ScrollDirection.Horizontal).scrollBarColor(Color.Orange)

      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
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

@Component
struct Item {
  @ObjectLink bluetoothDevice: BluetoothDevice
  @Link  isConnect: boolean;
  private index: number = 0

  async aboutToAppear() {
    Logger.info(TAG, `aboutToAppear: bluetoothDevice = ${JSON.stringify(this.bluetoothDevice)}`)
    await globalThis.setOrientation(window.Orientation.AUTO_ROTATION_LANDSCAPE)
  }

  build() {
    Row() {
      Column() {
        Text(this.bluetoothDevice.deviceName)
          .fontSize(18)
          .fontColor(Color.Black)
        Text(this.bluetoothDevice.deviceId)
          .fontSize(14)
          .fontColor(Color.Black)
          .margin({ top: 8 })
      }
      .margin({ left: 16 })
      .alignItems(HorizontalAlign.Start)

      Blank()

      if(this.bluetoothDevice.rssi !== undefined) {
        Text(this.bluetoothDevice.rssi.toString() + ' dbm')
          .fontSize(14)
          .margin({ right: 10 })
      }

    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, top: 4, right: 12, bottom: 4 })
    .justifyContent(FlexAlign.SpaceBetween)
    .onClick(async () => {
      if (this.bluetoothDevice.connectionState === ConnectionState.STATE_CONNECTED) {
        await router.pushUrl({ url: 'pages/HeartRate' })
      }
    })
  }
}