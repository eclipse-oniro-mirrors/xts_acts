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
import { CustomContainer } from '../common/CameraVideoContainer'
import FirstDialog from '../model/FirstDialog'
import router from '@ohos.router'
import mediaPlay from '../model/mediaPlay'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct cameraOrientation {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraVideo';
  @State StepTips: string = '测试目的：用于测试相机录像分辨率能力\n-对于前置摄像头会有镜像效果\n预期结果：所有分辨率均可以录像，录像与预览一致';
  private tag: string = 'qlw CameraVideo'
  private mXComponentController: XComponentController = new XComponentController()
  private mXComponentController1: XComponentController = new XComponentController()
  @State surfaceId: number = 0;
  @State cameraDeviceIndex: number = 0
  @State assetUri: string = undefined
  @State Vue: boolean = false
  @State takeFlag: boolean = true
  @State isEnabled: boolean = true
  @State resolution: SelectOption[] = [] // 分辨率
  @State clickFrequency: number = 0 // 点击次数
  @State resolutionSelectVal: string = '' // 下拉框默认value
  @State cameraListLength: number = undefined // 相机数量
  @State cameraList: SelectOption[] = [] // 相机列表
  @State testingFrequency: number = undefined // 测试总数
  @State testEnabled: boolean = true
  @State nextEnabled: boolean = false
  @State isVideoPlayback: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    mediaPlay.setVideoPlaybackCallback(this.handleVideoPlayback.bind(this))
  }

  handleVideoPlayback = (isVideoPlayback: boolean) => {
    this.isVideoPlayback = isVideoPlayback
    Logger.info(this.tag, `VideoPlayBack end, isVideoPlayback: ${this.isVideoPlayback}`)
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

  nextClickFn() {
    // 切换next 次数增加 分辨率遍历 分辨率遍历完 切换摄像头 再次遍历分辨率 调取初始化相机进行改变
    this.clickFrequency++

    Logger.info(this.tag, `nextClickFn new clickFrequency: ${this.clickFrequency}`)
    if (this.clickFrequency === this.testingFrequency) {
      this.Vue = true
      this.testEnabled = false
      this.nextEnabled = false
      return
    }
    let newResolution = this.dealWithResolutionFn(this.resolution)
    Logger.info(this.tag, `nextClickFn new Resolution: ${newResolution}`)
    this.cameraInit(newResolution[this.clickFrequency])
    this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)

  }
  // 对分辨率数据处理 获取到需要的格式
  dealWithResolutionFn(arr) {
    let newResolution = []
    arr.forEach((item) => {
      let indexOf = item.value.indexOf("x")
      let objW = Number(item.value.slice(0, indexOf))
      let objH = Number(item.value.slice(indexOf + 1))
      let obj = {
        format: 1003,
        size: {
          "width": objW,
          "height": objH
        }
      }
      newResolution.push(obj)
    })
    return newResolution
  }

  async cameraInit(obj?) {
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
      this.resolution = CameraService.videoResolution
      this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)
      this.cameraListFn()
    })
  }

  onPageShow() {
    Logger.info(this.tag, `takePicture end, assetUri`)
	// @ts-ignore
    this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex)
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
          Flex({ justifyContent: FlexAlign.SpaceEvenly }) {

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
                  this.cameraInit()
                })
                .size({ width: '100%', height: '100%' })
              Text('视频录制').fontSize('20fp').fontColor(Color.White)
            }.size({ width: '45%', height: '100%' })

            Column() {
              if(!this.isVideoPlayback){
                XComponent({
                  id: '',
                  type: 'surface',
                  controller: this.mXComponentController1
                })
                  .onLoad(() => {
                  })
                  .size({ width: '100%', height: '100%' })
                Text('视频回放').fontSize('20fp').fontColor(Color.White)
              }
            }.size({ width: '45%', height: '100%' })

          }.size({ width: '100%', height: '60%' })

          Column() {
            Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly }) {
              Select(this.resolution)
                .selected(this.clickFrequency)
                .value(this.resolutionSelectVal)
                .font({ size: 16, weight: 500 })
                .fontColor(Color.White)
                .margin({ top: 50 })
                .selectedOptionBgColor(Color.Black)
                .optionBgColor(Color.Black)
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 16, weight: 400 })
                .onSelect((index: number, value) => {
                  let indexOf = value.indexOf('x')
                  let objW = Number(value.slice(0, indexOf))
                  let objH = Number(value.slice(indexOf + 1))
                  let obj = {
                    format: 1003,
                    size: {
                      "width": objW,
                      "height": objH
                    }
                  }
                  CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex)
                  Logger.info(this.tag, `onSelect Rotation index: ${index}, value: ${value}, obj: ${obj}`)
                })
                .backgroundColor(Color.Black)
              Select(this.cameraList)
                .selected(this.cameraDeviceIndex)
                .value(this.cameraDeviceIndex ? 'Camera 1' : 'Camera 0')
                .font({ size: 16, weight: 500 })
                .fontColor(Color.White)
                .margin({ top: 50 })
                .selectedOptionBgColor(Color.Black)
                .optionBgColor(Color.Black)
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 16, weight: 400 })
                .onSelect((index: number) => {
                  this.cameraDeviceIndex = index
                  this.cameraInit()
                })
                .backgroundColor(Color.Black)
              Select([{ value: 'YUV' }])
                .selected(0)
                .value('YUV')
                .font({ size: 16, weight: 500 })
                .fontColor(Color.White)
                .margin({ top: 50 })
                .selectedOptionBgColor(Color.Black)
                .optionBgColor(Color.Black)
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 16, weight: 400 })
                .onSelect((index: number, value) => {
                  Logger.info(this.tag, `onSelect format index: ${index}, value: ${value}`)
                })
                .backgroundColor(Color.Black)
            }.size({ width: '100%', height: '50%' })

            Row() {
              Button('录制')
                .borderRadius(8)
                .backgroundColor(0x317aff)
                .margin(15)
                .enabled(this.testEnabled)
                .opacity(this.testEnabled ? 1 : 0.4)
                .size({ width: '30%', height: '40%' })
                .onClick(async () => {
                  this.testEnabled = false
                  this.nextEnabled = true
                  promptAction.showToast({
                    message: '录制中，请等待三秒', duration: 1000
                  });
                  CameraService.startVideo().then(() => {
                    setTimeout(() => {
                      // @ts-ignore
                      let sufferID = this.mXComponentController1.getXComponentSurfaceId()
                      Logger.info(this.tag, `onSelect format sufferID: ${sufferID}`)
                      mediaPlay.init(sufferID)
                    }, 4000)
                  })
                })
              Button('下一个')
                .borderRadius(8)
                .backgroundColor(0x317aff)
                .margin(15)
                .enabled(this.nextEnabled)
                .opacity(this.nextEnabled ? 1 : 0.4)
                .size({ width: '30%', height: '40%' })
                .onClick(async () => {
                  this.testEnabled = true
                  this.nextClickFn()
                })
            }.size({ width: '100%', height: '50%' }).justifyContent(FlexAlign.SpaceEvenly)
          }.size({ width: '100%', height: '30%' })
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
      }).height('10%').width('100%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Camera/Camera_index',
    })
  }
}