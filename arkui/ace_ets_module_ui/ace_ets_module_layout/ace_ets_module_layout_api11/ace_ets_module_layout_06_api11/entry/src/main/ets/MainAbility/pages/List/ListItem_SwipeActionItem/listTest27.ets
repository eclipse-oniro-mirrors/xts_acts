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


@Entry
@Component
struct ListItemExample27 {
  @State message: string = 'Hello World';
  @State arr: number[] = [0, 1, 2, 3, 4];
  @State enterEndDeleteAreaString: string = "not enterEndDeleteArea";
  @State exitEndDeleteAreaString: string = "not exitEndDeleteArea";
  @State swipeActionState: string = '-1';

  @Builder
  itemEnd() {
    Row() {
      Button("Delete").margin("4vp")
      Button("Set").margin("4vp")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder
  itemStart() {
    Row() {
      Button("StartDelete").margin("4vp")
      Button("StartSet").margin("4vp")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text("item" + item)
              .width('50%')
              .height(200)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition({ type: TransitionType.Delete, opacity: 0 })
          .swipeAction({
            end: {
              builder: () => {
                this.itemEnd();
              },
              actionAreaDistance: 56,
              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = "enterEndDeleteArea";
                this.exitEndDeleteAreaString = "not exitEndDeleteArea";
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = "not enterEndDeleteArea";
                this.exitEndDeleteAreaString = "exitEndDeleteArea";
              },
              onStateChange: (swipeActionState => {
                this.swipeActionState = swipeActionState.toString();
              })

            }

          })
          .key('lSwipe27Action' + item)
        }, (item: string) => item)
      }.listDirection(Axis.Horizontal).height('60%')

      Text(this.enterEndDeleteAreaString).fontSize(20)
      Text(this.exitEndDeleteAreaString).fontSize(20)
      Text(this.swipeActionState).fontSize(20).margin({ top: 20 }).key('swipe27State')
      Button("Delete").margin("4vp").key('btreset27').onClick(() => {
        this.swipeActionState = "-1";
        this.arr = [0, 1, 2, 3, 4];
      })

    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}