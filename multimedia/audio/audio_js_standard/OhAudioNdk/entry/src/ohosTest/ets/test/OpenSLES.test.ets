/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import OpenSLESTestObj from 'libohaudiondk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import Utils from './Utils';

let OPENSLES_SUCCESS: number = 0;
let OPENSLES_FAIL: number = -1;

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}


export default function OpenSLESTest() {

  describe('OpenSLES', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      OpenSLESTestObj.InitOpenSlesTest();
      await Utils.sleep(2000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      OpenSLESTestObj.DeInitOpenSlesTest();
      console.info('afterAll case ');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RECORD_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RECORD_FUNCTION_0100
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_FUNCTION_0100', 0, async (done: Function) => {
      console.log(`SUB_MULTIMEDIA_AUDIO_RECORD_FUNCTION_0100 test start `);
      let state: number | null = OpenSLESTestObj.TestOpenSlesRecorder();
      expect(state).assertEqual(OPENSLES_SUCCESS);
      console.log(`SUB_MULTIMEDIA_AUDIO_RECORD_FUNCTION_0100 test end `);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RECORD_INVALID_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RECORD_INVALID_FUNCTION_0100
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_INVALID_FUNCTION_0100', 0, async (done: Function) => {
      console.log(`SUB_MULTIMEDIA_AUDIO_RECORD_INVALID_FUNCTION_0100 test start `);
      let state: number | null = OpenSLESTestObj.TestOpenSlesRecorderInValid();
      expect(state).assertEqual(OPENSLES_SUCCESS);
      console.log(`SUB_MULTIMEDIA_AUDIO_RECORD_INVALID_FUNCTION_0100 test end `);
      done();
    });
  });
}
  