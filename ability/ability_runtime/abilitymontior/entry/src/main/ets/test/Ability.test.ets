/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import Subscriber from '@ohos.commonEvent'

export default function abilityTest() {
    describe('ActsAbilityMonitor', function () {

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Callback_0100
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility to trigger onAbilityCreate (Callback).
        */
        it('ACTS_AddAbilityMonitor_Callback_0100', 0, async function (done) {
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            function onAbilityCreate() {
                console.debug("====>0100--onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0100", AddAbilityData, publishCallback);
            }
            console.debug("====>ACTS_AddAbilityMonitor_0100 start====>");
            var AddAbilityData;
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0100"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator();
            console.log("0100getAbilityDelegator data is" + JSON.stringify(data));
            Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                console.info("===ACTS_AddAbilityMonitor_0100===createSubscriber" + JSON.stringify(data));
                var AddAbility = data;
                await Subscriber.subscribe(AddAbility, (err, data) => {
                    console.log('===ACTS_AddAbilityMonitor_0100CallBack==='
                        + err.code + JSON.stringify(data));
                    Subscriber.unsubscribe(AddAbility, (err, data) => {
                        console.log('===UnSubscribeCallBacka===' + err.code);
                    });
                    if (data.code == 1) {
                        expect(data.code).assertEqual(1);
                        setTimeout(() => {
                            done();
                        }, 2500);
                    }
                    else {
                        expect().assertFail();
                        setTimeout(() => {
                            done();
                        }, 2500);
                    }
                });
            });
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onAbilityCreate: onAbilityCreate
                }, (async (err) => {
                    console.debug("====>ACTS_AddAbilityMonitor_0100 addAbilityMonitor====>" + err.code);
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>0100startAbility success====>");
                        });
                }));
        });

        /**
       * @tc.number: ACTS_AddAbilityMonitor_Callback_0200
       * @tc.name: Verify that the addAbilityMonitor interface functions normally.
       * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility to 
       * trigger onAbilityForeground (Callback).
       */
        it('ACTS_AddAbilityMonitor_Callback_0200', 0, async function (done) {
            function onAbilityForeground() {
                console.debug("====>0200--onAbilityForeground====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0200", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0200"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("0200getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onAbilityForeground: onAbilityForeground,
                    onWindowStageRestore:(Ability)=>{
                        console.info("===>onWindowStageRestore");
                    }
                }, (async (err) => {
                    console.debug("====>ACTS_AddAbilityMonitor_0200 success====>" + err.code);
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>0200startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_0200===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(data, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_0200CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, (err, data) => {
                                        console.log('===UnSubscribeCallBack===' + err.code)
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                }))
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Callback_0300
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility to trigger 
        * onAbilityBackground (Callback).
        */
        it('ACTS_AddAbilityMonitor_Callback_0300', 0, async function (done) {
            function onAbilityBackgroundPromise() {
                console.debug("====>onAbilityBackgroundPromise ====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0300", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            function UnSubscribeCallback() {
                console.debug("====>commonEvent_foreground UnSubscribeCallback====>");
            }
            function SubscribeCallBack(err, data) {
                console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
                Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                    console.info("===ACTS_AddAbilityMonitor_0300===createSubscriber" + JSON.stringify(data));
                    var AddAbility = data
                    Delegator.getCurrentTopAbility().then((ability) => {
                        console.info("===ACTS_AddAbilityMonitor_0300===ability " + JSON.stringify(ability).length);
                        Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_AddAbilityMonitor_0300CallBack==='
                                + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBack===')
                                Subscriber.unsubscribe(subscriber, UnSubscribeCallback);
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                        Delegator.doAbilityBackground(ability).then(async (data) => {
                            console.info("===ACTS_AddAbilityMonitor_0300===data succeed.");
                            expect(true).assertTrue();
                        }).catch((err: any) => {
                            console.info("===ACTS_AddAbilityMonitor_0300===data failed.");
                            expect(false).assertTrue();
                        });
                    })
                })
            }
            var AddAbilityData
            var subscriber
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0300"]
            };
            var commonEvent_Foreground = {
                events: ["commonEvent_foreground"]
            };
            var Delegator = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("1000getAbilityDelegator data is" + JSON.stringify(Delegator))
            Delegator.addAbilityMonitor(
                {
                    abilityName: 'MainAbility3',
                    onAbilityBackground: onAbilityBackgroundPromise
                }, (async (err) => {
                    console.debug("====>ACTS_AddAbilityMonitor_0300 addAbilityMonitor====>" + err.code);
                }))
            Subscriber.createSubscriber(commonEvent_Foreground, async (err, data) => {
                console.debug("====>Create Subscriber====>");
                subscriber = data;
                Subscriber.subscribe(subscriber, SubscribeCallBack);
                await globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility3'
                    }).then(async () => {
                        console.debug("====>startAbility success====>");
                    })
            })
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Callback_0400
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityDestroy (Callback).
        */
        it('ACTS_AddAbilityMonitor_Callback_0400', 0, async function (done) {
            function onAbilityDestroy() {
                console.debug("====>onAbilityDestroy====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0400", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0400"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("0400getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility4',
                    onAbilityDestroy: onAbilityDestroy
                }, (async (err) => {
                    console.debug("====>ACTS_AddAbilityMonitor_0400 success====>" + err.code);
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility4'
                        }).then(async () => {
                            console.debug("====>0400startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_0400===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(data, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_0400CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, (err, data) => {
                                        console.log('===UnSubscribeCallBack===' + err.code)
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                }))
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Callback_0500
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onWindowStageCreate (Callback).
        */
        it('ACTS_AddAbilityMonitor_Callback_0500', 0, async function (done) {
            function onWindowStageCreate() {
                console.debug("====>onWindowStageCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0500", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0500"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("0500getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onWindowStageCreate: onWindowStageCreate
                }, (async (err) => {
                    console.debug("====>ACTS_AddAbilityMonitor_0500 success====>" + err.code);
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>0500startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_0500===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(data, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_0500CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, (err, data) => {
                                        console.log('===UnSubscribeCallBacke===' + err.code)
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                }))
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Callback_0600
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onWindowStageDestroy (Callback).
        */
        it('ACTS_AddAbilityMonitor_Callback_0600', 0, async function (done) {
            function onWindowStageDestroy() {
                console.debug("====>onWindowStageDestroy====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0600", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0600"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("0700getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility4',
                    onWindowStageDestroy: onWindowStageDestroy
                }, (async (err) => {
                    console.debug("====>ACTS_AddAbilityMonitor_0600 success====>" + err.code);
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility4'
                        }).then(async () => {
                            console.debug("====>0600startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_0600===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(data, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_0600CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, () => {
                                        console.log('===UnSubscribeCallBackf===')
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                }))
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Callback_0700
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate with many
        *           a time (Callback).
        */
        it('ACTS_AddAbilityMonitor_Callback_0700', 0, async function (done) {
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            function onAbilityCreate() {
                console.debug("====>0700--onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0700", AddAbilityData, publishCallback);
            }
            var AddAbilityData
            console.debug("====>ACTS_AddAbilityMonitor_0700 start====>");
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0700"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("0700getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onAbilityCreate: onAbilityCreate
                }, (async (err) => {
                    console.debug("====>ACTS_AddAbilityMonitor_0700 addAbilityMonitorfir====>" + err.code);
                    data.addAbilityMonitor(
                        {
                            abilityName: 'MainAbility2',
                            onAbilityCreate: onAbilityCreate
                        }, (async (err) => {
                            console.debug("====>ACTS_AddAbilityMonitor_0700 addAbilityMonitorsec====>" + err.code);
                            await globalThis.abilitydelegator.startAbility(
                                {
                                    bundleName: 'com.example.abilitymonitortest',
                                    abilityName: 'MainAbility2'
                                }).then(async () => {
                                    console.debug("====>0700startAbility success====>");
                                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                        console.info("===ACTS_AddAbilityMonitor_0700===createSubscriber"
                                            + JSON.stringify(data));
                                        var AddAbility = data
                                        await Subscriber.subscribe(AddAbility, (err, data) => {
                                            console.log('===ACTS_AddAbilityMonitor_0700CallBack==='
                                                + err.code + JSON.stringify(data))
                                            Subscriber.unsubscribe(AddAbility, (err, data) => {
                                                console.log('===UnSubscribeCallBacka===' + err.code)
                                            })
                                            if (data.code == 1) {
                                                expect(data.code).assertEqual(1);
                                                setTimeout(() => {
                                                    done();
                                                }, 2500)
                                            }
                                            else {
                                                expect().assertFail();
                                                setTimeout(() => {
                                                    done();
                                                }, 2500)
                                            }
                                        })
                                    })
                                })
                        }))
                }))
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Promise_0100
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate (promise).
        */
        it('ACTS_AddAbilityMonitor_Promise_0100', 0, async function (done) {
            function onAbilityCreatePromise() {
                console.debug("====>onAbilityCreatePromise ====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0800", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0800"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("ACTS_AddAbilityMonitor_0800 data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onAbilityCreate: onAbilityCreatePromise
                }).then(() => {
                    console.debug("====>ACTS_AddAbilityMonitor_0800 success====>");
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>0800startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_0800===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(AddAbility, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_0800CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, (err, data) => {
                                        console.log('===UnSubscribeCallBack===' + err.code)
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                })
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Promise_0200
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityForeground (promise).
        */
        it('ACTS_AddAbilityMonitor_Promise_0200', 0, async function (done) {
            function onAbilityForegroundPromise() {
                console.debug("====>onAbilityForegroundPromise ====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_0900", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_0900"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("0900getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onAbilityForeground: onAbilityForegroundPromise
                }).then(async () => {
                    console.debug("====>ACTS_AddAbilityMonitor_0900 success====>");
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>0900startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_0900===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(AddAbility, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_0900CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, () => {
                                        console.log('===UnSubscribeCallBack===')
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                })
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Promise_0300
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityBackground (promise).
        */
        it('ACTS_AddAbilityMonitor_Promise_0300', 0, async function (done) {
            function onAbilityBackgroundPromise() {
                console.debug("====>onAbilityBackgroundPromise ====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_1000", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            function UnSubscribeCallback() {
                console.debug("====>commonEvent_foreground UnSubscribeCallback====>");
            }
            function SubscribeCallBack(err, data) {
                console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
                Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                    console.info("===ACTS_AddAbilityMonitor_1000===createSubscriber" + JSON.stringify(data));
                    var AddAbility = data
                    Delegator.getCurrentTopAbility().then((ability) => {
                        console.info("===ACTS_AddAbilityMonitor_1000===ability" + JSON.stringify(ability).length);
                        Delegator.doAbilityBackground(ability).then(async () => {
                            console.info("===ACTS_AddAbilityMonitor_1000===data succeed.");
                            expect(true).assertTrue();
                            await Subscriber.subscribe(AddAbility, (err, data) => {
                                console.log('===ACTS_AddAbilityMonitor_1000CallBack==='
                                    + err.code + JSON.stringify(data))
                                Subscriber.unsubscribe(AddAbility, () => {
                                    console.log('===UnSubscribeCallBack===')
                                    Subscriber.unsubscribe(subscriber, UnSubscribeCallback);
                                })
                                if (data.code == 1) {
                                    expect(data.code).assertEqual(1);
                                    setTimeout(() => {
                                        done();
                                    }, 2500)
                                }
                                else {
                                    expect().assertFail();
                                    setTimeout(() => {
                                        done();
                                    }, 2500)
                                }
                            })
                        }).catch(() => {
                            console.info("===ACTS_AddAbilityMonitor_1000===data succeed.");
                            expect(false).assertTrue();
                        });
                    })
                })
            }
            var AddAbilityData
            var subscriber
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_1000"]
            };
            var commonEvent_Foreground = {
                events: ["commonEvent_foreground"]
            };
            var Delegator = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("1000getAbilityDelegator data is" + JSON.stringify(Delegator))
            Delegator.addAbilityMonitor(
                {
                    abilityName: 'MainAbility3',
                    onAbilityBackground: onAbilityBackgroundPromise
                }).then(async () => {
                    console.debug("====>ACTS_AddAbilityMonitor_1000 success====>");
                })
            await Subscriber.createSubscriber(commonEvent_Foreground, async (err, data) => {
                console.debug("====>Create Subscriber====>");
                subscriber = data;
                Subscriber.subscribe(subscriber, SubscribeCallBack);
                await globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility3'
                    }).then(async () => {
                        console.debug("====>startAbility success====>");
                    })
            })
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Promise_0400
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityDestroy (promise).
        */
        it('ACTS_AddAbilityMonitor_Promise_0400', 0, async function (done) {
            function onAbilityDestroyPromise() {
                console.debug("====>onAbilityDestroyPromise====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_1100", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_1100"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("1100getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility4',
                    onAbilityDestroy: onAbilityDestroyPromise
                }).then(async () => {
                    console.debug("====>ACTS_AddAbilityMonitor_1100 success====>");
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility4'
                        }).then(async () => {
                            console.debug("====>1100startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_1100===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(data, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_1100CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, (err, data) => {
                                        console.log('===UnSubscribeCallBack===' + err.code)
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                })
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Promise_0500
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onWindowStageCreate (promise).
        */
        it('ACTS_AddAbilityMonitor_Promise_0500', 0, async function (done) {
            function onWindowStageCreatePromise() {
                console.debug("====>onWindowStageCreatePromise====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_1200", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_1200"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("1200getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onWindowStageCreate: onWindowStageCreatePromise
                }).then(async () => {
                    console.debug("====>ACTS_AddAbilityMonitor_1200 success====>");
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>1200startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_1200===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(data, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_1200CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, (err, data) => {
                                        console.log('===UnSubscribeCallBack===' + err.code)
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                })
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Promise_0600
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onWindowStageDestroy (promise).
        */
        it('ACTS_AddAbilityMonitor_Promise_0600', 0, async function (done) {
            function onWindowStageDestroyPromsie() {
                console.debug("====>onWindowStageDestroyPromsie====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_1300", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_1300"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("1300getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility4',
                    onWindowStageDestroy: onWindowStageDestroyPromsie
                }).then(async () => {
                    console.debug("====>ACTS_AddAbilityMonitor_1300 success====>");
                    await globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility4'
                        }).then(async () => {
                            console.debug("====>1300startAbility success====>");
                            await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                console.info("===ACTS_AddAbilityMonitor_1300===createSubscriber"
                                    + JSON.stringify(data));
                                var AddAbility = data
                                await Subscriber.subscribe(data, (err, data) => {
                                    console.log('===ACTS_AddAbilityMonitor_1300CallBack==='
                                        + err.code + JSON.stringify(data))
                                    Subscriber.unsubscribe(AddAbility, () => {
                                        console.log('===UnSubscribeCallBack===')
                                    })
                                    if (data.code == 1) {
                                        expect(data.code).assertEqual(1);
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                    else {
                                        expect().assertFail();
                                        setTimeout(() => {
                                            done();
                                        }, 2500)
                                    }
                                })
                            })
                        })
                })
        })

        /**
        * @tc.number: ACTS_AddAbilityMonitor_Promise_0700
        * @tc.name: Verify that the addAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate with many
        *           a time (promise).
        */
        it('ACTS_AddAbilityMonitor_Promise_0700', 0, async function (done) {
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            function onAbilityCreate() {
                console.debug("====>1400--onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_AddAbilityMonitor_1400", AddAbilityData, publishCallback);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_AddAbilityMonitor_1400"]
            };
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("1400getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(
                {
                    abilityName: 'MainAbility2',
                    onAbilityCreate: onAbilityCreate
                }).then(async () => {
                    data.addAbilityMonitor(
                        {
                            abilityName: 'MainAbility2',
                            onAbilityCreate: onAbilityCreate
                        }).then(async () => {
                            await globalThis.abilitydelegator.startAbility(
                                {
                                    bundleName: 'com.example.abilitymonitortest',
                                    abilityName: 'MainAbility2'
                                }).then(async () => {
                                    console.debug("====>1400startAbility success====>");
                                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                                        console.info("===ACTS_AddAbilityMonitor_1400===createSubscriber"
                                            + JSON.stringify(data));
                                        var AddAbility = data
                                        await Subscriber.subscribe(AddAbility, (err, data) => {
                                            console.log('===ACTS_AddAbilityMonitor_1400CallBack==='
                                                + err.code + JSON.stringify(data))
                                            Subscriber.unsubscribe(AddAbility, (err, data) => {
                                                console.log('===UnSubscribeCallBack===' + err.code)
                                            })
                                            if (data.code == 1) {
                                                expect(data.code).assertEqual(1);
                                                setTimeout(() => {
                                                    done();
                                                }, 2500)
                                            }
                                            else {
                                                expect().assertFail();
                                                setTimeout(() => {
                                                    done();
                                                }, 2500)
                                            }
                                        })
                                    })
                                })
                        })
                })
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0100
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityCreate (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0100', 0, async function (done) {
            function onAbilityCreate() {
                CallbackFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0100-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0100-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor, (err) => {
                    console.debug("====>0100removeAbilityMonitor success====>" + err.code);
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>remove0100 startAbility end====>");
                            expect(CallbackFlag).assertEqual(0)
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0200
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityForeground (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0200', 0, async function (done) {
            function onAbilityForeground() {
                CallbackFlag = -1
                console.debug("====>onAbilityForeground ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityForeground: onAbilityForeground
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0200-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0200-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor, (err) => {
                    console.debug("====>0200removeAbilityMonitor success====>" + err.code);
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>remove0200 startAbility end====>");
                            expect(CallbackFlag).assertEqual(0)
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0300
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityBackground (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0300', 0, async function (done) {
            function onAbilityBackground() {
                CallbackFlag = -1
                console.debug("====>onAbilityBackground ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityBackground: onAbilityBackground
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0300-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0300-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor, (err) => {
                    console.debug("====>0300removeAbilityMonitor success====>" + err.code);
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(CallbackFlag).assertEqual(0)
                            console.debug("====>remove0300 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0400
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityDestroy (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0400', 0, async function (done) {
            function onAbilityDestroy() {
                CallbackFlag = -1
                console.debug("====>onAbilityDestroy ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityDestroy: onAbilityDestroy
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0400-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0400-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor, (err) => {
                    console.debug("====>0400removeAbilityMonitor success====>" + err.code);
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(CallbackFlag).assertEqual(0)
                            console.debug("====>remove0400 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0500
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onWindowStageCreate (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0500', 0, async function (done) {
            function onWindowStageCreate() {
                CallbackFlag = -1
                console.debug("====>onWindowStageCreate ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onWindowStageCreate: onWindowStageCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0500-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0500-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor, (err) => {
                    console.debug("====>0500removeAbilityMonitor success====>" + err.code);
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(CallbackFlag).assertEqual(0)
                            console.debug("====>remove0500 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0600
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onWindowStageDestroy (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0600', 0, async function (done) {
            function onWindowStageDestroy() {
                CallbackFlag = -1
                console.debug("====>onWindowStageDestroy ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onWindowStageDestroy: onWindowStageDestroy
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0600-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0600-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor, (err) => {
                    console.debug("====>0600removeAbilityMonitor success====>" + err.code);
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(CallbackFlag).assertEqual(0)
                            console.debug("====>remove0600 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0700
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityCreate (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0700', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0700-getAbilityDelegator data is" + JSON.stringify(data))
            await data.removeAbilityMonitor({
                abilityName: 'WrongName',
                onAbilityCreate: onAbilityCreate
            }, (err) => {
                console.debug("====>0700removeAbilityMonitor success====>" + err.code);
                expect(err.code).assertEqual(0)
                done();
            })
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0800
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityCreate (Callback).
        */
        it('ACTS_RemoveAbilityMonitor_Callback_0800', 0, async function (done) {
            function onAbilityCreate() {
                CallbackFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0800-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0800-waitAbilityMonitor success====>" + err.code);
            }))
            data.removeAbilityMonitor(monitor, (err) => {
                console.debug("====>0800removeAbilityMonitor success====>" + err.code);
                globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility2'
                    }).then(async () => {
                        console.debug("====>remove0800 startAbility end====>");
                        expect(CallbackFlag).assertEqual(0)
                        setTimeout(() => {
                            done();
                        }, 2500)
                    })
            })
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0100
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityCreate (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0100', 0, async function (done) {
            function onAbilityCreate() {
                PromiseFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0100-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0100-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor).then(() => {
                    console.debug("====>0100removeAbilityMonitor success====>");
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>remove0100 startAbility end====>");
                            expect(PromiseFlag).assertEqual(0)
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0200
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityForeground (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0200', 0, async function (done) {
            function onAbilityForeground() {
                PromiseFlag = -1
                console.debug("====>onAbilityForeground ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityForeground: onAbilityForeground
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0200-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0200-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor).then(() => {
                    console.debug("====>0200removeAbilityMonitor success====>");
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            console.debug("====>remove0200 startAbility end====>");
                            expect(PromiseFlag).assertEqual(0)
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0300
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityBackground (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0300', 0, async function (done) {
            function onAbilityBackground() {
                PromiseFlag = -1
                console.debug("====>onAbilityBackground ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityBackground: onAbilityBackground
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0300-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0300-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor).then(() => {
                    console.debug("====>0300removeAbilityMonitor success====>");
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(PromiseFlag).assertEqual(0)
                            console.debug("====>remove0300 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0400
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityDestroy (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0400', 0, async function (done) {
            function onAbilityDestroy() {
                PromiseFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityDestroy: onAbilityDestroy
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0400-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0400-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor).then(() => {
                    console.debug("====>0400removeAbilityMonitor success====>");
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(PromiseFlag).assertEqual(0)
                            console.debug("====>remove0400 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0500
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onWindowStageCreate (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0500', 0, async function (done) {
            function onWindowStageCreate() {
                PromiseFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onWindowStageCreate: onWindowStageCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0500-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0500-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor).then(() => {
                    console.debug("====>0500removeAbilityMonitor success====>");
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(PromiseFlag).assertEqual(0)
                            console.debug("====>remove0500 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0600
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onWindowStageDestroy (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0600', 0, async function (done) {
            function onWindowStageDestroy() {
                PromiseFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onWindowStageDestroy: onWindowStageDestroy
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0600-getAbilityDelegator data is" + JSON.stringify(data))
            data.addAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0600-addAbilityMonitor success====>" + err.code);
                await data.removeAbilityMonitor(monitor).then(() => {
                    console.debug("====>0600removeAbilityMonitor success====>");
                    globalThis.abilitydelegator.startAbility(
                        {
                            bundleName: 'com.example.abilitymonitortest',
                            abilityName: 'MainAbility2'
                        }).then(async () => {
                            expect(PromiseFlag).assertEqual(0)
                            console.debug("====>remove0600 startAbility end====>");
                            setTimeout(() => {
                                done();
                            }, 2500)
                        })
                })
            }))
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0700
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityCreate (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0700', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0700-getAbilityDelegator data is" + JSON.stringify(data))
            data.removeAbilityMonitor({
                abilityName: 'WrongName',
                onAbilityCreate: onAbilityCreate
            }).then(() => {
                console.debug("====>0700 removeAbilityMonitorPromise====>")
                setTimeout(() => {
                    done();
                }, 2500)
            }).catch((err) => {
                console.debug("====>0700removeAbilityMonitorPromise success====>" + err);
                expect().assertFail()
                setTimeout(() => {
                    done();
                }, 1500)
            })
        })

        /**
        * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0800
        * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add monitor and use removeAbilityMonitor 
        * to remove monitor then trigger
        *           onAbilityCreate (promise).
        */
        it('ACTS_RemoveAbilityMonitor_Promise_0800', 0, async function (done) {
            function onAbilityCreate() {
                PromiseFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("remove0800-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, (async (err) => {
                console.debug("====>remove0800-waitAbilityMonitor success====>" + err.code);
            }))
            await data.removeAbilityMonitor(monitor).then(() => {
                globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility2'
                    }).then(async () => {
                        console.debug("====>remove0800 startAbility end====>");
                        expect(PromiseFlag).assertEqual(0)
                        setTimeout(() => {
                            done();
                        }, 2500)
                    })
            })
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Callback_0100
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate (Callback).
        */
        it('ACTS_WaitAbilityMonitor_Callback_0100', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Callback_0100", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Callback_0100"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0100-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, async (err, data) => {
                console.log('===>0100err.code is===>' + JSON.stringify(err.code))
                expect(err.code).assertEqual(0)
                console.debug("====>ACTS_WaitAbilityMonitor_Callback_0100 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Callback_0100===createSubscriber" + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Callback_0100===' + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBack===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

        /**
            * @tc.number: ACTS_WaitAbilityMonitor_Callback_0200
            * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
            * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
            * to trigger onAbilityCreate exceed
            *           5s(Callback).
            */
        it('ACTS_WaitAbilityMonitor_Callback_0200', 0, async function (done) {
            function onAbilityCreate() {
                CallbackFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0200-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, (err, waitability) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Callback_0200 success====>");
                expect(err.code).assertEqual(-1)
                console.log('===>0200err.code is===>' + JSON.stringify(err.code))
            })
            setTimeout(() => {
                globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility2'
                    }).then(() => {
                        expect(CallbackFlag).assertEqual(0)
                        console.log('===>0200CallbackFlag is===>' + JSON.stringify(CallbackFlag))
                        console.debug("====>remove0200 startAbility end====>");
                        setTimeout(() => {
                            done();
                        }, 2500)
                    })
            }, 5500)
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Callback_0300
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate in
        *           1s(Callback).
        */
        it('ACTS_WaitAbilityMonitor_Callback_0300', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Callback_0300", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Callback_0300"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0300-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, 1000, async (err, data) => {
                console.log('===>0300err.code is===>' + JSON.stringify(err.code))
                expect(err.code).assertEqual(0)
                console.debug("====>ACTS_WaitAbilityMonitor_Callback_0300 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Callback_0300===createSubscriber"
                            + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Callback_0300==='
                                + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBack===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Callback_0400
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate exceed
        *           1s (Callback).
        */
        it('ACTS_WaitAbilityMonitor_Callback_0400', 0, async function (done) {
            function onAbilityCreate() {
                CallbackFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var CallbackFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0400-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, 1000, (err, waitability) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Callback_0400 success====>");
                expect(err.code).assertEqual(-1)
                console.log('===>0400err.code is===>' + JSON.stringify(err.code))
            })
            setTimeout(() => {
                globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility2'
                    }).then(() => {
                        expect(CallbackFlag).assertEqual(0)
                        console.log('===>0400CallbackFlag is===>' + JSON.stringify(CallbackFlag))
                        console.debug("====>remove0400 startAbility end====>");
                        setTimeout(() => {
                            done();
                        }, 2500)
                    })
            }, 1500)
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Callback_0500
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate in
        *           5s (Callback).
        */
        it('ACTS_WaitAbilityMonitor_Callback_0500', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Callback_0500", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Callback_0500"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0500-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, 0, async (err, data) => {
                console.log('===>0500err.code is===>' + JSON.stringify(err.code))
                expect(err.code).assertEqual(0)
                console.debug("====>ACTS_WaitAbilityMonitor_Callback_0500 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Callback_0500===createSubscriber"
                            + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Callback_0500===' + err.code
                                + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBackU===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Callback_0600
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate in
        *           5s (Callback).
        */
        it('ACTS_WaitAbilityMonitor_Callback_0600', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Callback_0600", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Callback_0600"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0600-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, -1, async (err, data) => {
                console.log('===>0600err.code is===>' + JSON.stringify(err.code))
                expect(err.code).assertEqual(0)
                console.debug("====>ACTS_WaitAbilityMonitor_Callback_0600 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Callback_0600===createSubscriber"
                            + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Callback_0600==='
                                + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBackU===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Promise_0100
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate (promise).
        */
        it('ACTS_WaitAbilityMonitor_Promise_0100', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Promise_0100", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Promise_0100"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0500-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor).then(async (data) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Promise_0100 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Promise_0100===createSubscriber"
                            + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Promise_0100==='
                                + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBack===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

        /**
      * @tc.number: ACTS_WaitAbilityMonitor_Promise_0200
      * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
      * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
      * to trigger onAbilityCreate exceed
      *           5s (promise).
      */
        it('ACTS_WaitAbilityMonitor_Promise_0200', 0, async function (done) {
            function onAbilityCreate() {
                PromiseFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0200-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor).then((data) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Callback_0200 success====>");
            })
            setTimeout(() => {
                globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility2'
                    }).then(() => {
                        expect(PromiseFlag).assertEqual(0)
                        console.log('===>0200PromiseFlag is===>' + JSON.stringify(PromiseFlag))
                        setTimeout(() => {
                            done();
                        }, 2500)
                    })
            }, 5500)
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Promise_0300
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate in
        *           1s (promise).
        */
        it('ACTS_WaitAbilityMonitor_Promise_0300', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Promise_0300", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Promise_0300"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0300-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, 1000).then(async (data) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Promise_0300 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Promise_0300===createSubscriber"
                            + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Promise_0300==='
                                + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBackM===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Promise_0400
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate exceed
        *           1s (promise).
        */
        it('ACTS_WaitAbilityMonitor_Promise_0400', 0, async function (done) {
            function onAbilityCreate() {
                PromiseFlag = -1
                console.debug("====>onAbilityCreate ====>");
            }
            var PromiseFlag = 0
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0400-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, 1000).then((data) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Promise_0400 success====>");
            })
            setTimeout(() => {
                globalThis.abilitydelegator.startAbility(
                    {
                        bundleName: 'com.example.abilitymonitortest',
                        abilityName: 'MainAbility2'
                    }).then(() => {
                        expect(PromiseFlag).assertEqual(0)
                        console.log('===>0400PromiseFlag is===>' + JSON.stringify(PromiseFlag))
                        console.debug("====>remove0400 startAbility end====>");
                        setTimeout(() => {
                            done();
                        }, 2500)
                    })
            }, 1500)
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Promise_0500
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate in
        *           5s (promise).
        */
        it('ACTS_WaitAbilityMonitor_Promise_0500', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Promise_0500", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Promise_0500"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0500-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, 100).then(async (data) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Promise_0500 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Promise_0500===createSubscriber"
                            + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Promise_0500==='
                                + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBack===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

        /**
        * @tc.number: ACTS_WaitAbilityMonitor_Promise_0600
        * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
        * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility 
        * to trigger onAbilityCreate in
        *           5s (promise).
        */
        it('ACTS_WaitAbilityMonitor_Promise_0600', 0, async function (done) {
            function onAbilityCreate() {
                console.debug("====>onAbilityCreate====>");
                AddAbilityData = {
                    code: 1
                }
                Subscriber.publish("ACTS_WaitAbilityMonitor_Promise_0600", AddAbilityData, publishCallback);
            }
            function publishCallback(err) {
                console.info("===>publishCallback" + err.code);
                expect(err.code).assertEqual(0);
            }
            var AddAbilityData
            var commonEventSubscribeInfo = {
                events: ["ACTS_WaitAbilityMonitor_Promise_0600"]
            };
            var monitor = {
                abilityName: 'MainAbility2',
                onAbilityCreate: onAbilityCreate
            }
            var data = abilityDelegatorRegistry.getAbilityDelegator()
            console.log("wait0600-getAbilityDelegator data is" + JSON.stringify(data))
            data.waitAbilityMonitor(monitor, -1).then(async (data) => {
                console.debug("====>ACTS_WaitAbilityMonitor_Promise_0600 success====>");
            })
            await globalThis.abilitydelegator.startAbility(
                {
                    bundleName: 'com.example.abilitymonitortest',
                    abilityName: 'MainAbility2'
                }).then(async () => {
                    await Subscriber.createSubscriber(commonEventSubscribeInfo, async (err, data) => {
                        console.info("===ACTS_WaitAbilityMonitor_Promise_0600===createSubscriber"
                            + JSON.stringify(data));
                        var AddAbility = data
                        await Subscriber.subscribe(AddAbility, (err, data) => {
                            console.log('===ACTS_WaitAbilityMonitor_Promise_0600==='
                                + err.code + JSON.stringify(data))
                            Subscriber.unsubscribe(AddAbility, () => {
                                console.log('===UnSubscribeCallBack===')
                            })
                            if (data.code == 1) {
                                expect(data.code).assertEqual(1);
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                            else {
                                expect().assertFail();
                                setTimeout(() => {
                                    done();
                                }, 2500)
                            }
                        })
                    })
                })
        })

    })
}


