'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

// import { MovingPhotoView, MovingPhotoViewController, MovingPhotoViewAttribute } from '@ohos.multimedia.movingphotoview';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import fs from '@ohos.file.fs';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { Entry, Column, Component, NavDestination, Stack, ImageFit, Row, Button, Context, Text, Margin, Alignment, ClickEvent, TextAlign} from '@ohos.arkui.component'
import { BusinessError } from '@ohos.base';

// let context = getContext(this)
let data: photoAccessHelper.MovingPhoto
function delay(milliseconds: int) {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, milliseconds);
  });
}
function checkResourceFile(context: Context) {
  try {
    // const sandboxPath = context.filesDir;
    // let resourcePath = context.resourceDir;
    // let resourcePathArray = fs.listFileSync(resourcePath);
    // for (let index = 0; index < resourcePathArray.length; index++) {
    //   fs.copyFileSync((resourcePath + '/' + resourcePathArray[index]), (sandboxPath + '/' + resourcePathArray[index]))
    //   delay(2000)
    // }
    // let sandboxFileArray = fs.listFileSync(sandboxPath)
  } catch (error) {
    console.error(`checkResourceFile failed.err is ${error}`);
  }
}
async function example111() {
  try {
    let imageFileUri = 'file://com.arkui.ace.imageText.nowear.api13/data/storage/el2/base/haps/entry/files/test_mov_1.jpg';
    let videoFileUri = 'file://com.arkui.ace.imageText.nowear.api13/data/storage/el2/base/haps/entry/files/test_mov_1.mp4';
    // data = await photoAccessHelper.MediaAssetManager.loadMovingPhoto(context, imageFileUri, videoFileUri);
    console.info('load moving photo successfully');
  } catch (err) {
    err = err as BusinessError;
    console.error(`load moving photo failed with error: ${err.code}, ${err.message}`);
  }
}

@Entry
@Component
struct MovingPhotoView1 {
  // controller: MovingPhotoViewController = new MovingPhotoViewController()
  @State src: photoAccessHelper.MovingPhoto | undefined = undefined;
  @State ImageFit: ImageFit | undefined | null = ImageFit.Contain;
  @State start: string = "Init";
  @State stop: string = "Init";
  @State pause: string = "Init";
  @State finish: string = "Init";
  @State error: string = "Init";
  @State play: string = "Init";
  @State stopPlay: string = "Init";
  @State complete: string = "Init";
  @State flag: boolean = false;
  @State autoPlayFlag: boolean = false;
  @State repeatPlayFlag: boolean = false;
  @State autoPlayPeriodStart: number = -1;
  @State autoPlayPeriodEnd: number = -1;
  aboutToAppear(): void {
    // checkResourceFile(context)
    example111()
  }

  build() {
    NavDestination() {
      Column() {
        Stack({ alignContent: Alignment.BottomStart }) {
          // MovingPhotoView({
          //   movingPhoto: data,
          //   // controller: this.controller
          // })
          //   .id('MovingPhotoView')
          //   .width(200)
          //   .height('20%')
          //   .muted(this.flag)
          //   .objectFit(this.ImageFit)
          //   .onStart(() => {
          //     this.start = "onStart succ"
          //   })
          //   .onStop(() => {
          //     this.stop = "onStop succ"
          //   })
          //   .onPause(() => {
          //     this.pause = "onPause succ"
          //   })
          //   .onFinish(() => {
          //     this.finish = "onFinish succ"
          //   })
          //   .onError(() => {
          //     this.error = "onError succ"
          //   })
          //   .onComplete(() => {
          //     this.complete = "onComplete succ"
          //   })
          //   .autoPlay(this.autoPlayFlag)
          //   .autoPlayPeriod(this.autoPlayPeriodStart, this.autoPlayPeriodEnd)
          //   .repeatPlay(this.repeatPlayFlag)
        }

        Row(){
          Button('Play').id('MovingPhotoView_playButton')
            .onClick((e: ClickEvent) => {
              // this.controller.startPlayback()
              this.play = "startPlayback succ"
            })
          Button('Stop').id('MovingPhotoView_stopButton')
            .onClick((e: ClickEvent) => {
              this.stop = "onStop succ"
            })
        }
        .height('5%')

        Row(){
          Button('StopPlay').id('MovingPhotoView_stopPlay')
            .onClick((e: ClickEvent) => {
              // this.controller.stopPlayback()
              this.stopPlay = "stopPlayback succ"
            })
          Button('mute').id('MovingPhotoView_true')
            .onClick((e: ClickEvent) => {
              this.flag = true
            })
        }
        .height('5%')

        Row(){
          Button('error').id('MovingPhotoView_errorButton')
            .onClick((e: ClickEvent) => {
              this.error = "onError succ"
            })
          Button('setAutoPlayPeriod').id('MovingPhotoView_setAutoPlayPeriod')
            .onClick((e: ClickEvent) => {
              this.autoPlayPeriodStart = 100
              this.autoPlayPeriodEnd = 500
            })
        }
        .height('5%')

        Row(){
          Button('autoPlay').id('MovingPhotoView_autoPlay')
            .onClick((e: ClickEvent) => {
              this.autoPlayFlag = true
            })
          Button('repeatPlay').id('MovingPhotoView_repeatPlay_true')
            .onClick((e: ClickEvent) => {
              this.repeatPlayFlag = true
            })
        }
        .height('5%')

        Row(){
          Text(this.flag + '').id('MovingPhotoView_mute').textAlign(TextAlign.Center).width('30%')
          Text(this.start).id('MovingPhotoView_start').textAlign(TextAlign.Center).width('30%')
          Text(this.stop).id('MovingPhotoView_stop').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.pause).id('MovingPhotoView_pause').textAlign(TextAlign.Center).width('30%')
          Text(this.finish).id('MovingPhotoView_finish').textAlign(TextAlign.Center).width('30%')
          Text(this.error).id('MovingPhotoView_error').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.pause).id('MovingPhotoView_pause').textAlign(TextAlign.Center).width('30%')
          Text(this.finish).id('MovingPhotoView_finish').textAlign(TextAlign.Center).width('30%')
          Text(this.error).id('MovingPhotoView_error').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.play).id('MovingPhotoView_play').textAlign(TextAlign.Center).width('30%')
          Text(this.stopPlay).id('MovingPhotoView_stopPlay1').textAlign(TextAlign.Center).width('30%')
          Text(this.complete).id('MovingPhotoView_complete').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.autoPlayPeriodStart + '').id('MovingPhotoView_autoPlayPeriodStart').textAlign(TextAlign.Center).width('30%')
          Text(this.autoPlayPeriodEnd + '').id('MovingPhotoView_autoPlayPeriodEnd').textAlign(TextAlign.Center).width('30%')
          Text(this.autoPlayFlag + '').id('MovingPhotoView_autoPlay1').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
        Row(){
          Text(this.repeatPlayFlag + '').id('MovingPhotoView_repeatPlay').textAlign(TextAlign.Center).width('30%')
        }.height('5%')
      }
      .height('100%')
    }
  }
}