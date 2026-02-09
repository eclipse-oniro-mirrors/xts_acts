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
import { Entry,Builder,Component,Scroller,GridRow,Scroll,ButtonType,CommonAttribute,OutlineRadiuses,
  BreakpointsReference,GridRowDirection,GridCol,GridItem,Grid,List,Video,Image,BarPosition,
  ButtonAttribute,Resource,$r,FlexAlign,Divider,Tabs,TabContent,TabsController,TextPicker,TextAreaController,
  PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,
  ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,
  CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,Alignment,AlignRuleOption,RenderFit,
  Direction,OutlineStyle,ShadowOptions,Position,Rect,ClickEffectLevel,DragPreviewMode,VerticalAlign,HorizontalAlign,
  AdaptiveColor, HoverEffect, ThemeColorMode, SafeAreaType,SafeAreaEdge,GradientDirection,EdgeOutlineStyles,
  EdgeOutlineWidths,EdgeColors,EdgeOutlineWidths,ObscuredReasons,ProgressMask,
  BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { CommonModifier } from "@ohos.arkui.modifier";
import matrix4 from '@ohos.matrix4'
import UTD from '@ohos.data.uniformTypeDescriptor';

class CustomModifier extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute): void {
    // super.applyNormalAttribute(instance);
  }
  onChange() {
    this.zIndex(5)
  }
}

@Entry
@Component
struct Common1Example {

  @State customModifier: CustomModifier = new CustomModifier()
    .outlineRadius({ topLeft: 10, topRight: "10vp", bottomLeft: "20vp", bottomRight: 13 } as OutlineRadiuses)
    .outlineStyle({top: OutlineStyle.SOLID,left: OutlineStyle.SOLID,bottom: OutlineStyle.SOLID,right: OutlineStyle.SOLID} as EdgeOutlineStyles)
    .outlineWidth({top: 2,left:2,bottom: 2,right: 2} as EdgeOutlineWidths)
    .outlineColor({top: "#FFFFC0CB",left:"#FFFFC0CB",bottom: "#FFFFC0CB",right: "#FFFFC0CB"} as EdgeColors)
    .align(Alignment.TopStart)
    .direction(Direction.Ltr)
    .backdropBlur(20, undefined, undefined)
    .invert(0.5)
    .blur(15)
    .zIndex(2)
    .displayPriority(2)
    .alignSelf(ItemAlign.Start)
    .flexBasis(20)
    .flexGrow(3)
    .flexShrink(4)
    .transform(matrix4.identity()
      .translate({ x: 1, y: 1 })
      .scale({ x: 1, y: 1 })
      .rotate({ x: 0, y: 0, z: 1, angle: 5 }))
    .rotate({ x: 0, y: 0, z: 1, centerX: 0, centerY: 0, centerZ: 0, perspective: 0, angle: 10 })
    .translate({ x: 30, y: 10 })
    .scale({x: 1,y: 1,z: 1,centerX:'120px',centerY:'100px'})


  @State customModifier1: CustomModifier = new CustomModifier()
    .outline({ width: {top: 10,left:10,bottom: 10,right: 10}  as EdgeOutlineWidths} )
    .useShadowBatching(true)
    // .obscured([1]) // No matching call signature for obscured(Array<Int>)
    // .obscured([ObscuredReasons.PLACEHOLDER])
    .shadow({ radius: 10 } as ShadowOptions)
    .renderFit(RenderFit.CENTER)
    .clip(false)
    .radialGradient({
      center: [10, 20],
      radius: 15, colors:
        [['0xff0000', 0.0], ['0x0000ff', 1], ['0xffff00', 2.0]],
      repeating: true
    })
    .sweepGradient({
      center: [50, 50],
      start: 100,
      end: 359,
      colors: [['0xff0000', 0.0], ['0x0000ff', 0.3], ['0xffff00', 1.0]]
    })
    .aspectRatio(2)
    .offset({ x: '10px', y: '20px' } as Position)
    .markAnchor({ x: '15px', y: '25px' } as Position)
    .position({ x: '20px', y: '30px' } as Position)
    // .gridOffset(2)   // 废弃
    // .gridSpan(3) // 废弃
    .renderGroup(true)
    .hueRotate(1)
    .sepia(1)


  @State customModifier2: CommonModifier = new CustomModifier()
    // .mask(new Rect({ height: '280px' }).fill(Color.Gray))
    .mask(new ProgressMask(0, 1, '#80ffffff'))
    .overlay(
      "Winter",
      {
        align: Alignment.Bottom,
        offset: { x: 15, y: 15 }
      }
    )
    .draggable(true)
    .enabled(false)
    .backgroundEffect({
      radius: 0,
      saturation: 20,
      brightness: 200,
      color: "#FF008000",
      adaptiveColor: AdaptiveColor.DEFAULT,
      blurOptions: { grayscale: [1, 1] }
    })


  @State customModifier3: CustomModifier = new CustomModifier()
    .id("testid")

  @State customModifier4: CustomModifier = new CustomModifier()
    .key("testkey")

  @State customModifier5: CustomModifier = new CustomModifier()
    .clickEffect({ level: ClickEffectLevel.HEAVY, scale: 1 })
    .allowDrop([UTD.UniformDataType.PLAIN_TEXT])
    .backgroundBrightness({ rate: 10, lightUpDegree: 10 })
    .dragPreviewOptions({ mode: DragPreviewMode.AUTO })
    .alignRules({
      top: {anchor: "row3", align: VerticalAlign.Bottom},
      center: {anchor: "row4", align: VerticalAlign.Center},
      bottom: {anchor: "__container__", align: VerticalAlign.Bottom},
      left: {anchor: "row3", align: HorizontalAlign.Start},
      right: {anchor: "__container__", align: HorizontalAlign.End}
    } as AlignRuleOption)
    // 导致 白屏，适配暂注
    .allowDrop([UTD.UniformDataType.PLAIN_TEXT])
    .hoverEffect(HoverEffect.Auto)
    .foregroundBlurStyle(BlurStyle.Thin,{ colorMode: ThemeColorMode.DARK, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
    .expandSafeArea([SafeAreaType.SYSTEM],[ SafeAreaEdge.BOTTOM])
    .useEffect(true)
    .linearGradientBlur(60,{ fractionStops: [[0, 0], [0, 0.66], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })

  @State buttonTypeValue: ButtonType = ButtonType.Normal;

  build() {
    Column(){
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange();
      }).key("changeButton")

      Text("Modifier自定义")
        .attributeModifier(this.customModifier as CustomModifier)
        .key("common1")

      Text("Modifier1自定义")
        .attributeModifier(this.customModifier1 as CustomModifier)
        .key("common2")

      Image($r('app.media.icon'))
        .attributeModifier(this.customModifier2 as CustomModifier)
        .key("common3")

      Button('testid', { type: this.buttonTypeValue, stateEffect: true })
        .attributeModifier(this.customModifier3 as CustomModifier)

      Button('testkey', { type: this.buttonTypeValue, stateEffect: true })
        .attributeModifier(this.customModifier4 as CustomModifier)

      Button('testbutton', { type: this.buttonTypeValue, stateEffect: true })
        .attributeModifier(this.customModifier5 as CustomModifier)
        .id("testbutton")

    }
  }
}
