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

import Logger from '../model/Logger';
import { CustomContainer } from '../common/CameraFlashContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import { DisplayDevice } from '../Screen/DisplayDevice'
import display from '@ohos.display'

let TAG = "VirtualScreen";

interface ScreenInfo {
  id: string;
  name: string;
  refreshRate: string;
  width: string;
  height: string;
  alive: string;
  state: string;
  rotation: string;
  densityDPI: string;
  orientation: string;
  densityPixels: string;
  scaledDensity: string;
  xDPI: string;
  yDPI: string;
}

@CustomDialog
export struct ShowInfo {
  private defaultOrAllScreen?: boolean
  private allScreens?: display.Display[]
  private defaultScreens?: display.Display
  private dialogController?: CustomDialogController
  scroller: Scroller = new Scroller();

  @Builder
  infoText(types: string, infos: string) {
    Row() {
      Text(types)
        .margin({ left: '5%', right: '5%' })
        .fontSize(22)
        .width('35%')
        .fontColor('#182431')
        .textAlign(TextAlign.Start)
      Text(infos)
        .fontSize(22)
        .width('55%')
        .textAlign(TextAlign.End)
        .fontColor('#828a90')
        .id('smallRectId')
    }
    .width('93%')
    .height(54)
    .margin(5)
  }

  screenInfo(types: string) {
    Logger.info(TAG, `defaultOrAllScreen = ${this.defaultOrAllScreen}`)
    let info: string = ''
    if (this.defaultOrAllScreen && this.defaultScreens) {
      const SCREEN_INFO : ScreenInfo = {
        id: `${this.defaultScreens.id}`,
        name: `${this.defaultScreens.name}`,
        refreshRate: `${this.defaultScreens.refreshRate}`,
        width: `${this.defaultScreens.width}`,
        height: `${this.defaultScreens.height}`,
        alive: `${this.defaultScreens.alive ? globalThis.yes : globalThis.no}`,
        state: `${this.defaultScreens.state}`,
        rotation: `${this.defaultScreens.rotation}`,
        densityDPI: `${this.defaultScreens.densityDPI}`,
        orientation: `${this.defaultScreens.orientation}`,
        densityPixels: `${this.defaultScreens.densityPixels}`,
        scaledDensity: `${this.defaultScreens.scaledDensity}`,
        xDPI: `${this.defaultScreens.xDPI}`,
        yDPI: `${this.defaultScreens.yDPI}`
      }
      info = Object(SCREEN_INFO)[types]
    } else {
      let ids: string = '';
      let refreshRates: string = '';
      let widths: string = '';
      let heights: string = '';
      let names: string = '';
      let alives: string = '';
      let states: string = '';
      let rotations: string = '';
      let densityDPIs: string = '';
      let orientations: string = '';
      let densityPixelszs: string = '';
      let scaledDensitys: string = '';
      let xDPIs: string = '';
      let yDPIs: string = '';

      if(this.allScreens !== undefined) {
        for (let i = 1; i < this.allScreens.length; i++) {
          ids = `${ids} ${this.allScreens[i].id}`;
          refreshRates = `${refreshRates} ${this.allScreens[i].refreshRate}`;
          widths = `${widths} ${this.allScreens[i].width}`;
          heights = `${heights} ${this.allScreens[i].height}`;
          names = `${names} ${this.allScreens[i].name}`;
          alives = `${alives} ${this.allScreens[i].alive ? globalThis.yes : globalThis.no}`;
          states = `${states} ${this.allScreens[i].state}`;
          rotations = `${rotations} ${this.allScreens[i].rotation}`;
          densityDPIs = `${densityDPIs} ${this.allScreens[i].densityDPI}`;
          orientations = `${orientations} ${this.allScreens[i].orientation}`;
          densityPixelszs = `${densityPixelszs} ${this.allScreens[i].densityPixels}`;
          scaledDensitys = `${scaledDensitys} ${this.allScreens[i].scaledDensity}`;
          xDPIs = `${xDPIs} ${this.allScreens[i].xDPI}`;
          yDPIs = `${yDPIs} ${this.allScreens[i].yDPI}`;
        }
      }
      const SCREENS_INFO : ScreenInfo = {
        id: ids,
        name: names,
        refreshRate: refreshRates,
        width: widths,
        height: heights,
        alive: alives,
        state: states,
        rotation: rotations,
        densityDPI: densityDPIs,
        orientation: orientations,
        densityPixels: densityPixelszs,
        scaledDensity: scaledDensitys,
        xDPI: xDPIs,
        yDPI: yDPIs
      }
      info = Object(SCREENS_INFO)[types]
    }
    Logger.info(TAG, `this info is ${info}`)
    return info
  }

