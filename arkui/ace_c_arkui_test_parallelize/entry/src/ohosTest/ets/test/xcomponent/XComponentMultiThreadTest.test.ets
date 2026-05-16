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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';

export default function XComponentMultiThreadTest(){

  describe('xcomponentMultiThreadTest', () => {
    let PAGE_TAG = 'xcomponent_multithread';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`xcomponent/${PAGE_TAG}`, done);
      await Utils.sleep(1000);
    });

    /**
     * @tc.name   xcomponentMultiThreadTest
     * @tc.number xcomponentMultiThreadTest
     * @tc.desc   Test xcomponentMultiThreadTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('xcomponentMultiThreadTest', Level.LEVEL1, async (done: Function) => {
      console.info('[xcomponentMultiThreadTest] START');
      await Utils.sleep(1000);
      let driver = await Driver.create();
      await Utils.sleep(1000);
      let xcomponent = await driver.findComponent(ON.type('XComponent'));
      expect(xcomponent !== null).assertEqual(true)
      let id = await xcomponent.getId()
      console.info("[xcomponentMultiThreadTest] ID=" + id);
      expect(id).assertEqual('xcomponent_surface_success')
      console.info("[xcomponentMultiThreadTest] END");
      await Utils.pushPage(`xcomponent/${PAGE_TAG}`, done);
      done();
    });
  })
}