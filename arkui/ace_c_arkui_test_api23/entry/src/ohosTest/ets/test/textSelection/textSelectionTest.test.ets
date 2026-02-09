/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@kit.TestKit';

export default function TextSelectionTest() {

  describe('TextSelectionTest', () => {

    let PAGE_TAG = 'textSelectionTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textSelection/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   TextSelection_0100
     * @tc.number TextSelection_0100
     * @tc.desc   test CanbeObserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextSelection_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('TextSelection_0100 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button'));
      await button.click();
      console.info('TextSelection_0100 111');
      await Utils.sleep(1000);
      console.info('TextSelection_0100 222');
      let strJson1 = getInspectorByKey('textSelection');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TextSelection_0100] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('menuPolicy1select1 6');

      await button.click();
      console.info('TextSelection_0100 333');
      await Utils.sleep(1000);
      console.info('TextSelection_0100 444');
      
      let strJson2 = getInspectorByKey('textSelection');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[TextSelection_0100] content: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('menuPolicy0select1 6');

      await button.click();
      console.info('TextSelection_0100 555');
      await Utils.sleep(1000);
      console.info('TextSelection_0100 666');

      let strJson3 = getInspectorByKey('textSelection');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[TextSelection_0100] content: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('menuPolicy2select1 6');
      console.info('TextSelection_0100 END');

      done();
    });
  })
}