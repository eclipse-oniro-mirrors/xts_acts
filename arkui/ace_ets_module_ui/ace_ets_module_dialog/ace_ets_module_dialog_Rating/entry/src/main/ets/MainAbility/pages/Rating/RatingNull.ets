/*
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
struct ratingNull_testcase {
  @State rating: number = 2

  onPageShow() {
    console.info('Rating page show called');
  }

  onBuildDone() {
    console.info('Rating page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Rating page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Rating({ rating: 2, indicator: false })
          .contentModifier(null)
          .stepSize(null)
          .stars(null)
          .starStyle(null)
          .onChange((value: number) => {
            this.rating = value
          })
          .key('ratingnull')
        Rating({ rating: 2, indicator: true })
          .contentModifier(undefined)
          .stepSize(undefined)
          .stars(undefined)
          .starStyle(undefined)
          .key('ratingundefined')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}