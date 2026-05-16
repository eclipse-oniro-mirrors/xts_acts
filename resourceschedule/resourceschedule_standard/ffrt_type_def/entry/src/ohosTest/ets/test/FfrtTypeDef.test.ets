/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, TestType, Size} from '@ohos/hypium';
import ffrt from 'libentry.so';
export default function ffrtTypeDefTest() {
  const EINVAL = 22;
  describe('ActsFfrtTypeDefTest', () => {
    let TAG = '';

    /**
     * @tc.name   ActsFfrtTypeDefTest00100
     * @tc.number SUB_FFRT_TYPE_DEF_00100
     * @tc.desc   Test ffrt_fiber_init api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00100';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_fiber_initTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(EINVAL);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00200
     * @tc.number SUB_FFRT_TYPE_DEF_00200
     * @tc.desc   Test ffrt_rwlockattr_t api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00200';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_rwlockattr_tTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00300
     * @tc.number SUB_FFRT_TYPE_DEF_00300
     * @tc.desc   Test ffrt ffrt_function_header_t reserve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00300';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_reserveTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(1);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00400
     * @tc.number SUB_FFRT_TYPE_DEF_00400
     * @tc.desc   Test ffrt ffrt_task_attr_t storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00400';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_task_attr_tTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(1);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00500
     * @tc.number SUB_FFRT_TYPE_DEF_00500
     * @tc.desc   Test ffrt ffrt_queue_attr_t storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00500';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_queue_attr_tTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00600
     * @tc.number SUB_FFRT_TYPE_DEF_00600
     * @tc.desc   Test ffrt ffrt_condattr_t storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00600';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_condattr_tTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00700
     * @tc.number SUB_FFRT_TYPE_DEF_00700
     * @tc.desc   Test ffrt ffrt_mutexattr_t storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00700';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_mutexattr_tTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00800
     * @tc.number SUB_FFRT_TYPE_DEF_00800
     * @tc.desc   Test ffrt ffrt_rwlockattr_t storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00800';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_rwlockattr_tTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest00900
     * @tc.number SUB_FFRT_TYPE_DEF_00900
     * @tc.desc   Test ffrt ffrt_mutex_type ffrt_mutex_normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest00900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest00900';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_mutex_typeTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(1);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest01000
     * @tc.number SUB_FFRT_TYPE_DEF_01000
     * @tc.desc   Test ffrt ffrt_mutex_type ffrt_mutex_default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest01000';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_mutex_typeTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(1);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })

    /**
     * @tc.name   ActsFfrtTypeDefTest01100
     * @tc.number SUB_FFRT_TYPE_DEF_01100
     * @tc.desc   Test ffrt ffrt_fiber_t storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsFfrtTypeDefTest01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'ActsFfrtTypeDefTest01100';
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_fiber_tTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(1);
        done();
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    })
  })
}