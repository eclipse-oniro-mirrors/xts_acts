/**
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
import {describe, it, expect, Level, Size, TestType} from "@ohos/hypium"

export default function dynamicImport() {
  describe("DynamicImportTest", async () => {
    /**
     * @tc.name   importHar
     * @tc.number importHar
     * @tc.desc   importHar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('importHar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('har')
      expect(lib.add(2, 3)).assertEqual(5)
    })
    /**
     * @tc.name   importRelative
     * @tc.number importRelative
     * @tc.desc   importRelative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('importRelative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('./test')
      expect(lib.add(2, 3)).assertEqual(5)
      expect(lib.default).assertEqual('test')
    })
    /**
     * @tc.name   importSystemInternal
     * @tc.number importSystemInternal
     * @tc.desc   importSystemInternal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('importSystemInternal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('@ohos.hilog')
      lib.default.info(0x0000, "testTag", 'dexter log: call ohos.hilog')
    })
    /**
     * @tc.name   importSystemBuiltin
     * @tc.number importSystemBuiltin
     * @tc.desc   importSystemBuiltin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('importSystemBuiltin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('@system.app')
      lib.default.getInfo()
    })
    /**
     * @tc.name   importAppNapi
     * @tc.number importAppNapi
     * @tc.desc   importAppNapi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('importAppNapi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('libentry.so')
      expect(lib.default.add(2,3)).assertEqual(5)
    })
  })
}