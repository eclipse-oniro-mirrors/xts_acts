/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { window } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct Index4 {
  @State errCode: string = 'errCode'
  @State message: string = 'message'
  build() {
    Row() {
      Column() {
        Text(this.errCode)
          .id('errCode')
          .fontWeight(FontWeight.Bold)
        Text(this.message)
          .id('errMessage')
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('next page')
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .id('SubWinTestId')
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')
        .onClick(async ()=>{
          let context: common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
          const rawFile: Uint8Array = await context.resourceManager.getRawFileContent('test1.jpg');
          let ops: image.SourceOptions = {
            sourceDensity: 98,
          }
          let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);

          imageSource.createPixelMap().then(async (pixelMap: image.PixelMap) => {
            console.info(' Succeeded in creating pixelmap.');
            try {
              await window.setWatermarkImageForAppWindows(pixelMap);
              await window.setWatermarkImageForAppWindows(undefined);
              this.message = 'success'
            } catch (exception) {
              console.error(`Failed to set watermark image. Exception code: ${exception.code}, message: ${exception.message}`);
              this.message = JSON.stringify(exception);
              this.errCode = JSON.stringify(exception.code)
            }
          }).catch((err: BusinessError) => {
            console.error(`Failed to create PixelMap. Cause code: ${err.code}, message: ${err.message}`);
            this.errCode = JSON.stringify(err.code)
          });
        })
      }

      .width('100%')
    }
    .height('100%')
  }
}