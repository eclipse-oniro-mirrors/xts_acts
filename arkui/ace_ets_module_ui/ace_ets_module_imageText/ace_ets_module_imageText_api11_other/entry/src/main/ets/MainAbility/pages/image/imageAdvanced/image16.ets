/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct image16 {
  @State imageLoadingResult: string = 'loading failed';

  build() {
    Column() {
      Text(this.imageLoadingResult)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .id('loadingResult16')

      Image('images/test1.jpg')
        .width(160)
        .height(160)
        .borderWidth(1)
        .onComplete((event)=>{
          if(event) {
            this.imageLoadingResult = 'loading success'
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}