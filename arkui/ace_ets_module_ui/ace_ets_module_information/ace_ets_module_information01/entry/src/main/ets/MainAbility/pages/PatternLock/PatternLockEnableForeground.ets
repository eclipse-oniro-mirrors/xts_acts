/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct PatternLockEnableForeground {
  build() {
    Column() {
      Text('PatternLock enableForeground Test')
        .fontSize(20)
        .height('5%')

      Text('enableForeground: true')
        .fontSize(16)
        .height('5%')

      PatternLock()
        .id('PatternLockEnableForeground_PatternLock_True')
        .sideLength(200)
        .circleRadius(9)
        .pathStrokeWidth(5)
        .activeColor('#707070')
        .selectedColor('#707070')
        .pathColor('#707070')
        .backgroundColor('#F5F5F5')
        .regularColor(Color.Black)
        .activateCircleStyle({
          color: '#707070',
          radius: { value: 16, unit: LengthUnit.VP },
          enableWaveEffect: true,
          enableForeground: true
        }).height('5%')

      Text('enableForeground: false')
        .fontSize(16)
        .height('5%')

      PatternLock()
        .id('PatternLockEnableForeground_PatternLock_False')
        .sideLength(200)
        .circleRadius(9)
        .pathStrokeWidth(5)
        .activeColor('#707070')
        .selectedColor('#707070')
        .pathColor('#707070')
        .backgroundColor('#F5F5F5')
        .regularColor(Color.Black)
        .activateCircleStyle({
          color: '#707070',
          radius: { value: 16, unit: LengthUnit.VP },
          enableWaveEffect: true,
          enableForeground: false
        }).height('5%')
    }
    .width('100%')
    .height('100%')
  }
}
