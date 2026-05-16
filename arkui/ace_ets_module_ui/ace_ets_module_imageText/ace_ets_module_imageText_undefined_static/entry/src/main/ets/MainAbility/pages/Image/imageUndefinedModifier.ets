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
  ImageSourceSize, ImageFit, Resource, IlluminatedType, ImageAnalyzerConfig, ImageAnalyzerType, Matrix4Transit,
  AttributeModifier, ImageAttribute
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import matrix4 from '@ohos.matrix4'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ImageAttribute> {
  public colorFilterMatrix: Array<number> = [
    1, 0, 1, 0, 1,
    0, 0, 0, 1, 0,
    1, 0, 1, 0, 0,
    0, 1, 0, 1, 0];
  public matrix1: Matrix4Transit = matrix4.identity()
    .translate({ x: -100, y: -100 })
  public colorFilterValue: ColorFilter = new ColorFilter(this.colorFilterMatrix);
  public isColorFilter: boolean = false;
  public sourceSizeValue: ImageSourceSize = {width: 10, height: 10} as ImageSourceSize;
  public isSourceSize: boolean = false;
  public isImageMatrix: boolean = false;
  public isFitOriginalSize: boolean = false;
  public isMatchTextDirection: boolean = false;
  public isOnComplete: boolean = false;
  public onCompleteValue: string = 'U';
  applyNormalAttribute(instance: ImageAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct ImageUndefinedModifier {
  @State image: Resource = $r('app.media.startIcon');
  @State modifier: MyModifier = new MyModifier()

  build() {
    Column() {
      Button('0' + this.modifier.isFitOriginalSize).onClick((event: ClickEvent) => {
        this.modifier.isFitOriginalSize = !this.modifier.isFitOriginalSize;
      }).margin(5).id('fitOriginalSize_action_modifier')

      Text('Image')
      Image(this.image)
        .attributeModifier(this.modifier)
        .id('image_action_modifier')

      Row() {
        Button('1' + this.modifier.isColorFilter).onClick((event: ClickEvent) => {
          this.modifier.isColorFilter = !this.modifier.isColorFilter;
        }).margin(5).id('colorFilter_action_modifier')
        Button('2' + this.modifier.isSourceSize).onClick((event: ClickEvent) => {
          this.modifier.isSourceSize = !this.modifier.isSourceSize;
        }).margin(5).id('sourceSize_action_image_undefined_modifier')
        Button('3' + this.modifier.isImageMatrix).onClick((event: ClickEvent) => {
          this.modifier.isImageMatrix = !this.modifier.isImageMatrix;
        }).margin(5).id('imageMatrix_action_modifier')
      }

      Row() {
        Button('5' + this.modifier.isMatchTextDirection).onClick((event: ClickEvent) => {
          this.modifier.isMatchTextDirection = !this.modifier.isMatchTextDirection;
        }).margin(5).id('matchTextDirection_action_modifier')
        Button('6' + this.modifier.isOnComplete).onClick((event: ClickEvent) => {
          this.modifier.isOnComplete = !this.modifier.isOnComplete;
        }).margin(5).id('onComplete_action_image_undefined_modifier')
        Text(this.modifier.onCompleteValue)
          .id('onCompleteValue_modifier')
      }
    }
    .width('100%')
    .height('100%')
  }
}