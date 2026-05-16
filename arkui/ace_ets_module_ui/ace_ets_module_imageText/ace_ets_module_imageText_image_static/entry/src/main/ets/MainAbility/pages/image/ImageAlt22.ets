'use static'
/*
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
import { Entry, Text, Column, Row, Component, Button, ClickEvent, Image, ImageAttribute, AttributeModifier, $r,
  Resource, PixelMap} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import {
  PixelMapDrawableDescriptor,
  DrawableDescriptor,
  LayeredDrawableDescriptor,
  AnimationOptions,
  AnimatedDrawableDescriptor
} from '@ohos.arkui.drawableDescriptor';
class MyImageModifier1 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.alt({
      placeholder: '/resources/rawfile/apple.jpg',
      error: '/resources/rawfile/hand.png'
    })
  }
}
class MyImageModifier2 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.alt({
      placeholder: undefined,
      error: undefined
    })
  }
}
@Entry
@Component
struct ImageAlt22 {
  @State modifier1 :MyImageModifier1 = new MyImageModifier1();
  @State modifier2 :MyImageModifier2 = new MyImageModifier2();
  private getPixmapFromMedia(resource: Resource): PixelMap {
    let resManager = this.getUIContext().getHostContext()?.resourceManager;
    let pixmap: DrawableDescriptor = new DrawableDescriptor();
    if (resManager) {
      pixmap = (resManager.getDrawableDescriptor(resource.id)) as DrawableDescriptor;
    }
    return pixmap.getPixelMap() as PixelMap;
  }
  pixMap: PixelMap | undefined =
    new PixelMapDrawableDescriptor(this.getPixmapFromMedia($r('app.media.apple'))).getPixelMap();
  pixMap1: PixelMap | undefined =
    new PixelMapDrawableDescriptor(this.getPixmapFromMedia($r('app.media.apple'))).getPixelMap();
  build() {
    Column(undefined) {
      Row(){
        Image('common/pages/apple')
          .width('10%')
          .height(35)
          .alt({
            placeholder: '/resources/rawfile/apple.jpg',
            error: '/resources/rawfile/hand.png'
          })
          .key('image001')
        Image('common/pages/apple')
          .width('10%')
          .height(35)
          .alt({
            placeholder: undefined,
            error: undefined
          })
          .key('image002')
      }.width('80%')
      Row(){
        Image('common/pages/apple')
          .width('10%')
          .height(35)
          .attributeModifier(this.modifier1)
          .key('image003')
        Image('common/pages/apple')
          .width('10%')
          .height(35)
          .attributeModifier(this.modifier2)
          .key('image004')
      }.width('80%')
      Row(){
        Image('common/pages/apple')
          .width('10%')
          .height(35)
          .alt({
            placeholder: this.pixMap,
            error: this.pixMap1
          })
          .key('image005')
      }.width('80%')
    }.width('100%').height('100%')
  }
}