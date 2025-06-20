/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { CommonModifier } from "@ohos.arkui.modifier";

class CustomModifier extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct CommonExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  private mBorderImage: BorderImageOption = {
    source: { angle: 90,
      direction: GradientDirection.Right,
      colors: [[0xAEE1E1, 0.5], [0xD3E0DC, 0.7], [0xFCD1D1, 1.0]]
    },
    slice: 12,
    width: 21,
    repeat: RepeatMode.Repeat,
    outset: 3,
    fill: false
  }

  private mBorder: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
  }

  private mBackgroundEffect:
    BackgroundEffectOptions = {
      radius: 50,
      saturation: 20,
      brightness: 200,
      color: Color.Green,
      adaptiveColor: AdaptiveColor.DEFAULT,
      blurOptions: { grayscale: [1, 1] }
    }

  @State buttonModifier: CommonModifier = new CustomModifier()
    .focusOnTouch(true)
    .groupDefaultFocus(false)
    .defaultFocus(true)
    .tabIndex(3)
    .focusable(false)
    .size({ width: 100, height: 30 })

  @State textModifier: CommonModifier = new CustomModifier()
    .saturate(2)
    .colorBlend(Color.Orange)
    .grayscale(1)
    .contrast(1)
    .brightness(1)
    .foregroundColor("#ff0000ff")
    //.borderImage(this.mBorderImage)
    .pixelStretchEffect({right:5,bottom:5, top:5,left:5})
  
  @State textModifier2: CommonModifier = new CustomModifier()
    .borderWidth(3)
    .borderColor(Color.Red)
    .borderStyle(BorderStyle.Dotted)
    .borderRadius(30)
    .backgroundBrightness({ rate: 10, lightUpDegree: 10 })
    .dragPreviewOptions({ mode: DragPreviewMode.AUTO })

  @State textModifier3: CommonModifier = new CustomModifier()
    .border(this.mBorder)
    .backgroundBlurStyle(BlurStyle.Thin, this.mBackgroundEffect)
    .layoutWeight(2)
    .constraintSize({maxWidth: 20, minWidth: 10, maxHeight: 30, minHeight: 15})
    .useEffect(true)
    .sphericalEffect(1)
    .lightUpEffect(1)

  @State imageModifier: CommonModifier = new CustomModifier()
    .height(144)
    .width(144)
    .linearGradient({
      angle: 90,
      colors: [[0xff0000, 0.0], [0x0000ff, 0.3], [0xffff00, 1.0]],
      direction: GradientDirection.Left,
      repeating: false
    })
    .linearGradientBlur(60, { fractionStops: [[0, 0], [0, 0.66], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })
    .foregroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })

  @State rowModifier: CommonModifier = new CustomModifier()
    .backgroundImage($r("app.media.icon"), ImageRepeat.X)
    .backgroundImageSize({width:"150px",height:"150px"})
    .backgroundImagePosition({x:'144px', y: "144px"})
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
    .blendMode(BlendMode.OVERLAY, BlendApplyType.FAST)
    .responseRegion({ x: 0, y: 0, width: '50%', height: '100%' })

  @State buttonModifier2: CommonModifier = new CustomModifier()
    .visibility(Visibility.Visible)
    .margin(20)
    .padding({ top: 1, left: 1, bottom: 1, right: 1 })
    .opacity(1)
    .backgroundColor(Color.Red)
    .hitTestBehavior(HitTestMode.Default)

        
  build() {
    Column({ space: 5 }) {

      Button('First Button')
        .key("buttonModifier") 
        //focusable, tabIndex, defaultFocus, groupDefaultFocus, focusOnTouch
        //size
        .attributeModifier(this.buttonModifier as CustomModifier)

      Text("Modifier自定义")
        .key("textModifier") 
        //brightness, contrast, grayscale, colorBlend, saturate
        //foregroundColor，borderImage
        //pixelStretchEffect
        .attributeModifier(this.textModifier as CustomModifier)

      Text("Modifier自定义2")
        .key("textModifier2") 
        //borderWidth, borderColor, borderStyle, borderRadius
        //backgroundBrightness, dragPreviewOptions
        .attributeModifier(this.textModifier2 as CustomModifier)

      Text("Modifier自定义3")
        .key("textModifier3") 
        //border, backgroundBlurStyle, 
        //layoutWeight, constraintSize, useEffect, sphericalEffect, lightUpEffect        
        .attributeModifier(this.textModifier3 as CustomModifier)

      Image($r('app.media.icon'))
        .key("imageModifier")
        //foregroundBlurStyle
        //width, height
        //linearGradient, linearGradientBlur
        .attributeModifier(this.imageModifier as CommonModifier)

      Row()
        .key("rowModifier")
        .width(144)
        .height(144)
        //backgroundImage, backgroundImageSize, backgroundImagePosition
        //expandSafeArea
        .attributeModifier(this.rowModifier as CommonModifier)

      Button("2nd button")
        .key("buttonModifier2") 
        //responseRegion

        //visibility opacity,margin, padding backgroundColor
        .attributeModifier(this.buttonModifier2 as CommonModifier)
    }
    .margin({ top: 5 })
  }
}