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

import { IconType, ComposeListItem } from '@ohos.arkui.advanced.ComposeListItem';

@Entry
@Component
struct ComposeListItemOperateItemImage {
  build() {
    Column() {
      List() {
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.BADGE,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'operateItemImage',
              secondaryText: '辅助文字',
              description: '描述内容文字',
            }),
            operateItem: ({
              image: $r('sys.media.ohos_ic_public_arrow_right'),
            })
          })
        }
      }
    }
  }
}