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

import display from '@ohos.display';
import Logger from '../model/Logger';
import screen from '@ohos.screen';
import { ShowInfo } from '../Screen/VirtualScreen';

const TAG: string = '[DisplayModel]';

export class DisplayModel {
  async createVirtualScreen(id: number) {
    let result: ESObject = await screen.createVirtualScreen({
      name: `screen_${id}`,
      width: 480,
      height: 360,
      density: 60,
      surfaceId: `${id}`
    })
    Logger.info(TAG, `createVirtualScreen screen.id = ${result.id}`)
    let info: ESObject = await screen.makeExpand([{ screenId: result.id, startX: 0, startY: 0 }])
    Logger.info(TAG, `makeExpand number = ${info}`)
    return result
  }

  async destroyVirtualScreen(id: number) {
    await screen.destroyVirtualScreen(id)
    Logger.info(TAG, `destroyVirtualScreen is success`)
  }
}

@Component
export struct DisplayDevice {
  @State devices: number[] = []
  @Link isPass: boolean
  private screenIds: number[] = []
  private allScreens: display.Display[] = []
  private defaultScreens: display.Display | undefined = undefined
  private defaultOrAllScreen: boolean = false
  private displayModel: DisplayModel = new DisplayModel()
  dialogController: CustomDialogController = new CustomDialogController({
    builder: ShowInfo({
      defaultScreens: this.defaultScreens,
      allScreens: this.allScreens,
      defaultOrAllScreen: this.defaultOrAllScreen
    }),
    autoCancel: true,
    alignment: DialogAlignment.Default
  })

  addWatch() {
    display.on('add', (data) => {
      if (this.devices.length < 1) {
        this.devices.push(this.screenIds[this.screenIds.length - 1])
        Logger.info(TAG, `this push devices = ${JSON.stringify(this.devices)} this id = ${data}`)
      } else {
        Logger.info(TAG, `this screen's number is exceed three`)
      }
    })
  }

  removeWatch() {
    display.on('remove', (result) => {
      this.devices.pop()
      this.screenIds.pop()
      Logger.info(TAG, `this pop devices = ${JSON.stringify(this.devices)} this screenIds = ${JSON.stringify(this.screenIds)} result = ${result}`)
    })
  }

  aboutToAppear() {
    this.addWatch()
    this.removeWatch()
  }

  async getDefaultScreen() {
    this.defaultOrAllScreen = true
    this.defaultScreens = await display.getDefaultDisplaySync()
    Logger.info(TAG, `This getDefaultScreen = ${JSON.stringify(this.defaultScreens)}`)
  }

  async getAllScreen() {
    this.defaultOrAllScreen = false
    this.allScreens = await display.getAllDisplay()
    Logger.info(TAG, `This getAllScreen = ${JSON.stringify(this.allScreens)}`)
  }

  build() {
    Column() {
      Row() {
        Rect({ width: '40%', height: '23%' })
          .margin({ top: '56px', left: '1%', right: '2%' })
          .id('bigRect')
          .fill('#007dff')
          .onClick(async () => {
            await this.getDefaultScreen()
            Logger.info(TAG, `defaultOrAllScreen = ${this.defaultOrAllScreen}`)
            this.dialogController.open()
          })


        ForEach(this.devices, (index: number) => {
          Rect({ width: '40%', height: '23%' })
            .margin({ top: '56px', left: '5%', right: '1%' })
            .fill(Color.Green)
            .id('smallRect' + (index + 1))
            .onClick(async () => {
              await this.getAllScreen()
              Logger.info(TAG, `defaultOrAllScreen = ${this.defaultOrAllScreen}`)
              this.dialogController.open()
            })
        })
      }

      Row() {
        Button('添加虚拟屏')
          .width('40%')
          .height('10%')
          .id('addScreen')
          .fontSize(22)
          .backgroundColor('#007dff')
          .type(ButtonType.Capsule)
          .onClick(async () => {
            let result: ESObject = await this.displayModel.createVirtualScreen(this.screenIds.length)
            Logger.info(TAG, `this createVirtualScreen screen id = ${JSON.stringify(this.screenIds)}`)
            this.screenIds.push(result.id)
          })

        Button('移除虚拟屏')
          .width('40%')
          .height('10%')
          .id('removeScreen')
          .fontSize(22)
          .backgroundColor('#007dff')
          .type(ButtonType.Capsule)
          .onClick(async () => {
            await this.displayModel.destroyVirtualScreen(this.screenIds[this.screenIds.length - 1])
            Logger.info(TAG, `this after destroyVirtualScreen screen id = ${JSON.stringify(this.screenIds)}`)
            this.isPass = true
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .margin({ top: 70 })
      .margin({ bottom: '20vp' })
    }
    .width('100%')
    .height('50%')
  }
}
