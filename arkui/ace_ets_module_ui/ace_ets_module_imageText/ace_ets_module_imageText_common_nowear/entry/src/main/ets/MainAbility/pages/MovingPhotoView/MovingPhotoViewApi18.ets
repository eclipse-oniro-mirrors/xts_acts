/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { MovingPhotoView, MovingPhotoViewController, MovingPhotoViewAttribute } from '@ohos.multimedia.movingphotoview';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image'

let context = getContext(this)
let data: photoAccessHelper.MovingPhoto
function delay(milliseconds: number) {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, milliseconds);
  });
}
function checkResourceFile(context: Context) {
  try {
    const sandboxPath = context.filesDir;
    let resourcePath = context.resourceDir;
    let resourcePathArray = fs.listFileSync(resourcePath);
    for (let index = 0; index < resourcePathArray.length; index++) {
      fs.copyFileSync((resourcePath + '/' + resourcePathArray[index]), (sandboxPath + '/' + resourcePathArray[index]))
      delay(2000)
    }
    let sandboxFileArray = fs.listFileSync(sandboxPath)
  } catch (error) {
    console.error(`checkResourceFile failed.err is ${error}`);
  }
}
async function example111() {
  try {
    let imageFileUri = 'file://com.arkui.ace.imageText.common.nowear/data/storage/el2/base/haps/entry/files/test_mov_1.jpg';
    let videoFileUri = 'file://com.arkui.ace.imageText.common.nowear/data/storage/el2/base/haps/entry/files/test_mov_1.mp4';
    data = await photoAccessHelper.MediaAssetManager.loadMovingPhoto(context, imageFileUri, videoFileUri);
    console.info('load moving photo successfully');
  } catch (err) {
    console.error(`load moving photo failed with error: ${err.code}, ${err.message}`);
  }
}

@Entry
@Component
struct MovingPhotoViewApi18 {
  controller: MovingPhotoViewController = new MovingPhotoViewController()
  private aiController: ImageAnalyzerController = new ImageAnalyzerController()
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.OBJECT_LOOKUP, ImageAnalyzerType.TEXT],
    aiController: this.aiController
  }
  @State src: photoAccessHelper.MovingPhoto | undefined = undefined;
  @State imageFit: ImageFit | undefined | null = ImageFit.Contain;
  @State start: string = 'Init';
  @State stop: string = 'Init';
  @State pause: string = 'Init';
  @State finish: string = 'Init';
  @State error: string = 'Init';
  @State play: string = 'Init';
  @State stopPlay: string = 'Init';
  @State complete: string = 'Init';
  @State flag: boolean = false;
  @State autoPlayFlag: boolean = false;
  @State repeatPlayFlag: boolean = false;
  @State autoPlayPeriodStart: number = -1;
  @State autoPlayPeriodEnd: number = -1;
  @State enableAnalyzerFlag: boolean = false;
  @State refresh: string = 'Init';
  aboutToAppear(): void {
    checkResourceFile(context)
    example111()
  }

  build() {
    NavDestination() {
      Column() {
        Stack({ alignContent: Alignment.BottomStart }) {
          MovingPhotoView({
            movingPhoto: data,
            controller: this.controller,
            imageAIOptions: this.options
          })
            .id('MovingPhotoViewApi18')
            .width(200)
            .height(200)
            .muted(this.flag)
            .objectFit(this.imageFit)
            .onStart(() => {
              this.start = 'onStart succ'
            })
            .onStop(() => {
              this.stop = 'onStop succ'
            })
            .onPause(() => {
              this.pause = 'onPause succ'
            })
            .onFinish(() => {
              this.finish = 'onFinish succ'
            })
            .onError(() => {
              this.error = 'onError succ'
            })
            .onComplete(() => {
              this.complete = 'onComplete succ'
            })
            .autoPlay(this.autoPlayFlag)
            .autoPlayPeriod(this.autoPlayPeriodStart, this.autoPlayPeriodEnd)
            .repeatPlay(this.repeatPlayFlag)
            .enableAnalyzer(this.enableAnalyzerFlag)
        }

        Row(){
          Button('Play').id('MovingPhotoViewApi18_playButton')
            .onClick(() => {
              this.controller.startPlayback()
              this.play = 'startPlayback succ'
            })
          Button('Stop').id('MovingPhotoViewApi18_stopButton')
            .onClick(() => {
              this.stop = 'onStop succ'
            })
        }

        Row(){
          Button('StopPlay').id('MovingPhotoViewApi18_stopPlay')
            .onClick(() => {
              this.controller.stopPlayback()
              this.stopPlay = 'stopPlayback succ'
            })
          Button('mute').id('MovingPhotoViewApi18_true')
            .onClick(() => {
              this.flag = true
            })
        }

        Row(){
          Button('error').id('MovingPhotoViewApi18_errorButton')
            .onClick(() => {
              this.error = 'onError succ'
            })
          Button('setAutoPlayPeriod').id('MovingPhotoViewApi18_setAutoPlayPeriod')
            .onClick(() => {
              this.autoPlayPeriodStart = 100
              this.autoPlayPeriodEnd = 500
            })
        }

        Row(){
          Button('autoPlay').id('MovingPhotoViewApi18_autoPlay')
            .onClick(() => {
              this.autoPlayFlag = true
            })
          Button('repeatPlay').id('MovingPhotoViewApi18_repeatPlay_true')
            .onClick(() => {
              this.repeatPlayFlag = true
            })
        }

        Row(){
          Button('enableAnalyzer').id('MovingPhotoViewApi18_enableAnalyzer')
            .onClick(() => {
              this.enableAnalyzerFlag = true
            })
          Button('Refresh').id('MovingPhotoViewApi18_refreshButton')
            .onClick(() => {
              this.controller.refreshMovingPhoto()
              this.refresh = 'refresh succ'
            })
        }

        Text(this.flag + '').id('MovingPhotoViewApi18_mute')
        Text(this.start).id('MovingPhotoViewApi18_start')
        Text(this.stop).id('MovingPhotoViewApi18_stop')
        Text(this.pause).id('MovingPhotoViewApi18_pause')
        Text(this.finish).id('MovingPhotoViewApi18_finish')
        Text(this.error).id('MovingPhotoViewApi18_error')
        Text(this.play).id('MovingPhotoViewApi18_play')
        Text(this.stopPlay).id('MovingPhotoViewApi18_stopPlay1')
        Text(this.complete).id('MovingPhotoViewApi18_complete')
        Text(this.autoPlayPeriodStart + '').id('MovingPhotoViewApi18_autoPlayPeriodStart')
        Text(this.autoPlayPeriodEnd + '').id('MovingPhotoViewApi18_autoPlayPeriodEnd')
        Text(this.autoPlayFlag + '').id('MovingPhotoViewApi18_autoPlay1')
        Text(this.repeatPlayFlag + '').id('MovingPhotoViewApi18_repeatPlay')
        Text(this.enableAnalyzerFlag + '').id('MovingPhotoViewApi18_enableAnalyzerFlag')
        Text(this.refresh).id('MovingPhotoViewApi18_refresh')
      }
    }
  }
}