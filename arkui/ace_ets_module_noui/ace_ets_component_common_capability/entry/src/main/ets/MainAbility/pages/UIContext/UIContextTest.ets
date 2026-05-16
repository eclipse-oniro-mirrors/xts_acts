/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct UIContextTest {
  @State text01: string = 'result_0'
  @State text02: string = 'result_1'
  @State text03: string = 'result_100'
  @State text04: string = 'result_max-1'
  @State text05: string = 'result_max'
  @State text06: string = 'result_-1'
  @State text07: string = 'result_overflow'
  @State text08: string = 'result_min'

  build() {
    Scroll() {
      Column() {
        Text('UIContext Test')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin(5)

        Column() {
          Text('Child Level 1')
            .fontSize(10)
            .id('testId')

          Column() {
            Text('Child Level 2')
              .fontSize(8)
              .id('childLevel2')

            Text('Child Level 3')
              .fontSize(8)
              .id('childLevel3')
          }
          .id('nestedColumn')
        }
        .id('parentColumn')
        .padding(5)
        .backgroundColor(Color.Gray)

        Text(this.text01).id('text01_id').fontSize(8).maxLines(2)
        Button('depth_0').id("btn_depth_0").width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', 0, ['id'])
              this.text01 = result
            } catch (err) {
              this.text01 = JSON.stringify(err)
            }
          })

        Text(this.text02).id('text02_id').fontSize(8).maxLines(2)
        Button('depth_1').id('btn_depth_1').width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', 1, ['id'])
              this.text02 = result
            } catch (err) {
              this.text02 = JSON.stringify(err)
            }
          })

        Text(this.text03).id('text03_id').fontSize(8).maxLines(2)
        Button('depth_100').id('btn_depth_100').width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', 100, ['id'])
              this.text03 = result
            } catch (err) {
              this.text03 = JSON.stringify(err)
            }
          })

        Text(this.text04).id('text04_id').fontSize(8).maxLines(2)
        Button('depth_max-1').id('btn_depth_max_minus_one').width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', 2147483646, ['id'])
              this.text04 = result
            } catch (err) {
              this.text04 = JSON.stringify(err)
            }
          })

        Text(this.text05).id('text05_id').fontSize(8).maxLines(2)
        Button('depth_max').id('btn_depth_max').width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', 2147483647, ['id'])
              this.text05 = result
            } catch (err) {
              this.text05 = JSON.stringify(err)
            }
          })

        Text(this.text06).id('text06_id').fontSize(8).maxLines(2)
        Button('depth_-1').id('btn_depth_negative').width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', -1, ['id'])
              this.text06 = result
            } catch (err) {
              this.text06 = JSON.stringify(err)
            }
          })

        Text(this.text07).id('text07_id').fontSize(8).maxLines(2)
        Button('depth_overflow').id('btn_depth_above_max').width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', 2147483648, ['id'])
              this.text07 = result
            } catch (err) {
              this.text07 = JSON.stringify(err)
            }
          })

        Text(this.text08).id('text08_id').fontSize(8).maxLines(2)
        Button('depth_min').id('btn_depth_large_negative').width(120).height(30).fontSize(10)
          .onClick(() => {
            try {
              let result = this.getUIContext().getFilteredInspectorTreeById('testId', -2147483648, ['id'])
              this.text08 = result
            } catch (err) {
              this.text08 = JSON.stringify(err)
            }
          })
      }
      .width('100%')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .id('main_scroll')
  }
}