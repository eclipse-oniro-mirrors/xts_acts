/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct QRCodeResourceStr {
  build() {
    Column({ space: 8 }) {
      Row() {
        QRCode($r('app.string.module_desc')).width(10).height(10).color(0xF7C00).id('QRCode')
        QRCode(undefined).width(10).height(10).color(0xF7C00).id('QRCode1')
        QRCode(null).width(10).height(10).color(0xF7C00).id('QRCode2')
        QRCode('resourceStr').width(10).height(10).color(0xF7C00).id('QRCode3')
      }
    }
    .alignItems(HorizontalAlign.Start)
  }
}