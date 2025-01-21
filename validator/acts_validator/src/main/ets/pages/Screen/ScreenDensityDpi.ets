/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
import promptAction from '@ohos.promptAction';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import Logger from '../model/Logger';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import screenshot from '@ohos.screenshot';
import FirstDialog from '../model/FirstDialog';
import screen from '@ohos.screen';
import { BusinessError } from '@ohos.base';

let path = globalThis.dir;
const TAG = '[ScreenDensityDpi]';

@Entry
@Component
struct ScreenDensityDpi {
  @State FillColor: string = '#FF000000';
  @State name: string = 'ScreenDensityDpi';
  @State StepTips: string = '操作步骤：1、点击不同的dpi按钮\n' + '预期结果：屏幕大小有变化';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State isMilitaryTime: boolean = false;
  @State strDpi: string = '';

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    }
    else {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/Screen/Screen_index',
          params: { result: 'true ', title: this.name,
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
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/Screen/Screen_index',
        params: { result: 'false', title: this.name,
        }
      })
      this.getScreen(isFullScreen);
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.strDpi === '320' || this.strDpi === '360') {
        this.Vue = true
      }
    }, 500)
    try {
      this.densityDpi_240()
    } catch (err) {
      Logger.info(TAG, `err is${err.message}`)
    }
  }

  onPageHide() {
    try {
      this.densityDpi_240()
    } catch (err) {
      Logger.info(TAG, `err is${err.message}`)
    }
  }

  aboutToDisappear() {
    try {
      this.densityDpi_240()
    } catch (err) {
      Logger.info(TAG, `err is${err.message}`)
    }
  }

  // 320dpi
  densityDpi_320() {
    let densityDpi: number = 320;
    let screenClass: screen.Screen | null = null;
    screen.getAllScreens((err: BusinessError, data: Array<screen.Screen>) => {
      const errCode: number = err.code;
      if (errCode) {
        Logger.info(TAG, 'Failed to get all screens. Cause:  ' + JSON.stringify(err));
        return;
      }
      Logger.info(TAG, 'Succeeded in getting all screens. Data:' + JSON.stringify(data));
      screenClass = data[0];
      screenClass.setDensityDpi(densityDpi, (err: BusinessError) => {
        const errCode: number = err.code;
        this.strDpi = '320'
        if (errCode) {
          console.error('Failed to set the pixel density of the screen to 320. Code: ' + JSON.stringify(err));
          return;
        }
        console.info('Succeeded in setting the vertical orientation.');
      });
    });
  }

  // 380dpi
  densityDpi_380() {
    let densityDpi: number = 380;
    let screenClass: screen.Screen | null = null;
    screen.getAllScreens((err: BusinessError, data: Array<screen.Screen>) => {
      const errCode: number = err.code;
      if (errCode) {
        Logger.info(TAG, 'Failed to get all screens. Cause:  ' + JSON.stringify(err));
        return;
      }
      Logger.info(TAG, 'Succeeded in getting all screens. Data:' + JSON.stringify(data));
      screenClass = data[0];
      screenClass.setDensityDpi(densityDpi, (err: BusinessError) => {
        this.strDpi = '380'
        const errCode: number = err.code;
        if (errCode) {
          console.error('Failed to set the pixel density of the screen to 320. Code: ' + JSON.stringify(err));
          return;
        }
        console.info('Succeeded in setting the vertical orientation.');
      });
    });
  }

  // 240dpi
  densityDpi_240() {
    let densityDpi: number = 240;
    let screenClass: screen.Screen | null = null;
    screen.getAllScreens((err: BusinessError, data: Array<screen.Screen>) => {
      const errCode: number = err.code;
      if (errCode) {
        Logger.info(TAG, 'Failed to get all screens. Cause:  ' + JSON.stringify(err));
        return;
      }
      Logger.info(TAG, 'Succeeded in getting all screens. Data:' + JSON.stringify(data));
      screenClass = data[0];
      screenClass.setDensityDpi(densityDpi, (err: BusinessError) => {
        this.strDpi = '240'
        const errCode: number = err.code;
        if (errCode) {
          console.error('Failed to set the pixel density of the screen to 320. Code: ' + JSON.stringify(err));
          return;
        }
        console.info('Succeeded in setting the vertical orientation.');
      });
    });
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
            url: 'pages/Screen/Screen_index',
            params: { result: 'None' }
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

      Column() {
        Button('320dpi')
          .margin(20)
          .onClick(() => {
            this.densityDpi_320()
          })
          .margin({ top: 50 })

        Button('380dpi')
          .margin(20)
          .onClick(() => {
            this.densityDpi_380()
          })
          .margin({ top: 50 })

        Row() {
          Text('当前屏幕dpi为：' + this.strDpi)
            .fontSize(18)
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(24)
        .width('50%')
        .height(50)
        .margin({ top: 50 })
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.Black)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })

        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
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
    let fd = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
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
      Logger.error(`save failed, code is ${err.code}, message isaction ${err.message}`);
    }
  }
}

