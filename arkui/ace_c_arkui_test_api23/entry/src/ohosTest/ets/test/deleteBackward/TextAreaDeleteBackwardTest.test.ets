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

export default function TextAreaDeletBackward() {

  describe('TextAreaDeletBackward', () => {

    let PAGE_TAG = 'TextAreaDeleteBackwardTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`deleteBackward/${PAGE_TAG}`, done);
    });

   /**
     * @tc.name   TextAreaDeleteTest001
     * @tc.number TextAreaDeleteTest001
     * @tc.desc   test the TextArea deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextAreaDeleteTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaDeleteTest001] START');
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let DeleteBackward = await driver.findComponent(ON.id('DeleteBackward'));
      await Utils.sleep(500);
      await DeleteBackward.click();
      await Utils.sleep(500);
      let textAreaMiningTips = await driver.findComponent(ON.id('textAreaMiningTips'));
      let actualContent = await textAreaMiningTips.getText();
      console.info('[TextAreaDeleteTest001] actual content is: ' + actualContent);
      expect(actualContent).assertEqual('测试文本!⛏️⛏️⛏️⛏️');
     
      console.info('[TextAreaDeleteTest001] END');
      done();
    });
  })
}