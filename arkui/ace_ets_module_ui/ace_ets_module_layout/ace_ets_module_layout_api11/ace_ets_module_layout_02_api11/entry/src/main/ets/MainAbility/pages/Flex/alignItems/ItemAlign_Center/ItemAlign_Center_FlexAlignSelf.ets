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
struct FlexAlignSelf_Center {
  private content: string = 'FlexAlignSelf_Center Page';

  onPageShow() {
    console.info('FlexAlignSelf_Center page show called');
  }

  onBuildDone() {
    console.info('FlexAlignSelf_Center page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexTest12').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.Center,
          wrap: FlexWrap.NoWrap,
        }) {
          Text('1')
            .width(150)
            .height(50)
            .backgroundColor(0xF5DEB3)
            .alignSelf(ItemAlign.End)
            .key('ItemAlign_Center_textAlignSelf01')
          Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('ItemAlign_Center_textAlignSelf02')
          Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key('ItemAlign_Center_textAlignSelf03')
        }
        .key('ItemAlign_Center_flexAlignSelf')
        .height(200)
        .width(500)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 })
    }.width('100%')
  }
}
