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
import spawn from 'libspawnndk1.so'

export default function muslSpawn1Test() {
  describe('MuslSpawn1Test', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_0200
     * @tc.name       : testMuslSpawnPosixSpawn002
     * @tc.desc       : test posixspawn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawn002', 0, async (done: Function) => {
      expect(spawn.posixSpawn(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_ADD_CLOSE_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrAddClose001
     * @tc.desc       : test posixSpawnFileActionsAddClose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrAddClose001', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAddClose(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_ADD_CLOSE_0200
     * @tc.name       : testMuslSpawnPosixSpawnAttrAddClose002
     * @tc.desc       : test posixSpawnFileActionsAddClose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrAddClose002', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAddClose(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_ADDUP2_0100
     * @tc.name       : testMuslSpawnPosixSpawnFileActionsAdddup2001
     * @tc.desc       : test posixSpawnFileActionsAdddup2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnFileActionsAdddup2001', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAdddup2(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_ADDUP2_0200
     * @tc.name       : testMuslSpawnPosixSpawnFileActionsAdddup2002
     * @tc.desc       : test posixSpawnFileActionsAdddup2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnFileActionsAdddup2002', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAdddup2(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_ADD_OPEN_0100
     * @tc.name       : testMuslSpawnPosixSpawnFileActionsAddOpen001
     * @tc.desc       : test posixSpawnFileActionsAddopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnFileActionsAddOpen001', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAddopen(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_ADD_OPEN_0200
     * @tc.name       : testMuslSpawnPosixSpawnFileActionsAddOpen002
     * @tc.desc       : test posixSpawnFileActionsAddopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnFileActionsAddOpen002', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAddopen(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_DESTORY_0100
     * @tc.name       : testMuslSpawnPosixSpawnFileActionsDestroy001
     * @tc.desc       : test posixSpawnFileActionsDestroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnFileActionsDestroy001', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsDestroy(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_INIT_0100
     * @tc.name       : testMuslSpawnPosixSpawnFileActionsInit001
     * @tc.desc       : test posixSpawnFileActionsInit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnFileActionsInit001', 0, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsInit(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTRS_DESTORY_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrDestroy001
     * @tc.desc       : test posixSpawnAttrDestroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrDestroy001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrDestroy(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_GET_FLAGS_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrGetFlags001
     * @tc.desc       : test posixspawnattrgetflags
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrGetFlags001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetFlags(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_GET_GROUP_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrGetGroup001
     * @tc.desc       : test posixSpawnAttrGetpGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrGetGroup001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetpGroup(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTRS_Get_Sig_Default_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrGetSigDefault001
     * @tc.desc       : test posixSpawnAttrGetSigDefault
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrGetSigDefault001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetSigDefault(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_GET_SIG_MASK_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrGetSigMask001
     * @tc.desc       : test posixSpawnAttrGetSigMask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrGetSigMask001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetSigMask(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_INIT_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrInit001
     * @tc.desc       : test posixSpawnAttrInit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrInit001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrInit(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_FLAGS_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrSetFlags001
     * @tc.desc       : test posixSpawnAttrSetFlags
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrSetFlags001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetFlags(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_FLAGS_0200
     * @tc.name       : testMuslSpawnPosixSpawnAttrSetFlags002
     * @tc.desc       : test posixSpawnAttrSetFlags
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrSetFlags002', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetFlags(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_PGROUP_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrSetPGroup001
     * @tc.desc       : test posixSpawnAttrSetPGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrSetPGroup001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetPGroup(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_SIG_DEFAULT_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrSetSigDefault001
     * @tc.desc       : test posixSpawnAttrSetSigDefault
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrSetSigDefault001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetSigDefault(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_SIG_MASK_0100
     * @tc.name       : testMuslSpawnPosixSpawnAttrSetSigMask001
     * @tc.desc       : test posixSpawnAttrSetSigMask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnAttrSetSigMask001', 0, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetSigMask(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWNP_0100
     * @tc.name       : testMuslSpawnPosixSpawnP001
     * @tc.desc       : test spawnp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnP001', 0, async (done: Function) => {
      expect(spawn.posixSpawnP(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWNP_0200
     * @tc.name       : testMuslSpawnPosixSpawnP002
     * @tc.desc       : test spawnp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSpawnPosixSpawnP002', 0, async (done: Function) => {
      expect(spawn.posixSpawnP(-1)).assertEqual(-1);
      done()
    });
  })
}

