/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect } from "@ohos/hypium"
import { TAG as ConstantTAG } from '@ohos/hypium/src/main/Constant';
import validator from 'validator';
import validator2 from 'validator/validator';

export default function staticLoadRemoteHar() {
  describe('StaticLoadRemoteHarTest', () => {
    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_Remote_HAR_0100
     * @tc.name      : testRemoteHar01
     * @tc.desc      : Remote har, package name xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testRemoteHar01", 0, () => {
      const caseName: string = "testRemoteHar01";
      try {
        expect(validator.isEmail('foo@bar.com')).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_Remote_HAR_0200
     * @tc.name      : testRemoteHar02
     * @tc.desc      : Remote har, two-level package name @xxx/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testRemoteHar02", 0, () => {
      const caseName: string = "testRemoteHar02";
      try {
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_Remote_HAR_0300
     * @tc.name      : testRemoteHar03
     * @tc.desc      : Remote har, package name + path xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testRemoteHar03", 0, () => {
      const caseName: string = "testRemoteHar03";
      try {
        expect(validator2.isEmail('foo@bar.com')).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_Remote_HAR_0400
     * @tc.name      : testRemoteHar04
     * @tc.desc      : Remote har, two-level package name + path @xxx/xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testRemoteHar04", 0, () => {
      const caseName: string = "testRemoteHar04";
      try {
        expect(ConstantTAG).assertEqual('[Hypium]');
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })
  })
}