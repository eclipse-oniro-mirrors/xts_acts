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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function UIContextCreateFromBuilderJsunit() {
  describe('UIContextCreateFromBuilderTest', () => {
    beforeEach(async (done: Function) => {
      console.info('text beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/xts/UIContextCreateFromBuilder',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get UIContextCreateFromBuilder state pages:' + JSON.stringify(pages));
        if (!('UIContextCreateFromBuilder' == pages.name)) {
          console.info('get UIContextCreateFromBuilder state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push UIContextCreateFromBuilder page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UIContextCreateFromBuilder page error:' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('UIContextCreateFromBuilder after each called');
    });

    /**
     * @tc.number UIContextCreateFromBuilderTest_0100
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('UIContextCreateFromBuilderTest_0100', 0, async (done: Function) => {
      console.info('UIContextCreateFromBuilderTest_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('getComponentSnapshot_03'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('key_getComponentSnapshot_text_03');
      expect(JSON.parse(text).$attrs.content).assertEqual('snapshot');
      console.info('UIContextCreateFromBuilderTest_0100 END');
      done();
    });

    /**
     * @tc.number UIContextCreateFromBuilderTest_0200
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('UIContextCreateFromBuilderTest_0200', 0, async (done: Function) => {
      console.info('UIContextCreateFromBuilderTest_0200 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('getComponentSnapshot_04'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('key_getComponentSnapshot_text_04');
      expect(JSON.parse(text).$attrs.content).assertEqual('snapshot');
      console.info('UIContextCreateFromBuilderTest_0200 END');
      done();
    });
  })
}