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
import { PinDialog } from '../Component/PinDialog'
import Logger from '../../../model/Logger';
import connection from '@ohos.bluetooth.connection';
import access from '@ohos.bluetooth.access';
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';

let innerEvent11: emitter.InnerEvent = {
  eventId: 11
};
const TAG = '[Screenshot]';
const TIME: number = 0 // 设备可被发现的持续时间
const isCore = canIUse('SystemCapability.Communication.Bluetooth.Core');
const isLite = canIUse('SystemCapability.Communication.Bluetooth.Lite');

@Entry
@Component
struct StandardBluetooth {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'StandardBluetooth';
  @State StepTips: string = '操作步骤：\n1、请打开蓝牙' + '\n2、自己创建一个蓝牙' + '\n3、查看应用是否扫描到自己创建的蓝牙MAC地址'
    + '\n4、选择点击蓝牙后进行配对' + '\n预期结果：列表能扫描到自己的蓝牙，能配对成功则通过' +
    '\n注：\n1、若点击MAC地址后长时间无弹窗或弹窗弹出后点击配对无反应，请将蓝牙关闭再开启，并重新点击其他MAC号重试'
    + '\n2、配对设备MAC地址与真实地址不一致的情况下，可以先使用对端设备与测试设备进行配对，查看应用中已配对的MAC地址，确认后可按照上述步骤进行操作';
  @State Vue: boolean = false;
  @State btnState: boolean = false;
  @State isOn: boolean = false;
  @State deviceList: Array<string> = [];
  @State discoveryList: Array<string> = [];
  private bluetoothState: boolean = false;
  private pinDialogController: CustomDialogController | null = null;
  private intervalId: number = -1;
  handlerClickButton = () => {
    let context : ESObject = getContext(this) as ESObject;
    context.terminateSelf();
  }

