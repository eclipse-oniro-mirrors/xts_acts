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

import { describe, expect, it } from '@ohos/hypium'
import xattr from 'libxattrndk.so'

export default function xattrNdkTest() {
  describe('MuslXattrTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_XATTR_SETXATTR_0100
     * @tc.name       : testMuslXattrSetxattr001
     * @tc.desc       : test setxattr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslXattrSetxattr001', 0, async (done: Function) => {
      let a: number = xattr.setxattr();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_XATTR_FSETXATTR_0100
     * @tc.name       : testMuslXattrFsetxattr001
     * @tc.desc       : test fsetxattr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslXattrFsetxattr001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = xattr.fsetxattr();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_XATTR_FREMOVEXATTR_0100
     * @tc.name       : testMuslXattrFremovexattr001
     * @tc.desc       : test fremovexattr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslXattrFremovexattr001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = xattr.fremovexattr();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_XATTR_LGETXATTR_0100
     * @tc.name     : testMuslXattrLgetxattr001
     * @tc.desc     : test getxattr
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslXattrLgetxattr001', 0, async (done: Function) => {
      let result: number = xattr.lgetxattr();
      expect(result).assertEqual(1)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_XATTR_LSETXATTR_0100
     * @tc.name     : testMuslXattrLsetxattr001
     * @tc.desc     : test lsetxattr
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslXattrLsetxattr001', 0, async (done: Function) => {
      let result: number = xattr.lsetxattr();
      expect(result).assertEqual(1)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_XATTR_GETXATTR_0100
     * @tc.name     : testMuslXattrGetxattr001
     * @tc.desc     : test getxattr
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslXattrGetxattr001', 0, async (done: Function) => {
      let result: number = xattr.getxattr();
      expect(result).assertEqual(1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_XATTR_LLISTXATTR_0100
     * @tc.name     : testMuslXattrllistxattr001
     * @tc.desc     : test getxattr
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslXattrllistxattr001', 0, async (done: Function) => {
      let result: number = xattr.llistxattr();
      expect(result).assertEqual(1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_XATTR_LISTXATTR_0100
     * @tc.name     : testMuslXattrlistxattr001
     * @tc.desc     : test listxattr
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslXattrlistxattr001', 0, async (done: Function) => {
      let result: number = xattr.listxattr();
      expect(result).assertEqual(1)
      done()
    });

    /**
    * @tc.number   : SUB_THIRDPARTY_MUSL_XATTR_LREMOVXATTR_0100
    * @tc.name     : testMuslXattrLremovexattr001
    * @tc.desc     : test lremovexattr
    * @tc.size     : MediumTest
    * @tc.type     : Function
    * @tc.level    : Level 1
    */
    it('testMuslXattrLremovexattr001', 0, async (done: Function) => {
      let result: number = xattr.lremovexattr();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_XATTR_REMOVXATTR_0100
     * @tc.name     : testMuslXattrRemovexattr001
     * @tc.desc     : test removexattr
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslXattrRemovexattr001', 0, async (done: Function) => {
      let result: number = xattr.removexattr();
      expect(result).assertEqual(0)
      done()
    });

        /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_XATTR_FLISTXATTR_0100
     * @tc.name       : testMuslXAttrFListXAttr001
     * @tc.desc       : test flistxattr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslXAttrFListXAttr001', 0, async (done: Function) => {
      let result = false;
      if (xattr.flistxattr() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });
  })
}