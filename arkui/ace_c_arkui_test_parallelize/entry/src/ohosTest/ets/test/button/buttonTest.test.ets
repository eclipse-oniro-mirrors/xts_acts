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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

const SLEEP_TIME = 1000;

export default function ButtonTest(){

  describe('ButtonTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   buttonTest001
     * @tc.number buttonTest001
     * @tc.desc   Test the button interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonTest001', Level.LEVEL1, async (done: Function) => {
      console.info('buttonTest001 START');
      let PAGE_TAG = 'buttonTest';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('button001');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(SLEEP_TIME);
      expect(obj.$attrs.label).assertEqual('click');
      await Utils.sleep(SLEEP_TIME);
      console.info('buttonTest001 END');
      done();
    });
  })
}