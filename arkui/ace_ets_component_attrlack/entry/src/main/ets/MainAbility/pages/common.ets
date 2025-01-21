/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../common/Log.ets';
import events_emitter from '@ohos.events.emitter';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CommonColorMode {
  // popup构造器定义弹框内容
  @Builder
  popupBuilder() {
    Row({ space: 2 }) {
      Text('Custom Popup')
        .fontSize(10)
    }
    .width(100)
    .height(50)
    .padding(5)
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CommonColorMode start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CommonColorMode end`)
  }

  onLayout(children: Array<LayoutChild>, constraint: ConstraintSizeOptions) {
    Log.showInfo(TAG, `onLayout start` + JSON.stringify(children));
    if (children.length != 0) {
      children[0].borderInfo = {
        borderWidth: { top: 20, right: 20, bottom: 20, left: 20 },
        margin: { top: 30, right: 30, bottom: 30, left: 30 },
        padding: { top: 20, right: 20, bottom: 20, left: 20 }
      }
      children[0].constraint = {
        maxWidth: 200
      }
      children[0].layout({
        position: {
          x: 20,
          y: 20
        },
        constraint: {
          maxWidth: 200
        }
      })
    }
  }

  onMeasure(children: Array<LayoutChild>, constraint: ConstraintSizeOptions) {
    Log.showInfo(TAG, `onMeasurestart`)
  }

  @Styles
  normalStyles() {
    .backgroundColor("#0A59F7")

  }

  // add
  configuration: Configuration = {

    colorMode: "$000",

    fontScale: 23
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("common-FontScale")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("fontScaleText")
        .bindPopup(true, {
          message: "23",
          showInSubWindow: true
        })

      Text("common-OnFinish")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onFinishText")
        .animation({
          onFinish: () => {
            Log.showInfo(TAG, 'animation onFinish success')
          }
        })
        .bindPopup(true, {
          builder: this.popupBuilder,
          showInSubWindow: true
        })

      Text("common-MotionPath")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("motionPathText")
        .sharedTransition('motionPathText', {
          motionPath: {
            path: ''
          }
        })

      Text("common-Middle")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("middleText")
        .alignRules({
          middle: { anchor: 'string', align: HorizontalAlign.Center }
        })

      Text("common-Area")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("areaText")
        .onClick((event) => {
          Log.showInfo(TAG, 'JSON.stringify area : ' + JSON.stringify(event.target.area))
          const area = JSON.stringify(event.target.area)
          console.info("area value1 is: " + area)
          console.info("area value3 is: " + JSON.parse(JSON.stringify(event.target.area))["width"])
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": JSON.parse(JSON.stringify(event.target.area))["width"]
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60312,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("areaValue start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("areaValue emit action state err: " + JSON.stringify(err.message))
          }
        })
      Text("common-Repeat")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("RepeatText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: { top: 10, bottom: 10, left: 10, right: 10 },
          width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
          repeat: RepeatMode.Repeat,
          fill: false
        });

      Text("common-Space")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("SpaceText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: { top: 10, bottom: 10, left: 10, right: 10 },
          width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
          repeat: RepeatMode.Space,
          fill: false
        });

      Text("common-Thin")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("ThinText")
        .backgroundBlurStyle(BlurStyle.Thin)

      Text("common-Thick")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("ThickText")
        .backgroundBlurStyle(BlurStyle.Thick)

      Text("common-Slice")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("sliceText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: { top: 10, bottom: 10, left: 10, right: 10 },
          width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
          repeat: RepeatMode.Stretch,
          fill: false
        });

      Text("common-Outset")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("outsetText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: { top: 10, bottom: 10, left: 10, right: 10 },
          width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
          repeat: RepeatMode.Stretch,
          fill: false,
          outset: 2
        });


      Text("common-Touches")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("touchesText")
        .onTouch((event) => {
          Log.showInfo(TAG, 'touches: ' + JSON.stringify(event.touches))
          const touchesValue = JSON.stringify(event.touches)
          console.info("touches value1 is: " + touchesValue)
          console.info("touches value3 is: " + JSON.stringify(event.touches)[0]["type"])
          try {
            let backData1: events_emitter.EventData = {
              data: {
                "STATUS": JSON.stringify(event.touches)[0]["type"]
              }
            }
            let backEvent1: events_emitter.InnerEvent = {
              eventId: 60313,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("touchesValue start to emit action state")
            events_emitter.emit(backEvent1, backData1)
          } catch (err) {
            console.info("touchesValue emit action state err: " + JSON.stringify(err.message))
          }
        })

      Text("common-ChangedTouches")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("changedTouchesText")
        .onTouch((event) => {
          Log.showInfo(TAG, 'changedTouches: ' + JSON.stringify(event.changedTouches))
          const changedTouchesValue = JSON.stringify(event.changedTouches)
          console.info("changedTouchesValue value1 is: " + changedTouchesValue)
          console.info("changedTouchesValue value3 is: " + changedTouchesValue[0]["type"])
          try {
            let backData2: events_emitter.EventData = {
              data: {
                "STATUS": changedTouchesValue[0]["type"]
              }
            }
            let backEvent2: events_emitter.InnerEvent = {
              eventId: 60314,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("touchesValue start to emit action state")
            events_emitter.emit(backEvent2, backData2)
          } catch (err) {
            console.info("touchesValue emit action state err: " + JSON.stringify(err.message))
          }
        })

      Text("common-KeyCode")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("keyCodeText")
        .onKeyEvent((event) => {
          Log.showInfo(TAG, 'keyCode: ' + event.keyCode)
        })

      Text("common-KeyText")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("keyTextText")
        .onKeyEvent((event) => {
          Log.showInfo(TAG, 'keyText: ' + event.keyText)
        })

      Text("common-KeySource")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("keySourceText")
        .onKeyEvent((event) => {
          Log.showInfo(TAG, 'keySource: ' + event.keySource)
        })

      Text("common-DeviceId")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("deviceIdText")
        .onKeyEvent((event) => {
          Log.showInfo(TAG, 'deviceId: ' + event.deviceId)
        })

      Text("common-MetaKey")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("metaKeyText")
        .onKeyEvent((event) => {
          Log.showInfo(TAG, 'metaKey: ' + event.metaKey)
        })

      Text("common-Normal")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("normalText")
        .stateStyles({ normal: this.normalStyles })

      Text("common-Pressed")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("pressedText")
        .stateStyles({ pressed: this.normalStyles })

      Text("common-Focused")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("focusedText")
        .stateStyles({ focused: this.normalStyles })

      Text("common-Clicked")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("clickedText")
        .stateStyles({ clicked: this.normalStyles })

    }.width("100%").height("100%")
  }
}

@Preview({
  locale: 'locale'
})
@Component
struct PreviewParamsLocale {
  build() {
    Flex() {
      Text("common-locale")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("LocaleText")
    }
  }
}

@Preview({
  colorMode: 'red',
})
@Component
struct PreviewParamsColorMode {
  build() {
    Flex() {
      Text("common-colorMode")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("ColorModeText")
    }
  }
}

@Preview({
  deviceType: 'phone'
})
@Component
struct PreviewParamsDeviceType {
  build() {
    Flex() {
      Text("common-deviceType")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("DeviceTypeText")
    }
  }
}

@Preview({
  dpi: 160
})
@Component
struct PreviewParamsDpi {
  build() {
    Flex() {
      Text("common-dpi")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("DpiText")
    }
  }
}

@Preview({
  orientation: ''
})
@Component
struct PreviewParamsOrientation {
  build() {
    Flex() {
      Text("common-orientation")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("OrientationText")
    }
  }
}

@Preview({
  roundScreen: true
})
@Component
struct PreviewParamsRoundScreen {
  build() {
    Flex() {
      Text("common-roundScreen")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("RoundScreenText")
    }
  }
}

