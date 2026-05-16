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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function bindControllerList() {
  describe('bindControllerList', () => {
    beforeEach(async (done: Function) => {
      console.info('bindControllerList beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/bindControllerList',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get bindControllerList state pages:' + JSON.stringify(pages));
        if (!('bindControllerList' == pages.name)) {
          console.info('get bindControllerList pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push bindControllerList page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push bindControllerList page error:' + err);
      }
      console.info('bindControllerList beforeEach end');
      done();
    });

    /**
     * @tc.name   bindControllerList_0100
     * @tc.number bindControllerList_0100
     * @tc.desc   frameNode: test bindController error code for List
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindControllerList_0100', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerList_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('list_btn_100023'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('error_list_100023');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[bindControllerList_0100] content obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Error: 100023');
      console.info('[bindControllerList_0100] END');
      done();
    });

    /**
     * @tc.name   bindControllerList_0200
     * @tc.number bindControllerList_0200
     * @tc.desc   frameNode: test bindController error code for List
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('bindControllerList_0200', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerList_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('list_btn_100021'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('error_list_100021');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[bindControllerList_0200] content obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      console.info('[bindControllerList_0200] END');
      done();
    });
  })
}