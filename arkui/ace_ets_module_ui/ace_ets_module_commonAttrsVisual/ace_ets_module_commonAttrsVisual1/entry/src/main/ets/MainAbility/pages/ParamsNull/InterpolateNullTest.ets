/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

@Entry
@Component
struct InterpolateNullIndex {
  @State widthSize: number = 200;
  @State heightSize: number = 200;

  build() {
    Column() {
      Text('laJi.....nHai')
        .id('btn_interpolate_id')
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(Color.Red)
        .onClick(() => {
          let curve = curves.cubicBezierCurve(0.25, 0.1, 0.25, 1.0);
          this.widthSize = curve.interpolate(null) * this.widthSize;
          console.info('interpolate null success:' + this.widthSize);
          AppStorage.SetOrCreate('interpolateNull', 'success');
          this.heightSize = curve.interpolate(undefined) * this.heightSize;
          console.info('interpolate null success:'+ this.widthSize);
          AppStorage.SetOrCreate('interpolateUndefined', 'success');
        })
        .animation({ duration: 2000, curve: curves.stepsCurve(9, true) })
    }.width("100%").height("100%")
  }
}