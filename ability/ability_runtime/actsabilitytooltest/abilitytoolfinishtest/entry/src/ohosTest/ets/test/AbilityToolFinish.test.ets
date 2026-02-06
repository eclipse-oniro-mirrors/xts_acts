/*
 * Copyright (c) 2024-2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

const TEST_SUITE_NAME: string = 'AbilityToolFinishTest';
const CODE_ERROR = 401;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;

export default function abilityToolFinishTest() {
  describe('AbilityToolFinishTest', () => {
    beforeAll(async (done: Function) => {
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      await done();
    })

    afterEach(async (done: Function) => {
      console.log("AbilityToolFinishTest afterEach called");
      let wantInfo: Want = {
        bundleName: "com.acts.abilitytoolfinishtest",
        abilityName: "MainAbility"
      }
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantInfo)
        .then((data) => {
          console.log("AbilityToolFinishTest startAbility data : " + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log("AbilityToolFinishTest startAbility err : " + JSON.stringify(err));
        })

      setTimeout(() => {
        console.log("AbilityToolFinishTest afterEach end");
        done();
      }, 1000)
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20600
     * @tc.name      : The parameters of the test command are valid, and the finishTest API is called in AsyncCallback mode,
     * and the msg parameter (including Chinese and special characters) and code parameter (Number.MIN_VALUE-1) are invalid.
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MIN_VALUE-1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20600', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(AppStorage.get<string>("stdResult206")!.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20700
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in AsyncCallback mode,
     * the msg parameter is valid (including Chinese and special characters) and the code parameter is invalid (non-number)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is invalid ('ABCD')
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20700', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(AppStorage.get<string>("stdResult207")!.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20800
     * @tc.name      : Each parameter of the test command is valid, call the finishTest API in AsyncCallback mode,
     * the msg parameter is valid (including Chinese and special characters) and the code parameter is valid (1)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20800', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(AppStorage.get<string>("stdResult208")!.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20900
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in AsyncCallback mode,
     * the msg parameter is valid (including Chinese and special characters) and the code parameter is valid (Number.MAX_VALUE)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MAX_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20900', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(AppStorage.get<string>("stdResult209")!.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21000
     * @tc.name      : The parameters of the test command are valid, and the finishTest API is called in AsyncCallback mode,
     * and the msg parameter (including Chinese and special characters) and code parameter (Number.MIN_VALUE) are valid.
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MIN_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21000', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(AppStorage.get<string>("stdResult210")!.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21100
     * @tc.name      : The parameters of the test command are valid, and the finishTest API is called in Promise mode,
     * and the msg parameter is invalid (null) and the code parameter is valid (1).
     * @tc.desc      : for testing finishTest by promise msg msg parameter is invalid(null) and the code is valid(1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21100', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21100';
      try {
        await abilityDelegator.finishTest(null, 1)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err.code}`);
        expect(err.code).assertEqual(CODE_ERROR);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21200
     * @tc.name      : The parameters of the test command are valid, call the finishTest API in Promise mode,
     *                 and the msg parameter is invalid (Undefined) and the code parameter is valid (1)
     * @tc.desc      : for testing finishTest by promise msg msg parameter is invalid(undefined) and the code is valid(1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21200', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21200';
      try {
        await abilityDelegator.finishTest(undefined, 1)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err.code}`)
        expect(err.code).assertEqual(CODE_ERROR);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21300
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 the msg parameter is valid (including Chinese and special characters) and the code parameter is invalid (Number.MAX_VALUE+1)
     * @tc.desc      : for testing finishTest by promise msg msg parameter is invalid('测试日志!@#$%^&*()_+QWE{}|?><Fafq3146') and the code is invalid(Number.MAX_VALUE+1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21300', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(globalThis.stdResult1.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400
     * @tc.name      : The parameters of the test command are valid, call the finishTest API in Promise mode,
     *                 and the msg parameter is valid (including Chinese and special characters) and the code parameter is invalid (Number.MIN_VALUE-1)
     * @tc.desc      : for testing finishTest by promise msg msg parameter is invalid('测试日志!@#$%^&*()_+QWE{}|?><Fafq3146') and the code is invalid(Number.MIN_VALUE-1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(globalThis.stdResult1.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21500
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 msg parameter is valid (including Chinese and special characters) and code parameter is invalid (non-number)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called by promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is invalid ('ABCD')
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21500', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(globalThis.stdResult1.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21600
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 msg parameter (including Chinese and special characters) and code parameter are valid (1)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21600', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(globalThis.stdResult1.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21700
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 msg parameter is valid (including Chinese and special characters) and code parameter is valid (Number.MAX_VALUE)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MAX_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21700', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(globalThis.stdResult1.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_21800
     * @tc.name      : The parameters of the test command are valid, call the finishTest API in Promise mode,
     *                 and the msg parameter (including Chinese and special characters) and code parameter (Number.MIN_VALUE) are valid.
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MIN_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21800', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21400';
      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test start`);
      try {
        expect(globalThis.stdResult1.indexOf('aa test') === -1).assertTrue();
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })
  })
}
