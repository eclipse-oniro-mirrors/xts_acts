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
  @State isShowSwipeEventCom: boolean = false;
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('MainPage')
        .fontWeight(FontWeight.Bold)
        .accessibilityDefaultFocus(true)
      Stack({ alignContent: Alignment.TopStart }) {
        Scroll(this.scroller) {
          Column() {
            Button('toast').fontWeight(FontWeight.Bold)
              .id('toastBtn')
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

            Button('dialog').fontWeight(FontWeight.Bold)
              .id('dialogBtn')
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
                .fontWeight(FontWeight.Bold)
            }
            .key('my-key')
            .type(ButtonType.Capsule)
            .margin({ top: 5 })
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
                .fontWeight(FontWeight.Bold)
            }
            .id('twiceBtn')
            .type(ButtonType.Capsule)
            .margin({ top: 5 })
            .gesture(
              TapGesture({ count: 2 })
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
                .fontWeight(FontWeight.Bold)
            }
            .type(ButtonType.Capsule)
            .key('jump')
            .margin({ top: 5 })
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
                .fontWeight(FontWeight.Bold)
            }
            .id('scrollBtn')
            .type(ButtonType.Capsule)
            .margin({ top: 5 })
            .onClick(() => {
              console.info('jump to scroll')
              router.push({ uri: 'pages/scroll' })
              console.info('jump to scroll over')
            })
            Row() {
              Button() {
                Text('wearList')
                  .fontWeight(FontWeight.Bold)
              }
              .id('wearListBtn')
              .type(ButtonType.Capsule)
              .margin({ top: 5 })
              .onClick(() => {
                console.info('jump to wearList')
                router.push({ uri: 'pages/wearList' })
                console.info('jump to wearList over')
              })
              Button() {
                Text('并行测试')
                  .fontWeight(FontWeight.Bold)
              }
              .id('to5')
              .margin({left: 5})
              .type(ButtonType.Capsule)
              .margin({ top: 5 })
              .onClick(() => {
                console.info('jump to five')
                router.push({ uri: 'pages/five' })
                console.info('jump to five over')
              })
            }

            Row() {
              Checkbox({ name: 'hi' })
                .size({ width: 30, height: 30 })
                .id('hi')
              Checkbox({ name: 'go' })
                .select(true)
                .id('go')
                .size({ width: 30, height: 30 })
              Button('enableFalse')
                .id('enableFalse')
                .enabled(false)
                .accessibilitySelected(true)
            }
            TextInput({ placeholder: 'welcome', text: 'Hello World' })
              .type(InputType.Normal)
              .width(300)
              .height(50)
              .enabled(true)
              .margin({ top: 5 })
              .textAlign(TextAlign.Center)
            ForEach(this.arr, (item:number) => {
              Text(item.toString())
                .width('100%')
                .height('15%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(35)
                .textAlign(TextAlign.Center)
                .margin({ top: 5 })
            }, (item:string) => item)
            Button() {
              Text('bottom')
                .fontWeight(FontWeight.Bold)
            }.type(ButtonType.Capsule)
            .margin({
              top: 20, left: 150,
              bottom: 20
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
        .onScrollStart(() => {
          this.isShowSwipeEventCom = true
        })
        .onScrollStop(() => {
          this.isShowSwipeEventCom = false;
        })
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(30)
        .id('parentScroll')
        .onScroll((xOffset: number, yOffset: number) => {
          console.info(xOffset + ' ' + yOffset)
        })
      }.width('100%').height('100%').backgroundColor(0xDCDCDC)
      .onTouch((event) => {
        console.log(`onTouch action 11111`);
        this.pressure = event.pressure;
      })
      Column() {
          Text('ShowSwipeEventCom')
            .id('ShowSwipeEventCom')
            .visibility(this.isShowSwipeEventCom ? Visibility.Visible: Visibility.Hidden)
        Text(this.pressure.toFixed(1))
          .id('pressure')
        Text('MainPage_End')
          .fontWeight(FontWeight.Bold)
      }.margin({
        top: 20
      })
    }
  }
}

