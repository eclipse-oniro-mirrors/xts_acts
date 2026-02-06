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

import { describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'

export default function requirementRouterPageStateTest() {

  describe('RequirementRouterPageStateTest', () => {

    let PAGE_TAG = 'RequirementRouterPageStateTest';

    it('testRequirementRouterPageState001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`, done);
      let dataArray: number[][] = nativeRender.getRouterData();
      let router: number[] = dataArray[0];
      expect(router[0] == 106201).assertEqual(true)
      expect(router[1] == 106201).assertEqual(true)
      expect(router[2] == 106201).assertEqual(true)
    })
  })
}
