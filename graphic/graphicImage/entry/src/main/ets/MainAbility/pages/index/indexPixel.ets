/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
 
import image from '@ohos.multimedia.image';
import CameraService from '../../mode/CameraService'
import { BusinessError } from '@ohos.base';
import { GlobalContext } from '../../comFile/utils/GlobalContext'
import camera from '@ohos.multimedia.camera';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World1';
  @State _pixelMap1: image.PixelMap | undefined = undefined
  private mXComponentController: XComponentController = new XComponentController()
  private surfaceId = ''
  private defaultCameraDeviceIndex = 0

  async Demo(surfaceId: string) {
    let cameraManager = camera.getCameraManager(GlobalContext.get().getCameraSettingContext());
    let supportedCameras: camera.CameraDevice[] = [];
    supportedCameras = cameraManager.getSupportedCameras();

    if(supportedCameras.length < 1 || supportedCameras.length < this.defaultCameraDeviceIndex + 1){
        this.message = 'pass'
    } else {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } }
        try {
            await image.createPixelMapFromSurfaceSync(surfaceId, region);
            this.message = 'pass';
        } catch(err) {
            this.message = 'failed'
        }
    }
  }

  build() {
    Column() {
      Text(this.message)
        .id('createPixelMapFromSurfaceSync')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center },
        })
        .onClick(async ()=>{
          this.Demo(this.surfaceId)
        })
      XComponent({
        id:'componentId',
        type:'surface',
        controller:this.mXComponentController
      })
      .width('100%')
      .height('50%')
      .border({width:2, color: Color.Red})
      .onLoad(async ()=>{
        this.surfaceId=this.mXComponentController.getXComponentSurfaceId();
        await CameraService.initCamera(this.surfaceId,this.defaultCameraDeviceIndex);
      })
    }
    .width('100%')
    .height('100%')
    .alignSelf(ItemAlign.Center)
  }
}