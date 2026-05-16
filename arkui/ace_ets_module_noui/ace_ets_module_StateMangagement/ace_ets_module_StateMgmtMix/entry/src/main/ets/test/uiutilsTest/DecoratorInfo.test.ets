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
 import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { ObservedResult } from '@ohos.arkui.StateManagement';
export default function DecoratorInfoTest() {
  describe('DecoratorInfoTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uiutils/DecoratorInfo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DecoratorInfoTest state pages: ' + JSON.stringify(pages));
        if (!('DecoratorInfoTest' == pages.name)) {
          console.info('get DecoratorInfoTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push DecoratorInfoTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DecoratorInfoTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('DecoratorInfoTest after each called');
    });
    /**
     * @tc.name   DecoratorInfoTest_0010
     * @tc.number DecoratorInfoTest_0010
     * @tc.desc   DecoratorInfoTest_0010 test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DecoratorInfoTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('DecoratorInfoTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('V2test_01'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let res1 = AppStorage.get<ObservedResult>('ObservedResultRes');
        let res = res1 as ObservedResult;
        console.info("[DecoratorInfoTest_0010] component res is: " + JSON.stringify(res));
        expect(res.isObserved+'').assertEqual('true');
        console.info("[DecoratorInfoTest_0020]");
        expect(res.reason+'').assertEqual('The object data is decorated with V2 @ObservedV2 and @Trace');

        expect(res.decoratorInfo !== undefined).assertTrue();
        expect(res.decoratorInfo.length > 0).assertTrue();
        console.info("[DecoratorInfoTest_0030]");
        expect(res.decoratorInfo[0].decoratorName+'').assertEqual('@Trace');
        console.info("[DecoratorInfoTest_0040]");
        expect(res.decoratorInfo[0].stateVariableName+'').assertEqual('bbb');
        console.info("[DecoratorInfoTest_0050]");
        expect(res.decoratorInfo[0].owningComponentOrClassName+'').assertEqual('AAA');
        console.info("[DecoratorInfoTest_0060]");
        expect(res.decoratorInfo[0].owningComponentId+'').assertEqual('-1');
        console.info("[DecoratorInfoTest_0070]");

        expect(res.decoratorInfo[0].dependentInfo !== undefined).assertTrue();
        expect(res.decoratorInfo[0].dependentInfo.length > 0).assertTrue();

        expect(res.decoratorInfo[0].dependentInfo[0].elementId != -1).assertTrue();
        console.info("[DecoratorInfoTest_0080]");
        expect(res.decoratorInfo[0].dependentInfo[0]?.elementName+'').assertEqual('Text');
        console.info("[DecoratorInfoTest_0090]");
      console.info('[DecoratorInfoTest_0010] END');
      done();
    });
  })
}