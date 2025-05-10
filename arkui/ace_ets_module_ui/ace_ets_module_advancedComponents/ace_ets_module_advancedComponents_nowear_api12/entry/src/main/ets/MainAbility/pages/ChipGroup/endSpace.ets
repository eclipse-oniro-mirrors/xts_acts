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
import { ChipGroup, ChipGroupSpaceOptions } from "@ohos.arkui.advanced.ChipGroup";

@Entry
@Preview
@Component
struct endSpaceTest {
  @State selected_index: Array<number> = [0, 1, 2, 3, 4, 5, 6]
  @State mChipGroupSpace: ChipGroupSpaceOptions | undefined = { itemSpace: 8, endSpace: 10, startSpace: 20 }
  @State mEndSpace: string = ''
  build() {
    Column() {
      Text('endSpace:' + this.mEndSpace).id('endSpace')
      Button('change')
        .id('change')
        .onClick(() => {
          this.mChipGroupSpace = { itemSpace: 20, endSpace: 30, startSpace: 40 }
        }).margin(20)
      Button('get')
        .id('get')
        .onClick(() => {
          this.mEndSpace = this.mChipGroupSpace?.endSpace + ''
        })
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('app.media.icon') },
            label: { text: "操作块1" },
            suffixIcon: { src: $r('sys.media.ohos_ic_public_cut') },
            allowClose: false
          },
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') },
            label: { text: "操作块2" },
            allowClose: true
          },
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_clock') },
            label: { text: "操作块3" },
            allowClose: true
          },
        ],
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: this.mChipGroupSpace,
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:Array<number>) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        },
      }).id('ChipGroup')
    }
  }
}