  build() {
    Column() {
      Text('设备信息')
        .margin({ left: '10%', right: '10%', bottom: '11px' })
        .fontSize(28)
        .width('90%')
        .height(56)
        .id('deviceInfo')

      Column() {
        Scroll(this.scroller) {
          Column() {
            this.infoText('设备Id', this.screenInfo('id'));
            this.infoText('设备状态', this.screenInfo('state'));
            this.infoText('设备刷新率', this.screenInfo('refreshRate'));
            this.infoText('设备宽度', this.screenInfo('width'));
            this.infoText('设备高度', this.screenInfo('height'));
            this.infoText('xDPI', this.screenInfo('xDPI'));
            this.infoText('yDPI', this.screenInfo('yDPI'));
          }
          .width('100%')
          .height('100%')
          .borderRadius(10)
          .backgroundColor("#ffffff")
          .alignItems(HorizontalAlign.Start)
        }
        .id('scroller')
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor('#828a90')
        .scrollBarWidth('15px')

        Button('取消')
          .id('cancelShow')
          .width('60%')
          .height(40)
          .fontSize(22)
          .fontColor('#007dff')
          .backgroundColor('#ffffff')
          .margin({ top: '20px', left: '20%', right: '20%', bottom: '40%' })
          .onClick(() => {
            if(this.dialogController !== undefined) {
              this.dialogController.close();
            }
          })
      }
      .alignItems(HorizontalAlign.Center)
      .backgroundColor("#ffffff")
      .width('100%')
      .height('80%')
      .margin({ left: '5%', right: '5%' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#ffffff")
    .onClick(() => {
      if(this.dialogController !== undefined) {
        this.dialogController.close();
      }
    })
  }
}

@Entry
@Component
struct VirtualScreen {
  @State FillColor: string = '#FF000000';
  @State name: string = 'VirtualScreen';
  @State StepTips: string = '操作步骤：\n1.点击添加虚拟屏按钮,能够添加一块虚拟屏\n2.点击新增的绿色虚拟屏可以查看信息' +
    '\n3.点击移除虚拟屏按钮，能成功移除' +
    '\n预期结果：系统能够创建并移除虚拟屏';
  @State Vue: boolean = false;
  @State isFlush: boolean = false;
  @State isPass: boolean = false;
  @State intervalNum: number = 0

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name)
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      this.Vue = this.isPass
    }, 500)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
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
            url: 'pages/Screen/Screen_index',
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

      Row() {
        Text('测试步骤：\n1.点击添加虚拟屏按钮,能够添加一块虚拟屏\n2.点击新增的绿色虚拟屏可以查看信息\n3.点击移除虚拟屏按钮，能成功移除')
          .fontSize('24fp')
          .fontColor(Color.White)
      }
      .height('30%')
      .margin({ bottom: '-10vp' })
      DisplayDevice({ isPass: $isPass })

      CustomContainer({
        title: this.name,
        Url: 'pages/Screen/Screen_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue,
        isFlash: $isFlush
      })
        .height('10%')
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Screen/Screen_index'
    })
  }
}