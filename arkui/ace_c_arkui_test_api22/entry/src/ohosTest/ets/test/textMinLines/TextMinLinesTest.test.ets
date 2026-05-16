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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function textMinLinesTest() {

  describe('textMinLinesTest', () => {

    let PAGE_TAG = 'TextMinLinesTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textMinLines/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   textMinLinesTest_001
     * @tc.number textMinLinesTest_001
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textMinLinesTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[textMinLinesTest_001] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('test1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textMinLinesTest_001] textMinLines1: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('1');

      await Utils.sleep(100);
      let strJson2 = getInspectorByKey('test2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[textMinLinesTest_001] textMinLines2: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('0');

      await Utils.sleep(100);
      let strJson3 = getInspectorByKey('test3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[textMinLinesTest_001] textMinLines3: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('5');

      await Utils.sleep(100);
      let strJson4 = getInspectorByKey('test4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[textMinLinesTest_001] textMinLines4: ' + obj4.$attrs.content);
      expect(obj4.$attrs.content).assertEqual('0');

      await Utils.sleep(100);
      let strJson5 = getInspectorByKey('test5');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info('[textMinLinesTest_001] textMinLines5: ' + obj5.$attrs.content);
      expect(obj5.$attrs.content).assertEqual('0');

      console.info('[textMinLinesTest_001] END');
      done();
    })
  })
}