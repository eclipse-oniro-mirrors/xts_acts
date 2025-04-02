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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import inotify from 'libinotifyndk.so'


export default function inotifyNdkTest() {
  describe('MuslInotifyTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT_0100
     * @tc.name       : testMuslInotifyInotifyInit001
     * @tc.desc       : test inotify_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInotifyInotifyInit001', 0, async (done: Function) => {
      let data: number = inotify.inotifyInit();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT1_0100
     * @tc.name       : testMuslInotifyInotifyInit1001
     * @tc.desc       : test inotify_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInotifyInotifyInit1001', 0, async (done: Function) => {
      let data: number = inotify.inotifyInit1(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT1_0200
     * @tc.name       : testMuslInotifyInotifyInit1002
     * @tc.desc       : test inotify_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInotifyInotifyInit1002', 0, async (done: Function) => {
      let data: number = inotify.inotifyInit1(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_INIT1_0300
     * @tc.name       : testMuslInotifyInotifyInit1003
     * @tc.desc       : test inotify_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInotifyInotifyInit1003', 0, async (done: Function) => {
      let data: number = inotify.inotifyInit1(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_ADD_WATCH_0100
     * @tc.name       : testMuslInotifyInotifyAddWatch001
     * @tc.desc       : test inotify_add_watch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslInotifyInotifyAddWatch001', 0, async (done: Function) => {
      let data: number = inotify.inotifyAddWatch();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INOTIFY_INOTIFY_RM_WATCH_0100
     * @tc.name       : testMuslInotifyInotifyRmWatch001
     * @tc.desc       : test inotify_rm_watch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslInotifyInotifyRmWatch001', 0, async (done: Function) => {
      let data: number = inotify.inotifyRmWatch();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

  })
}
