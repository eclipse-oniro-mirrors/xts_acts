/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function versionInfoTest() {

  describe("ActsVersionInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_GETVERSIONINFO_STATIC_0100
     * @tc.name      test_GetVersionInfo_Static_0001
     * @tc.desc      get version valid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVersionInfo_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetVersionInfo_Static_0001 start');
      let cls = new Foo();
      let result = cls.test_GetVersion();
      expect(result).assertEqual(1);
      console.log('test_GetVersionInfo_Static_0001 done');
      done();
      console.log('test_GetVersionInfo_Static_0001 end');
    });

    /**
     * @tc.number    SUB_ANI_GETVERSIONINFO_STATIC_0200
     * @tc.name      test_GetVersionInfo_Static_0002
     * @tc.desc      get version first args is nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVersionInfo_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GetVersionInfo_Static_0002 start');
        let cls = new Foo();
        let result = cls.test_GetVersion_02();
        expect(result).assertTrue();
        console.log('test_GetVersionInfo_Static_0002 done');
        done();
        console.log('test_GetVersionInfo_Static_0002 end');
      });

    /**
     * @tc.number    SUB_ANI_GETVERSIONINFO_STATIC_0300
     * @tc.name      test_GetVersionInfo_Static_0003
     * @tc.desc      get version first args is invalid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVersionInfo_Static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GetVersionInfo_Static_0003 start');
        let cls = new Foo();
        let result = cls.test_GetVersion_03();
        expect(result).assertTrue();
        console.log('test_GetVersionInfo_Static_0003 done');
        done();
        console.log('test_GetVersionInfo_Static_0003 end');
      });

    /**
     * @tc.number    SUB_ANI_GETVERSIONINFO_STATIC_0400
     * @tc.name      test_GetVersionInfo_Static_0004
     * @tc.desc      get version multiple call is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVersionInfo_Static_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GetVersionInfo_Static_0004 start');
        let cls = new Foo();
        let result = cls.test_GetVersion_04();
        expect(result).assertTrue();
        console.log('test_GetVersionInfo_Static_0004 done');
        done();
        console.log('test_GetVersionInfo_Static_0004 end');
      });
  })
}