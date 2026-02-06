'use static';
/**
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
import { Entry,Component,$r,Column,ColumnOptions,BorderImageOption,BorderOptions,AdaptiveColor,
  BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,
  MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,
  ButtonType,EdgeWidths,
  FlexDirection,Padding,HitTestMode,BorderRadiuses,EdgeColors,
  ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,
  Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,
  CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition,ImageRepeat,
  Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,SafeAreaEdge,BlendMode,BlendApplyType,
  CommonAttribute,ThemeColorMode, Rectangle,SafeAreaType,SafeAreaEdge,BlendMode,BlendApplyType,
  DragPreviewMode,BackgroundBlurStyleOptions,SizeOptions,Position,Visibility,Position,
  AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef
} from '@ohos.arkui.stateManagement';
import { CommonModifier } from "@ohos.arkui.modifier";

class CustomModifier extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct CommonExample {
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7)
  private mBorderImage: BorderImageOption = {
    source: { angle: 90,
      direction: GradientDirection.Right,
      colors: [[Color.Red, 0.5], [Color.Red, 0.7], [Color.Red, 1.0]]
    },
    slice: 12,
    width: 21,
    repeat: RepeatMode.Repeat,
    outset: 3,
    fill: false
  } as BorderImageOption

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
  } as BorderOptions

  // private mBackgroundEffect:
  //   BackgroundEffectOptions = {
  //     radius: 50,
  //     saturation: 20,
  //     brightness: 200,
  //     color: Color.Green,
  //     adaptiveColor: AdaptiveColor.DEFAULT,
  //     blurOptions: { grayscale: [1, 1] }
  //   } as BackgroundEffectOptions

  @State buttonModifier: CustomModifier = new CustomModifier()
    .focusOnTouch(true)
    .groupDefaultFocus(false)
    .defaultFocus(true)
    .tabIndex(3)
    .focusable(false)
    .size({ width: 100, height: 30 })

  @State textModifier: CustomModifier = new CustomModifier()
    .saturate(2)
    .colorBlend(Color.Orange)
    .grayscale(1)
    .contrast(1)
    .brightness(1)
    .foregroundColor("#ff0000ff")
    //.borderImage(this.mBorderImage) // 1.1注释
    .pixelStretchEffect({right:5,bottom:5, top:5,left:5})

  @State textModifier2: CustomModifier = new CustomModifier()
    .borderWidth({left:3, top:3, bottom:3, right:3} as EdgeWidths)
    .borderColor({left:Color.Red, top:Color.Red, bottom:Color.Red, right:Color.Red} as EdgeColors)
    .borderStyle(BorderStyle.Dotted)
    .borderRadius({ topLeft:30, topRight:30,bottomLeft:30, bottomRight:30} as BorderRadiuses)
    .backgroundBrightness({ rate: 10, lightUpDegree: 10 })
    .dragPreviewOptions({ mode: DragPreviewMode.AUTO })

  @State textModifier3: CustomModifier = new CustomModifier()
    .border(this.mBorder)
    // .backgroundBlurStyle(BlurStyle.Thin, this.mBackgroundEffect)
    .backgroundBlurStyle(BlurStyle.Thin)
    .layoutWeight(2)
    .constraintSize({maxWidth: 20, minWidth: 10, maxHeight: 30, minHeight: 15})
    .useEffect(true)
    .sphericalEffect(1)
    .lightUpEffect(1)

  @State imageModifier: CustomModifier = new CustomModifier()
    .height(144)
    .width(144)
    .linearGradient({
      angle: 90,
      colors: [[Color.Red, 0.0], [Color.Red, 0.3], [Color.Red, 1.0]],
      direction: GradientDirection.Left,
      repeating: false
    })
    .linearGradientBlur(60, { fractionStops: [[0, 0], [0, 0.66], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })
    .foregroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })

  @State rowModifier: CustomModifier = new CustomModifier()
    .backgroundImage($r("app.media.icon"), ImageRepeat.X)
    .backgroundImageSize({width:"150px",height:"150px"} as SizeOptions)
    .backgroundImagePosition({x:'144px', y: "144px"} as Position)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
    .blendMode(BlendMode.OVERLAY, BlendApplyType.FAST)
    .responseRegion({ x: 0, y: 0, width: '50%', height: '100%' } as  Rectangle )

  @State buttonModifier2: CustomModifier = new CustomModifier()
    .visibility(Visibility.Visible)
    .margin(20)
    .padding({ top: 1, left: 1, bottom: 1, right: 1 } as Padding)
    .opacity(1)
    .backgroundColor(Color.Red)
    .hitTestBehavior(HitTestMode.Default)


  build() {
    Column({ space: 5 } as ColumnOptions) {

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
//
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
        .attributeModifier(this.imageModifier as CustomModifier)

      Row()
        .key("rowModifier")
        .width(144)
        .height(144)
        //backgroundImage, backgroundImageSize, backgroundImagePosition
        //expandSafeArea
        .attributeModifier(this.rowModifier as CustomModifier)

      Button("2nd button")
        .key("buttonModifier2")
        //responseRegion

        //visibility opacity,margin, padding backgroundColor
        .attributeModifier(this.buttonModifier2 as CustomModifier)
    }
    .margin({ top: 5 } as Margin)
  }
}