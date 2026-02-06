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
import grp from 'libgrpndk.so'

export default function grpNdkTest() {
  describe('MuslGrpTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_SETGRENT_0100
     * @tc.name       : testMuslGrpSetgrent001
     * @tc.desc       : test setgrent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslGrpSetgrent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = grp.setgrent();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_ENDGRENT_0100
     * @tc.name       : testMuslGrpEndGRent001
     * @tc.desc       : test endgrent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslGrpEndGRent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(grp.endgrent()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRGID_0100
     * @tc.name       : testMuslGrpGetgrgid001
     * @tc.desc       : test getgrgid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslGrpGetgrgid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 1;
      let result: number = grp.getgrgid();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRGIDR_0100
     * @tc.name       : testMuslGrpGetgrgidR001
     * @tc.desc       : test getgrgid_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslGrpGetgrgidR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = grp.getgrgidR();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRNAM_0100
     * @tc.name       : testMuslGrpGetgrnam001
     * @tc.desc       : test getgrnam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslGrpGetgrnam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 1;
      let result: number = grp.getgrnam();
      expect(result).assertEqual(resultValue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRNAMR_0100
     * @tc.name       : testMuslGrpGetGrNamR001
     * @tc.desc       : test getgrnam_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslGrpGetGrNamR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = grp.getGrNamR();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGROUPLIST_0100
     * @tc.name       : testMuslGrpGetGroupList001
     * @tc.desc       : test getgrouplist
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslGrpGetGroupList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = grp.getGroupList();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRENT_0100
     * @tc.name       : testMuslGrpGetgrent001
     * @tc.desc       : test getgrent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslGrpGetgrent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = 1;
      let data: number = grp.getgrent();
      expect(data).assertEqual(ret);
      done()
    });
  })
}