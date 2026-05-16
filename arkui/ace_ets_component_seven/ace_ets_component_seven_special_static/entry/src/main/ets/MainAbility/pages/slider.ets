'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, SliderAttribute, SliderBlockStyle, CircleOptions,Circle, Ellipse, Path, Rect, Row, Color,
  SliderBlockType, $r, Column, Slider, RectOptions, SliderStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { CircleShape, EllipseShape, PathShape, RectShape } from '@ohos.arkui.shape';

class SliderBlockBorderColorModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.blockBorderColor(0xFFA500)
  }
}
class SliderBlockBorderWidthModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.blockBorderWidth(5)
  }
}
class SliderStepColorModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.stepColor(0xffa500)
  }
}
class SliderTrackBorderRadiusModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.trackBorderRadius(0)
  }
}
class SliderBlockSizeModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.blockSize({ width: 0, height: 0 })
  }
}
class SliderStepSizeModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.stepSize(0)
  }
}
class SliderBlockStyleModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.blockStyle({ type: SliderBlockType.DEFAULT })
  }
}
class SliderBlockColorModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.blockColor(Color.Blue)
  }
}
class SliderTrackColorModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.trackColor(Color.Gray)
  }
}
class SliderSelectedColorModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.selectedColor(Color.Blue)
  }
}
class SliderShowStepsModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.showSteps(true)
  }
}
class SliderShowTipsModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.showTips(true)
  }
}
class SliderTrackThicknessModifier1 implements AttributeModifier<SliderAttribute>{
  applyNormalAttribute(instance: SliderAttribute): void {
    instance.trackThickness(1)
  }
}

@Entry
@Component
struct SliderTest {
  @State message: string = 'Hello Worlds'
  @State str: string = '200'
  @State inSetValueOne: number = 40;
  // circle = new Circle({ width: '280px', height: '280px' }).fill('#FFFF0000')
  // Ellipse = new Ellipse({ width: '280px', height: '280px' }).fill('#FFFF0000')
  // Path = new Path({ width: '280px', height: '280px' }).fill('#FFFF0000')
  // Rect = new Rect({ width: '280px', height: '280px' }).fill('#FFFF0000')
  // private sliderImage: SliderBlockStyle = { type: SliderBlockType.IMAGE, image: $r('app.media.icon') }
  // private sliderShapeCircle: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.circle }
  // private sliderShapeEllipse: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.Ellipse }
  // private sliderShapePath: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.Path }
  // private sliderShapeRect: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.Rect }
  // private sliderDefault: SliderBlockStyle = { type: SliderBlockType.DEFAULT }

  @State blockBorderColormodifier1 : SliderBlockBorderColorModifier1 =  new SliderBlockBorderColorModifier1()
  @State blockBorderWidthmodifier1 : SliderBlockBorderWidthModifier1 =  new SliderBlockBorderWidthModifier1()
  @State stepColormodifier1 : SliderStepColorModifier1 =  new SliderStepColorModifier1()
  @State trackBorderRadiusmodifier1 : SliderTrackBorderRadiusModifier1 =  new SliderTrackBorderRadiusModifier1()
  @State blockSizemodifier1 : SliderBlockSizeModifier1 =  new SliderBlockSizeModifier1()
  @State stepSizemodifier1 : SliderStepSizeModifier1 =  new SliderStepSizeModifier1()
  @State blockStylemodifier1 : SliderBlockStyleModifier1 =  new SliderBlockStyleModifier1()
  @State blockColormodifier1 : SliderBlockColorModifier1 =  new SliderBlockColorModifier1()
  @State trackColormodifier1 : SliderTrackColorModifier1 =  new SliderTrackColorModifier1()
  @State selectedColormodifier1 : SliderSelectedColorModifier1 =  new SliderSelectedColorModifier1()
  @State showStepsmodifier1 : SliderShowStepsModifier1 =  new SliderShowStepsModifier1()
  @State showTipsmodifier1 : SliderShowTipsModifier1 =  new SliderShowTipsModifier1()
  @State trackThicknessmodifier1 : SliderTrackThicknessModifier1 =  new SliderTrackThicknessModifier1()

  build() {
    Row() {
      Column() {
        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0100')
          .attributeModifier(this.blockBorderColormodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0100')
          .attributeModifier(this.blockBorderWidthmodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0100')
          .attributeModifier(this.stepColormodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0100')
          .attributeModifier(this.trackBorderRadiusmodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0100')
          .attributeModifier(this.blockSizemodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0100')
          .attributeModifier(this.stepSizemodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0100')
          .attributeModifier(this.blockStylemodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockColor_0100')
          .attributeModifier(this.blockColormodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackColor_0100')
          .attributeModifier(this.trackColormodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_selectedColor_0100')
          .attributeModifier(this.selectedColormodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_showSteps_0100')
          .attributeModifier(this.showStepsmodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_showTips_0100')
          .attributeModifier(this.showTipsmodifier1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackThickness_0100')
          .attributeModifier(this.trackThicknessmodifier1)
      }
      .width('100%')
    }
    .height('100%')
  }
}