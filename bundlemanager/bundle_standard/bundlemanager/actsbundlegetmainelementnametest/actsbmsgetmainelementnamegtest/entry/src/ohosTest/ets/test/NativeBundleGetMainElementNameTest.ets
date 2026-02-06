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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import bundlendk from 'libbundlendk.so';

const BUNDLE_NAME = 'com.example.bundlenativegetmainelementnametest';
const MODULE_NAME = 'entry';
const ABILITY_NAME = 'AbilityOne';

export default function bundlenativegetmainelementnameTest() {
  describe('bundlenativegetmainelementnameTest', () => {
    /**
     * @tc.number: SUB_BMS_OH_NativeBundle_GetMainElementName_0700
     * @tc.name: SUB_BMS_OH_NativeBundle_GetMainElementName_0700
     * @tc.desc: The mainElement entry is not configured in module.json within the project, 
     *           and a single module has the ability to be called by the application
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_BMS_OH_NativeBundle_GetMainElementName_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      expect(bundlendk.getMainElementName().bundleName).assertEqual(BUNDLE_NAME);
      expect(bundlendk.getMainElementName().moduleName).assertEqual(MODULE_NAME);
      expect(bundlendk.getMainElementName().abilityName).assertEqual(ABILITY_NAME);
      done();
    });
  })
}
