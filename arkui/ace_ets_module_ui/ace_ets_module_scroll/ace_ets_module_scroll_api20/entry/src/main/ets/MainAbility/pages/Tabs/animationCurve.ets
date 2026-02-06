/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { curves } from '@kit.ArkUI';

export interface TestAttributes {
  curves?: number | Curve | ICurve | undefined | null;
}
export const testData: TestAttributes[] = [
  {
    curves: curves.initCurve(Curve.Linear)
  },
  {
    curves:undefined
  },
  {
    curves:null
  },
  {
    curves: -9
  },
  {
    curves: curves.cubicBezierCurve(0.1, 0.0, 0.1, 0.5)
  }
]
interface itemType {
  text: string,
  backgroundColor: Color
}
@Entry
@Component
struct TabsCustomAnimationExample {
  @State fraction: number = 0
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
  @State opacityList: number[] = []
  @State scaleList: number[] = []
  @State index: number = 0
  @State testData: TestAttributes[] = testData
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  build() {
    Column() {
      Row() {
        Text('changeIndex:' + this.currentIndex)
        Button('++')
          .onClick(() => {
            this.changeIndex(this.currentIndex + 1)
          })
          .id('changeIndex++')
      }.margin(5)
      .width('100%')
      Tabs({ controller: this.controller }) {
        ForEach(this.data, (item: itemType, index: number) => {
          TabContent() {}
          .tabBar(item.text)
          .backgroundColor(item.backgroundColor)
          .opacity(this.opacityList[index])
          .scale({ x: this.scaleList[index], y: this.scaleList[index] })
        })
      }
      .key('tabsOri')
      .animationDuration(1000)
      .animationCurve(this.testData[this.index].curves)
      .backgroundColor(0xf1f3f5)
      .width('100%')
      .height('25%')
      Column() {
        Row(){
          Button('Index++')
            .onClick(() => {
              this.index = (this.index + 1) % (this.testData?.length);
            })
            .id('Index++')
        }
        Text(`${this.index + 1} / ${this.testData?.length}`)

      }
      .height('25%')
      .alignItems(HorizontalAlign.Center)
      .width('100%')
    }
  }
  private changeIndex(index : number) {
    if (index < 0) {
      index = 0;
    }
    index = index % this.data.length;
    this.controller.changeIndex(index)
    this.currentIndex = index;
  }
}
