/**
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
struct ShadowTypeStyle {
  build() {
    Column({ space: 10 }) {
      Text('ShadowType: COLOR').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("ShadowType_COLOR")
        .width('90%')
        .height(40)
        .shadow({type:ShadowType.COLOR,radius:20})

      Text('ShadowType: BLUR').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("ShadowType_BLUR")
        .width('90%')
        .height(40)
        .shadow({type:ShadowType.BLUR,radius:20})

      // 添加阴影效果，图片效果不变
      Text('ShadowStyle: OUTER_DEFAULT_XS').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("OUTER_DEFAULT_XS")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_XS)
        .shadow({type:ShadowType.COLOR,radius:20})

      Text('ShadowStyle: OUTER_DEFAULT_SM').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("OUTER_DEFAULT_SM")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_SM)

      Text('ShadowStyle: OUTER_DEFAULT_MD').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("OUTER_DEFAULT_MD")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_MD)

      Text('ShadowStyle: OUTER_DEFAULT_LG').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("OUTER_DEFAULT_LG")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_LG)

      Text('ShadowStyle: OUTER_FLOATING_SM').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("OUTER_FLOATING_SM")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_FLOATING_SM)

      Text('ShadowStyle: OUTER_FLOATING_MD').fontSize(15).fontColor(0xCCCCCC).width('90%')
      Image($r('app.media.icon')).id("OUTER_FLOATING_MD")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_FLOATING_MD)
    }.width('100%').margin({ top: 5 })
  }
}