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
  AttributeModifier, Resource, $r} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
class MyImageModifier1 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.supportSvg2(true)
  }
}
class MyImageModifier2 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.supportSvg2(false)
  }
}
class MyImageModifier3 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.supportSvg2(undefined)
  }
}
@Entry
@Component
struct ImageSupportSvg2 {
  @State imageResource: Resource = $r('app.media.svg2');
  @State myModifier1 :MyImageModifier1 = new MyImageModifier1();
  @State myModifier2 :MyImageModifier2 = new MyImageModifier2();
  @State myModifier3 :MyImageModifier3 = new MyImageModifier3();
  build() {
    Column(undefined) {
      Row(){
        Image(this.imageResource)
          .width('10%')
          .height('10%')
          .supportSvg2(true)
          .id('supportSvg2_001')
        Image(this.imageResource)
          .width('10%')
          .height('10%')
          .supportSvg2(false)
          .id('supportSvg2_002')
        Image(this.imageResource)
          .width('10%')
          .height('10%')
          .supportSvg2(undefined)
          .id('supportSvg2_003')
      }
      Row(){
        Image(this.imageResource)
          .width('10%')
          .height('10%')
          .attributeModifier(this.myModifier1)
          .id('supportSvg2_004')
        Image(this.imageResource)
          .width('10%')
          .height('10%')
          .attributeModifier(this.myModifier2)
          .id('supportSvg2_005')
        Image(this.imageResource)
          .width('10%')
          .height('10%')
          .attributeModifier(this.myModifier3)
          .id('supportSvg2_006')
      }
    }.width('100%').height('100%')
  }
}