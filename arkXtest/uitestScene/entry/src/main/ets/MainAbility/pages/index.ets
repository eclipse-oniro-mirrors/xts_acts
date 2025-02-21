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
import prompt from '@ohos.prompt';

@Entry
@Component
struct ScrollExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [1,2,3,4]

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('MainPage')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Stack({ alignContent: Alignment.TopStart }) {
        Scroll(this.scroller) {
          Column() {
            Button() {
              Text('next page')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .key('my-key')
            .type(ButtonType.Capsule)
            .margin({ top: 20 })
            .onClick(() => {
              router.push({ uri: 'MainAbility/pages/second' })
            })
            .gesture(
            LongPressGesture({ repeat: false })
              .onAction((event: GestureEvent) => {
                router.push({ uri: 'MainAbility/pages/fourth' })
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
                router.push({ uri: 'MainAbility/pages/third' })
              })
            )
            Button() {
              Text('jump')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .type(ButtonType.Capsule)
            .margin({ top: 20 })
            .onClick(() => {
              router.push({ uri: 'MainAbility/pages/screen' })
            })
            .gesture(
            LongPressGesture({ repeat: false })
              .onAction((event: GestureEvent) => {
                router.push({ uri: 'MainAbility/pages/drag' })
              })
            )
            Checkbox({ name: 'hi' })
              .size({ width: 30, height: 30 })
            TextInput({ placeholder: 'welcome', text: 'Hello World' })
              .type(InputType.Normal)
              .width(300)
              .height(50)
              .fontSize(40)
              .enabled(true)
              .margin({ top: 20 })
            ForEach(this.arr, (item) => {
              Text(item.toString())
                .width('100%')
                .height('30%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(75)
                .fontSize(80)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, item => item)
            Button() {
              Text('bottom')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }.type(ButtonType.Capsule)
            .margin({
              top: 20, left: 150
            })
            .onClick(() => {
              router.push({ uri: 'MainAbility/pages/second' })
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
      Text('MainPage_End')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
  }
}

