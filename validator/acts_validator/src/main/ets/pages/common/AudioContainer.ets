/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import router from '@ohos.router';
import screenshot from '@ohos.screenshot';
import image from '@ohos.multimedia.image';
import Logger from '../model/Logger';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';

let path = globalThis.dir;

const TAG = '[Screenshot]';
@Component
export struct CustomContainer {
  @Link name : string;
  title : string = '';
  StepTips: string = '';
  Url : string = '';
  @Link Vue : boolean;
  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if(this.Vue == false){
      Button({stateEffect:this.Vue}) {
        Image($r('app.media.ic_public_pass')).width('20vp').height('20vp')
      }.width('30%').height('30vp').backgroundColor(Color.Grey).opacity(0.4)
      .onClick(()=>{

      })
    }
    else{
      Button({stateEffect:this.Vue}) {
        Image($r('app.media.ic_public_pass')).width('20vp').height('20vp')
      }.width('30%').height('30vp').backgroundColor(Color.Grey)
      .onClick(()=>{
        router.back({
          url:this.Url,
          params: {result : 'true ', title : this.name,
          }
        })
        this.getScreen(isFullScreen);
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }
  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button(){
      Image($r('app.media.ic_public_fail')).width('20vp').height('20vp')
    }.width('30%').height('30vp').backgroundColor(Color.Grey)
    .onClick(()=>{
      router.back({
        url:this.Url,
        params: {result : 'false',title : this.name,
        }
      })
      this.getScreen(isFullScreen);
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }
  build() {
    Column() {
      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button(){
          Image($r('app.media.ic_public_help')).width('20vp').height('20vp')
        }.width('30%').height('30vp').backgroundColor(Color.Grey)
        .onClick(() =>{
          AlertDialog.show({
            title:'操作提示',
            message: this.StepTips,
            confirm:{
              value:'OK',
              action:()=>{
              }
            }
          })
        })
        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Black)
    }.height('98%').width('100%')
  }
  async savePicture(data: image.PixelMap, context: any) {
    Logger.info(TAG, `savePicture`);
    let packOpts: image.PackingOption = {
      format: "image/jpeg", quality: 100
    };
    let info = {
      prefix: 'IMG_', suffix: '.jpg', directory: mediaLibrary.DirectoryType.DIR_IMAGE
    };
    let name = this.name;
    let displayName = `${info.prefix}${name}${info.suffix}`;
    let dirPath = path + '/screenshot' + '/' + displayName;
    let imagePackerApi = image.createImagePacker();
    let arrayBuffer = await imagePackerApi.packing(data, packOpts);
    let fd = fs.openSync(dirPath,fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    imagePackerApi.release();
    try {
      await fs.write(fd.fd, arrayBuffer);
    } catch (err) {
      Logger.error(`write failed, code is ${err.code}, message is ${err.message}`);
    }
    await fs.close(fd);
    Logger.info(TAG, `write done`);

  }
  getScreen = (isFullScreen: boolean) => {
    let screenshotOptions: screenshot.ScreenshotOptions = {
      screenRect: { left: 0, top: 0, width: 400, height: 400 },
      imageSize: { width: 400, height: 400 },
      rotation: 0,
      displayId: 0
    };
    if (isFullScreen) {
      screenshotOptions = {
        rotation: 0
      }
    }
    try {
      screenshot.save(screenshotOptions, (err, data: image.PixelMap) => {
        if (err) {
          Logger.info(TAG, `Failed to save the screenshot. Error:${JSON.stringify(err)}`);
        }
        Logger.info(TAG, 'save callback');
        this.savePicture(data, getContext(this) as any);
      })
    } catch (err) {
      Logger.error(`save failed, code is ${err.code}, message is ${err.message}`);
    }
  }
}
