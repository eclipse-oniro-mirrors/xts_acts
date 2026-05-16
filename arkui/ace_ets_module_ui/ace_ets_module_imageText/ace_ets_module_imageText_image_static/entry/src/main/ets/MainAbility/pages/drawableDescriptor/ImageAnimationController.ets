'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, Text, Column, Component, Button, ClickEvent, Image, AnimationStatus,
  Row, PixelMap, $r, RowOptions, Resource} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image'
import { UIContext } from '@ohos.arkui.UIContext';
import {
  PixelMapDrawableDescriptor,
  DrawableDescriptor,
  LayeredDrawableDescriptor,
  AnimationOptions,
  AnimatedDrawableDescriptor,
  DrawableDescriptorLoadedResult,
  AnimationController
} from '@ohos.arkui.drawableDescriptor'

@Entry
@Component
struct ImageAnimationController {
  @State animated_: AnimatedDrawableDescriptor | undefined = undefined;
  @State animated_1: AnimatedDrawableDescriptor | undefined = undefined;
  @State animationController_: AnimationController | undefined = undefined;
  @State animationController_1: AnimationController | undefined = undefined;
  @State getStatus: string = '';
  statusToString(status: AnimationStatus): string {
    switch (status) {
      case AnimationStatus.Initial:
        return 'Initial'
      case AnimationStatus.Running:
        return 'Running'
      case AnimationStatus.Paused:
        return 'Paused'
      case AnimationStatus.Stopped:
        return 'Stopped'
      default:
        return 'Error'
    }
    return 'undefined'
  }
  build() {
    Column(undefined) {
      Row() {
      Button('animated')
        .id('animated')
        .onClick((e: ClickEvent) => {
          let resManager = this.getUIContext().getHostContext()?.resourceManager;
          if (resManager) {
            try {
              hilog.info(0x0000, 'testTag', '1');
              let drawableDescriptor1: DrawableDescriptor =
                resManager.getDrawableDescriptor($r('app.media.startIcon').id);
              let pixelmap = drawableDescriptor1.getPixelMap() as PixelMap;
              let drawableDescriptor2: DrawableDescriptor =
                resManager.getDrawableDescriptor($r('app.media.apple').id);
              let pixelmap2 = drawableDescriptor2.getPixelMap() as PixelMap;
              let drawableDescriptor3: DrawableDescriptor =
                resManager.getDrawableDescriptor($r('app.media.flower').id);
              let pixelmap3 = drawableDescriptor3.getPixelMap() as PixelMap;
              let pixelMaps: image.PixelMap[] = [];
              let options: AnimationOptions = {
                duration: 1000,
                iterations: -1,
                autoPlay: false,
                frameDurations: [1000, 4000, 3000]
              };
              let options1: AnimationOptions = {
                duration: 1000,
                iterations: -1,
                autoPlay: true,
                frameDurations: [1000, 4000, 3000]
              };
              pixelMaps.push(pixelmap);
              pixelMaps.push(pixelmap2);
              pixelMaps.push(pixelmap3);
              hilog.info(0x0000, 'testTag', 'AnimatedDrawable 2');
              let animated: AnimatedDrawableDescriptor =
                new AnimatedDrawableDescriptor(pixelMaps as Array<image.PixelMap>, options);
              hilog.info(0x0000, 'testTag', 'AnimatedDrawable 2.5');
              this.animated_ = animated;
              let animated1: AnimatedDrawableDescriptor =
                new AnimatedDrawableDescriptor(pixelMaps as Array<image.PixelMap>, options1);
              hilog.info(0x0000, 'testTag', 'AnimatedDrawable 2.5');
              this.animated_1 = animated1;

              hilog.info(0x0000, 'testTag', 'AnimatedDrawable end');
            } catch (e) {
              console.log('更新图片 catch error：-----------' + e.message);
            }
          }
        })
      Button('C1')
        .id('Controller1')
        .width('20%').height('20%')
        .onClick((e: ClickEvent) => {
          try {
            hilog.info(0x0000, '获取getAnimationController', '1');
            if (this.animated_) {
              let result = (this.animated_ as AnimatedDrawableDescriptor).getAnimationController('image1');
              this.animationController_ = result;
            }
          } catch (e) {
            console.log('获取Result catch error：-----------' + e.message);
          }
        })
    }.width('80%')
      Row() {
        Button('1')
          .id('start')
          .onClick((e: ClickEvent) => {
            try {
              hilog.info(0x0000, 'start()', '1');
              if (this.animationController_) {
                console.log('if (this.animationController_)');
                (this.animationController_ as AnimationController).start();
              }
            } catch (e) {
              console.log('start catch error：-----------' + e.message);
            }
          })

        Button('2')
          .id('stop')
          .onClick((e: ClickEvent) => {
            try {
              hilog.info(0x0000, 'stop()', '1');
              if (this.animationController_) {
                (this.animationController_ as AnimationController).stop();
              }
            } catch (e) {
              console.log('stop catch error：-----------' + e.message);
            }
          })

        Button('3')
          .id('pause')
          .onClick((e: ClickEvent) => {
            try {
              hilog.info(0x0000, 'pause()', '1');
              if (this.animationController_) {
                (this.animationController_ as AnimationController).pause();
              }
            } catch (e) {
              console.log('pause catch error：-----------' + e.message);
            }
          })

        Button('4')
          .id('resume')
          .onClick((e: ClickEvent) => {
            try {
              hilog.info(0x0000, 'resume()', '1');
              if (this.animationController_) {
                (this.animationController_ as AnimationController).resume();
              }
            } catch (e) {
              console.log('resume catch error：-----------' + e.message);
            }
          })
        Button('5')
          .id('c1status')
          .onClick((e: ClickEvent) => {
            try {
              hilog.info(0x0000, 'getStatus()', '1');
              if (this.animationController_) {
                let status =  (this.animationController_ as AnimationController).getStatus();
                console.info(`animation status = ${this.statusToString(status)}`)
                this.getStatus = `status = ${this.statusToString(status)}`
              }
            } catch (e) {
              console.log('getStatus catch error：-----------' + e.message);
            }
          })
      }.width('80%')
      Row(){
        Image(this.animated_ ? this.animated_ as AnimatedDrawableDescriptor : '')
          .width(25)
          .height(25)
          .id('image1')
        Image(this.animated_1 ? this.animated_1 as AnimatedDrawableDescriptor : '')
          .width(25)
          .height(25)
          .id('image2')
      }.width('80%')
      Text(this.getStatus)
        .id('getStatus')
    }.width('100%').height('100%')
  }
}