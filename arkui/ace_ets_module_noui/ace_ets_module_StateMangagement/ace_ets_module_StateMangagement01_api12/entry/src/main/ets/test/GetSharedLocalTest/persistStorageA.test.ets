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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function persistStorageATest() {
  describe('persistStorageATest', () => {
    beforeEach(async (done: Function) => {
      console.info("persistStorageATest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GetSharedLocal/persistStorageA',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get persistStorageATest state pages: " + JSON.stringify(pages));
        if (!("persistStorageA" == pages.name)) {
          console.info("get persistStorageATest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push persistStorageATest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push persistStorageATest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   persistStorageATest_0100
     * @tc.number ListScroll
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('persistStorageATest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('persistStorageATest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('persistStorageA_1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('PropAX:47');
      done();
    });
  })
}

