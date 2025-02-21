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
import resource from 'libresourcendk.so'

export default function resourceNdkTest() {
  describe('MuslResourceTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_SETPRIORITY_0100
     * @tc.name       : testMuslResourceSetpriority001
     * @tc.desc       : test setpriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceSetpriority001', 0, async (done: Function) => {
      let result:number = resource.setpriority(-20);
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
      let result:number = resource.setpriority(-19);
      expect(result).assertEqual(0);
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
      let result:number = resource.setrlimit(1);
      expect(result).assertEqual(-1);
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
      let result:number = resource.setrlimit(0);
      expect(result).assertEqual(0);
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
      let result:number = resource.setrlimit64(1);
      expect(result).assertEqual(-1);
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
      let result:number = resource.setrlimit64(0);
      expect(result).assertEqual(0);
      done()
    });
    
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETPRIORITY_0100
     * @tc.name       : testMuslResourceGetPriority001
     * @tc.desc       : test getpriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetPriority001', 0, async (done: Function) => {
      let result:number = resource.getPriority(0);
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(1);
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
      let result:number = resource.getPriority(1);
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETPRIORITY_0300
     * @tc.name       : testMuslResourceGetPriority003
     * @tc.desc       : test getpriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetPriority003', 0, async (done: Function) => {
      let result:number = resource.getPriority(2);
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(1);
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
      let result:number = resource.getRLimit(0);
      console.info("Test NAPI data= " + JSON.stringify(result));
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
      let result:number = resource.getRLimit(3);
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT_0300
     * @tc.name       : testMuslResourceGetRLimit003
     * @tc.desc       : test getrlimit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRLimit003', 0, async (done: Function) => {
      let result:number = resource.getRLimit(7);
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(0);
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
      let result:number = resource.getRUsage(0);
      console.info("Test NAPI data= " + JSON.stringify(result));
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
      let result:number = resource.getRUsage(-1);
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRUSAGE_0300
     * @tc.name       : testMuslResourceGetRUsage003
     * @tc.desc       : test getrusage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRUsage003', 0, async (done: Function) => {
      let result:number = resource.getRUsage(1);
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(0);
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
      let result:number = resource.prLimit();
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(0);
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
      let result:number = resource.prLimit64();
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(0);
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
      let result:number = resource.getrlimit64();
      expect(result).assertEqual(0);
      done()
    });
  })
}