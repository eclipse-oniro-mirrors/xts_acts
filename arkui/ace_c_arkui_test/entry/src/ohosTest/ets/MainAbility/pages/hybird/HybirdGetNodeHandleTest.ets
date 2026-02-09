/*
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

import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';
import { UIContext, ComponentContent   } from '@kit.ArkUI';
@Builder
function mixedRow() {
  Row() {
    Text('Hello, World!')
      .backgroundColor(Color.Gray)
  }
  .id('row')
  .width(200)
  .height(200)
  .backgroundColor(Color.Green)
}

// 提供创建ArkTS组件的入口函数。
export function createMixedRow(uiContent:UIContext): ComponentContent<[]> {
  // 通过ComponentContent创建Row组件并将它封装起来。
  return new ComponentContent<[]>(uiContent!, wrapBuilder<[]>(mixedRow));
}

@Entry
@Component
struct HybirdGetNodeHandleTest {
  PAGE_TAG: string = 'HybirdGetNodeHandleTest';

  build() {
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.hybirdGetNodeHandleTest(this.PAGE_TAG, createMixedRow, this.getUIContext());
      })
    }
  }
}
