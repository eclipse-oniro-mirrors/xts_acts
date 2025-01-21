/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
//@ts-nocheck
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

@Entry
@Component
struct SliderTest {
  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  @State message: string = 'Hello Worlds'
  @State str: string = '200'
  @State inSetValueOne: number = 40;
  circle = new Circle({ width: '280px', height: '280px' }).fill('#FFFF0000')
  Ellipse = new Ellipse({ width: '280px', height: '280px' }).fill('#FFFF0000')
  Path = new Path({ width: '280px', height: '280px' }).fill('#FFFF0000')
  Rect = new Rect({ width: '280px', height: '280px' }).fill('#FFFF0000')
  private sliderImage: SliderBlockStyle = { type: SliderBlockType.IMAGE, image: $r('app.media.icon') }
  private sliderShapeCircle: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.circle }
  private sliderShapeEllipse: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.Ellipse }
  private sliderShapePath: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.Path }
  private sliderShapeRect: SliderBlockStyle = { type: SliderBlockType.SHAPE, shape: this.Rect }
  private sliderDefault: SliderBlockStyle = { type: SliderBlockType.DEFAULT }

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
          .blockBorderColor(0xffa500)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0200')
          .blockBorderColor('#ffc709e9')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0300')
          .blockBorderColor(Color.Pink)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0400')
          .blockBorderColor($r("app.color.start_block_Border_Color"))

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0500')
          .blockBorderColor(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0600')
          .blockBorderColor("rgb(0,255,255)")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0700')
          .blockBorderColor(0x00ff00)
          .backgroundColor(Color.Pink)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0800')
          .blockBorderColor(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_0900')
          .blockBorderColor('bgr(138,43,226)')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_1000')
          .blockBorderColor('')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_1100')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_1200')
          .blockBorderColor(0xffa500)
          .blockBorderColor('#ffc709e9')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderColor_1300')
          .blockBorderColor(0xffa500)
          .blockBorderColor('bgr(138,43,226)')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0100')
          .blockBorderWidth(5)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0200')
          .blockBorderWidth('5px')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0300')
          .blockBorderWidth($r("app.string.block_border_width_test"))

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0400')
          .blockBorderWidth('')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0500')
          .blockBorderWidth(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0600')
          .blockBorderWidth(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0700')
          .blockBorderWidth(0)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0800')
          .blockBorderWidth(-1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_0900')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_1000')
          .blockBorderWidth(5)
          .blockBorderWidth(7)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_1100')
          .blockBorderWidth(5)
          .blockBorderWidth(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_1200')
          .blockBorderWidth('asdf%^7')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockBorderWidth_1300')
          .blockBorderWidth(5)
          .width(7)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0100')
          .stepColor(0xffa500)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0200')
          .stepColor('#ffc709e9')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0300')
          .stepColor(Color.Pink)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0400')
          .stepColor($r("app.color.start_Step_Color"))

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0500')
          .stepColor(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0600')
          .stepColor("rgb(0,255,255)")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0700')
          .stepColor(0x00ff00)
          .backgroundColor(Color.Pink)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0800')
          .stepColor(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_0900')
          .stepColor('bgr(138,43,226)')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_1000')
          .stepColor('')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_1100')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_1200')
          .stepColor(0xffa500)
          .stepColor('#ffc709e9')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_1300')
          .stepColor(0xffa500)
          .stepColor('bgr(138,43,226)')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0100')
          .trackBorderRadius(0)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0200')
          .trackBorderRadius(10)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0300')
          .trackBorderRadius('60px')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0400')
          .trackBorderRadius('120%')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0500')
          .trackBorderRadius($r("app.string.trach_border_radius_test"))

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0600')
          .trackBorderRadius("")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0700')
          .trackBorderRadius(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0800')
          .trackBorderRadius(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_0900')
          .trackBorderRadius(-1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_1000')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_1100')
          .trackBorderRadius(10)
          .trackBorderRadius(40)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_1200')
          .trackBorderRadius(10)
          .trackBorderRadius(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_1300')
          .trackBorderRadius("asdf#$8")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_trackBorderRadius_1400')
          .trackBorderRadius(0)
          .size(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0100')
          .blockSize({ width: 0, height: 0 })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0200')
          .blockSize({ width: 5, height: 5 })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0300')
          .blockSize({ width: 15, height: 20 })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0400')
          .blockSize({ width: 12, height: 12 })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0500')
          .blockSize({ width: "20px", height: "20px" })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0600')
          .blockSize({ width: "120%", height: "120%" })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0700')
          .blockSize({
            width: $r("app.string.block_size_width_test"),
            height: $r("app.string.block_size_height_test")
          })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0800')
          .blockSize({ width: " ", height: " " })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_0900')
          .blockSize({ width: null, height: null })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1000')
          .blockSize({ width: undefined, height: undefined })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1100')
          .blockSize({ width: -1, height: -1 })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1200')
          .blockSize({ width: -1, height: 15 })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1300')
          .blockSize({ width: "15", height: "-1" })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1400')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .key('ArkUX_Stage_Slider_blockSizeOutSet_1400')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1500')
          .blockSize({ width: 15, height: 20 })
          .blockSize({ width: "20fp", height: "25fp" })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1600')
          .blockSize({ width: 15, height: 20 })
          .blockSize({ width: -1, height: -1 })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1700')
          .blockSize({ width: "asdf#$8", height: "asdf#$8" })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockSize_1800')
          .blockSize({ width: "20lpx", height: "20lpx" })

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0100')
          .stepSize(0)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0200')
          .stepSize(10)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0300')
          .stepSize("60px")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0400')
          .stepSize("120%")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0500')
          .stepSize($r("app.string.step_size_test"))

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0600')
          .stepSize("")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0700')
          .stepSize(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0800')
          .stepSize(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_0900')
          .stepSize(-1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_1000')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_1100')
          .stepSize(10)
          .stepSize(40)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepColor_marker_color_marker_color_aalpha')
          .backgroundColor($r("sys.color.ohos_id_color_foreground"))
          .opacity($r("sys.float.ohos_id_alpha_normal_bg"))

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_1200')
          .stepSize(10)
          .stepSize(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_1300')
          .stepSize("asdf#$8")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_stepSize_1400')
          .stepSize(10)
          .size(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_Test_0100')
          .blockBorderColor('#ffc709e9')
          .blockBorderWidth(10)
          .stepColor('#fff10202')
          .trackBorderRadius(15)
          .blockSize({ width: 10, height: 10 })
          .stepSize(10)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0100')
          .blockStyle(this.sliderDefault)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0200')

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0300')
          .blockStyle(this.sliderImage)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0400')
          .blockStyle(this.sliderShapeCircle)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0500')
          .blockStyle(this.sliderShapeEllipse)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0600')
          .blockStyle(this.sliderShapePath)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0700')
          .blockStyle(this.sliderShapeRect)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0800')
          .blockStyle(this.sliderDefault)
          .blockStyle(this.sliderShapeCircle)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_0900')
          .blockStyle(this.sliderImage)
          .blockStyle(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_1000')
          .blockStyle(" ")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_1100')
          .blockStyle(null)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_1200')
          .blockStyle(undefined)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_1300')
          .blockStyle(-1)

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('ArkUX_Stage_Slider_blockStyle_1400')
          .blockStyle(this.sliderShapeCircle)
          .size(null)
      }
      .width('100%')
    }
    .height('100%')
  }
}
