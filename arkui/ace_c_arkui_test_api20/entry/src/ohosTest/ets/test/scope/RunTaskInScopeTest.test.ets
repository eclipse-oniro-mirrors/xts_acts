/*
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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function RunTaskInScopeTest(){

  describe('RunTaskInScopeTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testRunTaskInScope001
     * @tc.number SUB_ARKUI_CAPI_RUNTASK_IN_SCOPE_0100
     * @tc.desc   test RunTaskInScope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunTaskInScope001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestRunTaskInScope';
      await Utils.pushPage(`scope/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('btn3_id'));
      await button1.click();
      await Utils.sleep(1000)
      let button2 = await driver.findComponent(ON.id('btn4_id'));
      await button2.click();
      await Utils.sleep(1000)
      let button3 = await driver.findComponent(ON.id('uiContext2'));
      await button3.click();
      await Utils.sleep(1000)

      expect(Utils.getComponentInfoByKey('btn3_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('btn4_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('uiContext2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}