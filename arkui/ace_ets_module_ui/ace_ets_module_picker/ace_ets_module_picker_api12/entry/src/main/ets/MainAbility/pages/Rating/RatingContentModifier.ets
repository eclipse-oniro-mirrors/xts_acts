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

class MyRatingStyle implements ContentModifier<RatingConfiguration> {

  constructor() {}

  applyContent() : WrappedBuilder<[RatingConfiguration]> {
    return wrapBuilder(buildRating)
  }
}

@Builder function buildRating(config: RatingConfiguration) {
  Column({space:10}) {
    Text("Rating" + config.rating).id('RatingContentModifier_text')
    Button('triggerChange')
      .id('RatingContentModifier_btn')
      .onClick(()=>{
        config.triggerChange(2)
      })
  }
}

@Entry
@Component
struct RatingContentModifierTest {

  build() {
    Column({space:10}) {
      Rating({
        rating: 0,
      })
        .stars(5)
        .width('100%')
        .onChange((value: number) => {
          console.info('Rating change is'+ value);
        })
        .contentModifier(new MyRatingStyle())

    }
    .width('100%')
    .height('100%')
  }
}