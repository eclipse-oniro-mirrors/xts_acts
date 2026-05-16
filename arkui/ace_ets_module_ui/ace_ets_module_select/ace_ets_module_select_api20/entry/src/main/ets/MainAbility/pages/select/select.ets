/*
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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct selectmenuOutlineTest {
  @State private text: string = 'SelectTest';
  @Builder
  build() {
    Column() {
      Select([{ value: 'aaa' },
        { value: 'bbb' },
        { value: 'ccc' },
        { value: 'ddd' }])
        .id('menuOutline')
        .selected(2)
        .value('this.text')
        .font({ size: 16, weight: 500 })
        .fontColor($r('sys.color.font_primary'))
        .selectedOptionFont({ size: 16, weight: 400 })
        .optionFont({ size: 16, weight: 400 })
        .space(8)
        .arrowPosition(ArrowPosition.END)
        .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
        .optionWidth(200)
        .optionHeight(300)
        .menuOutline({
          width: 8,
          color: Color.Red
        })
    }
      .width("90%")
      .height(50)
      .margin(10)
  }
} 