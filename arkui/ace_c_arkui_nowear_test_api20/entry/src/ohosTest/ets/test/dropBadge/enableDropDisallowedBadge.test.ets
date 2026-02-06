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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { UiComponent, UiDriver, Component, Driver, ON, BY, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function enableDropDisallowedBadgeTest() {

  describe('enableDropDisallowedBadgeTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })


  /**
   * @tc.name   enableDropDisallowedBadge001
   * @tc.number enableDropDisallowedBadge001
   * @tc.desc   enableDropDisallowedBadge001
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('enableDropDisallowedBadge001', Level.LEVEL1, async (done: Function) => {
    console.info('enableDropDisallowedBadge001 START');
    let PAGE_TAG = 'enableDropDisallowedBadge';
    await Utils.pushPage(`dropBadge/enableDropDisallowedBadge`)
    await Utils.sleep(2000)
    let strJson = getInspectorByKey('image');
    let obj: ESObject = JSON.parse(strJson);
    console.info("[enableDropDisallowedBadge001]:" + JSON.stringify(obj.$attrs.backgroundColor));
    expect(obj.$attrs.backgroundColor).assertEqual('#AA00AA00');
    await Utils.sleep(1000)
    console.info('enableDropDisallowedBadge001 END');
    done();
  });
  })
}