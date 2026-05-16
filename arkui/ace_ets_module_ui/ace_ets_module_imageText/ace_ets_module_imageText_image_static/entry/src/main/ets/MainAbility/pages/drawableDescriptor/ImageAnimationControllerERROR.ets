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
struct ImageAnimationControllerERROR {
  @State animated_: AnimatedDrawableDescriptor | undefined = undefined;
  @State animated_1: AnimatedDrawableDescriptor | undefined = undefined;
  @State animatedDrawable1?: AnimatedDrawableDescriptor | Resource = undefined
  @State animationController_: AnimationController | undefined = undefined;
  @State animationController_1: AnimationController | undefined = undefined;
  @State getStatus1: string = '';
  @State controllerText: string = '';
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
    // return 'undefined'
  }
  build() {
    Column(undefined) {
      Row() {
      Button('animated')
        .id('animated')
        .height('6%')
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
            } catch (e: Error) {
              console.log('更新图片 catch error：-----------' + e.message);
            }
          }
        })
        Button('C2')
          .id('Controller2')
          .onClick((e: ClickEvent) => {
            try {
              hilog.info(0x0000, 'getAnimationController', '1');
              if (this.animated_1) {
                let result = (this.animated_1 as AnimatedDrawableDescriptor).getAnimationController('image5');
                this.animationController_1 = result;
                console.log('Result catch result：-----------' + result);
                this.controllerText = JSON.stringify(result)
              }
            } catch (e: Error) {
              console.log('Result catch error：-----------' + e.message);
            }
          })
    }.width('80%')
      Row() {
        Button('c1')
          .id('c3start')
          .height('6%')
          .fontSize(10)
          .onClick(() => {
            if (this.animated_1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animated_1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.start()

            }
          })
        Button('c2')
          .id('c3stop')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animated_1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animated_1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.stop()
              console.log('getAnimationController：-----------');
            }
          })
        Button('c3')
          .id('c3pause')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animated_1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animated_1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.pause()
            }
          })
        Button('c3')
          .id('c3resume')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animated_1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animated_1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.resume()
            }
          })
        Button('c4')
          .id('c3status')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            try {
              if (this.animated_1 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animated_1 as AnimatedDrawableDescriptor
                let status = drawable?.getAnimationController()?.getStatus()
                console.info(`animation status =`+ status)
                this.getStatus1 = `status = `+ status
              }
            } catch (error) {
            }
          })
      }.width('80%')
      Row(){
        Image(this.animated_1 ? this.animated_1 as AnimatedDrawableDescriptor : '')
          .width(25)
          .height(25)
          .id('image2')
        Image(this.animated_1 ? this.animated_1 as AnimatedDrawableDescriptor : '')
          .width(25)
          .height(25)
      }.width('80%')
      Text(this.controllerText)
        .id('ControllerText')
      Text(this.getStatus1)
        .id('getStatus1')
    }.width('100%').height('100%')
  }
}