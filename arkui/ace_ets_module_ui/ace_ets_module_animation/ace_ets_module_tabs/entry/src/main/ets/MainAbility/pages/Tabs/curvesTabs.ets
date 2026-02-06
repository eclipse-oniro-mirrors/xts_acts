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
import { curves } from '@kit.ArkUI';

interface itemType {
  text: string,
  backgroundColor: Color
}
@Entry
@Component
struct TabsCustomAnimationExample1 {
  @State data: itemType[] = [
    {
      text: 'Red',
      backgroundColor: Color.Red
    },
    {
      text: 'Yellow',
      backgroundColor: Color.Yellow
    },
    {
      text: 'Blue',
      backgroundColor: Color.Blue
    }]

  private timeoutList: number[] = []
  @State opacityListOri: number[] = []
  @State scaleListOri: number[] = []
  private durationListOri: number[] = []
  private customTransitionOri: (from: number, to: number) => TabContentAnimatedTransition =
    (from: number, to: number) => {
      let tabContentAnimatedTransition = {
        timeout: this.timeoutList[from],
        transition: (proxy: TabContentTransitionProxy) => {
          this.scaleListOri[from] = 1.0
          this.scaleListOri[to] = 0.5
          this.opacityListOri[from] = 1.0
          this.opacityListOri[to] = 0.5
          animateTo({
            duration: this.durationListOri[from],
            onFinish: () => {
              proxy.finishTransition()
            }
          }, () => {
            this.scaleListOri[from] = 0.5
            this.scaleListOri[to] = 1.0
            this.opacityListOri[from] = 0.5
            this.opacityListOri[to] = 1.0
          })
        }
      } as TabContentAnimatedTransition
      return tabContentAnimatedTransition
    }
  @State currentIndexOri: number = 0
  private controllerOri: TabsController = new TabsController()
  @State noMinHeightLimit1: boolean = true;

  build() {
    Column() {
      Text('index: ' + this.currentIndexOri)
        .id('tabs_text1_curve')
        .margin({top: 10})

      Tabs({ index: this.currentIndexOri, controller: this.controllerOri }) {
        ForEach(this.data, (item: itemType, index: number) => {
          TabContent() {}
          .tabBar(item.text)
          .backgroundColor(item.backgroundColor)
          .opacity(this.opacityListOri[index])
          .scale({ x: this.scaleListOri[index], y: this.scaleListOri[index] })
        })
      }
      .id('tabs_bar_curve')
      .vertical(false)
      .barMode(BarMode.Fixed)
      .animationDuration(600)
      .barHeight('auto', this.noMinHeightLimit1)
      .width('90%')
      .height('40%')
      .backgroundColor(0xf1f3f5)
      .animationCurve(curves.cubicBezierCurve(0.25, 0.1, 0.25, 1.0))
      .customContentTransition(this.customTransitionOri)
      .onChange((index: number) => {
        this.currentIndexOri = index
      })
    }
  }
}
