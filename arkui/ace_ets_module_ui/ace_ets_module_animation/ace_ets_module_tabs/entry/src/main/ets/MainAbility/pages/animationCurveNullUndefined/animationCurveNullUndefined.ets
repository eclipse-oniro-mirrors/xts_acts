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
    curves: curves.stepsCurve(undefined, true)
  },
  {
    curves: curves.stepsCurve(null, true)
  },
  {
    curves: curves.cubicBezierCurve(undefined, undefined, undefined, undefined)
  },
  {
    curves: curves.cubicBezierCurve(null, null, null, null)
  },
  {
    curves: curves.springCurve(undefined, undefined, undefined, undefined)
  },
  {
    curves: curves.springCurve(null, null, null, null)
  },
  {
    curves: curves.springMotion(undefined, undefined, undefined)
  },
  {
    curves: curves.springMotion(null, null, null)
  },
  {
    curves: curves.responsiveSpringMotion(undefined, undefined, undefined)
  },
  {
    curves: curves.responsiveSpringMotion(null, null, null)
  },
  {
    curves: curves.interpolatingSpring(undefined, undefined, undefined, undefined)
  },
  {
    curves: curves.interpolatingSpring(null, null, null, null)
  },
  {
    curves: curves.springCurve(-1, -1, -1, -1)
  },
  {
    curves: curves.springCurve(0, 0, 0, 0)
  },
  {
    curves: curves.springCurve(1, 1, 1, 1)
  }
]

interface itemType {
  text: string,
  backgroundColor: Color
}

@Entry
@Component
struct TabsCustomAnimationNullUndefinedExample {
  @State testData: TestAttributes[] = testData
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  build() {
    Column() {
      Row() {
        Text('changeIndex:' + this.currentIndex)
        Button('++')
          .onClick(() => {
            this.currentIndex = this.currentIndex % this.testData.length;
          })
          .id('animationCurveChangeIndex')
      }.margin(5)
      .width('100%')

      Tabs({ controller: this.controller }) {
        TabContent() {
        }
        .tabBar('Yellow')
        .backgroundColor(Color.Yellow)
      }
      .key('animationCurveNullUndefined')
      .animationDuration(1000)
      .animationCurve(this.testData[this.currentIndex].curves)
      .backgroundColor(0xf1f3f5)
      .width('100%')
      .height('25%')
    }
  }
}
