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
import { Entry, Text, Column, Row, Component, Button, ClickEvent, Image, ImageAttribute,
  AttributeModifier, $r, ContentTransitionEffect, Resource} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

class MyImageModifier1 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.contentTransition(ContentTransitionEffect.IDENTITY)
  }
}
class MyImageModifier2 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.contentTransition(ContentTransitionEffect.OPACITY)
  }
}
class MyImageModifier3 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.contentTransition(undefined)
  }
}
@Entry
@Component
struct ImageContentTransition {
  @State imageResource1: Resource = $r('app.media.flower');
  @State imageResource2: Resource = $r('app.media.flower');
  @State imageResource3: Resource = $r('app.media.flower');
  @State myModifier_1 :MyImageModifier1 = new MyImageModifier1();
  @State myModifier_2 :MyImageModifier2 = new MyImageModifier2();
  @State myModifier_3 :MyImageModifier3 = new MyImageModifier3();
  build() {
    Column(undefined) {
      Row(){
        Image(this.imageResource1)
          .width('10%')
          .height('10%')
          .contentTransition(ContentTransitionEffect.IDENTITY)
          .onClick(() => {
            this.imageResource1 = $r('app.media.icon')
          })
          .key('ContentTransition001')
        Image(this.imageResource2)
          .width('10%')
          .height('10%')
          .contentTransition(ContentTransitionEffect.OPACITY)
          .onClick(() => {
            this.imageResource2 = $r('app.media.icon')
          })
          .key('ContentTransition002')
        Image(this.imageResource3)
          .width('10%')
          .height('10%')
          .contentTransition(undefined)
          .onClick(() => {
            this.imageResource3 = $r('app.media.icon')
          })
          .key('ContentTransition003')
      }.width('80%')
      Row(){
        Image(this.imageResource1)
          .width('10%')
          .height('10%')
          .attributeModifier(this.myModifier_1)
          .onClick(() => {
            this.imageResource1 = $r('app.media.icon')
          })
          .key('ContentTransition004')
        Image(this.imageResource2)
          .width('10%')
          .height('10%')
          .attributeModifier(this.myModifier_2)
          .onClick(() => {
            this.imageResource2 = $r('app.media.icon')
          })
          .key('ContentTransition005')
        Image(this.imageResource3)
          .width('10%')
          .height('10%')
          .attributeModifier(this.myModifier_3)
          .onClick(() => {
            this.imageResource3 = $r('app.media.icon')
          })
          .key('ContentTransition006')
      }.width('80%')
    }.width('100%').height('100%')
  }
}