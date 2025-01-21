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
// @ts-nocheck
// @ts-ignore
import camera from '@ohos.multimedia.camera'
import Logger from '../model/Logger'
import CameraService from '../model/CameraService'
import { CustomContainer } from '../common/CameraFlashContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';

@Entry
@Component
struct cameraOrientation {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraFlash';
  @State StepTips: string = '测试目的：用于测试相机闪光灯能力\n-确定是否有闪光灯\n-根据设备选择选项\n-点击开启关闭对闪光灯进行操作' + '\n' + '预期结果：操作后闪关灯表现一致';
  private tag: string = 'qlw CameraFlash'
  @State Vue: boolean = false
  @State isFlash: boolean = undefined
  private mXComponentController: XComponentController = new XComponentController()
  @State captureSession: camera.CaptureSession = undefined
  @State flashChange: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name)
    this.cameraIsFlash()
  }

  cameraInit() {
    // @ts-ignore
    this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
    CameraService.initCamera(this.surfaceId, 0).then(() => {
      this.captureSession = CameraService.captureSession
      this.isFlash = this.captureSession.hasFlash()
      Logger.info(this.tag, `onLoad isFlash: ${this.isFlash}`)
    })
  }

  openFlash() {
    this.flashChange = !this.flashChange
    if (this.isFlash) {
      // 设置当前设备的闪光灯模式
      this.captureSession.setFlashMode(this.flashChange ? camera.FlashMode.FLASH_MODE_ALWAYS_OPEN : camera.FlashMode.FLASH_MODE_CLOSE)
      if (!this.flashChange){
        this.Vue = true
      }
      Logger.info(this.tag, `setFlashMode success`)
      // 获取当前设备的闪光灯模式
      let flashMode = this.captureSession.getFlashMode()
      Logger.info(this.tag, `getFlashMode success: ${flashMode}`)
    }
  }

  onPageShow() {
    this.cameraInit()
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

      Stack() {
        XComponent({
          id: 'componentId',
          type: 'surface',
          controller: this.mXComponentController
        })
          .onLoad(async () => {
            Logger.info(this.tag, 'onLoad is called')
            this.cameraInit()
          })
        Row().backgroundColor(Color.Black).size({ width: '100%', height: '100%' })
      }.size({ width: '10%', height: '30%' })

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start, direction: FlexDirection.Column }) {
        Scroll() {
          Column() {
            // Text(`提示：` + this.isFlash).fontSize('16fp').fontColor(Color.White)
            Text(`提示：如果设备存在闪光灯，选择开启，否则选择无闪光灯`)
              .fontSize('16fp').fontColor(Color.White).margin('20fp')
            Row() {
              Button(this.flashChange ? '关闭' : '开启').onClick(() => {
                this.openFlash()
              })
              Button('无闪光灯').onClick(() => {
                this.Vue = true
              })
            }.justifyContent(FlexAlign.SpaceEvenly).width('100%').margin('20fp')
          }
        }.scrollBarColor(Color.White) // 滚动条颜色
        .scrollBarWidth(10)
      }.width('80%').height('50%')


      CustomContainer({
        title: this.name,
        Url: 'pages/Camera/Camera_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue,
        isFlash:$isFlash
      }).height('10%').width('100%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Camera/Camera_index',
    })
  }
}