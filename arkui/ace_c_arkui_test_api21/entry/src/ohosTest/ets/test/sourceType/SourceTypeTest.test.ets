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

import { beforeAll, describe, expect, it, Level, afterEach, beforeEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, By } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';

declare function getInspectorByKey(key: string): string;

export default function SourceTypeTest() {
  describe('SourceTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SourceType beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sourceType/SourceTypeTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SourceType state pages:' + JSON.stringify(pages));
        if (pages.name !== 'SourceTypeTest') { 
          console.info('get SourceType pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push SourceType page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SourceType page error:' + JSON.stringify(err));
        expect().assertFail(); 
      }
      console.info('SourceTypeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('SourceTypeTest after each called');
    });

    /**
     * @tc.number    SourceType_001
     * @tc.name      SourceType_001
     * @tc.desc      testing click button for the value of sourceType_KEY
     * @tc.level:    Level 1
     */
    it('SourceType_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceType_001] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);

        let keyBtn1 = await driver.findComponent(ON.id('buttonKeyTest'));
        await keyBtn1.click();
        await CommonFunc.sleep(500);

        await driver.triggerKey(2049);
        await CommonFunc.sleep(500);

        await driver.triggerKey(2049);
        await CommonFunc.sleep(500);

        await driver.triggerKey(2054);
        await Utils.sleep(1000);
        console.info('[SourceType_001] KEY');

        let strJson = getInspectorByKey('textValue'); 
        let obj: ESObject = JSON.parse(strJson);
        console.info('[SourceTypeTest_001]:' + obj.$attrs.content);
        expect(obj.$attrs.content).assertEqual('4'); 
  
      console.info('[SourceType_001] END');
      done();
    });
  });
}