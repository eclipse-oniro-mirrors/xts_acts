'use static';
/**
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

import {
  Entry, Text, Column, Row, Component, Button, ClickEvent, Image, $r, ResolutionQuality, Color, ColorFilter,
  ImageSourceSize, ImageFit, Resource, IlluminatedType, ImageAnalyzerConfig, ImageAnalyzerType, Matrix4Transit
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import matrix4 from '@ohos.matrix4'

@Entry
@Component
struct ImageUndefined {
  private colorFilterMatrix: Array<number> = [
    1, 0, 1, 0, 1,
    0, 0, 0, 1, 0,
    1, 0, 1, 0, 0,
    0, 1, 0, 1, 0];
  private matrix1: Matrix4Transit = matrix4.identity()
    .translate({ x: -100, y: -100 })
  @State image: Resource = $r('app.media.startIcon');
  @State colorFilterValue: ColorFilter = new ColorFilter(this.colorFilterMatrix);
  @State isColorFilter: boolean = false;
  @State sourceSizeValue: ImageSourceSize = {width: 10, height: 10} as ImageSourceSize;
  @State isSourceSize: boolean = false;
  @State isImageMatrix: boolean = false;
  @State isFitOriginalSize: boolean = false;
  @State isMatchTextDirection: boolean = false;
  @State isOnComplete: boolean = false;
  @State onCompleteValue: string = 'U';

  build() {
    Column() {
      Button('0' + this.isFitOriginalSize).onClick((event: ClickEvent) => {
        this.isFitOriginalSize = !this.isFitOriginalSize;
      }).margin(5).id('fitOriginalSize_action')

      Text('Image')
      Image(this.image)
        .colorFilter(this.isColorFilter ? this.colorFilterValue : undefined)
        .sourceSize(this.isSourceSize ? this.sourceSizeValue : undefined)
        .objectFit(this.isImageMatrix ? ImageFit.MATRIX : ImageFit.Cover)
        .imageMatrix(this.isImageMatrix ? this.matrix1 : undefined)
        .alt(undefined)
        .fitOriginalSize(this.isFitOriginalSize ? true :undefined)
        .matchTextDirection(this.isMatchTextDirection ? true : undefined)
        .onComplete( this.isOnComplete? () => {
          this.onCompleteValue += 'U';
        } : undefined)
        .id('image_action')

      Row() {
        Button('1' + this.isColorFilter).onClick((event: ClickEvent) => {
          this.isColorFilter = !this.isColorFilter;
        }).margin(5).id('colorFilter_action')
        Button('2' + this.isSourceSize).onClick((event: ClickEvent) => {
          this.isSourceSize = !this.isSourceSize;
        }).margin(5).id('sourceSize_action')
        Button('3' + this.isImageMatrix).onClick((event: ClickEvent) => {
          this.isImageMatrix = !this.isImageMatrix;
        }).margin(5).id('imageMatrix_action')
      }

      Row() {
        Button('5' + this.isMatchTextDirection).onClick((event: ClickEvent) => {
          this.isMatchTextDirection = !this.isMatchTextDirection;
        }).margin(5).id('matchTextDirection_action')
        Button('6' + this.isOnComplete).onClick((event: ClickEvent) => {
          this.isOnComplete = !this.isOnComplete;
        }).margin(5).id('onComplete_action')
        Text(this.onCompleteValue)
          .id('onCompleteValue')
      }
    }
    .width('100%')
    .height('100%')
  }
}