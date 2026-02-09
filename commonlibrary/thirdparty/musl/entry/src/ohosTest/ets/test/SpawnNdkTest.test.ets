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
import spawn from 'libspawnndk.so'

export default function muslSpawnTest() {
  describe('MuslSpawnTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslSpawnPosixSpawn001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_0100
     * @tc.desc   test posixspawn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawn()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnP001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWNP_0100
     * @tc.desc   test spawnp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnP()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrGetFlags001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_GET_FLAGS_0100
     * @tc.desc   test posixspawnattrgetflags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrGetFlags001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetFlags()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrAddClose001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_ADD_CLOSE_0100
     * @tc.desc   test posixSpawnFileActionsAddClose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrAddClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAddClose()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnFileActionsAdddup2001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_ADDUP2_0100
     * @tc.desc   test posixSpawnFileActionsAdddup2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnFileActionsAdddup2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAdddup2()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnFileActionsAddOpen001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_ADD_OPEN_0100
     * @tc.desc   test posixSpawnFileActionsAddopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnFileActionsAddOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsAddopen()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnFileActionsDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_DESTORY_0100
     * @tc.desc   test posixSpawnFileActionsDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnFileActionsDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnFileActionsInit001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_FILE_ACTIONS_INIT_0100
     * @tc.desc   test posixSpawnFileActionsInit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnFileActionsInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnFileActionsInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTRS_DESTORY_0100
     * @tc.desc   test posixSpawnAttrDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrGetSchedPolicy001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTRS_Get_Sched_Policy_0100
     * @tc.desc   test posixSpawnAttrGetSchedPolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrGetSchedPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetSchedPolicy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrGetSigDefault001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTRS_Get_Sig_Default_0100
     * @tc.desc   test posixSpawnAttrGetSigDefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrGetSigDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetSigDefault()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrInit001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_INIT_0100
     * @tc.desc   test posixSpawnAttrInit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrGetSigMask001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_GET_SIG_MASK_0100
     * @tc.desc   test posixSpawnAttrGetSigMask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrGetSigMask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetSigMask()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrSetFlags001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_FLAGS_0100
     * @tc.desc   test posixSpawnAttrSetFlags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrSetFlags001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetFlags()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrGetSchedParam001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_GET_SCHED_PARAM_0100
     * @tc.desc   test posixSpawnAttrGetSchedParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrGetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrGetGroup001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_GET_GROUP_0100
     * @tc.desc   test posixSpawnAttrGetpGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrGetGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrGetpGroup()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrSetSigDefault001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_SIG_DEFAULT_0100
     * @tc.desc   test posixSpawnAttrSetSigDefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrSetSigDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetSigDefault()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrSetSigMask001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_SIG_MASK_0100
     * @tc.desc   test posixSpawnAttrSetSigMask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrSetSigMask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetSigMask()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrSetSchedPolicy001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_SCHED_POLICY_0100
     * @tc.desc   test posixSpawnAttrSetSchedPolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrSetSchedPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetSchedPolicy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrSetSchedParam001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_SCHED_PARAM_0100
     * @tc.desc   test posixSpawnAttrSetSchedParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrSetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSpawnPosixSpawnAttrSetPGroup001
     * @tc.number SUB_THIRDPARTY_MUSL_SPAWN_POSIX_SPAWN_ATTR_SET_PGROUP_0100
     * @tc.desc   test posixSpawnAttrSetPGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSpawnPosixSpawnAttrSetPGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(spawn.posixSpawnAttrSetPGroup()).assertEqual(0);
      done()
    });
  })
}