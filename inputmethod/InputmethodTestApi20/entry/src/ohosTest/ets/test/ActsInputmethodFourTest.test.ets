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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'
import { inputMethodEngine, inputMethod } from '@kit.IMEKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commoneventmanager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

let sleep = (timeout: number): Promise<ESObject> => {
  return new Promise(resolve => {
    const st = setTimeout(() => {
      resolve(null);
      clearTimeout(st);
    }, timeout);
  });
};

export default function ActsInputmethodFourTest() {
  describe('ActsInputmethodFourTest', () => {
    const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    beforeAll(async () => {
      await delegator.executeShellCommand('ime -e com.acts.actsinputmethodtest -f');
      await delegator.executeShellCommand('ime -s com.acts.actsinputmethodtest');
    })
    /**
     * @tc.number SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800
     * @tc.name SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800
     * @tc.desc test IME_EXTEND_ACTION_SELECT_ALL
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800 publishCallback failed:" +
          JSON.stringify(err));
        } else {
          try {
            let data = await inputMethod.getController().detach();
            console.info(`====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800 data: ${JSON.stringify(data)}`);
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800 onHandleExtendAction start");
            testNapi.testImeExtendAction();
            await sleep(1000);
            let result: number = testNapi.testImeExtendActionSelectAll();
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800 result====",
              result);
            expect(result).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_SELECT_ALL_17800 onHandleExtendAction catch err: " +
            JSON.stringify(err));
            expect(err).assertFail();
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 10
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900
     * @tc.name SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900
     * @tc.desc test IME_EXTEND_ACTION_CUT
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900 publishCallback failed:" +
          JSON.stringify(err));
        } else {
          try {
            let data = await inputMethod.getController().detach();
            console.info(`====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900 data: ${JSON.stringify(data)}`);
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900 onHandleExtendAction start");
            testNapi.testImeExtendAction();
            await sleep(1000);
            let result: number = testNapi.testImeExtendActionCut();
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900 result====",
              result);
            expect(result).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_CUT_17900 onHandleExtendAction catch err: " +
            JSON.stringify(err));
            expect(err).assertFail();
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 20
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000
     * @tc.name SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000
     * @tc.desc test IME_EXTEND_ACTION_COPY
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000 publishCallback failed:" +
          JSON.stringify(err));
        } else {
          try {
            let data = await inputMethod.getController().detach();
            console.info(`====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000 data: ${JSON.stringify(data)}`);
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000 onHandleExtendAction start");
            testNapi.testImeExtendAction();
            await sleep(1000);
            let result: number = testNapi.testImeExtendActionCopy();
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000 result====",
              result);
            expect(result).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_COPY_18000 onHandleExtendAction catch err: " +
            JSON.stringify(err));
            expect(err).assertFail();
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 30
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /**
     * @tc.number SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100
     * @tc.name SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100
     * @tc.desc test IME_EXTEND_ACTION_PASTE
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100 publishCallback failed:" +
          JSON.stringify(err));
        } else {
          try {
            let data = await inputMethod.getController().detach();
            console.info(`====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100 data: ${JSON.stringify(data)}`);
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100 onHandleExtendAction start");
            testNapi.testImeExtendAction();
            await sleep(1000);
            let result: number = testNapi.testImeExtendActionPaste();
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100 result====",
              result);
            expect(result).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_Imf_SDK_IME_EXTEND_ACTION_PASTE_18100 onHandleExtendAction catch err: " +
            JSON.stringify(err));
            expect(err).assertFail();
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 40
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });
  })
}