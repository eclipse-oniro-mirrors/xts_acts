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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import xattr from 'libxattrndk.so'

export default function xattrNdkTest() {
  describe('MuslXattrTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslXattrFsetxattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_FSETXATTR_0100
     * @tc.desc   test fsetxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrFsetxattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = xattr.fsetxattr();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslXattrFremovexattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_FREMOVEXATTR_0100
     * @tc.desc   test fremovexattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrFremovexattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = xattr.fremovexattr();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.name   testMuslXattrLgetxattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_LGETXATTR_0100
     * @tc.desc   test getxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrLgetxattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = xattr.lgetxattr();
      expect(result).assertEqual(1)
      done()
    });
    /**
     * @tc.name   testMuslXattrLsetxattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_LSETXATTR_0100
     * @tc.desc   test lsetxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrLsetxattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = xattr.lsetxattr();
      expect(result).assertEqual(1)
      done()
    });
    /**
     * @tc.name   testMuslXattrGetxattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_GETXATTR_0100
     * @tc.desc   test getxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrGetxattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = xattr.getxattr();
      expect(result).assertEqual(1)
      done()
    });

    /**
     * @tc.name   testMuslXattrllistxattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_LLISTXATTR_0100
     * @tc.desc   test getxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrllistxattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = xattr.llistxattr();
      expect(result).assertEqual(1)
      done()
    });

    /**
     * @tc.name   testMuslXattrlistxattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_LISTXATTR_0100
     * @tc.desc   test listxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrlistxattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = xattr.listxattr();
      expect(result).assertEqual(1)
      done()
    });

    /**
     * @tc.name   testMuslXattrLremovexattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_LREMOVXATTR_0100
     * @tc.desc   test lremovexattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrLremovexattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = xattr.lremovexattr();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslXattrRemovexattr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_REMOVXATTR_0100
     * @tc.desc   test removexattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXattrRemovexattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = xattr.removexattr();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslXAttrFListXAttr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_FLISTXATTR_0100
     * @tc.desc   test flistxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXAttrFListXAttr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = false;
      if (xattr.flistxattr() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });
  })
}