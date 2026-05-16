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
struct ProgressExample {
  @State enableValue: string = 'ProgressMask enableBreathingAnimation'
  @State progress1: ProgressMask = new ProgressMask(0, 100, '#66000000')

  build() {
    Column({ space: 15 }) {
      Text(JSON.stringify(this.progress1)).fontSize(20).id('ProgressMaskImage')
      Text(this.enableValue).fontSize(20).id('ProgressMaskText')
      Image($r('app.media.icon'))
        .width(80)
        .height(80)
        .mask(this.progress1)
        .borderRadius(20)
        .onAppear(() => {
          this.enableValue = 'enableBreathingAnimation success'
          this.progress1.enableBreathingAnimation(true)
        })
    }.width('100%').padding({ top: 5 })
  }
}