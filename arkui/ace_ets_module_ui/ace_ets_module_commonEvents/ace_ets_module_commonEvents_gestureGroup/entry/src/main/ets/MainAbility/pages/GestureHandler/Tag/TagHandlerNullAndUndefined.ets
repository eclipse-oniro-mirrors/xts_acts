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
struct TagHandlerPropertyTest {
  @State tagEmptyResult: string = 'Init';
  @State tagNullResult: string = 'Init';
  @State tagUndefinedResult: string = 'Init';

  build() {
    Column() {
      Text('GestureHandler Tag Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.tagEmptyResult)
        .id('tagEmptyResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.tagNullResult)
        .id('tagNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.tagUndefinedResult)
        .id('tagUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Button('tag empty')
        .id('tagEmptyBtn')
        .width('100%')
        .height('5%')
        .gesture(TapGesture().tag('').onAction(() => {
          this.tagEmptyResult = 'tagEmptyTriggered';
        }))

      Button('tag null')
        .id('tagNullBtn')
        .width('100%')
        .height('5%')
        .gesture(TapGesture().tag(null).onAction(() => {
          this.tagNullResult = 'tagNullTriggered';
        }))

      Button('tag undefined')
        .id('tagUndefinedBtn')
        .width('100%')
        .height('5%')
        .gesture(TapGesture().tag(undefined).onAction(() => {
          this.tagUndefinedResult = 'tagUndefinedTriggered';
        }))
    }
    .width('100%')
    .height('100%')
  }
}
