/**
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
struct ImageSpanVisibility {

  build() {
    Column() {
      Text('Visibility.None').fontSize(15).width('90%').height('5%')
      Text() {
        // 隐藏不参与占位
        ImageSpan($r('app.media.app_icon'))
          .id('ImageSpan_Visibility_None')
          .visibility(Visibility.None)
          .width('90%')
          .height('10%')
      }.borderWidth(1)

      Text('Visibility.Hidden').fontSize(15).width('90%').height('5%')
      Text() {
        // 隐藏参与占位
        ImageSpan($r('app.media.app_icon'))
          .id('ImageSpan_Visibility_Hidden')
          .visibility(Visibility.Hidden)
          .width('90%')
          .height('10%')
      }.borderWidth(1)

      Text('Visibility.Visible').fontSize(15).width('90%').height('5%')
      Text() {
        // 正常显示，组件默认的显示模式
        ImageSpan($r('app.media.app_icon'))
          .id('ImageSpan_Visibility_Visible')
          .visibility(Visibility.Visible)
          .width('90%')
          .height('10%')
      }.borderWidth(1)

      Text('Visibility: default').fontSize(15).width('90%').height('5%')
      Text() {
        // 正常显示
        ImageSpan($r('app.media.app_icon'))
          .id('ImageSpan_Visibility_default')
          .width('90%')
          .height('10%')
      }.borderWidth(1)

      Text('Visibility: undefined').fontSize(15).width('90%').height('5%')
      Text() {
        // 正常显示
        ImageSpan($r('app.media.app_icon'))
          .id('ImageSpan_Visibility_undefined')
          .visibility(undefined)
          .width('90%')
          .height('10%')
      }.borderWidth(1)
    }.alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center)
  }
}