  foundDevices() {
    connection.on('bluetoothDeviceFind', (data) => {
      Logger.info(TAG, `enter on bluetoothDeviceFind`)
      if (data !== null && data.length > 0) {
        if (this.discoveryList.indexOf(data[0]) === -1 && this.deviceList.indexOf(data[0]) === -1) {
          this.discoveryList.push(data[0])
        }
        Logger.info(TAG, `discoveryList = ${JSON.stringify(this.discoveryList)}`)
      }
      let list = connection.getPairedDevices()
      if (list !== null && list.length > 0) {
        this.deviceList = list
        Logger.info(TAG, `deviceList =  ${JSON.stringify(this.deviceList)}`)
      }
    })
    try {
      connection.startBluetoothDiscovery()
      connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, TIME)
    } catch (err) {
      Logger.info(TAG, `foundDevices connection.startBluetoothDiscovery =  ${JSON.stringify(err.message)}`)
    }
  }

  scroller: Scroller = new Scroller();

  async aboutToAppear() {
    if (isCore && isLite) {
      await FirstDialog.ChooseDialog(this.StepTips, this.name);
      let state = access.getState()
      if (state === access.BluetoothState.STATE_ON) {
        this.isOn = true
        this.foundDevices()
      }
      if (state === access.BluetoothState.STATE_OFF) {
        this.isOn = false
      }

      connection.on('pinRequired', (data: connection.PinRequiredParam) => {
        Logger.info(TAG, `enter pinRequired`)
        this.pinDialogController = new CustomDialogController({
          builder: PinDialog({ data: data }),
          autoCancel: true,
          alignment: DialogAlignment.Bottom
        })
        this.pinDialogController.open()
        Logger.info(TAG, `onPinRequiredData = ${JSON.stringify(data)}`)
      })

      connection.on('bondStateChange', (data) => {
        Logger.info(TAG, `enter bondStateChange`)
        Logger.info(TAG, `data = ${JSON.stringify(data)}`)
        if (data.state === connection.BondState.BOND_STATE_BONDED) {
          Logger.info(TAG, `BOND_STATE_BONDED`)
          let index = this.discoveryList.indexOf(data.deviceId)
          this.discoveryList.splice(index, 1)
          this.deviceList = connection.getPairedDevices()
        }
        if (data.state === connection.BondState.BOND_STATE_INVALID) {
          Logger.info(TAG, `BOND_STATE_INVALID`)
          this.deviceList = connection.getPairedDevices()
        }
        Logger.info(TAG, `bondStateChange,data = ${JSON.stringify(data)}`)
      })

      this.intervalId = setInterval(() => {
        this.discoveryList = []
        this.foundDevices()
      }, 60000)
    } else {
      setTimeout(() => {
        promptAction.showToast({
          message: '该设备没有蓝牙相关模块',
          duration: 2000
        })
        router.back({
          url: 'pages/Bluetooth/BlueTooth_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
      }, 2000)
    }
  }

  async onPageShow() {
    emitter.on(innerEvent11, (res) => {
      if(res.data !== undefined) {
        this.Vue = res.data.flag
        console.info('emitter.on =11=this.Vue ' + this.Vue);
      }
    });
  }

  async onPageHide() {
    Logger.info("enter onPageHide");
  }

  async aboutToDisappear() {
    clearInterval(this.intervalId)
  }

  initBluetooth() {
    access.on('stateChange', (data) => {
      Logger.info(TAG, `enter on stateChange`)
      if (data === access.BluetoothState.STATE_ON) {
        Logger.info(TAG, `enter BluetoothState.STATE_ON`)
        this.foundDevices()
      }
      if (data === access.BluetoothState.STATE_OFF) {
        Logger.info(TAG, `enter BluetoothState.STATE_OFF`)
        connection.off('bluetoothDeviceFind', (data) => {
          Logger.info(TAG, `offBluetoothDeviceFindData = ${JSON.stringify(data)}`)
        })
        connection.stopBluetoothDiscovery()
        this.discoveryList = []
      }
      Logger.info(TAG, `BluetoothState = ${JSON.stringify(data)}`)
    })
    access.enableBluetooth()
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
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/Bluetooth/BlueTooth_index',
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

        Row() {
          Column() {
            Text('蓝牙')
              .fontSize(24)
              .margin({ top: 20 })
              .alignSelf(ItemAlign.Start)
              .fontColor(Color.White)
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
              .size({ width: 40, height: 25 })
              .selectedColor('#ff2982ea')
              .switchPointColor('#FFFFFF')
              .onChange((isOn: boolean) => {
                if (isOn) {
                  try {
                    this.isOn = true
                    this.initBluetooth()
                  } catch (err) {
                    Logger.info(TAG, 'onChange  =' + JSON.stringify(err.message))
                  }
                } else {
                  this.isOn = false
                  access.disableBluetooth()
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

        Scroll() {
          Column() {
            if (this.isOn) {
              Divider()
                .vertical(false)
                .strokeWidth(10)
                .color('#ffece7e7')
                .lineCap(LineCapStyle.Butt)
                .margin('1%')

              Text('已配对的设备')
                .fontSize(24)
                .fontColor(Color.White)
                .margin({ left: '5%' })
                .alignSelf(ItemAlign.Start)

              ForEach(this.deviceList, (item: string, index) => {
                Row() {
                  Text(item)
                    .fontColor(Color.White)
                    .fontSize(20)
                }
                .alignSelf(ItemAlign.Start)
                .width('100%')
                .height(50)
                .margin({ left: '5%', top: '1%' })
                .id(`pairedDevice${index}`)
                .onClick(() => {
                  AlertDialog.show({
                    title: '是否断开连接？',
                    message: '此操作将会断开您与以下设备的连接：' + item,
                    primaryButton: {
                      value: '取消',
                      action: () => {
                      }
                    },
                    secondaryButton: {
                      value: '确定',
                      action: () => {
                        let deleteStatus : Boolean = false;
                        try {
                          connection.cancelPairedDevice(item, (err: BusinessError) => {
                            Logger.info(TAG, 'connection.cancelPairedDevice err: ' + JSON.stringify(err));
                            if (err === undefined) {
                              deleteStatus = true
                            }
                          });
                        } catch (err) {
                          Logger.info(TAG, 'errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
                        }
                        Logger.info(TAG, `deleteStatus = ${deleteStatus}`)
                        if (deleteStatus === true) {
                          this.deviceList = connection.getPairedDevices()
                          this.discoveryList = []
                          connection.startBluetoothDiscovery()
                        }
                      }
                    }
                  })
                })
              })

              Divider()
                .vertical(false)
                .strokeWidth(10)
                .color('#ffece7e7')
                .lineCap(LineCapStyle.Butt)
                .margin('1%')

              Text('可用设备')
                .fontSize(25)
                .fontColor(Color.White)
                .margin({ left: '5%', bottom: '2%' })
                .alignSelf(ItemAlign.Start)

              ForEach(this.discoveryList, (item: string) => {
                Row() {
                  Text(item)
                    .fontColor(Color.White)
                    .fontSize(20)
                }
                .alignSelf(ItemAlign.Start)
                .width('100%')
                .height(50)
                .margin({ left: '5%', top: '1%' })
                .onClick(() => {
                  Logger.info(TAG, `start bluetooth.pairDevice,item = ${item}`)
                  try {
                    connection.pairDevice(item)
                  } catch (err) {
                    Logger.error(TAG, 'errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
                  }
                })

                Divider()
                  .vertical(false)
                  .color('#ffece7e7')
                  .lineCap(LineCapStyle.Butt)
                  .margin('1%')
              })
            }
          }
        }
        .height('65%')

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