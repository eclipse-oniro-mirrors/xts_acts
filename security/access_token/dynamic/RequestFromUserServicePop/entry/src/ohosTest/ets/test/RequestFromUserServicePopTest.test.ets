/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permission and
 * limitations under the License.
 */

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Utils';
import { abilityAccessCtrl, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function RequestFromUserServicePopTest() {
  describe('RequestFromUserServicePopTest', () => {
    console.info('##########start RequestFromUserServicePopTest');
    let testContext: common.UIAbilityContext;
    
    beforeAll(() => {
      testContext = AppStorage.get('context') as common.UIAbilityContext;
      console.info('########## RequestFromUserServicePopTest beforeAll');
    })
    afterEach(() => {
      console.info('########## RequestFromUserServicePopTest afterEach');
    })


    /**
     * @tc.name   Test_requestFromUserServicePop_001
     * @tc.number Test_requestFromUserServicePop_001
     * @tc.desc   test requestPermissionsFromUser service extension pop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestFromUserServicePop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(domain, tag, "Test_requestFromUserServicePop_001 start");
      try {
        let atManager = abilityAccessCtrl.createAtManager();
        hilog.info(domain, tag, "Test_requestFromUserServicePop_001 begin request Permission from user");
        atManager.requestPermissionsFromUser(testContext, ['ohos.permission.APP_TRACKING_CONSENT']).then((data: PermissionRequestResult): void => {
          hilog.info(domain, tag, "Test_requestFromUserServicePop_001 requestPermissionsFromUser data " + JSON.stringify(data));
          expect(data.permissions.length).assertEqual(1);
          expect(data.authResults[0]).assertEqual(0);
          expect(data.dialogShownResults?.[0]).assertTrue();
          hilog.info(domain, tag, "Test_requestFromUserServicePop_001 requestPermissionsFromUser expect ");
          done();
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, "Test_requestFromUserServicePop_001 catch error" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, "Test_requestFromUserServicePop_001 catch err" + error.code);
        expect(false).assertTrue();
        done();
      }
    })
  })
}