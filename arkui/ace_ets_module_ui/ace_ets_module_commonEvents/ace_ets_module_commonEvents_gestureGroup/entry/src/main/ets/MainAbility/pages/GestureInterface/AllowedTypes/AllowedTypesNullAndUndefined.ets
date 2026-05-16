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
struct AllowedTypesPropertyTest {
  @State allowedTypesNullResult: string = 'Init';
  @State allowedTypesUndefinedResult: string = 'Init';

  build() {
    Column() {
      Text('AllowedTypes Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.allowedTypesNullResult)
        .id('allowedTypesNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.allowedTypesUndefinedResult)
        .id('allowedTypesUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Button('allowedTypes null')
        .id('allowedTypesNullBtn')
        .width('100%')
        .height('5%')
        .gesture(TapGesture().allowedTypes(null).onAction(() => {
          this.allowedTypesNullResult = 'allowedTypesNullTriggered';
        }))

      Button('allowedTypes undefined')
        .id('allowedTypesUndefinedBtn')
        .width('100%')
        .height('5%')
        .gesture(TapGesture().allowedTypes(undefined).onAction(() => {
          this.allowedTypesUndefinedResult = 'allowedTypesUndefinedTriggered';
        }))
    }
    .width('100%')
    .height('100%')
  }
}
