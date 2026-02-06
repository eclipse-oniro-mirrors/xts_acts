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
  ToolBarV2,
  ToolBarV2Item,
  ToolBarV2ItemImage,
  ToolBarV2ItemState,
  ToolBarV2ItemText,
  ToolBarV2Modifier
} from '@ohos.arkui.advanced.ToolBarV2';
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node';
import { DividerModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct ToolBarItemState {
  @Local toolBarList: ToolBarV2Item[] = [];
  @Local toolBarModifier: ToolBarV2Modifier =
    new ToolBarV2Modifier().height(LengthMetrics.vp(52)).backgroundColor(ColorMetrics.resourceColor(Color.Transparent));
  @Local dividerModifier: DividerModifier = new DividerModifier().height(0);
  @Local activatedIndex: number = 0;

  aboutToAppear() {
    this.toolBarList.push(new ToolBarV2Item(
      {
        content: new ToolBarV2ItemText({
          text: 'Copy',
        }),
        icon: new ToolBarV2ItemImage({
          src: $r('sys.media.ohos_ic_public_copy'),
        }),
        action: (index: number) => {
        },
        state: ToolBarV2ItemState.DISABLE,
      }
    ));
    this.toolBarList.push(new ToolBarV2Item(
      {
        content: new ToolBarV2ItemText({
          text: 'Share',
          activatedColor: ColorMetrics.resourceColor('#ffec5d5d'),
        }),
        icon: new ToolBarV2ItemImage({
          src: $r('sys.media.ohos_ic_public_share'),
          color: ColorMetrics.resourceColor('#ff18cb53'),
          activatedColor: ColorMetrics.resourceColor('#ffec5d5d'),
        }),
        action: (index: number) => {
        },
        state: ToolBarV2ItemState.ENABLE,
      }
    ));

  }

  build() {
    Row() {
      Stack() {
        Column() {
          ToolBarV2({
            toolBarModifier: this.toolBarModifier,
            dividerModifier: this.dividerModifier,
            activatedIndex: this.activatedIndex,
            toolBarList: this.toolBarList,
          })
        }
      }
      .align(Alignment.Bottom)
      .width('100%')
      .height('100%')
    }
  }
}