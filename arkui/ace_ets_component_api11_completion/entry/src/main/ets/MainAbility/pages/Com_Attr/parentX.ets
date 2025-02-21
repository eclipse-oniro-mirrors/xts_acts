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
struct parentX {
  @State parentX: number = 0
  @State parentY: number = 0
  @State strategy_DEFAULT: string = ''
  @State strategy_FORWARD_COMPETITION: string = ''
  @State strategy_FORWARD: string = ''
  build() {
    Row() {
      Column() {
        Column({ space: 20 }) {
          Text('' + this.parentX)
            .key('parentX')
            .margin({ top: 30 })
          Text('' + this.parentY)
            .key('parentY')
          Text(this.strategy_DEFAULT)
            .key('strategy_DEFAULT')
          Text(this.strategy_FORWARD_COMPETITION)
            .key('strategy_FORWARD_COMPETITION')
          Text(this.strategy_FORWARD)
            .key('strategy_FORWARD')
        }
        .key('Column_CustomEvent')
        .width(400)
        .height(400)
        .backgroundColor(0xF1F3F5)
        .onChildTouchTest((touchinfo) => {
          let strategy_DEFAULT = TouchTestStrategy.DEFAULT
          let strategy_FORWARD_COMPETITION = TouchTestStrategy.FORWARD_COMPETITION
          let strategy_FORWARD = TouchTestStrategy.FORWARD
          this.parentX = Number(touchinfo[0].parentX.toFixed(0))
          this.parentY = Number(touchinfo[0].parentY.toFixed(0))
          this.strategy_DEFAULT = JSON.stringify(strategy_DEFAULT)
          this.strategy_FORWARD_COMPETITION = JSON.stringify(strategy_FORWARD_COMPETITION)
          this.strategy_FORWARD = JSON.stringify(strategy_FORWARD)
          return { strategy: TouchTestStrategy.DEFAULT }
        })
      }.width('100%')
    }.height('100%').width('100%').id('row')
  }
}