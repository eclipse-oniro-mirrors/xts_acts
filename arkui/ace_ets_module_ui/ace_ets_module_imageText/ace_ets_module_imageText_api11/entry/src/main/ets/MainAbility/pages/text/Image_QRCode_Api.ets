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

@Entry
@Component
struct Image_QRCode_Api {

  build() {
    Column({ space: 5 }){
      Image($r('app.media.icon')).width(100).enableAnalyzer(true)
        .id('Image_QRCode_Api_Image')

      QRCode('hello').width(100).height(100).contentOpacity(0.5).id('Image_QRCode_Api_QRCode1')


    }.width('100%')
  }
}
