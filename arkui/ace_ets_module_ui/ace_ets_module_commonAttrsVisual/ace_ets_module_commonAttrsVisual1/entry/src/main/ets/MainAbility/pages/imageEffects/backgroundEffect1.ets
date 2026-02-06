/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct BackgroundExample {
  @State grayscale2 :number[] =[3,56]
  @Builder renderBackground() {
    Column() {
      Progress({value : 50})
    }
  }

  build() {
    Column() {
      Text('content')
        .width(100)
        .height(40)
        .fontColor('#FFF')
        .key('texteffrct')
        .position({x:50, y:80})
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Green)
        .backgroundEffect({
          radius : 5,
          saturation : 50,
          brightness : 100,
          color :Color.Green,
          adaptiveColor : AdaptiveColor.DEFAULT,
          blurOptions : {
            grayscale: [3, 65]
          }
        })
    }
    .width(200).height(200)
    .background(this.renderBackground,undefined)
    .backgroundColor(Color.Gray)

  }
}