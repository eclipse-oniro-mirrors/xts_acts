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
import {add as add2} from './test'
import hilog from "@ohos.hilog"
import testNapi from "libentry.so"

export default function staticImport() {
  describe("StaticImportTest", () => {
    /**
     * @tc.name   importRelative
     * @tc.number importRelative
     * @tc.desc   importRelative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('importRelative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
	  hilog.info(0x0000, "testTag", 'dexter log: call ohos.hilog')
      expect(add2(2, 3)).assertEqual(5)
    })
    /**
     * @tc.name   ImportAppNapi
     * @tc.number ImportAppNapi
     * @tc.desc   ImportAppNapi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImportAppNapi", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testNapi.add(2, 3)).assertEqual(5)
    })
  })
}