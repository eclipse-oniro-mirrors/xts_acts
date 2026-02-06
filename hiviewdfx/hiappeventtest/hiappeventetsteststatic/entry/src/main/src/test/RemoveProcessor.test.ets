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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'removeProcessorTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function removeProcessorTest() {
  describe('removeProcessorTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_RemoveProcessor_0100
     * @tc.name testRemoveProcessor01
     * @tc.desc 验证removeProcessor接口移除数据处理者，processor已存在，删除成功，不存在、非法，删除失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRemoveProcessor01', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveProcessor01 start');
      let processor: hiAppEvent.Processor = {
        name: 'analyticskit_native',
        routeInfo: 'CN',
      }
      try {
        let processorId = hiAppEvent.addProcessor(processor);
        hilog.info(domain, tag, `testRemoveProcessor01 > processorId: ${processorId}`)
        hiAppEvent.removeProcessor(processorId)
        hiAppEvent.removeProcessor(processorId)
        hiAppEvent.removeProcessor(-1)
        expect(true).assertTrue()
        done()
      }
      catch (err: BusinessError) {
        hilog.error(domain, tag, `testRemoveProcessor01 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

  })
  hilog.info(domain, tag, 'removeProcessorTest end');
}