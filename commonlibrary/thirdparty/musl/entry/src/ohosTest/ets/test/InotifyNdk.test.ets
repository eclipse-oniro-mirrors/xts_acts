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
import inotify from 'libinotifyndk.so'


export default function inotifyNdkTest() {
  describe('MuslInotifyTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslInotifyInotifyInit001
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT_0100
     * @tc.desc   test inotify_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslInotifyInotifyInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inotify.inotifyInit();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslInotifyInotifyInit1001
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT1_0100
     * @tc.desc   test inotify_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslInotifyInotifyInit1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inotify.inotifyInit1(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslInotifyInotifyInit1002
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT1_0200
     * @tc.desc   test inotify_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslInotifyInotifyInit1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inotify.inotifyInit1(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslInotifyInotifyInit1003
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT1_0300
     * @tc.desc   test inotify_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslInotifyInotifyInit1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inotify.inotifyInit1(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslInotifyInotifyAddWatch001
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_ADD_WATCH_0100
     * @tc.desc   test inotify_add_watch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslInotifyInotifyAddWatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inotify.inotifyAddWatch();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslInotifyInotifyRmWatch001
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_RM_WATCH_0100
     * @tc.desc   test inotify_rm_watch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslInotifyInotifyRmWatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inotify.inotifyRmWatch();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

  })
}
