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
import camera from '@ohos.multimedia.camera'
import Logger from '../model/Logger'
import CameraService from '../model/CameraService'
import { CustomContainer } from '../common/CameraOrientationContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';

@Entry
@Component
struct cameraOrientation {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraOrientation';
  @State StepTips: string = '测试目的：用于测试相机预览和拍照旋转能力\n-左侧显示预览窗口\n-右侧显示指定旋转角度的拍照图片\n-对于前置摄像头会有镜像效果' + '\n' + '预期结果：拍照图片与预览窗口的画面一致';
  private tag: string = 'qlw CameraOrientation'
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
	  if (this.cameraListLength > 1){
        this.cameraDeviceIndex = 1
        CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex)
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
                this.cameraListFn()
              })
            })
            .size({ width: '100%', height: '100%' })
          Text('预览').fontSize('20fp').fontColor(Color.White)
        }.size({ width: '40%', height: '60%' })

        Column() {
          Image(this.assetUri || '').size({ width: '100%', height: '100%' }).border({ width: 1 })
          Text('带旋转角度的图片').fontSize('20fp').fontColor(Color.White)
        }.size({ width: '40%', height: '60%' })
      }.width('100%').height('50%')

      Flex({ direction: FlexDirection.Column }) {
        Text(`Camera: ${this.cameraDeviceIndex}`).fontSize('16fp').fontColor(Color.White)
        Text(`Orientation: ${this.imageRotation}°`).fontSize('16fp').fontColor(Color.White)
        Text(`顺时针`).fontSize('16fp').fontColor(Color.White)
        Text(`提示：`).fontSize('16fp').fontColor(Color.White)
        Text(`如果左边预览窗口顺时针旋转后与右边窗口相同，选择pass，否则选择fail`)
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
  onBackPress(){
    router.replaceUrl({
      url:'pages/Camera/Camera_index',
    })
  }
}