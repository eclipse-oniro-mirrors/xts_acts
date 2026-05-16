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

class WaterFlowScrollFrameBeginData {
  public pageTag: string;
  public offset: number;

  constructor(pageTag: string, offset: number) {
    this.pageTag = pageTag;
    this.offset = offset;
  }
}

@Entry
@Component
struct WaterFlowOnScrollFrameBeginTest {
  PAGE_TAG: string = (router.getParams() as WaterFlowScrollFrameBeginData).pageTag;
  private distance: number = (router.getParams() as WaterFlowScrollFrameBeginData).offset;

  build() {
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.waterFlowOnScrollFrameBeginTest(this.PAGE_TAG, this.distance);
      })
    }
  }
}

export { WaterFlowScrollFrameBeginData }