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
import { router } from '@kit.ArkUI';

class WaterFlowScrollToIndexData {
  public pageTag: string;
  public index: number;
  public alignment: number;

  constructor(pageTag: string, index: number, alignment: number) {
    this.pageTag = pageTag;
    this.index = index;
    this.alignment = alignment;
  }
}

@Entry
@Component
struct WaterFlowScrollToIndexTest {
  PAGE_TAG: string = (router.getParams() as WaterFlowScrollToIndexData).pageTag;
  private index: number = (router.getParams() as WaterFlowScrollToIndexData).index;
  private alignment: number = (router.getParams() as WaterFlowScrollToIndexData).alignment;

  build() {
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.waterFlowScrollToIndexTest(this.PAGE_TAG, this.index, this.alignment);
      })
    }
  }
}

export { WaterFlowScrollToIndexData }