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
struct backgroundEffectTest1 {
  @State imageSize: number = 150;
  @State mInactiveColor: ResourceColor = '#FFFF0000'

  build() {
    Column({ space: 5 }) {
      // backgroundEffect 可以自定义设置 模糊半径，亮度，饱和度等参数
      Stack() {
        Column()
          .id('backgroundEffectValue')
          .width(this.imageSize)
          .height(this.imageSize)
          .backgroundEffect({
            //页面效果显示=》模糊程度
            radius: 10, //模糊半径
            saturation: 50, //饱和度
            blurOptions: { grayscale: [20, 20] },//灰阶模糊参数，默认为[0,0]。
            brightness: 2, //亮度
            color: '#8044a4b5', //颜色
            adaptiveColor : AdaptiveColor.DEFAULT, //背景模糊效果使用的取色模式
            inactiveColor: this.mInactiveColor,
            policy: BlurStyleActivePolicy.ALWAYS_ACTIVE//一直有模糊效果。
          })
      }
    }
    .width('100%')
    .padding({ top: 5 })
  }
}
