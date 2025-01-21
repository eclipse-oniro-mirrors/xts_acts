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
import { CustomContainer } from '../common/CameraPhotoContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';

@Entry
@Component
struct cameraOrientation {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraSerialPhoto';
  @State StepTips: string = '测试目的：用于测试相机连拍\n-左侧显示相机预览窗口\n-右侧显示拍照后的每个图片\n-对于前置摄像头会有镜像效果\n测试步骤：\n1.点击拍照按钮\n预期结果：点击拍照按钮后每个摄像头连拍生成10张图片，图片显示正常';
  private tag: string = 'qlw CameraSerialPhoto'
  private mXComponentController: XComponentController = new XComponentController()
  @State surfaceId: number = 0;
  @State cameraDeviceIndex: number = 0
  @State assetUri: string = undefined
  @State Vue: boolean = false
  @State imageRotation: number = 0
  @State cameraListLength: number = undefined
  @State cameraList: SelectOption[] = []
  @State isEnabled: boolean = true
  @State takeSelect: number = 0
  @State clickFrequency: number = 0
  @State resolutionSelectVal: string = '' // 下拉框默认value
  @State @Watch('onChangeClickSerialPhotoVal') clickSerialPhotoVal: number = 0
  @State timer: number = -1

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    CameraService.setTakePictureCallback(this.handleTakePicture.bind(this))
  }

  onChangeClickSerialPhotoVal() {
    if (this.clickSerialPhotoVal < 10 * this.cameraListLength || this.clickSerialPhotoVal == 10 * this.cameraListLength) {
      CameraService.takePicture()
      this.assetUri = ''
      if (this.clickSerialPhotoVal == 10) {
        this.onChangeCamera()
      }
      if (this.clickSerialPhotoVal == 10 * this.cameraListLength){
        clearInterval(this.timer)
        this.Vue = true
      }
      return
    }
  }

  onChangeCamera(){
    if (this.cameraListLength > 1){
      this.cameraDeviceIndex = Number(!this.cameraDeviceIndex)
      CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
        this.cameraListFn()
      })
    }
  }

  cameraListFn() {
    this.cameraList = []
    this.cameraListLength = CameraService.cameras.length
    for (let index = 0; index < this.cameraListLength; index++) {
      this.cameraList.push({ value: `Camera ${index}` })
    }
  }

  handleTakePicture = (assetUri: string) => {
    this.assetUri = assetUri
    Logger.info(this.tag, `takePicture end, assetUri: ${this.assetUri}`)
  }

  onPageShow() {
    Logger.info(this.tag, `takePicture end, assetUri`)
	// @ts-ignore
    this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
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
          Text('图片').fontSize('20fp').fontColor(Color.White)
        }.size({ width: '40%', height: '60%' })
      }.width('100%').height('50%')

      Flex({ direction: FlexDirection.Column }) {
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
        Text(`提示：`).fontSize('16fp').fontColor(Color.White)
        Text(`期望拍摄${this.cameraListLength*10}张照片，实际拍摄${this.clickSerialPhotoVal}张，如果一致请选择pass，否则选择fail`)
          .fontSize('16fp').fontColor(Color.White)
      }.size({ width: '80%', height: '25%' })

      Button('拍照')
        .enabled(this.isEnabled)
        .opacity(this.isEnabled ? 1 : 0.4)
        .width('50%')
        .height('5%')
        .backgroundColor(0x317aff)
        .onClick(async () => {
          this.isEnabled = false
          this.timer = setInterval(() => {
            this.clickSerialPhotoVal++
          }, 1000)
        })

      CustomContainer({
        title: this.name,
        Url: 'pages/Camera/Camera_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue
      }).height('10%').width('100%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Camera/Camera_index',
    })
  }
}
