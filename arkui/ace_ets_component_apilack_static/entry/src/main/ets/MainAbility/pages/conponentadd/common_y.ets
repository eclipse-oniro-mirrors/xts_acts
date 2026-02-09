'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../../common/Log';
import {
  Alignment,
  AlignRuleOption,
  BlurStyle,
  Button,
  ClickEvent,
  Color,
  CommonMethod,
  Component,
  Configuration,
  ConstraintSizeOptions,
  CustomStyles,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  GeometryInfo,
  GradientDirection,
  HitTestMode,
  HorizontalAlign,
  HoverEffect,
  ItemAlign,
  KeyEvent,
  KeyType,
  Layoutable,
  LocalizedAlignRuleOptions,
  Measurable,
  MeasureResult,
  RepeatMode,
  SizeResult,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  VerticalAlign
} from '@ohos.arkui.component';
import { Environment } from 'arkui.stateManagement.storage.environment';
import { State } from '@ohos.arkui.stateManagement';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CommonBackgroundBlurStyle {
  @State value: string = ''
  isEnv: boolean = Environment.envProp<string>('accessibilityEnabled', 'default')
  configuration: Configuration = {
    colorMode: "xxx",
    fontScale: 20
  } as Configuration
  result: SizeResult = {
    width: 0,
    height: 0
  } as SizeResult;

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>, constraint: ConstraintSizeOptions) {
    let startPos = 300;
    let pos = startPos - children[0].measureResult.height;
    children[0].layout({ x: pos, y: pos })
  }

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>,
    constraint: ConstraintSizeOptions): SizeResult {
    let size = 100;
    let result: MeasureResult = children[0].measure({
      minHeight: size,
      minWidth: size,
      maxWidth: size,
      maxHeight: size
    }) as MeasureResult
    size += result.width / 2;
    this.result.width = 100;
    this.result.height = 400;
    return this.result;
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CommonBackgroundBlurStyle start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CommonBackgroundBlurStyle end`)
  }

  onPageHide(): void {
    Log.showInfo(TAG, `onPageHide CommonBackgroundBlurStyle start`)
  }

  onBackPress(): boolean {
    Log.showInfo(TAG, `onBackPress CommonBackgroundBlurStyle start`)
    return false
  }

  PressedStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor(Color.Blue);
  };

  // buttonTab() {
  //   let keyEventDown: inputEventClient.KeyEvent = {
  //     isPressed: true,
  //     keyCode: 2049,
  //     keyDownDuration: 0,
  //     isIntercepted: false
  //   }
  //   let res1 = inputEventClient.injectEvent({ KeyEvent: keyEventDown });
  //
  //   let keyEventUp: inputEventClient.KeyEvent = {
  //     isPressed: false,
  //     keyCode: 2049,
  //     keyDownDuration: 0,
  //     isIntercepted: false
  //   }
  //   let res2 = inputEventClient.injectEvent({ KeyEvent: keyEventUp });
  // }
  //
  // buttonOnKey() {
  //   let keyEventDown: inputEventClient.KeyEvent = {
  //     isPressed: true,
  //     keyCode: 2054,
  //     keyDownDuration: 0,
  //     isIntercepted: false
  //   }
  //   let res3 = inputEventClient.injectEvent({ KeyEvent: keyEventDown });
  //
  //   let keyEventUp: inputEventClient.KeyEvent = {
  //     isPressed: false,
  //     keyCode: 2054,
  //     keyDownDuration: 0,
  //     isIntercepted: false
  //   }
  //   let res4 = inputEventClient.injectEvent({ KeyEvent: keyEventUp });
  // }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("common-BackgroundBlurStyle")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("backgroundBlurStyleText")
        .backgroundBlurStyle(BlurStyle.Thick)

      Text("common-BorderImage")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("borderImageText")
        .hitTestBehavior(HitTestMode.Default)
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: {
            top: 10,
            bottom: 10,
            left: 10,
            right: 10
          },
          width: {
            top: "10px",
            bottom: "10px",
            left: "10px",
            right: "10px"
          },
          repeat: RepeatMode.Stretch,
          fill: false
        })

      Text("common-HoverEffectHighlight")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("hoverEffectText")
        .hoverEffect(HoverEffect.Highlight)

      Text("common-HoverEffectScale")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("hoverEffectScaleText")
        .hoverEffect(HoverEffect.Scale)

      Text("common-OnKeyEvent")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onKeyEventText")

      Button('common-OnKeyEvent')
        .onClick((e: ClickEvent) => {
          // this.buttonTab()
          // this.buttonOnKey()
        })
        .key("onKeyEventButton")
        .onKeyEvent((event: KeyEvent): boolean => {
          if (event.keyCode === 2054) {
            console.info("onKeyEvent 2054 inject Success ");
          }
          if (event.type === KeyType.Down) {
            Log.showInfo(TAG, `Down`)
          }
          if (event.type === KeyType.Up) {
            Log.showInfo(TAG, `Up`)
          }
          Log.showInfo(TAG, 'KeyType:' + event.type + ';keyCode:' + event.keyCode + ';keyText:' + event.keyText)
        })

      Text("common-TabIndex")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("tabIndexText")
        .tabIndex(1)

      Text("common-ParallelGesture" + '\n' + this.value)
        .width(320)
        .height(100)
        .fontSize(12)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(15)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("parallelGestureText")
        .parallelGesture(TapGesture().onAction(() => {
          // 并行手势
          this.value = 'gesture onAction'
        }))

      Text("common-Sepia")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("sepiaText")
        .backgroundColor('#E78282')
        .sepia(1)

      Button('Button 1')
        .id('target')

      Text("common-AlignRules")
        .width(260)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("alignRulesText")
        .alignRules({
          top: { anchor: 'target', align: VerticalAlign.Bottom },
          right: { anchor: "target", align: HorizontalAlign.Center }
        } as AlignRuleOption)

      Text("common-StateStyles")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("stateStylesText")
        .stateStyles({
          pressed: this.PressedStyles
        })

      Text("common-OnVisibleAreaChange")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onVisibleAreaChangeText")

      Text("common-OnPageHide")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onPageHideText")

      Text("common-OnBackPress")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onBackPressText")

    }.width("100%").height("100%")
  }
}

