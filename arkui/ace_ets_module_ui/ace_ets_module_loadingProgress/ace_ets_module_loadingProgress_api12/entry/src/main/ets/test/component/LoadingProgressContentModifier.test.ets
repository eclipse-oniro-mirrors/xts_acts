/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';


export default function LoadingProgressContentModifier() {
  describe('LoadingProgressContentModifier', () => {
    beforeEach(async (done: Function) => {
      console.info('LoadingProgressContentModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/LoadingProgressContentModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get LoadingProgressContentModifier state success ' + JSON.stringify(pages));
        if (!('LoadingProgressContentModifier' == pages.name)) {
          console.info('get LoadingProgressContentModifier state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push LoadingProgressContentModifier page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push LoadingProgressContentModifier page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('LoadingProgressContentModifier after each called');
    });
    /*
    * @tc.number     : LoadingProgressContentModifier_001
    * @tc.name       : LoadingProgressContentModifier_001
    * @tc.desc       : test LoadingProgressContentModifier_001
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('LoadingProgressContentModifier_001', Level.LEVEL1, async (done: Function) => {
      console.info('[LoadingProgressContentModifier_001] START');
      let strJson2 = getInspectorByKey('loadingProgressContentModifierKey01');
      let obj1: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info('[LoadingProgressContentModifier_001] obj1 is: ' + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('config.enableLoading是：true');
      console.info('[LoadingProgressContentModifier_001] END');
      done();
    });
  })
}