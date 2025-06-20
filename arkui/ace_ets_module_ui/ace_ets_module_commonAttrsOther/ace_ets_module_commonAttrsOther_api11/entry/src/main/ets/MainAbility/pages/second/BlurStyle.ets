/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct BlurStyle1 {

  build() {
    Column() {
      Text("BlurStyle.BACKGROUND_THIN").margin(5).id("BACKGROUND_THIN")
        .backgroundBlurStyle(BlurStyle.BACKGROUND_THIN, { colorMode: ThemeColorMode.SYSTEM, adaptiveColor: AdaptiveColor.DEFAULT })
      Text("BlurStyle.BACKGROUND_REGULAR").margin(5).id("BACKGROUND_REGULAR")
        .backgroundBlurStyle(BlurStyle.BACKGROUND_REGULAR, { adaptiveColor: AdaptiveColor.AVERAGE })
      Text("BlurStyle.BACKGROUND_THICK").margin(5).id("BACKGROUND_THICK")
        .backgroundBlurStyle(BlurStyle.BACKGROUND_THICK)
      Text("BlurStyle.BACKGROUND_ULTRA_THICK").margin(5).id("BACKGROUND_ULTRA_THICK")
        .backgroundBlurStyle(BlurStyle.BACKGROUND_ULTRA_THICK)
      Column({ space: 100 }) {
        // 绘制一个直径为150的圆,默认填充色为黑色
        Circle({ width: 150, height: 200 })
        // 绘制一个直径为150的圆，
        Circle({ width: 150, height: 200 })
          .backgroundColor(Color.White)
          .foregroundColor(ColoringStrategy.INVERT)
      }.width('100%').backgroundColor(Color.Blue)
    }.width('90%').height("90%")
  }
}