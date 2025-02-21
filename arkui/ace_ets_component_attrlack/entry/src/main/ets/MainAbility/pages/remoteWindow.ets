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

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct FormComponentFormDimension {
  @State target: WindowAnimationTarget = undefined // 通过windowAnimationManager获取

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear Dimension start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear Dimension end`);
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Text("formComponent-FormDimension-WindowBounds")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("formComponentFormDimensionWindowBoundsText")

        RemoteWindow(this.target)
          .translate({ x: 100, y: 200 })
          .scale({ x: 0.5, y: 0.5 })
          .opacity(0.8)
          .position({ x: px2vp(this.target?.windowBounds.left), y: px2vp(this.target?.windowBounds.top) })
          .width(px2vp(this.target?.windowBounds.width))
          .height(px2vp(this.target?.windowBounds.height))
          .key('remoteWindow')

      }
      .width('100%')
    }
    .height('100%')
  }
}
