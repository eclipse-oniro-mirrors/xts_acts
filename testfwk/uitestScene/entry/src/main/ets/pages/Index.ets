/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@system.router';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct ScrollExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
  @State hoverText : string = 'jump'
  @State pressure : number = 0.0
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('MainPage')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Stack({ alignContent: Alignment.TopStart }) {
        Scroll(this.scroller) {
          Column() {
            Button('toast').fontSize(25).fontWeight(FontWeight.Bold)
              .onClick(() => {
                try {
                  console.info('toastShow start')
                  promptAction.showToast({
                    message: 'toastShow',
                    duration: 60000
                  });
                  console.info('toastShow over')
                } catch (error) {
                  console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
                };
              })

            Button('dialog').fontSize(25).fontWeight(FontWeight.Bold)
              .onClick(() => {
                console.info('dialog start')
                AlertDialog.show(
                  {
                    title: '',
                    message: 'dialogShow',
                    alignment: DialogAlignment.Bottom,
                    confirm: {
                      value: 'close',
                      action: () => {
                        console.info('close dialog')
                      }
                    }
                  }
                )
                console.info('dialog over')
              })
            Button() {
              Text('next page')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .key('my-key')
            .type(ButtonType.Capsule)
            .margin({ top: 20 })
            .onClick(() => {
              console.info('jump to second')
              router.push({ uri: 'pages/second' })
              console.info('jump to second over')
            })
            .gesture(
              LongPressGesture({ repeat: false })
                .onAction((event: GestureEvent) => {
                  console.info('jump to fourth')
                  router.push({ uri: 'pages/fourth' })
                  console.info('jump to fourth over')
                })
            )
            .gesture(
              LongPressGesture({ repeat: false, duration: 1800 })
                .onAction((event: GestureEvent) => {
                  console.info('duration 1800 jump to fourth')
                  router.push({ uri: 'pages/fourth' })
                  console.info('duration 1800 jump to fourth over')
                })
            )
            Button() {
              Text('Click twice')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .type(ButtonType.Capsule)
            .margin({ top: 20 })
            .gesture(
              TapGesture({ count: 1 })
                .onAction(() => {
                  console.info('jump to third')
                  router.push({ uri: 'pages/third' })
                  console.info('jump to third over')
                })
            )
            .gesture(
              LongPressGesture({ repeat: false })
                .onAction((event: GestureEvent) => {
                  console.info('jump to wearList')
                  router.push({ uri: 'pages/wearList' })
                  console.info('jump to wearList over')
                })
            )
            Button() {
              Text(this.hoverText)
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .type(ButtonType.Capsule)
            .key('jump')
            .margin({ top: 20 })
            .onHover((isHover: boolean) => {
              console.info('hover start')
              if (isHover) {
                this.hoverText = 'hover'
              }
              console.info('hover over')
            })
            .onMouse((event: MouseEvent) => {
              console.info('Mouse operation events start')
              switch (event.button) {
                case MouseButton.Left :
                  this.hoverText = 'left'
                  break
                case MouseButton.Right :
                  this.hoverText = 'right'
                  break
                case MouseButton.Middle :
                  this.hoverText = 'middle'
                  break
              }
              console.info('Mouse operation events over')
            })
            .onClick(() => {
              console.info('jump to pinch')
              router.push({ uri: 'pages/pinch' })
              console.info('jump to pinch over')
            })
            .gesture(
              LongPressGesture({ repeat: false })
                .onAction((event: GestureEvent) => {
                  console.info('jump to drag')
                  router.push({ uri: 'pages/drag' })
                  console.info('jump to drag over')
                })
            )
            Button() {
              Text('scroll')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .type(ButtonType.Capsule)
            .margin({ top: 20 })
            .onClick(() => {
              console.info('jump to scroll')
              router.push({ uri: 'pages/scroll' })
              console.info('jump to scroll over')
            })
            Button() {
              Text('wearList')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .type(ButtonType.Capsule)
            .margin({ top: 20 })
            .onClick(() => {
              console.info('jump to wearList')
              router.push({ uri: 'pages/wearList' })
              console.info('jump to wearList over')
            })
            Checkbox({ name: 'hi' })
              .size({ width: 30, height: 30 })
            TextInput({ placeholder: 'welcome', text: 'Hello World' })
              .type(InputType.Normal)
              .width(300)
              .height(50)
              .fontSize(40)
              .enabled(true)
              .margin({ top: 20 })
            ForEach(this.arr, (item:number) => {
              Text(item.toString())
                .width('100%')
                .height('30%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(75)
                .fontSize(80)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, (item:string) => item)
            Button() {
              Text('bottom')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }.type(ButtonType.Capsule)
            .margin({
              top: 20, left: 150
            })
            .onClick(() => {
              console.info('jump to second')
              router.push({ uri: 'pages/second' })
              console.info('jump to second over')
            })
          }.width('100%')
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(30)
        .onScroll((xOffset: number, yOffset: number) => {
          console.info(xOffset + ' ' + yOffset)
        })
      }.width('100%').height('100%').backgroundColor(0xDCDCDC)
      .onTouch((event) => {
        console.log(`onTouch action 11111`);
        this.pressure = event.pressure;
      })
      Text(this.pressure.toFixed(1))
        .id('pressure')
        .fontSize(20)
      Text('MainPage_End')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
  }
}

