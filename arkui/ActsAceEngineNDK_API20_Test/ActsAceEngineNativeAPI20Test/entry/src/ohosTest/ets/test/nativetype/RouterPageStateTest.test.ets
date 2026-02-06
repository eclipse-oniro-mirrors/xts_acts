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

import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import { ON } from '@kit.TestKit';
import Utils from '../common/Utils';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;

export default function RouterPageStateTest() {
  describe('RouterPageStateTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.replacePageStandard("NativeType/RouterPage", done);
    })
    /**
     * @tc.name   testArkUIACERouterPageState0300
     * @tc.number SUB_ArkUI_ACE_RouterPageState_0300
     * @tc.desc   testing ArkUI_RouterPageState enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERouterPageState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RouterPageState_0300 start====");
          let com = await Utils.driver.findComponent(ON.id("goPageTwo"));
          await com.click();
          await Utils.sleep(900);
          Utils.triggerKey(2);
          await Utils.sleep(900);
          let result: number = libnativetype.GetRouterPageNodeStateResult(2);
          console.info("====>SUB_ArkUI_ACE_RouterPageState_0300 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RouterPageState_0300 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERouterPageState0400
     * @tc.number SUB_ArkUI_ACE_RouterPageState_0400
     * @tc.desc   testing ArkUI_RouterPageState enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERouterPageState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RouterPageState_0400 start====");
          let com = await Utils.driver.findComponent(ON.id("goPageTwo"));
          await com.click();
          await Utils.sleep(900);
          Utils.triggerKey(2);
          await Utils.sleep(900);
          let result: number = libnativetype.GetRouterPageNodeStateResult(3);
          console.info("====>SUB_ArkUI_ACE_RouterPageState_0400 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RouterPageState_0400 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERouterPageState0500
     * @tc.number SUB_ArkUI_ACE_RouterPageState_0500
     * @tc.desc   testing ArkUI_RouterPageState enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERouterPageState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RouterPageState_0500 start====");
          let com = await Utils.driver.findComponent(ON.id("goPageTwo"));
          await com.click();
          await Utils.sleep(900);
          Utils.triggerKey(2);
          await Utils.sleep(900);
          let result: number = libnativetype.GetRouterPageNodeStateResult(4);
          console.info("====>SUB_ArkUI_ACE_RouterPageState_0500 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RouterPageState_0500 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
  })
}
