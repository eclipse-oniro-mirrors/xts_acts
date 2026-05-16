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
struct ArcListItemAutoScaleNullUndefined {
  build() {
    Scroll() {
      Column() {
        // ========== autoScale tests ==========
        Text('autoScale')

        // ========== Default ==========
        ArcList() {
          ArcListItem() {
            Button('Item', { type: ButtonType.Capsule })
              .width('100%')
              .height('30%')
              .backgroundColor(0x17A98D)
          }
        }
        .id('arclistitem_autoScale_default')
        .width('60%')
        .height('30%')

        // ========== Null ==========
        ArcList() {
          ArcListItem() {
            Button('Item', { type: ButtonType.Capsule })
              .width('100%')
              .height('30%')
              .backgroundColor(0x17A98D)
          }
          .autoScale(null)
        }
        .id('arclistitem_autoScale_null')
        .width('60%')
        .height('30%')

        // ========== Undefined ==========
        ArcList() {
          ArcListItem() {
            Button('Item', { type: ButtonType.Capsule })
              .width('100%')
              .height('30%')
              .backgroundColor(0x17A98D)
          }
          .autoScale(undefined)
        }
        .id('arclistitem_autoScale_undefined')
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
