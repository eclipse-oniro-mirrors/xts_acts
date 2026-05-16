/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, Level } from '../../../hypium/index';
import application from '@ohos.app.ability.application';
import hilog from '@ohos.hilog';

const domain: int = 0x0000;
const tag: string = 'AbilityApplicationStaticTest';

export default function AbilityApplicationStaticTest() {


  describe('AbilityApplicationStaticTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_application_getApplicationContextInstance_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_application_getApplicationContextInstance_Static_0100
     * @tc.desc   applicationContext obtained by application calls the processName property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_application_getApplicationContextInstance_Static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const PROCESS_NAME = 'com.example.actsabilityapplicationtest.static';
        let caseName = 'SUB_Ability_AbilityRuntime_application_getApplicationContextInstance_Static_0100';
        try {
          hilog.info(domain, tag, `${caseName} start.`);
          let applicationContext = application.getApplicationContextInstance();
          expect(applicationContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
          expect(applicationContext.cloudFileDir).assertEqual('/data/storage/el2/cloud');
          expect(applicationContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
          expect(applicationContext.logFileDir).assertEqual('/data/storage/el2/log');
          expect(applicationContext.processName).assertEqual(PROCESS_NAME);
          expect(typeof (applicationContext.resourceDir) == 'string').assertTrue();
          hilog.info(domain, tag, `${caseName} end.`)
          done();
        } catch (err: Error) {
          hilog.error(domain, tag, `${caseName} fail.`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_application_getAppPreloadType_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_application_getAppPreloadType_Static_0100
     * @tc.desc   Test getAppPreloadType() and AppPreloadType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_application_getAppPreloadType_Static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const PROCESS_NAME = 'com.example.actsabilityapplicationtest.static';
        let caseName = 'SUB_Ability_AbilityRuntime_application_getAppPreloadType_Static_0100';
        try {
          hilog.info(domain, tag, `${caseName} start.`);
          let Type = application.getAppPreloadType();
          hilog.info(domain, tag, `AppPreloadType is : ${Type}`);
          expect(application.AppPreloadType.UNSPECIFIED).assertEqual(0);
          expect(application.AppPreloadType.TYPE_CREATE_PROCESS).assertEqual(1);
          expect(application.AppPreloadType.TYPE_CREATE_ABILITY_STAGE).assertEqual(2);
          expect(application.AppPreloadType.TYPE_CREATE_WINDOW_STAGE).assertEqual(3);
          expect(Type === application.AppPreloadType.TYPE_CREATE_PROCESS).assertFalse();
          expect(Type === application.AppPreloadType.TYPE_CREATE_ABILITY_STAGE).assertFalse();
          expect(Type === application.AppPreloadType.TYPE_CREATE_WINDOW_STAGE).assertFalse();
          expect(Type).assertEqual(application.AppPreloadType.UNSPECIFIED);
          hilog.info(domain, tag, `${caseName} end.`)
          done();
        } catch (err: Error) {
          hilog.error(domain, tag, `${caseName} fail.`);
          expect().assertFail();
          done();
        }
      });
  })
}