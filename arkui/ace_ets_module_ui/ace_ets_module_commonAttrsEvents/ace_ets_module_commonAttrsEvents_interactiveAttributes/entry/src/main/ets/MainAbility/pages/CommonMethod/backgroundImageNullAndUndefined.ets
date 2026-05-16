/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct CommonMethodBackgroundImageNullAndUndefined {
  @State resultText: string = '';

  build() {
    Scroll() {
      Column() {
        Text('CommonMethod backgroundImage Test')
          .width('100%')

        Row() {
          Text('Result:')
            .width('30%')
          Text(this.resultText)
            .width('60%')
        }
        .width('90%')
        .height('5%')
        .justifyContent(FlexAlign.SpaceBetween)

        Text('API 7-12: backgroundImage(src, repeat?)')

        Button('Test first param null (ImageRepeat)')
          .width('90%')
          .height('5%')
          .id('testOneNullBtn')
          .backgroundImage(null, ImageRepeat.NoRepeat)
          .onClick(() => {
            this.resultText = 'first param null applied';
          })

        Button('Test first param undefined (ImageRepeat)')
          .width('90%')
          .height('5%')
          .id('testOneUndefinedBtn')
          .backgroundImage(undefined, ImageRepeat.NoRepeat)
          .onClick(() => {
            this.resultText = 'first param undefined applied';
          })

        Button('Test second param null (ImageRepeat)')
          .width('90%')
          .height('5%')
          .id('testTwoNullBtn')
          .backgroundImage('images/bg.png', null)
          .onClick(() => {
            this.resultText = 'second param null applied';
          })

        Button('Test second param undefined (ImageRepeat)')
          .width('90%')
          .height('5%')
          .id('testTwoUndefinedBtn')
          .backgroundImage('images/bg.png', undefined)
          .onClick(() => {
            this.resultText = 'second param undefined applied';
          })

        Text('API 18+: backgroundImage(src, options?)')

        Button('Test first param null (BackgroundImageOptions)')
          .width('90%')
          .height('5%')
          .id('testThreeNullBtn')
          .backgroundImage(null, { repeat: ImageRepeat.NoRepeat })
          .onClick(() => {
            this.resultText = 'first param null (options) applied';
          })

        Button('Test first param undefined (BackgroundImageOptions)')
          .width('90%')
          .height('5%')
          .id('testThreeUndefinedBtn')
          .backgroundImage(undefined, { repeat: ImageRepeat.NoRepeat })
          .onClick(() => {
            this.resultText = 'first param undefined (options) applied';
          })

        Button('Test second param null (BackgroundImageOptions)')
          .width('90%')
          .height('5%')
          .id('testFourNullBtn')
          .backgroundImage('images/bg.png', null)
          .onClick(() => {
            this.resultText = 'second param null (options) applied';
          })

        Button('Test second param undefined (BackgroundImageOptions)')
          .width('90%')
          .height('5%')
          .id('testFourUndefinedBtn')
          .backgroundImage('images/bg.png', undefined)
          .onClick(() => {
            this.resultText = 'second param undefined (options) applied';
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
