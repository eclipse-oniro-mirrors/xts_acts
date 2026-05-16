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
  public format: number = 0;
  public size: SizeObj = {width : 0, height : 0};
}

class SizeObj {
  public width: number = 0;
  public height: number = 0;
}

interface ResolutionItem {
  value: string;
}

@Entry
@Component
struct cameraFitRotate {
  @State FillColor: string = '#FF000000';
  @State name: string = 'cameraFitRotate';
  @State StepTips: string = '测试目的：用于测试相机预览和视频录制中旋转适配\n测试步骤：先进性设备旋转，观察相机内画面旋转适配；再点击下一步按钮，进行设备旋转，观察相机内画面旋转适配\n预期结果：相机内画面均正向展示';
  private tag: string = 'cameraFitRotate';
  private mXComponentController: XComponentController = new XComponentController();
  @State surfaceId: number = 0;
  @State cameraDeviceIndex: number = 0;
  @State Vue: boolean = false;
  @State resolution: ResolutionItem[] = [];
  @State testingFrequency: number = 0;
  @State clickFrequency: number = 0;
  @State resolutionSelectVal: string = '';
  @State nextEnabled: boolean = true;
  @State selectFn: string = 'Camera 0';
  @State testItemName: string = '拍照预览';

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    Logger.info(this.tag, `the resolution: ${this.resolution}`);
    display.on('change', (data) => {
      this.setPreviewRotation();
    })
  }
  aboutToDisappear() {
    Logger.info(this.tag, 'aboutToDisappear');
    CameraService.stopVideo();
    display.off('change');
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
    CameraService.releaseCamera();
    Logger.info(this.tag, `onPageHide releaseCamera end`);
  }

  async cameraInit(obj?: ESObject) {
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex, undefined, undefined, obj).then(() => {
      this.resolution = CameraService.resolution;
      this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value);
      this.setPreviewRotation();
    })
  }

  onPageShow() {
    Logger.info(this.tag, `takePicture end, assetUri`);
  }

  nextClickFn() {
    if (this.testItemName === '拍照预览') {
      this.testItemName = '录像预览';
      CameraService.startVideoPreview();
    } else {
      this.testItemName = '视频录制';
      CameraService.startVideo();
      this.nextEnabled = false;
      this.Vue = true;
    }
    Logger.info(this.tag, `nextClickFn current testItemName: ${this.testItemName}`);
  }

  dealWithResolutionFn(arr: ResolutionItem[]) {
    let newResolution : Obj[]= [];
    if (arr.length > 0) {
      let item = arr[arr.length - 1];
      let indexOf = item.value.indexOf('x');
      if (indexOf !== -1) {
        let objW = Number(item.value.slice(0, indexOf));
        let objH = Number(item.value.slice(indexOf + 1));
        let obj: Obj = {
          format: 1003,
          size: {
            width: objW,
            height: objH
          }
        }
        newResolution.push(obj);
      }
    }
    return newResolution;
  }

  build() {
    Column() {
      Scroll(){
        Row({space:20}) {
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
        .height('20%')
        .width('160%')
        .justifyContent(FlexAlign.Center)
      }.scrollable(ScrollDirection.Horizontal).scrollBarColor(Color.Orange)

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
          Flex({
            alignItems: ItemAlign.Center,
            justifyContent: FlexAlign.SpaceAround,
            direction: FlexDirection.Column
          }) {
            Column() {
              XComponent({
                id: 'componentId',
                type: XComponentType.SURFACE,
                controller: this.mXComponentController
              })
                .onLoad(async () => {
                  Logger.info(this.tag, 'onLoad is called')
                  this.surfaceId = Number(this.mXComponentController.getXComponentSurfaceId());
                  Logger.info(this.tag, `onLoad surfaceId: ${this.surfaceId}`)
                  this.cameraInit()
                })
                .size({ width: '100%', height: '70%' })
              Text(this.testItemName).fontSize('20fp').fontColor(Color.White)
            }.size({ width: '80%' })
            Column() {
              Row() {
                Text('请顺时针或是逆时针旋转90/180/270/360度，观察画面是否均正向展示')
                  .textAlign(TextAlign.Center)
                  .fontSize(14)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('85%')
              }.size({ width: '100%', height: '30%' }).justifyContent(FlexAlign.SpaceEvenly)

              Row() {
                Button('下一步')
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
        }.height('65%').width('100%')
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