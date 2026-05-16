'use static';
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
import {
  Entry,
  Grid,
  Component,
  BarState,
  GridItem,
  Row,
  List,
  ColumnOptions,
  GridItemAlignment,
  ListItem,
  Text,
  Direction,
  IndexerAlign,
  Column,
  Button,
  Stack,
  Margin,
  Alignment,
  ForEach,
  AlphabetIndexer,
  ClickEvent,
  Color,
  TextAlign,
  FontWeight,
  BlurStyle,
  FontStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct alignItemsGridIndex {
  @State data: number[] = new Array<number>();
  @State items: number[] = new Array<number>();

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.data.push(i)
      this.items.push(this.getSize())
    }
  }

  getSize() {
    let ret = Math.floor(Math.random() * 5)
    return Math.max(1, ret)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('Grid alignItems DEFAULT')
      Grid() {
        ForEach(this.data, (item: number) => {
          // GridItem和Column不设置高度，默认会自适应子组件大小。
          GridItem() {
            Column() {
              Column().height(100).backgroundColor('#D5D5D5').width('100%')
              // 中间的Text设置flexGrow(1)来自适应填满父组件的空缺
              Text('这是一段文字。'.repeat(this.items[item.toInt()].toInt()))
                .flexGrow(1)
                .width('100%')
                .align(Alignment.TopStart)
                .backgroundColor('#F7F7F7')
                .id('default_' + item)
              Column().height(50).backgroundColor('#707070').width('100%')
            }
          }
          .border({ color: Color.Black, width: 1 })
        })
      }
      .columnsGap(10)
      .rowsGap(5)
      .columnsTemplate('1fr 1fr')
      .width('80%')
      .height('30%')
      // Grid设置alignItems为DEFAULT，使用Grid的默认对齐方式。
      .alignItems(GridItemAlignment.DEFAULT)
      .scrollBar(BarState.Off)

      Text('Grid alignItems STRETCH')
      Grid() {
        ForEach(this.data, (item: number) => {
          // GridItem和Column不设置高度，设置STRETCH的场景下，会变成与当前行最高节点同高。
          GridItem() {
            Column() {
              Column().height(100).backgroundColor('#D5D5D5').width('100%')
              // 中间的Text设置flexGrow(1)来自适应填满父组件的空缺
              Text('这是一段文字。'.repeat(this.items[item.toInt()].toInt()))
                .flexGrow(1)
                .width('100%')
                .align(Alignment.TopStart)
                .backgroundColor('#F7F7F7')
                .id('stretch_' + item)
              Column().height(50).backgroundColor('#707070').width('100%')
            }
          }
          .border({ color: Color.Black, width: 1 })
        })
      }
      .columnsGap(10)
      .rowsGap(5)
      .columnsTemplate('1fr 1fr')
      .width('80%')
      .height('30%')
      // Grid设置alignItems为STRETCH，以当前行最高的GridItem的高度为其他GridItem的高度。
      .alignItems(GridItemAlignment.STRETCH)
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
  }
}