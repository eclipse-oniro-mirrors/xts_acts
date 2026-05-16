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
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@ohos.arkui.ArcList';

@Entry
@Component
struct ArcListOnScrollIndexNullUndefined {
  @State numItems: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    Scroll() {
      Column() {
        // ========== onScrollIndex tests ==========
        Text('onScrollIndex')

        // ========== Default ==========
        ArcList() {
          ForEach(this.numItems.slice(0, 3), (item: number) => {
            ArcListItem() {
              Button('Item', { type: ButtonType.Capsule })
                .width('100%')
                .height('20%')
                .backgroundColor(0x17A98D)
            }
          }, (item: number) => `onScrollIndex_default_${item}`)
        }
        .id('arclist_onScrollIndex_default')
        .width('60%')
        .height('30%')

        // ========== Null ==========
        ArcList() {
          ForEach(this.numItems.slice(0, 3), (item: number) => {
            ArcListItem() {
              Button('Item', { type: ButtonType.Capsule })
                .width('100%')
                .height('20%')
                .backgroundColor(0x17A98D)
            }
          }, (item: number) => `onScrollIndex_null_${item}`)
        }
        .onScrollIndex(null)
        .id('arclist_onScrollIndex_null')
        .width('60%')
        .height('30%')

        // ========== Undefined ==========
        ArcList() {
          ForEach(this.numItems.slice(0, 3), (item: number) => {
            ArcListItem() {
              Button('Item', { type: ButtonType.Capsule })
                .width('100%')
                .height('20%')
                .backgroundColor(0x17A98D)
            }
          }, (item: number) => `onScrollIndex_undefined_${item}`)
        }
        .onScrollIndex(undefined)
        .id('arclist_onScrollIndex_undefined')
        .width('60%')
        .height('30%')
      }
    }
    .width('100%')
    .height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .backgroundColor('#D5D5D5')
  }
}
