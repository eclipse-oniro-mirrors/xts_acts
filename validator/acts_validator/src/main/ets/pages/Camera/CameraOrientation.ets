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

// @ts-ignore
import Logger from '../model/Logger';
import CameraService from '../model/CameraService';
import { CustomContainer } from '../common/CameraOrientationContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';

@Entry
@Component
struct cameraOrientation {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraOrientation';
  @State StepTips: string = '测试目的：用于测试相机预览和拍照旋转能力\n-左侧显示预览窗口\n-右侧显示指定旋转角度的拍照图片\n-对于前置摄像头会有镜像效果' + '\n' + '预期结果：左侧预览窗口顺时针旋转相应角度后与右侧图片一致';
  private tag: string = 'CameraOrientation'
  private mXComponentController: XComponentController = new XComponentController()
  @State surfaceId: number = 0;
  @State cameraDeviceIndex: number = 0
  @State assetUri: string = undefined
  @State Vue: boolean = false
  @State imageRotation: number = 0
  @State cameraListLength: number = undefined
  @State cameraList: SelectOption[] = []
  @State takeFlag: boolean = true
  @State testingFrequency: number = undefined
  @State isEnabled: boolean = true
  @State takeSelect: number = 0
  @State clickFrequency: number = 0
  @State resolution: SelectOption[] = [] // 分辨率
  @State screensObj: object = null
  @State XWidth: string = '1%'
  @State XHeight: string = '1%'

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    CameraService.setTakePictureCallback(this.handleTakePicture.bind(this))
  }

  onChangeTake() {
    if (this.takeFlag) {
      CameraService.takePicture(this.imageRotation)
      this.Vue = true
      this.takeFlag = false
      this.isEnabled = false
    } else {
      this.takeFlag = true
      // next 刷新数据
      // 图像置为黑色
      this.assetUri = ''
      this.imageRotation = this.imageRotation + 90
      if (this.imageRotation > 270 && this.clickFrequency > 3) {
        this.imageRotation = 0
      }
      if (this.cameraListLength > 1) {
        if (this.imageRotation > 270 && this.clickFrequency > 3) {
          this.imageRotation = 0
          this.cameraDeviceIndex = 1
          CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex)
        }
      }
    }
  }

  cameraListFn() {
    this.cameraListLength = CameraService.cameras.length
    Logger.info(this.tag, `cameraListFn cameraListLength: ${this.cameraListLength}`)
    this.testingFrequency = this.cameraListLength * 4
    Logger.info(this.tag, `cameraListFn testingFrequency: ${this.testingFrequency}`)
    for (let index = 0; index < this.cameraListLength; index++) {
      this.cameraList.push({
        value: `Camera ${index}`
      })
    }
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
    // @ts-ignore
    Logger.info(this.tag, `setXComponent this.screensObj.width  w` + JSON.stringify(this.screensObj[0].width))
    Logger.info(this.tag, `setXComponent objW` + JSON.stringify(objW))
    // @ts-ignore
    let w = (this.screensObj[this.screensObj.length-1].width * 0.4) / objW
    Logger.info(this.tag, `setXComponent w` + JSON.stringify(w))
    // @ts-ignore
    this.XWidth = String(this.screensObj[this.screensObj.length-1].width * 0.4) + "px"
    Logger.info(this.tag, `setXComponent XWidth` + JSON.stringify(this.XWidth))
    this.XHeight = String(objH * w) + "px"
    Logger.info(this.tag, `setXComponent XHeight` + JSON.stringify(this.XHeight))
  }

  handleTakePicture = (assetUri: string) => {
    this.assetUri = assetUri
    Logger.info(this.tag, `takePicture end, assetUri: ${this.assetUri}`)
  }

  onPageShow() {
    Logger.info(this.tag, `cameraOrientation onPageShow`)
    // @ts-ignore
    this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
      Logger.info(this.tag, `onPageShow initCamera start`)
      this.cameraListFn()
    })
  }

  onPageHide() {
    CameraService.releaseCamera()
    Logger.info(this.tag, `onPageHide releaseCamera end`)
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back')).width('20vp').height('18vp').margin({ left: '20vp' })
        }.backgroundColor(Color.Black).size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/Camera/Camera_index',
            params: { result: 'None', }
          })
        })

        Text(this.name).fontColor(Color.White).fontSize('18fp').margin({ left: '-20vp' })
        Text('hello').fontColor(Color.White).visibility(Visibility.Hidden)
      }.backgroundColor(Color.Black).height('10%').width('100%').justifyContent(FlexAlign.SpaceBetween)

      Scroll() {
        Column() {
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
            Column() {
              XComponent({
                id: 'componentId',
                type: 'surface',
                controller: this.mXComponentController
              })
                .onLoad(async () => {
                  Logger.info(this.tag, 'onLoad is called')
                  // @ts-ignore
                  this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
                  Logger.info(this.tag, `onLoad surfaceId: ${this.surfaceId}`)
                  CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
                    this.screensObj = CameraService.screensObj
                    this.resolution = CameraService.photoResolution
                    this.cameraListFn()
                    this.setXComponent()
                  })
                })
                .size({ width: '100%', height: '100%' })
              Text('预览').fontSize('20fp').fontColor(Color.White)
            }.size({ width: this.XWidth, height: this.XHeight })

            Column() {
              Image(this.assetUri || '').size({ width: '100%', height: '100%' }).objectFit(ImageFit.Fill)
              Text('带旋转角度的图片').fontSize('20fp').fontColor(Color.White)
            }.size({ width: this.XWidth, height: this.XHeight })
          }.width('100%').height('60%')

          Flex({ direction: FlexDirection.Column }) {
            Text(`Camera: ${this.cameraDeviceIndex}`).fontSize('16fp').fontColor(Color.White)
            Text(`Orientation: ${this.imageRotation}°`).fontSize('16fp').fontColor(Color.White)
            Text(`顺时针`).fontSize('16fp').fontColor(Color.White)
            Text(`提示：`).fontSize('16fp').fontColor(Color.White)
            Text(`如果左侧预览窗口顺时针旋转相应角度后与右侧图片一致，选择pass，否则选择fail`)
              .fontSize('16fp').fontColor(Color.White)
          }.size({ width: '80%', height: '25%' })

          Button(this.takeFlag ? '拍照' : '下一个')
            .enabled(this.isEnabled)
            .opacity(this.isEnabled ? 1 : 0.4)
            .width('50%')
            .height('5%')
            .backgroundColor(0x317aff)
            .onClick(async () => {
              this.onChangeTake()
            })
        }
      }.height('80%').scrollBarColor(Color.White) // 滚动条颜色
        .scrollBarWidth(10)

      CustomContainer({
        title: this.name,
        Url: 'pages/Camera/Camera_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue,
        testingFrequency: $testingFrequency,
        isEnabled: $isEnabled,
        clickFrequency: $clickFrequency
      }).height('10%').width('100%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Camera/Camera_index',
    })
  }
}