/*
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
@Entry
@Component
struct GesturePropertyTest {
  @State gestureNullResult: string = 'Init';
  @State gestureUndefinedResult: string = 'Init';
  @State gestureMaskNullResult: string = 'Init';
  @State gestureMaskUndefinedResult: string = 'Init';

  build() {
    Column() {
      Text('Gesture Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.gestureNullResult)
        .id('gestureNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.gestureUndefinedResult)
        .id('gestureUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.gestureMaskNullResult)
        .id('gestureMaskNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.gestureMaskUndefinedResult)
        .id('gestureMaskUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Button('gesture null')
        .id('gestureNull')
        .width('100%')
        .height('5%')
        .gesture(null)

      Button('gesture undefined')
        .id('gestureUndefined')
        .width('100%')
        .height('5%')
        .gesture(undefined)

      Button('gesture + mask null')
        .id('gestureMaskNull')
        .width('100%')
        .height('5%')
        .gesture(TapGesture().onAction(() => {
          this.gestureMaskNullResult = 'gestureMaskNullTriggered';
        }), null)

      Button('gesture + mask undefined')
        .id('gestureMaskUndefined')
        .width('100%')
        .height('5%')
        .gesture(TapGesture().onAction(() => {
          this.gestureMaskUndefinedResult = 'gestureMaskUndefinedTriggered';
        }), undefined)
    }
    .width('100%')
    .height('100%')
  }
}
