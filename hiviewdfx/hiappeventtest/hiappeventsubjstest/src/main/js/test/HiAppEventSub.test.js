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
import HiAppEvent from '@ohos.hiAppEvent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import Constant from 'deccjsunit/src/Constant'

export default function HiAppEventSubTest() {
describe('HiAppEventSubTest', function () {

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0100
     * @tc.name 验证调用hiAppEvent.addWatcher，添加watcher为string类型，事件订阅成功，使用function可自动分发事件
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub01', 3, async function (done) {
        console.info('testHiAppEventSub01 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            triggerCondition: {
                row: 1
            },

            onTrigger: function (curRow, curSize, holder) {
                expect(holder != null).assertTrue();

                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        console.info("HiAppEventSub_result" + result)
        expect(result != null).assertTrue();

        setTimeout(() => {
            HiAppEvent.write("test_event1", HiAppEvent.EventType.FAULT, {"key_int":100},
                (err, value) => {
                    console.log('HiAppEvent into json-callback');
                    if (err) {
                        console.error(`HiAppEventSub01 json-callback-error code=${err.code}`);
                        expect(err.code == -1).assertFail();
                    } else {
                        console.log(`HiAppEventSub01 json-callback-success value=${value}`);
                        expect(value == 0).assertTrue();
                    }
                });
        }, 500)

        setTimeout(() => {
            HiAppEvent.write("test_event1", HiAppEvent.EventType.STATISTIC, {"key_int":100},
                (err, value) => {
                    console.log('HiAppEvent into json-callback');
                    if (err) {
                        console.error(`HiAppEventSub01 json-callback-error code=${err.code}`);
                        expect(err.code == -1).assertFail();
                    } else {
                        console.log(`HiAppEventSub01 json-callback-success value=${value}`);
                        expect(value == 0).assertTrue();
                    }
                });
        }, 1000)

        setTimeout(() => {
            HiAppEvent.write("test_event1", HiAppEvent.EventType.SECURITY, {"key_int":100},
                (err, value) => {
                    console.log('HiAppEvent into json-callback');
                    if (err) {
                        console.error(`HiAppEventSub01 json-callback-error code=${err.code}`);
                        expect(err.code == -1).assertFail();
                    } else {
                        console.log(`HiAppEventSub01 json-callback-success value=${value}`);
                        expect(value == 0).assertTrue();
                    }
                });
        }, 1500)
        setTimeout(() => {
            HiAppEvent.write("test_event1", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
                (err, value) => {
                    console.log('HiAppEvent into json-callback');
                    if (err) {
                        console.error(`HiAppEventSub01 json-callback-error code=${err.code}`);
                        expect(err.code == -1).assertFail();
                    } else {
                        console.log(`HiAppEventSub01 json-callback-success value=${value}`);
                        expect(value == 0).assertTrue();
                    }
                });
        }, 2000)

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub01 end')
        }, 4000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0200
     * @tc.name 验证调用hiAppEvent.addWatcher，添加watcher为string类型，事件订阅成功，使用function可自动分发事件
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub02', 3, async function (done) {
        console.info('testHiAppEventSub02 start')
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
        let holder = HiAppEventV9.addWatcher({
            name: "watcher2",
        });
        HiAppEvent.write("test_event2", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub02 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub02 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event2", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub02 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub02 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event2", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub09 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub02 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event2", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub02 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub02 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        sleep(3000)
        if (holder != null) {
            let eventPkg = holder.takeNext();
            if (eventPkg == null) {
                return;
            }
            console.info("eventPkg.packageId=" + eventPkg.packageId);
            console.info("eventPkg.row=" + eventPkg.row);
            console.info("eventPkg.size=" + eventPkg.size);
            for (const eventInfo of eventPkg.data) {
                console.info("eventPkg.data=" + eventInfo);
            }
            expect(true).assertTrue()
        }
        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher2"})
            done()
            console.info('HiAppEventSub02 end')
        }, 5000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0300
     * @tc.name 验证调用hiAppEvent.addWatcher，添加watcher为int类型，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub03', 3, async function (done) {
        console.info('testHiAppEventSub03 start')
        try {
            let result = HiAppEventV9.addWatcher({
                name: 123,
                appEventFilters: [
                    {
                        domain: "default",
                        eventTypes: [HiAppEvent.EventType.FAULT]
                    }
                ],
                triggerCondition: {
                    row: 1
                },

                onTrigger: function (curRow, curSize, holder) {
                    let eventPkg = holder.takeNext();
                    if (eventPkg == null) {
                        expect().assertFail()
                    }
                    console.info("eventPkg.packageId=" + eventPkg.packageId);
                    console.info("eventPkg.row=" + eventPkg.row);
                    console.info("eventPkg.size=" + eventPkg.size);
                    for (const eventInfo of eventPkg.data) {
                        console.info("eventPkg.data=" + eventInfo);
                    }
                    expect(true).assertTrue()
                }
            })
            console.info("HiAppEventSub_result" + result)
            expect(result == null).assertTrue();
        } catch (error) {
            expect(error.code).assertEqual("401");
        }

        HiAppEvent.write("test_event3", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub03 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub03 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event3", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub03 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub03 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event3", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub03 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub03 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event3", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub03 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub03 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub03 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0400
     * @tc.name 验证调用hiAppEvent.addWatcher，添加watcher为bool类型，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub04', 3, async function (done) {
        console.info('testHiAppEventSub04 start')
        try {
            let result = HiAppEventV9.addWatcher({
                name: true,
                appEventFilters: [
                    {
                        domain: "default",
                        eventTypes: [HiAppEvent.EventType.FAULT]
                    }
                ],
                triggerCondition: {
                    row: 1
                },

                onTrigger: function (curRow, curSize, holder) {
                    let eventPkg = holder.takeNext();
                    if (eventPkg == null) {
                        expect().assertFail()
                    }
                    console.info("eventPkg.packageId=" + eventPkg.packageId);
                    console.info("eventPkg.row=" + eventPkg.row);
                    console.info("eventPkg.size=" + eventPkg.size);
                    for (const eventInfo of eventPkg.data) {
                        console.info("eventPkg.data=" + eventInfo);
                    }
                    expect(true).assertTrue()
                }
            })
            expect(result == null).assertTrue();
        } catch (error) {
            expect(error.code).assertEqual("401");
        }

        HiAppEvent.write("test_event4", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub04 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub04 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event4", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub04 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub04 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event4", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub04 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub04 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event4", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub04 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub04 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub04 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0500
     * @tc.name 验证调用hiAppEvent.addWatcher，无watcher，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub05', 3, async function (done) {
        console.info('testHiAppEventSub05 start')
        try {
            let result = HiAppEventV9.addWatcher({
                appEventFilters: [
                    {
                        domain: "default",
                    }
                ],
                triggerCondition: {
                    row: 0
                },

                onTrigger: function (curRow, curSize, holder) {
                    let eventPkg = holder.takeNext();
                    if (eventPkg == null) {
                        expect().assertFail()
                    }
                    console.info("eventPkg.packageId=" + eventPkg.packageId);
                    console.info("eventPkg.row=" + eventPkg.row);
                    console.info("eventPkg.size=" + eventPkg.size);
                    for (const eventInfo of eventPkg.data) {
                        console.info("eventPkg.data=" + eventInfo);
                    }
                    expect(true).assertTrue()
                }
            })
            expect(result == null).assertTrue();
        } catch (error) {
            expect(error.code).assertEqual("401");
        }

        HiAppEvent.write("test_event5", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub05 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub05 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event5", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub05 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub05 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event5", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub05 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub05 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event5", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub05 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub05 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub05 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0600
     * @tc.name 验证调用hiAppEvent.addWatcher，添加domain为有效，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub06', 3, async function (done) {
        console.info('testHiAppEventSub06 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default"
                }
            ],
            triggerCondition: {
                row: 1
            },

            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    console.info("HiAppEventSub_result6:" + eventPkg)
                    return
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event6", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub06 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub06 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event6", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub06 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub06 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event6", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub06 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub06 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event6", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub06 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub06 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub06 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0700
     * @tc.name 验证调用hiAppEvent.addWatcher，domain为空，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub07', 3, async function (done) {
        console.info('testHiAppEventSub07 start')
        try {
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: ""
                    }
                ],
                triggerCondition: {
                    row: 1,
                    size: 1,
                    timeOut: 1
                },

                onTrigger: function (curRow, curSize, holder) {
                    let eventPkg = holder.takeNext();
                    if (eventPkg == null) {
                        expect().assertFail()
                    }
                    console.info("eventPkg.packageId=" + eventPkg.packageId);
                    console.info("eventPkg.row=" + eventPkg.row);
                    console.info("eventPkg.size=" + eventPkg.size);
                    for (const eventInfo of eventPkg.data) {
                        console.info("eventPkg.data=" + eventInfo);
                    }
                    expect(true).assertTrue()
                }
            })
            expect(result == null).assertTrue();
        } catch (error) {
            expect(error.code).assertEqual("11102002");
        }

        HiAppEvent.write("test_event7", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub07 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub07 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub07 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0800
     * @tc.name 验证调用hiAppEvent.addWatcher，domain为无效，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub08', 3, async function (done) {
        console.info('testHiAppEventSub08 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default1"
                }
            ],
            triggerCondition: {
                row: 1,
                size: 1,
                timeOut: 1
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        console.info("HiAppEventSub_result" + result)
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event8", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub08 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub08 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub08 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0900
     * @tc.name 验证调用hiAppEvent.addWatcher，设置domain，eventType为FAULT，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub09', 3, async function (done) {
        console.info('testHiAppEventSub09 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT]
                }
            ],
            triggerCondition: {
                row: 1
            },

            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        console.info("HiAppEventSub_result" + result)
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event9", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub09 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub09 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event9", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub09 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub09 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event9", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub09 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub09 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event9", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub09 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub09 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub09 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1000
     * @tc.name 验证调用hiAppEvent.addWatcher，设置domain，eventType为STATISTIC，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub10', 3, async function (done) {
        console.info('testHiAppEventSub10 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.STATISTIC]
                }
            ],
            triggerCondition: {
                row: 1
            },

            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event10", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub10 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub10 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event10", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub10 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub10 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event10", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub10 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub10 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event10", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub10 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub10 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub10 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1100
     * @tc.name 验证调用hiAppEvent.addWatcher，设置domain，eventType为SECURITY，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub11', 3, async function (done) {
        console.info('testHiAppEventSub11 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.SECURITY]
                }
            ],
            triggerCondition: {
                size: 1
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event11", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub11 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub11 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event11", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub11 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub11 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event11", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub09 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub11 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event11", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub11 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub11 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub11 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1200
     * 验证调用hiAppEvent.addWatcher，设置domain，eventType为BEHAVIOR，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub12', 3, async function (done) {
        console.info('testHiAppEventSub12 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.BEHAVIOR]
                }
            ],
            triggerCondition: {
                size: 1
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event12", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub12 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub12 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event12", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub12 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub12 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event12", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub09 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub12 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event12", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub12 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub12 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub12 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1300
     * @tc.name 验证调用hiAppEvent.addWatcher，设置domain，eventType为4种枚举类型，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub13', 3, async function (done) {
        console.info('testHiAppEventSub13 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT,HiAppEvent.EventType.STATISTIC,
                        HiAppEvent.EventType.SECURITY,HiAppEvent.EventType.BEHAVIOR]
                }
            ],
            triggerCondition: {
                row: 1
            },

            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    return
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event13", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub13 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub13 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event13", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub13 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub13 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event13", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub13 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub13 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event13", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub13 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub13 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub13 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1400
     * @tc.name 验证调用hiAppEvent.addWatcher，未设置domain，eventType为4种枚举类型，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub14', 3, async function (done) {
        console.info('testHiAppEventSub14 start')
        try {
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        eventTypes: [HiAppEvent.EventType.FAULT,HiAppEvent.EventType.STATISTIC,
                            HiAppEvent.EventType.SECURITY,HiAppEvent.EventType.BEHAVIOR]
                    }
                ],
                triggerCondition: {
                    row: 1
                },

                onTrigger: function (curRow, curSize, holder) {
                    let eventPkg = holder.takeNext();
                    if (eventPkg == null) {
                        expect().assertFail()
                    }
                    console.info("eventPkg.packageId=" + eventPkg.packageId);
                    console.info("eventPkg.row=" + eventPkg.row);
                    console.info("eventPkg.size=" + eventPkg.size);
                    for (const eventInfo of eventPkg.data) {
                        console.info("eventPkg.data=" + eventInfo);
                    }
                    expect(true).assertTrue()
                }
            })
            expect(result == null).assertTrue();
        } catch (error) {
            expect(error.code).assertEqual("401");
        }

        HiAppEvent.write("test_event14", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub14 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub14 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event14", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub14 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub14 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event14", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub14 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub14 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event14", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub14 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub14 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub14 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1500
     * @tc.name 验证调用hiAppEvent.addWatcher，eventType为非法，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub15', 3, async function (done) {
        console.info('testHiAppEventSub15 start')
        try {
            let result = HiAppEventV9.addWatcher({
                name: "watcher1",
                appEventFilters: [
                    {
                        domain: "default",
                        eventTypes: [HiAppEvent.EventType.BEHAVIOR+1]
                    }
                ],
                triggerCondition: {
                    row: 1
                },

                onTrigger: function (curRow, curSize, holder) {
                    let eventPkg = holder.takeNext();
                    if (eventPkg == null) {
                        return;
                    }
                    console.info("eventPkg.packageId=" + eventPkg.packageId);
                    console.info("eventPkg.row=" + eventPkg.row);
                    console.info("eventPkg.size=" + eventPkg.size);
                    for (const eventInfo of eventPkg.data) {
                        console.info("eventPkg.data=" + eventInfo);
                    }
                    expect(true).assertTrue()
                }
            })
            expect(result == null).assertTrue();
        } catch (error) {
            expect(error.code).assertEqual("401");
        }

        HiAppEvent.write("test_event15", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub15 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub15 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event15", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub15 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub15 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event15", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub15 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub15 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event15", HiAppEvent.EventType.BEHAVIOR, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub15 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub15 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub15 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1600
     * @tc.name 验证调用hiAppEvent.addWatcher，设置domain，过滤行数等于打点行数，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub16', 3, async function (done) {
        console.info('testHiAppEventSub16 start')
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            triggerCondition: {
                row: 3
            },

            onTrigger: function (curRow, curSize, holder) {
                expect(holder != null).assertTrue();

                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    return;
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        console.info("HiAppEventSub_result" + result)
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event16", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub16 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub16 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event16", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub16 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub16 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event16", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub16 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub16 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        sleep(3000)

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub16 end')
        }, 1000)
    })


    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1700
     * @tc.name 验证调用hiAppEvent.addWatcher，过滤行数大于打点行数，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub17', 3, async function (done) {
        console.info('testHiAppEventSub17 start')
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            triggerCondition: {
                row: 4
            },

            onTrigger: function (curRow, curSize, holder) {
                expect(holder != null).assertTrue();

                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    return;
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        console.info("HiAppEventSub_result" + result)
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event17", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub17 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub17 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event17", HiAppEvent.EventType.STATISTIC, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub17 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub17 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        HiAppEvent.write("test_event1", HiAppEvent.EventType.SECURITY, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub17 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub17 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        sleep(3000)

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub17 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1800
     * @tc.name 验证调用hiAppEvent.addWatcher，触发条件仅row有效，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub18', 3, async function (done) {
        console.info('testHiAppEventSub18 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT]
                }
            ],
            triggerCondition: {
                row: 1,
                size: 0,
                timeOut: 0
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event18", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub18 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub18 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub18 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1900
     * @tc.name 验证调用hiAppEvent.addWatcher，size=1，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub19', 3, async function (done) {
        console.info('testHiAppEventSub19 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default"
                }
            ],
            triggerCondition: {
                size: 1
            },

            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event19", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub19 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub19 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub19 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2000
     * @tc.name 验证调用hiAppEvent.addWatcher，size=0，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub20', 3, async function (done) {
        console.info('testHiAppEventSub20 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default"
                }
            ],
            triggerCondition: {
                size: 1
            },

            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event20", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub20 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub20 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub20 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2100
     * @tc.name 验证调用hiAppEvent.addWatcher，触发条件仅size有效，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub21', 3, async function (done) {
        console.info('testHiAppEventSub21 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT]
                }
            ],
            triggerCondition: {
                row: 0,
                size: 1,
                timeOut: 0
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event21", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub21 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub21 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub21 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2200
     * @tc.name 验证调用hiAppEvent.addWatcher，timeout=1，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub22', 3, async function (done) {
        console.info('testHiAppEventSub22 start')
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT]
                }
            ],
            triggerCondition: {
                timeOut: 1
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event22", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub22 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub22 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        sleep(30000)
        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub22 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2300
     * @tc.name 验证调用hiAppEvent.addWatcher，timeout=0，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub23', 3, async function (done) {
        console.info('testHiAppEventSub23 start')
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT]
                }
            ],
            triggerCondition: {
                timeOut: 0
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event23", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub23 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub23 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        sleep(1000)
        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub23 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2400
     * @tc.name 验证调用hiAppEvent.addWatcher，未设置触发条件，事件订阅失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub24', 3, async function (done) {
        console.info('testHiAppEventSub24 start')
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT]
                }
            ],
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event24", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub24 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub24 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        sleep(1000)
        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub24 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2800
     * @tc.name 验证调用hiAppEvent.addWatcher，触发条件仅timeout有效，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub28', 3, async function (done) {
        console.info('testHiAppEventSub28 start')
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default",
                    eventTypes: [HiAppEvent.EventType.FAULT]
                }
            ],
            triggerCondition: {
                row: 0,
                size: 0,
                timeOut: 1
            },
            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event28", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub28 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub28 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });
        sleep(30000)
        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub28 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2900
     * @tc.name 验证调用hiAppEvent.addWatcher，size=1，事件订阅成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub29', 3, async function (done) {
        console.info('testHiAppEventSub29 start')
        let result = HiAppEventV9.addWatcher({
            name: "watcher1",
            appEventFilters: [
                {
                    domain: "default"
                }
            ],
            triggerCondition: {
                size: 0
            },

            onTrigger: function (curRow, curSize, holder) {
                let eventPkg = holder.takeNext();
                if (eventPkg == null) {
                    expect().assertFail()
                }
                console.info("eventPkg.packageId=" + eventPkg.packageId);
                console.info("eventPkg.row=" + eventPkg.row);
                console.info("eventPkg.size=" + eventPkg.size);
                for (const eventInfo of eventPkg.data) {
                    console.info("eventPkg.data=" + eventInfo);
                }
                expect(true).assertTrue()
            }
        })
        expect(result != null).assertTrue();
        HiAppEvent.write("test_event29", HiAppEvent.EventType.FAULT, {"key_int":100},
            (err, value) => {
                console.log('HiAppEvent into json-callback');
                if (err) {
                    console.error(`HiAppEventSub29 json-callback-error code=${err.code}`);
                    expect(err.code == -1).assertFail();
                } else {
                    console.log(`HiAppEventSub29 json-callback-success value=${value}`);
                    expect(value == 0).assertTrue();
                }
            });

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
            console.info('HiAppEventSub29 end')
        }, 1000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2500
     * @tc.name 验证调用removeWatcher，watcher为已有watcher，订阅者、相关订阅事件删除成功
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub25', 3, async function (done) {
        console.info('testHiAppEventSub25 start')
        let holder = HiAppEventV9.addWatcher({
            name: "watcher1",
        });
        setTimeout(() => {
            HiAppEvent.write("test_event25", HiAppEvent.EventType.FAULT, {"key_int":100},
                (err, value) => {
                    console.log('HiAppEvent into json-callback');
                    if (err) {
                        console.error(`HiAppEventSub25 json-callback-error code=${err.code}`);
                        expect(err.code == -1).assertFail();
                    } else {
                        console.log(`HiAppEventSub25 json-callback-success value=${value}`);
                        expect(value == 0).assertTrue();
                    }
                });
            done()
        }, 500)

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher1"})
            done()
        }, 1000)

        setTimeout(() => {
            expect(holder == null).assertTrue();
            done()
            console.info('HiAppEventSub25 end')
        }, 2000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2600
     * @tc.name 验证调用removeWatcher，watcher无效，订阅者、相关订阅事件删除失败
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub26', 3, async function (done) {
        console.info('testHiAppEventSub26 start')
        let holder = HiAppEventV9.addWatcher({
            name: "watcher1",
        });
        setTimeout(() => {
            HiAppEvent.write("test_event26", HiAppEvent.EventType.FAULT, {"key_int":100},
                (err, value) => {
                    console.log('HiAppEvent into json-callback');
                    if (err) {
                        console.error(`HiAppEventSub26 json-callback-error code=${err.code}`);
                        expect(err.code == -1).assertFail();
                    } else {
                        console.log(`HiAppEventSub26 json-callback-success value=${value}`);
                        expect(value == 0).assertTrue();
                    }
                });
            done()
        }, 500)

        setTimeout(() => {
            HiAppEventV9.removeWatcher({"name":"watcher2"})
            done()
        }, 1000)

        setTimeout(() => {
            expect(holder != null).assertTrue();
            done()
            console.info('HiAppEventSub26 end')
        }, 2000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2700
     * @tc.name 验证清理接口功能
     * @tc.desc HiAppEvent write interface test.
     */
    it('HiAppEventSub27', 3, function () {
        console.info('testHiAppEventSub27 start')
        HiAppEventV9.clearData()
        expect(true).assertTrue()
        console.info('HiAppEventSub27 end')
    })
})
}