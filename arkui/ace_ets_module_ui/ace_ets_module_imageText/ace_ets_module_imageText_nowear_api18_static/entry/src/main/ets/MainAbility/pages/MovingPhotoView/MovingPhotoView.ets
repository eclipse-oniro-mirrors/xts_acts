'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image'
import { Entry, Component, ImageAnalyzerController, ClickEvent, Row, Stack, Text, Column, ImageAIOptions, ImageFit,
  ImageAnalyzerType, NavDestination, Alignment, Button } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@ohos.base';
let data: photoAccessHelper.MovingPhoto
function delay(milliseconds: int) {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, milliseconds);
  });
}
function checkResourceFile(context: common.Context | undefined) {
  try {
    const sandboxPath = context!.filesDir;
    let resourcePath = context!.resourceDir;
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
async function example111(context: common.Context | undefined) {
  try {
    let imageFileUri = 'file://com.arkui.ace.imageText.nowear.api18/data/storage/el2/base/haps/entry/files/test_mov_1.jpg';
    let videoFileUri = 'file://com.arkui.ace.imageText.nowear.api18/data/storage/el2/base/haps/entry/files/test_mov_1.mp4';
    data = await photoAccessHelper.MediaAssetManager.loadMovingPhoto(context as common.Context, imageFileUri, videoFileUri);
    console.info('load moving photo successfully');
  } catch (err: BusinessError){
    console.error(`load moving photo failed with error: ${err.code}, ${err.message}`);
  }
}

@Entry
@Component
struct MovingPhotoView1 {
  // controller: MovingPhotoViewController = new MovingPhotoViewController()
  private aiController: ImageAnalyzerController = new ImageAnalyzerController()
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.OBJECT_LOOKUP, ImageAnalyzerType.TEXT],
    aiController: this.aiController
  } as ImageAIOptions
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
  @State enableAnalyzerFlag: boolean = false;
  @State refresh: string = "Init";
  aboutToAppear(): void {
    checkResourceFile(AppStorage.get<common.Context>('applicationContext'))
    example111(AppStorage.get<common.Context>('applicationContext'))
  }

  build() {
    NavDestination() {
      Column() {
        Stack({ alignContent: Alignment.BottomStart }) {
        //   MovingPhotoView({
        //     movingPhoto: data,
        //     controller: this.controller,
        //     imageAIOptions: this.options
        //   })
        //     .id('MovingPhotoView')
        //     .width(200)
        //     .height(200)
        //     .muted(this.flag)
        //     .objectFit(this.ImageFit)
        //     .onStart(() => {
        //       this.start = "onStart succ"
        //     })
        //     .onStop(() => {
        //       this.stop = "onStop succ"
        //     })
        //     .onPause(() => {
        //       this.pause = "onPause succ"
        //     })
        //     .onFinish(() => {
        //       this.finish = "onFinish succ"
        //     })
        //     .onError(() => {
        //       this.error = "onError succ"
        //     })
        //     .onComplete(() => {
        //       this.complete = "onComplete succ"
        //     })
        //     .autoPlay(this.autoPlayFlag)
        //     .autoPlayPeriod(this.autoPlayPeriodStart, this.autoPlayPeriodEnd)
        //     .repeatPlay(this.repeatPlayFlag)
        //     .enableAnalyzer(this.enableAnalyzerFlag)
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

        Row(){
          Button('enableAnalyzer').id('MovingPhotoView_enableAnalyzer')
            .onClick((e: ClickEvent) => {
              this.enableAnalyzerFlag = true
            })
          Button('Refresh').id('MovingPhotoView_refreshButton')
            .onClick((e: ClickEvent) => {
              // this.controller.refreshMovingPhoto()
              this.refresh = "refresh succ"
            })
        }

        Text(this.flag + '').id('MovingPhotoView_mute')
        Text(this.start).id('MovingPhotoView_start')
        Text(this.stop).id('MovingPhotoView_stop')
        Text(this.pause).id('MovingPhotoView_pause')
        Text(this.finish).id('MovingPhotoView_finish')
        Text(this.error).id('MovingPhotoView_error')
        Text(this.play).id('MovingPhotoView_play')
        Text(this.stopPlay).id('MovingPhotoView_stopPlay1')
        Text(this.complete).id('MovingPhotoView_complete')
        Text(this.autoPlayPeriodStart + '').id('MovingPhotoView_autoPlayPeriodStart')
        Text(this.autoPlayPeriodEnd + '').id('MovingPhotoView_autoPlayPeriodEnd')
        Text(this.autoPlayFlag + '').id('MovingPhotoView_autoPlay1')
        Text(this.repeatPlayFlag + '').id('MovingPhotoView_repeatPlay')
        Text(this.enableAnalyzerFlag + '').id('MovingPhotoView_enableAnalyzerFlag')
        Text(this.refresh).id('MovingPhotoView_refresh')
      }
    }
  }
}