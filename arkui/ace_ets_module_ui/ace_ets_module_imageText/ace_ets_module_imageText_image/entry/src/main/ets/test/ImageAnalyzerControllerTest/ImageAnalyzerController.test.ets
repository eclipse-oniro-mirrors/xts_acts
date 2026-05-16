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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import { UiComponent, UiDriver, Component, Driver, ON, BY } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageAnalyzerControllerTest() {
  describe('ImageAnalyzerControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAnalyzerControllerTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnalyzerController/ImageAnalyzerController',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get ImageAnalyzerControllerTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('ImageAnalyzerController')) {
          const result = await router.replaceUrl(options);
          console.info('push ImageAnalyzerControllerTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push ImageAnalyzerControllerTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAnalyzerControllerTest afterEach called');
    });

    /**
     * @tc.name   ImageAnalyzerControllerTest001
     * @tc.number ImageAnalyzerControllerTest001
     * @tc.desc   test the ImageAnalyzerController  Array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnalyzerControllerTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnalyzerControllerTest001] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('getTypes'));
      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(500);
      let res: number[] | undefined = AppStorage.get('ImageAnalyzerControllerTypeArr');
      expect(res && res.length > 0).assertTrue();
      AppStorage.delete('ImageAnalyzerControllerTypeArr')
      console.info('[ImageAnalyzerControllerTest001] END');
      done();
    });
  })
}