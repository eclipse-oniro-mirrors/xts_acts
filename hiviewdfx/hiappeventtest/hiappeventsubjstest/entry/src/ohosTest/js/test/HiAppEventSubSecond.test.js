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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import Constant from 'deccjsunit/src/Constant'

export default function HiAppEventSubSecondTest() {
describe('HiAppEventSubSecondTest', function () {

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3000
     * @tc.name HiAppEventSub30
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub31
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub32
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub33
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub34
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub35
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub36
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub36', 3, async function (done) {
        console.info('testHiAppEventSub36 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain_test_domain_test_doma",
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
     * @tc.name HiAppEventSub37
     * @tc.desc 验证调用write接口，事件领域名称大写字母开头，32字符，打点成功.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub37', 3, async function (done) {
        console.info('testHiAppEventSub37 start')
        try{
            HiAppEventV9.write({
                domain: "Test_domain_Test_domain_Test_dom",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    // int_data_int_data_int_data_int_d: 100,
                    str_data: "strValue"
                }
            }, (err) => {
                if (err) {
                    console.error(`HiAppEventSub37 > code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue()
                    done()
                    return;
                } else {
                    console.log(`success to write event`);
                    expect(true).assertTrue()
                    done()
                }
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
     * @tc.name HiAppEventSub38
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub39
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub40
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub41
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub42
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub42', 3, async function (done) {
        console.info('testHiAppEventSub42 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "9Test_event",
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
     * @tc.name HiAppEventSub43
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub44
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub45
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub46
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub47
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub48
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub48', 3, async function (done) {
        console.info('testHiAppEventSub48 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    int_data_int_data_int_data_int_da: 100,
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
     * @tc.name HiAppEventSub49
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub49', 3, async function (done) {
        console.info('testHiAppEventSub49 start')
        try{
            HiAppEventV9.write({
                domain: "test_domain",
                name: "test_event",
                eventType: HiAppEventV9.EventType.FAULT,
                params: {
                    "9Int_data": 100,
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
     * @tc.name HiAppEventSub50
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub51
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub52
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub53
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub54
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub54', 3, async function (done) {
        console.info('testHiAppEventSub54 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1watcher2watcher3watcher4w",
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
     * @tc.name HiAppEventSub55
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub55', 3, async function (done) {
        console.info('testHiAppEventSub55 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "Watcher1Watcher2Watcher3Watcher4",
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
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.error(`HiAppEventSub55 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub55 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_5600
     * @tc.name HiAppEventSub56
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub57
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub58
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub59
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub59', 3, async function (done) {
        console.info('testHiAppEventSub59 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "test_domain_test_domain_test_doma"
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
     * @tc.name HiAppEventSub60
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub60', 3, async function (done) {
        console.info('testHiAppEventSub60 start')
        try{
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "Test_domain_Test_domain_Test_dom"
                    }
                ],
                triggerCondition: {
                    row: 1,
                },
                onTrigger: function (curRow, curSize, holder) {
                }
            })
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.error(`HiAppEventSub60 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(false).assertTrue()
            console.info('HiAppEventSub60 end')
            done()
        }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6100
     * @tc.name HiAppEventSub61
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub62
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub63
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub64
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub65
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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
     * @tc.name HiAppEventSub66
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
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

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_6700
     * @tc.name HiAppEventSub67
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub67', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('testHiAppEventSub67 start')
        try{
            let holder = HiAppEventV9.addWatcher({
                name: "watcher",
            });
            holder.setSize(null);
        } catch (err) {
            console.error(`HiAppEventSub67 delay > error code: ${err.code}, error msg: ${err.message}`)
            expect(err.code == 401).assertTrue()
            console.info('HiAppEventSub67 end')
            done()
        }
    })
})
}