/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import camera from '@ohos.multimedia.camera';
import Logger from '../model/Logger';
import CameraService from '../model/CameraService';
import { CustomContainer } from '../common/CameraPreviewFormatContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { display } from '@kit.ArkUI';

class Obj {
  format: number = 0;
  size: SizeObj = {width : 0, height : 0};
}

class SizeObj {
  width: number = 0;
  height: number = 0;
}

interface ResolutionItem {
  value: string;
}

@Entry
@Component
struct cameraFormat {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraPreviewFormat';
  @State StepTips: string = '测试目的：用于测试相机预览分辨率能力\n测试步骤：点击下一个遍历所有预览分辨率，观察预览窗口\n预期结果：所有分辨率均可以预览成功，预览画面正常';
  private tag: string = 'qlw CameraFormat';
  private mXComponentController: XComponentController = new XComponentController();
  @State surfaceId: number = 0;
  @State cameraDeviceIndex: number = 0;
  @State Vue: boolean = false;
  @State resolution: ResolutionItem[] = [];
  @State testingFrequency: number = 0;
  @State clickFrequency: number = 0;
  @State cameraListLength: number = 0;
  @State cameraList: SelectOption[] = [];
  @State resolutionSelectVal: string = '';
  @State nextEnabled: boolean = true;
  @State formatVal: SelectOption[] = [];
  @State selectFn: string = 'Camera 0';
  @State last_rotation: number = 0;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    Logger.info(this.tag, `the resolution: ${this.resolution}`)
    display.on("change", (data) => {
      this.setPreviewRotation();
    })
  }

  private setPreviewRotation() {
    let initDisplayRotation = display.getDefaultDisplaySync().rotation;
    let initPreviewRotation =
      CameraService.previewOutput.getPreviewRotation(initDisplayRotation * camera.ImageRotation.ROTATION_90);
    CameraService.previewOutput.setPreviewRotation(initPreviewRotation, false);
    display.off('change');
    display.on('change', () => {
      initDisplayRotation = display.getDefaultDisplaySync().rotation;
      let imageRotation = initDisplayRotation * camera.ImageRotation.ROTATION_90;
      let previewRotation = CameraService.previewOutput.getPreviewRotation(imageRotation);
      CameraService.previewOutput.setPreviewRotation(previewRotation, false);
    });
  }

  onPageHide() {
    CameraService.releaseCamera()
    Logger.info(this.tag, `onPageHide releaseCamera end`)
  }

  cameraListFn() {
    this.cameraList = []
    this.cameraListLength = CameraService.cameras.length
    for (let index = 0; index < this.cameraListLength; index++) {
      this.cameraList.push({ value: `Camera ${index}` })
    }
    // 测试总次数 = 摄像头0的分辨率 + 摄像头1的分辨率 优先以RK为主
    this.testingFrequency = this.resolution.length
    Logger.info(this.tag, `testingFrequency ${this.testingFrequency}`)
  }

  async cameraInit(obj?: ESObject) {
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex, undefined, undefined, obj).then(() => {
      this.resolution = CameraService.resolution
      this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)
      this.cameraListFn()
      this.last_rotation = -1
      this.setPreviewRotation();
    })
  }

  selectClickFn() {
    this.selectFn = 'Camera ' + this.cameraDeviceIndex;
  }

  onPageShow() {
    Logger.info(this.tag, `takePicture end, assetUri`)
  }

  nextClickFn() {
    // 切换next 次数增加 分辨率遍历 分辨率遍历完 切换摄像头 再次遍历分辨率 调取初始化相机进行改变
    this.clickFrequency++
    if (this.clickFrequency === this.testingFrequency) {
      this.Vue = true
      this.nextEnabled = false
      return
    }
    let newResolution = this.dealWithResolutionFn(this.resolution)
    Logger.info(this.tag, `nextClickFn new Resolution: ${JSON.stringify(newResolution)}`)
    this.cameraInit(newResolution[this.clickFrequency])
    this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)
  }

  // 对分辨率数据处理 获取到需要的格式
  dealWithResolutionFn(arr: ResolutionItem[]) {
    let newResolution : Obj[]= []
    arr.forEach((item) => {
      let indexOf = item.value.indexOf("x")
      if (indexOf !== -1) {
        let objW = Number(item.value.slice(0, indexOf))
        let objH = Number(item.value.slice(indexOf + 1))
        let obj: Obj = {
          format: 1003,
          size: {
            width: objW,
            height: objH
          }
        }
        newResolution.push(obj)
      }
    })
    return newResolution
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
            url: 'pages/Camera/Camera_index',
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

      Scroll() {
          Column() {
            Row() {
              Button(`设备无相机`)
                .borderRadius(8)
                .backgroundColor(0x317aff)
                .width('50%')
                .onClick(()=>{
                  this.Vue = false;
                  router.back({
                    url: 'pages/Camera/Camera_index',
                    params: { result: 'false', title: this.name }
                  });
                  promptAction.showToast({
                    message: '当前设备无相机', duration: 1000
                  });
                })
            }
            Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround, direction: FlexDirection.Column }) {
            Column() {
              XComponent({
                id: 'componentId',
                type: 'surface',
                controller: this.mXComponentController
              })
                .onLoad(async () => {
                  Logger.info(this.tag, 'onLoad is called')
                  this.surfaceId = Number(this.mXComponentController.getXComponentSurfaceId());
                  Logger.info(this.tag, `onLoad surfaceId: ${this.surfaceId}`)
                  this.cameraInit()
                })
                .size({ width: '100%', height: '70%' })
              Text('预览').fontSize('20fp').fontColor(Color.White)
            }.size({ width: '80%' })
            Column() {
              Row() {
                Select(this.resolution)
                  .selected(this.clickFrequency)
                  .value(this.resolutionSelectVal)
                  .font({ size: 16, weight: 500 })
                  .fontColor(Color.White)
                  .selectedOptionBgColor(Color.White)
                  .optionBgColor(Color.Yellow)
                  .selectedOptionFont({ size: 16, weight: 400 })
                  .optionFont({ size: 16, weight: 400 })
                  .onSelect((index: number, value) => {
                    let indexOf = value.indexOf('x')
                    let objW = Number(value.slice(0, indexOf))
                    let objH = Number(value.slice(indexOf + 1))
                    let obj: Obj = {
                      format: 1003,
                      size: {
                        width: objW,
                        height: objH
                      }
                    }
                    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex, obj).then(() => {
                      this.cameraListFn()
                    })
                    Logger.info(this.tag, `onSelect Rotation index: ${index}, value: ${value}, obj: ${obj}`)
                  })
                  .backgroundColor(Color.Black)
                Select(this.cameraList)
                  .selected(this.cameraDeviceIndex)
                  .value(this.selectFn)
                  .font({ size: 16, weight: 500 })
                  .fontColor(Color.White)
                  .selectedOptionBgColor(Color.White)
                  .optionBgColor(Color.Yellow)
                  .selectedOptionFont({ size: 16, weight: 400 })
                  .optionFont({ size: 16, weight: 400 })
                  .onSelect((index: number) => {
                    this.cameraDeviceIndex = index
                    this.cameraInit()
                    this.selectClickFn()
                  })
                  .backgroundColor(Color.Black)
              }.size({ width: '100%', height: '30%' }).justifyContent(FlexAlign.SpaceEvenly)

              Row() {
                Select([{ value: 'YUV' }])
                  .selected(0)
                  .value('YUV')
                  .font({ size: 16, weight: 500 })
                  .fontColor(Color.White)
                  .selectedOptionBgColor(Color.Black)
                  .optionBgColor(Color.Black)
                  .selectedOptionFont({ size: 16, weight: 400 })
                  .optionFont({ size: 16, weight: 400 })
                  .onSelect((index: number, value) => {
                    Logger.info(this.tag, `onSelect format index: ${index}, value: ${value}`)
                  })
                  .backgroundColor(Color.Black)
                Button('下一个')
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .enabled(this.nextEnabled)
                  .opacity(this.nextEnabled ? 1 : 0.4)
                  .width('20%')
                  .onClick(async () => {
                    this.nextClickFn()
                  })
              }.size({ width: '100%', height: '30%' }).justifyContent(FlexAlign.SpaceEvenly)
            }.size({ width: '100%', height: '20%' })
          }
        }.height('80%').width('100%')
      }.scrollBarColor(Color.White) // 滚动条颜色
      .scrollBarWidth(10)

      CustomContainer({
        title: this.name,
        Url: 'pages/Camera/Camera_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue,
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
      url: 'pages/Camera/Camera_index',
    })
  }
}