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
struct FlexMargin_End {
  private content: string = "FlexMargin_End Page";

  onPageShow() {
    console.info('FlexMargin_End page show called');
  }

  onBuildDone() {
    console.info('FlexMargin_End page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexTest05').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.End,
          wrap: FlexWrap.NoWrap,
        }) {
          Text('1').width(150).height(50).backgroundColor(0xF5DEB3).key('textFlexMargin01')
          Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('textFlexMargin02')
          Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key('textFlexMargin03')
        }
        .key('flexMargin')
        .height(200)
        .width(500)
        .margin(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
