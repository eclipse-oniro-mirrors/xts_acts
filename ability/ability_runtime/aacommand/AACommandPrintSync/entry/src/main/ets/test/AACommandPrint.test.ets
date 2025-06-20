/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function abilityTest() {
  let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined = AppStorage.get<AbilityDelegatorRegistry.AbilityDelegator>("abilityDelegator");
  describe('AACommandPrintTest', () => {
    /**
     * @tc.number: ACTS_AACommand_printSync_01_0100
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
     *           The printSync information includes Chinese, special characters, etc.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_printSync_01_0100', 0, async (done: Function) => {
      done();
      console.log("ACTS_AACommand_printSync_01_0100 start ====> ");
      let msg = ' 测试日志！@#$%^&*()_+QWE {}|?><Fafq3146';
      abilityDelegator?.printSync(msg);
      console.log("ACTS_AACommand_printSync_01_0100 printSync end ====> ");
      let finishmsg = 'ACTS_AACommand_printSync_01_0100 end';
      abilityDelegator?.finishTest(finishmsg, 1).then(() => {
        console.log("ACTS_AACommand_printSync_01_0100 finishTest  test  end ========> callback ");
        console.log("ACTS_AACommand_printSync_01_0100 finishTest  test  end " + "========> callback successfully" );
      })
    })

    /**
     * @tc.number: ACTS_AACommand_printSync_01_0200
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
     *           The length of the printSync message is 1000 characters.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_printSync_01_0200', 0, async (done: Function) => {
      done();
      let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaa' +
        '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae';
      abilityDelegator?.printSync(msg);
      console.log("ACTS_AACommand_printSync_01_0200 printSync end ====> ");
      let finishmsg = 'ACTS_AACommand_printSync_01_0200 end';
      abilityDelegator?.finishTest(finishmsg, 1).then(() => {
        console.log("ACTS_AACommand_printSync_01_0200 print  test  end ========> callback ");
      })
    })

    /**
     * @tc.number: ACTS_AACommand_printSync_01_0300
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid
     *           The length of the printSync message is greater than 1000 characters.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_printSync_01_0300', 0, async (done: Function) => {
      done();
      let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaa' +
        '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae' +
        'fffffffffff';
      abilityDelegator?.printSync(msg);
      console.log("ACTS_AACommand_printSync_01_0300 printSync end ====> ");
      let finishmsg = 'ACTS_AACommand_printSync_01_0300 end';
      abilityDelegator?.finishTest(finishmsg, 1).then(() => {
        console.log("ACTS_AACommand_printSync_01_0300 print  test  end ========> callback ");
      })
    })

    /**
     * @tc.number: ACTS_AACommand_printSync_01_0400
     * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
     *           printSync information is null.
     * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
     *           the test command.
     */
    it('ACTS_AACommand_printSync_01_0400', 0, async (done: Function) => {
      done();
      abilityDelegator?.printSync(null);
      console.log("ACTS_AACommand_printSync_01_0300 printSync end ====> ");
      let finishmsg = 'ACTS_AACommand_printSync_01_0400 end';
      abilityDelegator?.finishTest(finishmsg, 1).then(() => {
        console.log("ACTS_AACommand_printSync_01_0400 print  test  end ========> callback ");
      })
    })
  })
}
