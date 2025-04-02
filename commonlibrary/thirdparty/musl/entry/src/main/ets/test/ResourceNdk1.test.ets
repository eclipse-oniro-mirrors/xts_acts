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
import resource from 'libresourcendk1.so'

export default function muslResourceNdk1Test() {
  describe('MuslResource1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETPRIORITY_0100
     * @tc.name       : testMuslResourceGetPriority001
     * @tc.desc       : test getpriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetPriority001', 0, async (done: Function) => {
      let result:number = resource.getPriority1();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETPRIORITY_0200
     * @tc.name       : testMuslResourceGetPriority002
     * @tc.desc       : test getpriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetPriority002', 0, async (done: Function) => {
      let result:number = resource.getPriority2();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_SETPRIORITY_0100
     * @tc.name       : testMuslResourceSetpriority001
     * @tc.desc       : test setpriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceSetpriority001', 0, async (done: Function) => {
      let result:number = resource.setpriority1();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_SETPRIORITY_0200
     * @tc.name       : testMuslResourceSetpriority002
     * @tc.desc       : test setpriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceSetpriority002', 0, async (done: Function) => {
      let result:number = resource.setpriority2();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT_0100
     * @tc.name       : testMuslResourceGetRLimit001
     * @tc.desc       : test getrlimit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRLimit001', 0, async (done: Function) => {
      let result:number = resource.getRLimit1();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT_0200
     * @tc.name       : testMuslResourceGetRLimit002
     * @tc.desc       : test getrlimit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRLimit002', 0, async (done: Function) => {
      let result:number = resource.getRLimit2();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT64_0100
     * @tc.name     : testMuslResourceGetrlimit64001
     * @tc.desc     : test getrlimit64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslResourceGetrlimit64001', 0, async (done: Function) => {
      let result:number = resource.getrlimit641();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT64_0200
     * @tc.name     : testMuslResourceGetrlimit64002
     * @tc.desc     : test getrlimit64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslResourceGetrlimit64002', 0, async (done: Function) => {
      let result:number = resource.getrlimit642();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRUSAGE_0100
     * @tc.name       : testMuslResourceGetRUsage001
     * @tc.desc       : test getrusage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRUsage001', 0, async (done: Function) => {
      let result:number = resource.getRUsage1();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRUSAGE_0200
     * @tc.name       : testMuslResourceGetRUsage002
     * @tc.desc       : test getrusage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRUsage002', 0, async (done: Function) => {
      let result:number = resource.getRUsage2();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_PRLIMIT_0100
     * @tc.name       : testMuslResourceprLimit001
     * @tc.desc       : test prlimit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceprLimit001', 0, async (done: Function) => {
      let result:number = resource.prLimit1();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_PRLIMIT_0200
     * @tc.name       : testMuslResourceprLimit002
     * @tc.desc       : test prlimit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceprLimit002', 0, async (done: Function) => {
      let result:number = resource.prLimit2();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_PRLIMIT64_0100
     * @tc.name       : testMuslResourceprLimit64001
     * @tc.desc       : test prlimit64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceprLimit64001', 0, async (done: Function) => {
      let result:number = resource.prLimit641();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_PRLIMIT64_0200
     * @tc.name       : testMuslResourceprLimit64002
     * @tc.desc       : test prlimit64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceprLimit64002', 0, async (done: Function) => {
      let result:number = resource.prLimit642();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_SETRLIMIT_0100
     * @tc.name       : testMuslResourceSetrlimit001
     * @tc.desc       : test setrlimit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceSetrlimit001', 0, async (done: Function) => {
      let result:number = resource.setrlimit1();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_SETRLIMIT_0200
     * @tc.name       : testMuslResourceSetrlimit002
     * @tc.desc       : test setrlimit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceSetrlimit002', 0, async (done: Function) => {
      let result:number = resource.setrlimit2();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_SETRLIMIT64_0100
     * @tc.name       : testMuslResourceSetrlimit64001
     * @tc.desc       : test setrlimit64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceSetrlimit64001', 0, async (done: Function) => {
      let result:number = resource.setrlimit641();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_SETRLIMIT64_0200
     * @tc.name       : testMuslResourceSetrlimit64002
     * @tc.desc       : test setrlimit64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceSetrlimit64002', 0, async (done: Function) => {
      let result:number = resource.setrlimit642();
      expect(result).assertEqual(-1);
      done()
    });
  })
}