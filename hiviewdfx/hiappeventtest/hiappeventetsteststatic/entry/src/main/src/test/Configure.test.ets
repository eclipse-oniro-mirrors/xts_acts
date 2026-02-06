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
let tag: string = 'HiAppEventconfigureTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function configureTest() {
  describe('configureTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.number DFX_HiAppEvent_JSANI_0100
     * @tc.name testConfigure001
     * @tc.desc HiAppEvent configure interface with disable option set false.
     */
    it('testConfigure001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testConfigure001 start')
      try {
        hiAppEvent.configure({disable: true});
        hiAppEvent.configure({});
        hiAppEvent.configure({disable: false});
        hiAppEvent.configure({
          maxStorage: '100M'
        })
        expect(true).assertTrue()
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `testConfigure001 err ,err code is ${err.code}, err message is ${err.message}`)
        expect().assertFail();
      }
      hilog.info(domain, tag, 'testConfigure001 end')
      done()
    })

  })
  hilog.info(domain, tag, 'configureTest end');
}