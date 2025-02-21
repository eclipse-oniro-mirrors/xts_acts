/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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
import HiAppEventV9 from '@ohos.hiviewdfx.hiAppEvent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import Constant from 'deccjsunit/src/Constant'

export default function HiAppEventSubSecondTest() {
describe('HiAppEventSubSecondTest', function () {

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3000
     * @tc.name 验证调用write接口，缺少write参数，无法打点，错误码401。
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub30', 3, async function (done) {
        console.info('testHiAppEventSub30 start')
        try{
            HiAppEventV9.write( (err) => {
                if (err) {
                    console.error(`HiAppEventSub30 >code: ${err.code}, message: ${err.message}`);
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub30 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 401).assertTrue()
            console.info('HiAppEventSub30 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3100
     * @tc.name 验证调用addWatcher接口，缺少name参数，订阅失败，错误码401。
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub31', 3, async function (done) {
        console.info('testHiAppEventSub31 start')
        try{
            let result = HiAppEventV9.addWatcher({
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub31 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 401).assertTrue()
            console.info('HiAppEventSub31 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3200
     * @tc.name 验证调用write接口，打点功能被关闭，打点错误，返回错误码11100001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub32', 3, async function (done) {
        console.info('testHiAppEventSub32 start')
        try{
            HiAppEventV9.configure({
                disable: true
            });
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub32 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11100001).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
            HiAppEventV9.configure({
                disable: false
            });

        } catch (err) {
            console.error(`HiAppEventSub32 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub32 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3300
     * @tc.name 验证调用write接口，事件领域名称包含特殊字符，打点错误，返回错误码11101001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub33', 3, async function (done) {
        console.info('testHiAppEventSub33 start')
        try{
            HiAppEventV9.write({
                domain: "test_?domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub33 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101001).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub33 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub33 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3400
     * @tc.name 验证调用write接口，事件领域名称以下划线结尾，打点错误，返回错误码11101001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub34', 3, async function (done) {
        console.info('testHiAppEventSub34 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain_",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub34 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101001).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub34 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub34 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3500
     * @tc.name 验证调用write接口，事件领域名称为空，打点错误，返回错误码11101001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub35', 3, async function (done) {
        console.info('testHiAppEventSub35 start')
        try{
            HiAppEventV9.write({
                domain: "",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub35 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101001).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub35 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub35 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3600
     * @tc.name 验证调用write接口，事件领域名称超长，打点错误，返回错误码11101001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub36', 3, async function (done) {
        console.info('testHiAppEventSub36 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain_test_domain_test_domain_test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub36 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101001).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub36 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub36 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3700
     * @tc.name 验证调用write接口，事件领域名称大写字母开头，打点错误，返回错误码11101001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub37', 3, async function (done) {
        console.info('testHiAppEventSub37 start')
        try{
            HiAppEventV9.write({
                domain: "Test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub37 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101001).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub37 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub37 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3800
     * @tc.name 验证调用write接口，事件名称包含特殊字符，打点错误，返回错误码11101002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub38', 3, async function (done) {
        console.info('testHiAppEventSub38 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_?event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub38 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101002).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub38 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub38 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3900
     * @tc.name 验证调用write接口，事件名称以下划线结尾，打点错误，返回错误码11101002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub39', 3, async function (done) {
        console.info('testHiAppEventSub39 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event_",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub39 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101002).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub39 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub39 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4000
     * @tc.name 验证调用write接口，事件名称为空，打点错误，返回错误码11101002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub40', 3, async function (done) {
        console.info('testHiAppEventSub40 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub40 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101002).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub40 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub40 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4100
     * @tc.name 验证调用write接口，事件名称超长，打点错误，返回错误码11101002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub41', 3, async function (done) {
        console.info('testHiAppEventSub41 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event_test_event_test_event_test_event_test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub41 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101002).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub41 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub41 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4200
     * @tc.name 验证调用write接口，事件名称大写字母开头，打点错误，返回错误码11101002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub42', 3, async function (done) {
        console.info('testHiAppEventSub42 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "Test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub42 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101002).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub42 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub42 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4300
     * @tc.name 验证调用write接口，参数数量非法，丢弃额外事件，返回错误码11101003
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub43', 3, async function (done) {
        console.info('testHiAppEventSub43 start')
        try{
            let largeParams = {}
            for (let i = 0; i <33 ; i++) {
                largeParams["name" + i] = i
            }
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: largeParams
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub43 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101003).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub43 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub43 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4400
     * @tc.name 验证调用write接口，事件参数值传入了超长的字符串，丢弃额外字符，返回错误码11101004
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub44', 3, async function (done) {
        console.info('testHiAppEventSub44 start')
        try{
            let longStr = "a".repeat(8*1024 + 1);
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data:longStr
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub44 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101004).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub44 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub44 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4500
     * @tc.name 验证调用write接口，事件参数名称以下划线结尾，忽略相关事件参数，返回错误码11101005
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub45', 3, async function (done) {
        console.info('testHiAppEventSub45 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    "int_?data": 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub45 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101005).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub45 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub45 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4600
     * @tc.name 验证调用write接口，事件参数名称以下划线结尾，忽略相关事件参数，返回错误码11101005
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub46', 3, async function (done) {
        console.info('testHiAppEventSub46 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data_: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub46 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101005).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub46 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub46 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4700
     * @tc.name 验证调用write接口，事件参数名称为空，忽略相关事件参数，返回错误码11101005
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub47', 3, async function (done) {
        console.info('testHiAppEventSub47 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    "": 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub47 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101005).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub47 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub47 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4800
     * @tc.name 验证调用write接口，事件参数名称超长，忽略相关事件参数，返回错误码11101005
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub48', 3, async function (done) {
        console.info('testHiAppEventSub48 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data_int_data_int_data_int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub48 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101005).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub48 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub48 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_4900
     * @tc.name 验证调用write接口，事件参数名称大写字母开头，忽略相关事件参数，返回错误码11101005
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub49', 3, async function (done) {
        console.info('testHiAppEventSub49 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    Int_data: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub49 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101005).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub49 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub49 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5000
     * @tc.name 验证调用write接口，事件参数值传入了超出长度的数组，丢弃额外数组元素，返回错误码11101006
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub50', 3, async function (done) {
        console.info('testHiAppEventSub50 start')
        try{
            let msgArray = []
            for (let i = 0; i < 101; i++) {
                msgArray[i] = i
            }
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data: 100,
                    str_data: "strValue",
                    msg: msgArray
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub50 > code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 11101006).assertTrue()
                    done()
                    return;
                }
                console.log(`success to write event`);
            });
        } catch (err) {
            console.error(`HiAppEventSub50 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub50 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5100
     * @tc.name 验证调用addWatcher接口，watcher名称包含特殊字符，忽略忽略此次订阅，返回错误码11102001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub51', 3, async function (done) {
        console.info('testHiAppEventSub11 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1?",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub51 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102001).assertTrue()
            console.info('HiAppEventSub51 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5200
     * @tc.name 验证调用addWatcher接口，watcher名称以下划线结尾，忽略忽略此次订阅，返回错误码11102001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub52', 3, async function (done) {
        console.info('testHiAppEventSub11 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher_",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub52 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102001).assertTrue()
            console.info('HiAppEventSub52 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5300
     * @tc.name 验证调用addWatcher接口，watcher名称为空，忽略忽略此次订阅，返回错误码11102001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub53', 3, async function (done) {
        console.info('testHiAppEventSub53 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub53 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102001).assertTrue()
            console.info('HiAppEventSub53 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5400
     * @tc.name 验证调用addWatcher接口，watcher名称超长，忽略忽略此次订阅，返回错误码11102001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub54', 3, async function (done) {
        console.info('testHiAppEventSub54 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1watcher2watcher3watcher4watcher5",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub54 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102001).assertTrue()
            console.info('HiAppEventSub54 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5500
     * @tc.name 验证调用addWatcher接口，watcher名称以大写字母开头，忽略忽略此次订阅，返回错误码11102001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub55', 3, async function (done) {
        console.info('testHiAppEventSub55 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "Watcher1",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub55 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102001).assertTrue()
            console.info('HiAppEventSub55 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5600
     * @tc.name 验证调用addWatcher接口，过滤事件领域名称包含特殊字符，忽略忽略此次订阅，返回错误码11102002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub56', 3, async function (done) {
        console.info('testHiAppEventSub56 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "test_?domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub56 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102002).assertTrue()
            console.info('HiAppEventSub56 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5700
     * @tc.name 验证调用addWatcher接口，过滤事件领域名称以下划线结尾，忽略忽略此次订阅，返回错误码11102002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub57', 3, async function (done) {
        console.info('testHiAppEventSub57 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "test_domain_"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub57 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102002).assertTrue()
            console.info('HiAppEventSub57 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5800
     * @tc.name 验证调用addWatcher接口，过滤事件领域名称为空，忽略忽略此次订阅，返回错误码11102002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub58', 3, async function (done) {
        console.info('testHiAppEventSub58 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: ""
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub58 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102002).assertTrue()
            console.info('HiAppEventSub58 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5900
     * @tc.name 验证调用addWatcher接口，过滤事件领域名称超长，忽略忽略此次订阅，返回错误码11102002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub59', 3, async function (done) {
        console.info('testHiAppEventSub59 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "test_domain_test_domain_test_domain_test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub59 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102002).assertTrue()
            console.info('HiAppEventSub59 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6000
     * @tc.name 验证调用addWatcher接口，过滤事件领域名称以大写字母开头，忽略忽略此次订阅，返回错误码11102002
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub60', 3, async function (done) {
        console.info('testHiAppEventSub60 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "Test_domain"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub60 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102002).assertTrue()
            console.info('HiAppEventSub60 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6100
     * @tc.name 验证调用addWatcher接口，传入了非法的事件个数值，忽略忽略此次订阅，返回错误码11102003
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub61', 3, async function (done) {
        console.info('testHiAppEventSub61 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    row: -1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub61 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102003).assertTrue()
            console.info('HiAppEventSub61 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6200
     * @tc.name 验证调用addWatcher接口，传入了非法的事件大小值，忽略忽略此次订阅，返回错误码11102004
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub62', 3, async function (done) {
        console.info('testHiAppEventSub11 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    size: -1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub62 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102004).assertTrue()
            console.info('HiAppEventSub62 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6300
     * @tc.name 验证调用addWatcher接口，传入了非法的超时值，忽略忽略此次订阅，返回错误码11102005
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub63', 3, async function (done) {
        console.info('testHiAppEventSub63 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "test_domain"
                    }
                ],
                triggerCondition: {
                    timeOut: -1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result == null).assertTrue();
        } catch (err) {
            console.error(`HiAppEventSub63 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11102005).assertTrue()
            console.info('HiAppEventSub63 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6400
     * @tc.name 验证调用configure接口，存储配额值含特殊字符，系统将忽略此次配置，返回错误码11103001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub64', 3, async function (done) {
        console.info('testHiAppEventSub64 start')
        try{
            HiAppEventV9.configure({
                maxStorage: '100M?'
            });
        } catch (err) {
            console.error(`HiAppEventSub64 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11103001).assertTrue()
            console.info('HiAppEventSub64 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6500
     * @tc.name 验证调用configure接口，存储配额值无单位，系统将忽略此次配置，返回错误码11103001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub65', 3, async function (done) {
        console.info('testHiAppEventSub65 start')
        try{
            HiAppEventV9.configure({
                maxStorage: '100A'
            });
        } catch (err) {
            console.error(`HiAppEventSub65 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11103001).assertTrue()
            console.info('HiAppEventSub65 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6600
     * @tc.name 验证调用setSize接口，事件包大小值为负，系统将忽略此次配置，返回错误码11104001
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub66', 3, async function (done) {
        console.info('testHiAppEventSub66 start')
        try{
            let holder = HiAppEventV9.addWatcher({
                name: "watcher",
            });
            holder.setSize(-1000);
        } catch (err) {
            console.error(`HiAppEventSub66 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 11104001).assertTrue()
            console.info('HiAppEventSub66 end')
            done()
        }
    })
})
}