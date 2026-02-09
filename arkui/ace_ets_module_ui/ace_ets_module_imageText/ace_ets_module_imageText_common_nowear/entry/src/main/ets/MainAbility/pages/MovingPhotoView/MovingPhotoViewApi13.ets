/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct MovingPhotoViewApi13Page {
  controller: MovingPhotoViewController = new MovingPhotoViewController()
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
            controller: this.controller
          })
            .id('MovingPhotoViewApi13')
            .width(200)
            .height('20%')
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
        }

        Row(){
          Button('Play').id('MovingPhotoViewApi13_playButton')
            .onClick(() => {
              this.controller.startPlayback()
              this.play = 'startPlayback succ'
            })
          Button('Stop').id('MovingPhotoViewApi13_stopButton')
            .onClick(() => {
              this.stop = 'onStop succ'
            })
        }
        .height('5%')

        Row(){
          Button('StopPlay').id('MovingPhotoViewApi13_stopPlay')
            .onClick(() => {
              this.controller.stopPlayback()
              this.stopPlay = 'stopPlayback succ'
            })
          Button('mute').id('MovingPhotoViewApi13_true')
            .onClick(() => {
              this.flag = true
            })
        }
        .height('5%')

        Row(){
          Button('error').id('MovingPhotoViewApi13_errorButton')
            .onClick(() => {
              this.error = 'onError succ'
            })
          Button('setAutoPlayPeriod').id('MovingPhotoViewApi13_setAutoPlayPeriod')
            .onClick(() => {
              this.autoPlayPeriodStart = 100
              this.autoPlayPeriodEnd = 500
            })
        }
        .height('5%')

        Row(){
          Button('autoPlay').id('MovingPhotoViewApi13_autoPlay')
            .onClick(() => {
              this.autoPlayFlag = true
            })
          Button('repeatPlay').id('MovingPhotoViewApi13_repeatPlay_true')
            .onClick(() => {
              this.repeatPlayFlag = true
            })
        }
        .height('5%')

        Row(){
          Text(this.flag + '').id('MovingPhotoViewApi13_mute').textAlign(TextAlign.Center).width('30%')
          Text(this.start).id('MovingPhotoViewApi13_start').textAlign(TextAlign.Center).width('30%')
          Text(this.stop).id('MovingPhotoViewApi13_stop').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.pause).id('MovingPhotoViewApi13_pause').textAlign(TextAlign.Center).width('30%')
          Text(this.finish).id('MovingPhotoViewApi13_finish').textAlign(TextAlign.Center).width('30%')
          Text(this.error).id('MovingPhotoViewApi13_error').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.pause).id('MovingPhotoViewApi13_pause').textAlign(TextAlign.Center).width('30%')
          Text(this.finish).id('MovingPhotoViewApi13_finish').textAlign(TextAlign.Center).width('30%')
          Text(this.error).id('MovingPhotoViewApi13_error').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.play).id('MovingPhotoViewApi13_play').textAlign(TextAlign.Center).width('30%')
          Text(this.stopPlay).id('MovingPhotoViewApi13_stopPlay1').textAlign(TextAlign.Center).width('30%')
          Text(this.complete).id('MovingPhotoViewApi13_complete').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.autoPlayPeriodStart + '').id('MovingPhotoViewApi13_autoPlayPeriodStart').textAlign(TextAlign.Center).width('30%')
          Text(this.autoPlayPeriodEnd + '').id('MovingPhotoViewApi13_autoPlayPeriodEnd').textAlign(TextAlign.Center).width('30%')
          Text(this.autoPlayFlag + '').id('MovingPhotoViewApi13_autoPlay1').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.repeatPlayFlag + '').id('MovingPhotoViewApi13_repeatPlay').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
      }
      .height('100%')
    }
  }
}