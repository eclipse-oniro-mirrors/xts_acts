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

export default function isTransferredTest() {
  describe('isTransferredTest', () => {
    beforeEach(async (done: Function) => {
      console.info('isTransferredTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/isTransferredTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get isTransferredTest state pages:' + JSON.stringify(pages));
        if (!('isTransferredTest' == pages.name)) {
          console.info('get isTransferredTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push isTransferredTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push isTransferredTest page error:' + err);
      }
      console.info('isTransferredTest beforeEach end');
      done();
    });

    /**
     * @tc.name   isTransferredTest_0100
     * @tc.number isTransferredTest_0100
     * @tc.desc   frameNode: test bindController error code for Grid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('isTransferredTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('isTransferredTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_isTransferred'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isTransferredFalse')).assertEqual(false);
      AppStorage.delete('isTransferredFalse')
      console.info('[isTransferredTest_0100] END');
      done();
    });
  })
}