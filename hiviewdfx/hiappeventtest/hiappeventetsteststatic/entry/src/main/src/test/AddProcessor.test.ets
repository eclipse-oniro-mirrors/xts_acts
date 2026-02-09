/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HiAppEventAddProcessorTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function addProcessorTest() {

    describe('addProcessorTest', (): void => {
        hilog.info(domain, tag, 'describe start');

        /**
         * @tc.name   testHiAppEvent008
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0100
         * @tc.desc   验证添加数据处理者addProcessor无对应so，返回-1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHiAppEvent008', Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, 'testHiAppEvent008 start');
            let processor: hiAppEvent.Processor = {
                name: 'analyticskit',
                onStartReport: true,
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor);
                hilog.info(domain, tag, `testHiAppEvent008 > processorId: ${processorId}`);
                expect(processorId == -1).assertTrue()
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, `testHiAppEvent008 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEvent009
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0200
         * @tc.desc   验证添加数据处理者addProcessor为空字符串空，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHiAppEvent009', Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, 'testHiAppEvent009 start');
            let processor: hiAppEvent.Processor = {
                name: '',
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor);
                hilog.info(domain, tag, `testHiAppEvent009 > processorId: ${processorId}`)
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, `testHiAppEvent009 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEvent010
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0300
         * @tc.desc   验证添加数据处理者addProcessor，Processor可选参数非法，调用成功，有日志打印Parameter error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testHiAppEvent010', Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, 'testHiAppEvent010 start');
            let config: Record<string, string> = {
                "": "",
            };
            let processor: hiAppEvent.Processor = {
                name: 'test_processor',
                debugMode: false,
                routeInfo: '',
                appId: '',
                onStartReport: true,
                onBackgroundReport: true,
                periodReport: -1,
                batchReport: -2,
                userIds: [''],
                userProperties: [''],
                configId: -1,
                customConfigs: config,
                eventConfigs: [
                    {
                        domain: '',
                        name: 'testEvent',
                        isRealTime: false
                    }
                ],
               configName:  'SDK_OCG'
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor);
                hilog.info(domain, tag, `testHiAppEvent010 > processorId: ${processorId}`)
                hiAppEvent.removeProcessor(processorId)
                expect(true).assertTrue()
                done()
            }
            catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, `testHiAppEvent010 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });
    })
    hilog.info(domain, tag, 'addProcessorTest end');
}