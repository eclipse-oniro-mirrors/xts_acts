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
struct DrawableLoad {
  @State loadText: string = '';
  @State loadSyncText: string = '';
  @State drawable1: DrawableDescriptor =
    new AnimatedDrawableDescriptor($r('app.media.flower'), { iterations: -1 })
  @State drawable2: DrawableDescriptor =
    new AnimatedDrawableDescriptor('xxx/xxx/xxx', { iterations: -1 })
  @State drawable3: DrawableDescriptor =
    new AnimatedDrawableDescriptor($r('app.media.tree'), { iterations: -1 })
  @State loadError: string = ''
  @State loadSyncError: string = ''

  build() {
    Column() {
      Row(){
        Button('load')
          .height('6%')
          .id('load')
          .onClick((e: ClickEvent) => {
            (this.drawable1 as AnimatedDrawableDescriptor).load().then((result: DrawableDescriptorLoadedResult) => {
              console.log('获取load result.imageWidth:' + result.imageWidth +
                'result.imageHeight' + result.imageHeight);
              this.loadText = 'imageWidth:' + result.imageWidth + ',imageHeight:' +
              result.imageHeight
            }).catch((e: Error) => {
              console.log('获取load catch error：' + e.message);
            })
          })
        Button('loadSync')
          .id('loadSync')
          .onClick((e: ClickEvent) => {
            try {
              if (this.drawable1 || this.drawable2 || this.drawable3 ) {
                let result = (this.drawable3 as AnimatedDrawableDescriptor).loadSync();
                console.log('loadSync result.imageWidth:' + result.imageWidth + ',result.imageHeight' +
                result.imageHeight);
                this.loadSyncText = 'imageWidth:' + result.imageWidth + ',imageHeight:' +
                result.imageHeight
              }
            } catch (e: Error) {
              console.log('loadSync catch error：' + e.message);
            }
          })
      }
      Row(){
        Button('loadError')
          .height('6%')
          .id('loadError')
          .onClick((e: ClickEvent) => {
            (this.drawable2 as AnimatedDrawableDescriptor).load().then((result: DrawableDescriptorLoadedResult) => {
              console.log('load result.imageWidth:' + result.imageWidth +
                'result.imageHeight' + result.imageHeight);
              this.loadText = 'imageWidth:' + result.imageWidth + ',imageHeight:' +
              result.imageHeight
            }).catch((e: Error) => {
              console.log('load catch error：' + e.code);
              this.loadError = JSON.stringify(e.code)
            })
          })
        Button('loadSyncError')
          .id('loadSyncError')
          .onClick((e: ClickEvent) => {
            try {
                let result = (this.drawable2 as AnimatedDrawableDescriptor).loadSync();
                console.log('loadSync result.imageWidth:' + result.imageWidth + ',result.imageHeight' +
                result.imageHeight);
                this.loadSyncText = 'imageWidth:' + result.imageWidth + ',imageHeight:' +
                result.imageHeight
            } catch (e: Error) {
              console.log('load catch error：' + e.code);
              this.loadSyncError = JSON.stringify(e.code)
            }
          })
      }
      Text(this.loadText)
        .id('loadText')
      Text(this.loadSyncText)
        .id('loadSyncText')
      Text(this.loadError)
        .id('loadErrorText')
      Text(this.loadSyncError)
        .id('loadSyncErrorText')
    }.width('100%').height('100%')
  }
}