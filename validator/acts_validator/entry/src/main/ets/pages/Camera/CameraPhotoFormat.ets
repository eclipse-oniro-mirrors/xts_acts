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

import camera from '@ohos.multimedia.camera'
import Logger from '../model/Logger'
import CameraService from '../model/CameraService'
import { CustomContainer } from '../common/CameraPhotoContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

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

interface para {
  id: number;
  width: number;
  height: number;
  refreshRate: number;
}

@Entry
@Component
struct cameraOrientation {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraPhotoFormat';
  @State StepTips: string = '测试目的：用于测试相机拍照分辨率能力\n-对于前置摄像头会有镜像效果\n测试步骤：\n1. 点击拍照\n2. 点击下一个\n3. 重复步骤1和2直至所有拍照分辨率均遍历完成\n预期结果：所有分辨率均可以拍照，图片与预览一致';
  private tag: string = 'qlw';
  private mXComponentController: XComponentController = new XComponentController();
  @State surfaceId: number = 0;
  @State cameraDeviceIndex: number = 0;
  @State assetUri: string = '';
  @State Vue: boolean = false;
  @State imageRotation: number = 0;
  @State cameraListLength: number = 0;
  @State cameraList: SelectOption[] = [];
  @State isEnabled: boolean = true;
  @State isNextEnabled: boolean = true;
  @State takeSelect: number = 0;
  @State clickFrequency: number = 0;
  @State resolutionSelectVal: string = ''; // 下拉框默认value
  @State clickSerialPhotoVal: number = 0;
  @State timer: number = -1;
  @State resolution: ResolutionItem[] = []; // 分辨率
  @State testingFrequency: number = 0; // 测试总数
  @State isCameraChange: boolean = false;
  @State screensObj: Array<para> = [];
  @State XWidth: string = '1%';
  @State XHeight: string = '1%';

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    CameraService.setTakePictureCallback(this.handleTakePicture.bind(this))
  }

  cameraListFn() {
    this.cameraList = []
    this.cameraListLength = CameraService.cameras.length
    for (let index = 0; index < this.cameraListLength; index++) {
      this.cameraList.push({ value: `Camera ${index}` })
    }

    this.testingFrequency = this.resolution.length
    Logger.info(this.tag, `testingFrequency ${this.testingFrequency}`)
  }

  handleTakePicture = (assetUri: string) => {
    this.assetUri = assetUri
    Logger.info(this.tag, `takePicture end, assetUri: ${this.assetUri}`)
  }

  // 设置宽高
  // XWidth XHeight 左右布局的宽高
  // screensObj  width height 屏幕宽高
  // resolution 拍照分辨率
  setXComponent() {
    let res = String(this.resolution[this.clickFrequency].value)
    let indexOf = res.indexOf('x')
    let objW = Number(res.slice(0, indexOf)) // 拍照分辨率
    let objH = Number(res.slice(indexOf + 1)) // 拍照分辨率
    Logger.info(this.tag, `setXComponent screensObj w` + JSON.stringify(this.screensObj))
    Logger.info(this.tag, `setXComponent this.screensObj.width  w` + JSON.stringify(this.screensObj[0].width))
    Logger.info(this.tag, `setXComponent objW` + JSON.stringify(objW))
    let w = (this.screensObj[this.screensObj.length-1].width * 0.4) / objW
    Logger.info(this.tag, `setXComponent w` + JSON.stringify(w))
    this.XWidth = String(this.screensObj[this.screensObj.length-1].width * 0.4) + "px"
    Logger.info(this.tag, `setXComponent XWidth` + JSON.stringify(this.XWidth))
    this.XHeight = String(objH * w) + "px"
    Logger.info(this.tag, `setXComponent XHeight` + JSON.stringify(this.XHeight))

  }

  onPageShow() {
    Logger.info(this.tag, `takePicture end, assetUri`)
  }

  async cameraInit(obj?: ESObject) {
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex, obj, this.clickFrequency).then(() => {
      this.resolution = CameraService.photoResolution
      this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)
      Logger.info(this.tag, `resolution ` + JSON.stringify(this.resolution))
      this.screensObj = CameraService.screensObj
      Logger.info(this.tag, ` this.screensObj success view` + JSON.stringify(this.screensObj))
      this.cameraListFn()
      this.setXComponent()
    })
  }

  onPageHide() {
    CameraService.releaseCamera()
    Logger.info(this.tag, `onPageHide releaseCamera end`)
  }

  // 对分辨率数据处理 获取到需要的格式
  dealWithResolutionFn(arr: ResolutionItem[]) {
    let newResolution : Obj[] = []
    arr.forEach((item) => {
      let indexOf: number = item.value.indexOf("x")
      let objW: number = Number(item.value.slice(0, indexOf))
      let objH: number = Number(item.value.slice(indexOf + 1))
      let obj: Obj = {
        format: 2000,
        size: {
          width: objW,
          height: objH
        }
      }
      newResolution.push(obj)
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
            Column(){
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
          }
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
            Column() {
              XComponent({
                id: 'componentId',
                type: 'surface',
                controller: this.mXComponentController
              })
                .onLoad(async () => {
                  Logger.info(this.tag, 'onLoad is called')
                  this.surfaceId = Number(this.mXComponentController.getXComponentSurfaceId())
                  Logger.info(this.tag, `onLoad surfaceId: ${this.surfaceId}`)
                  this.cameraInit()
                })
                .size({ width: '100%', height: '100%' })
              Text('预览')
                .fontSize('20fp')
                .fontColor(Color.White)

            }.size({ width: this.XWidth, height: this.XHeight })

            Column() {
              Image('file://' + this.assetUri)
                .size({ width: '100%', height: '100%' })
                .objectFit(ImageFit.Fill)
              Text('图片')
                .fontSize('20fp')
                .fontColor(Color.White)
            }.size({ width: this.XWidth, height: this.XHeight })
          }
          .width('100%')
          .height('50%')

          Flex({ direction: FlexDirection.Column }) {
            Row() {
              Select(this.resolution)
                .selected(this.clickFrequency)
                .value(this.resolutionSelectVal)
                .font({ size: 16, weight: 500 })
                .fontColor(Color.White)
                .selectedOptionBgColor(Color.Black)
                .optionBgColor(Color.Black)
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 16, weight: 400 })
                .onSelect((index: number, value) => {
                  let indexOf = value.indexOf('x')
                  let objW = Number(value.slice(0, indexOf))
                  let objH = Number(value.slice(indexOf + 1))
                  let obj: Obj = {
                    format: 2000,
                    size: {
                      width: objW,
                      height: objH
                    }
                  }
                  CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
                    this.cameraListFn()
                  })
                  Logger.info(this.tag, `onSelect Rotation index: ${index}, value: ${value}, obj: ${obj}`)
                })
                .backgroundColor(Color.Black)
              Select(this.cameraList)
                .selected(this.cameraDeviceIndex)
                .value(this.cameraDeviceIndex ? 'Camera 1' : 'Camera 0')
                .font({ size: 16, weight: 500 })
                .fontColor(Color.White)
                .selectedOptionBgColor(Color.Black)
                .optionBgColor(Color.Black)
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 16, weight: 400 })
                .onSelect((index: number) => {
                  this.cameraDeviceIndex = index
                  CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
                    this.cameraListFn()
                  })
                })
                .backgroundColor(Color.Black)
            }.justifyContent(FlexAlign.SpaceEvenly)

            Text(`提示：不同拍照分辨率下进行拍摄，图片拍摄成功且与预览画面一致则选择pass，否则选择fail`)
              .fontSize('16fp')
              .fontColor(Color.White)
              .margin({ top: 20 })
          }.size({ width: '80%', height: '20%' })

          Row() {
            Button('拍照')
              .enabled(this.isEnabled)
              .opacity(this.isEnabled ? 1 : 0.4)
              .width('40%')
              .backgroundColor(0x317aff)
              .onClick(async () => {
                this.isEnabled = false
                this.isNextEnabled = false
                CameraService.takePicture()
              })
            Button('下一个')
              .enabled(!this.isNextEnabled)
              .opacity(!this.isNextEnabled ? 1 : 0.4)
              .width('40%')
              .backgroundColor(0x317aff)
              .onClick(async () => {
                this.clickFrequency++
                Logger.info(this.tag, `nextClickFn new clickFrequency: ${this.clickFrequency}`)

                if (this.resolution.length == this.clickFrequency || this.resolution.length < this.clickFrequency) {
                  if (this.isCameraChange) {
                    this.Vue = true
                    this.isEnabled = false
                    this.isNextEnabled = true
                    return
                  }
                  this.clickFrequency = 0
                  if (this.cameraListLength > 1) {
                    this.cameraDeviceIndex = Number(!this.cameraDeviceIndex)
                    await this.cameraInit().then(() => {
                      this.isCameraChange = true
                    })
                  } else {
                    this.Vue = true
                    this.isEnabled = false
                    this.isNextEnabled = true
                    return
                  }
                }
                this.isEnabled = true
                this.isNextEnabled = true
                if (this.clickFrequency) {
                  let newResolution = this.dealWithResolutionFn(this.resolution)
                  Logger.info(this.tag, `nextClickFn new Resolution: ${newResolution}`)
                  this.cameraInit(newResolution[this.clickFrequency])
                  this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)
                }

              })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .height('10%')
        }
      }
      .height('80%')
      .scrollBarColor(Color.White) // 滚动条颜色
      .scrollBarWidth(10)

      CustomContainer({
        title: this.name,
        Url: 'pages/Camera/Camera_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue
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