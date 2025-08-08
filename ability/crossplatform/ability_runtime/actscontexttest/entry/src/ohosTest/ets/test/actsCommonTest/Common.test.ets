/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function Common() {
  describe("Common",  () =>{

    beforeAll(async  () => {
      console.info("beforeAll case");
    });

    beforeEach(async  () => {
      console.info("beforeEach case");
    });

    afterEach(async  () => {
      console.info('afterEach case');
    });

    afterAll(async  () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : ABILITY_TEST_COMMON_0100
     * @tc.name      : testCommon001
     * @tc.desc      : test Common of UIAbilityContext
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCommon001', 0, async  (done:Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        console.log(`testCommon001 success`);
        done();
      } catch (err) {
        console.log(`testCommon001 fail:` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_COMMON_0200
     * @tc.name      : testCommon002
     * @tc.desc      : test Common of AbilityStageContext
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCommon002', 0, async  (done:Function) => {
      try {
        let stageContext: common.AbilityStageContext = globalThis.stageContext;
        expect(stageContext != null).assertTrue();
        console.log(`testCommon002 success`);
        done();
      } catch (err) {
        console.log(`testCommon002 fail:` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_COMMON_0300
     * @tc.name      : testCommon003
     * @tc.desc      : test Common of ApplicationContext
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCommon003', 0, async  (done:Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let appContext: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(appContext != null).assertTrue();
        console.log(`testCommon003 success`);
        done();
      } catch (err) {
        console.log(`testCommon003 fail:` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_COMMON_0400
     * @tc.name      : testCommon004
     * @tc.desc      : test Common of BaseContext
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCommon004', 0, async  (done:Function) => {
      try {
        let stageContext: common.AbilityStageContext = globalThis.stageContext;
        expect(stageContext != null).assertTrue();
        let baseContext: common.BaseContext = stageContext;
        expect(baseContext != null).assertTrue();
        console.log(`testCommon004 success`);
        done();
      } catch (err) {
        console.log(`testCommon004 fail:` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_COMMON_0500
     * @tc.name      : testCommon005
     * @tc.desc      : test Common of Context
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCommon005', 0, async  (done:Function) => {
      try {
        let stageContext: common.AbilityStageContext = globalThis.stageContext;
        expect(stageContext != null).assertTrue();
        let context: common.Context = stageContext;
        expect(context != null).assertTrue();
        console.log(`testCommon005 success`);
        done();
      } catch (err) {
        console.log(`testCommon005 fail:` + err);
        expect().assertFail();
        done();
      }
    })
  })
}
