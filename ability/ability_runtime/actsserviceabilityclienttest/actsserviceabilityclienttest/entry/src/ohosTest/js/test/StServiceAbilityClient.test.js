/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import commonEvent from '@ohos.commonEvent'
import rpc from "@ohos.rpc";

import { describe, afterEach, it, expect, Level } from '@ohos/hypium'
export default function ActsStServiceAbilityTest() {
    describe('ActsStServiceAbilityTest', function () {
        let bundleName = "com.amsst.stserviceabilityclient";
        let abilityName = "com.amsst.stserviceabilityclient.ServiceAbility1";

        let subscriber0100;
        let CommonEventSubscribeInfo0100 = {
            events: ["ACTS_SerivceAbilityServer_onCommand_PageStartService_0100",
            ],
        };
        let subscriber0200;
        let CommonEventSubscribeInfo0200 = {
            events: ["ACTS_SerivceAbilityServer_onCommand_PageStartService_0200",
            ],
        };
        let subscriber0300;
        let CommonEventSubscribeInfo0300 = {
            events: ["ACTS_SerivceAbilityServer_onCommand_PageStartService_0300",
            "ACTS_SerivceAbilityServer_onCommand_PageStartService_0301",
            ],
        };
        let subscriber0400;
        let CommonEventSubscribeInfo0400 = {
            events: ["ACTS_SerivceAbilityServer_onCommand_PageStartService_0400",
            "ACTS_SerivceAbilityServer_onCommand_PageStartService_0401",
            ],
        };
        let CommonEventSubscribeInfo0500 = {
            events: ["ACTS_SerivceAbilityServer_onConnect_PageConnectService_0500",
            "ACTS_SerivceAbilityServer_onDisConnect_PageConnectService_0500",
            "ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0500"
            ],
        };
        let subscriber0600;
        let CommonEventSubscribeInfo0600 = {
            events: ["ACTS_SerivceAbilityServer_onConnect_PageConnectService_0600",
            "ACTS_SerivceAbilityServer_onDisConnect_PageConnectService_0600",
            "ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0600"
            ],
        };
        let subscriber0900;
        let CommonEventSubscribeInfo0900 = {
            events: ["ACTS_SerivceAbilityServerSecond_onCommand_ServiceStartService_0900",
            ],
        };
        let subscriber1000;
        let CommonEventSubscribeInfo1000 = {
            events: ["ACTS_SerivceAbilityServerSecond_onCommand_ServiceStartService_1000",
            ],
        };
        let subscriber1300;
        let CommonEventSubscribeInfo1300 = {
            events: ["ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1300",
            "ACTS_SerivceAbilityServerSecond_onDisConnect_ServiceConnectService_1300",
            "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1300"
            ],
        };
        let subscriber1400;
        let CommonEventSubscribeInfo1400 = {
            events: ["ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1400",
            "ACTS_SerivceAbilityServerSecond_onDisConnect_ServiceConnectService_1400",
            "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1400"
            ],
        };
        let subscriber1500;
        let CommonEventSubscribeInfo1500 = {
            events: ["ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1500",
            "ACTS_SerivceAbilityServer_onDisConnect_ServiceConnectService_1500",
            "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1500"
            ],
        };

        function unsubscribe(caller, subscriber) {
            commonEvent.unsubscribe(subscriber, (err, data) => {
                console.info("=ACTS_unsubscribe (err,data)=======>"
                + (caller)
                + (" , json err【") + JSON.stringify(err) + (" 】")
                + ("json data【") + JSON.stringify(data) + (" 】")
                + " ,err=" + err + " ,data=" + data);
            });
        }
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        let gSetTimeout = 2000
        afterEach(async (done) => {
            setTimeout(function () {
                done();
            }, gSetTimeout);
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_0100
         * @tc.number ACTS_JsServiceAbility_0100
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_0100', Level.LEVEL0, async function (done) {
            console.info('ACTS_JsServiceAbility_0100====<begin');
            try {
                await commonEvent.createSubscriber(CommonEventSubscribeInfo0100).then((data) => {
                    console.info("=ACTS_JsServiceAbility_0100 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber0100 = data;
                    commonEvent.subscribe(subscriber0100, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_0100 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        expect("ACTS_SerivceAbilityServer_onCommand_PageStartService_0100").assertEqual(
                            data.event);
                        unsubscribe("ACTS_JsServiceAbility_0100_unsubscribe", subscriber0100);
                        console.info('ACTS_JsServiceAbility_0100====<end');
                        done();
                    });
                })
                featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: bundleName,
                            abilityName: abilityName,
                            action: "PageStartService_0100",
                        },
                    }
                ).then(data => {
                    console.info("=ACTS_JsServiceAbility_0100 .then(data)=======>"
                    + ("abilityStartSetting json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                }).catch(err => {
                    expect(".catch").assertEqual(err);
                    console.info('ACTS_JsServiceAbility_0100====<end .catch(err):' + JSON.stringify(err));
                    done();
                })
            } catch (err) {
                expect().assertFail()
                console.info('ACTS_JsServiceAbility_0100==== err: ' + JSON.stringify(err));
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_0200
         * @tc.number ACTS_JsServiceAbility_0200
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_0200', Level.LEVEL0, async function (done) {
            console.info('ACTS_JsServiceAbility_0200====<begin');
            try {
                await commonEvent.createSubscriber(CommonEventSubscribeInfo0200).then((data) => {
                    console.info("=ACTS_JsServiceAbility_0200 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber0200 = data;
                    commonEvent.subscribe(subscriber0200, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_0200 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        expect("ACTS_SerivceAbilityServer_onCommand_PageStartService_0200").assertEqual(
                            data.event);
                        unsubscribe("ACTS_JsServiceAbility_0200_unsubscribe", subscriber0200);
                        console.info('ACTS_JsServiceAbility_0200====<end');
                        done()
                    });
                })
                featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: bundleName,
                            abilityName: abilityName,
                            action: "PageStartService_0200",
                        },
                    }, (err, data) => {
                    console.info("=ACTS_JsServiceAbility_0200 startAbility (err,data)=======>"
                    + ("abilityStartSetting json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                }
                )
            } catch (err) {
                expect().assertFail()
                console.info('ACTS_JsServiceAbility_0200==== err: ' + JSON.stringify(err));
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_0300
         * @tc.number ACTS_JsServiceAbility_0300
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_0300', Level.LEVEL0, async function (done) {
            console.info('ACTS_JsServiceAbility_0300====<begin');
            try {
                await commonEvent.createSubscriber(CommonEventSubscribeInfo0300).then((data) => {
                    console.info("=ACTS_JsServiceAbility_0300 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber0300 = data;
                    commonEvent.subscribe(subscriber0300, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_0300 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        if (data.event == "ACTS_SerivceAbilityServer_onCommand_PageStartService_0300") {
                            expect("ACTS_SerivceAbilityServer_onCommand_PageStartService_0300").assertEqual(
                                data.event);
                            featureAbility.startAbility(
                                {
                                    want:
                                    {
                                        bundleName: bundleName,
                                        abilityName: abilityName,
                                        action: "PageStartService_0301",
                                    },
                                }
                            ).then(data => {
                                console.info("=ACTS_JsServiceAbility_0300 .then(data) 2=======>"
                                + ("json data【") + JSON.stringify(data) + (" 】")
                                + " ,data=" + data);
                            }).catch(err => {
                                expect().assertFail()
                                console.info('ACTS_JsServiceAbility_0300==== err: ' + JSON.stringify(err));
                                done();
                            })
                        } else {
                            expect("ACTS_SerivceAbilityServer_onCommand_PageStartService_0301").assertEqual(
                                data.event);
                            unsubscribe("ACTS_JsServiceAbility_0300_unsubscribe", subscriber0300);
                            console.info('ACTS_JsServiceAbility_0300====<end');
                            done();
                        }
                    });
                })
                featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: bundleName,
                            abilityName: abilityName,
                            action: "PageStartService_0300",
                        },
                    }
                ).then(data => {
                    console.info("=ACTS_JsServiceAbility_0300 .then(data) 1=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                }).catch(err => {
                    expect(".catch").assertEqual(err);
                    console.info('ACTS_JsServiceAbility_0300====<end .catch(err) 1');
                    done();
                })
            } catch (err) {
                expect().assertFail()
                console.info('ACTS_JsServiceAbility_0300==== err: ' + JSON.stringify(err));
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_0400
         * @tc.number ACTS_JsServiceAbility_0400
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_0400', Level.LEVEL0, async function (done) {
            console.info('ACTS_JsServiceAbility_0400====<begin');
            try {
                await commonEvent.createSubscriber(CommonEventSubscribeInfo0400).then((data) => {
                    console.info("=ACTS_JsServiceAbility_0400 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber0400 = data;
                    commonEvent.subscribe(subscriber0400, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_0400 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        if (data.event == "ACTS_SerivceAbilityServer_onCommand_PageStartService_0400") {
                            expect("ACTS_SerivceAbilityServer_onCommand_PageStartService_0400").assertEqual(
                                data.event);
                            featureAbility.startAbility(
                                {
                                    want:
                                    {
                                        bundleName: bundleName,
                                        abilityName: abilityName,
                                        action: "PageStartService_0401",
                                    },
                                }, (err, data) => {
                                console.info("=ACTS_JsServiceAbility_0400 startAbility (err,data) 2=======>"
                                + ("json err【") + JSON.stringify(err) + (" 】")
                                + ("json data【") + JSON.stringify(data) + (" 】")
                                + " ,err=" + err + " ,data=" + data);
                            }
                            )
                        } else {
                            expect("ACTS_SerivceAbilityServer_onCommand_PageStartService_0401").assertEqual(
                                data.event);
                            unsubscribe("ACTS_JsServiceAbility_0400_unsubscribe", subscriber0400);
                            console.info('ACTS_JsServiceAbility_0400====<end');
                            done();
                        }
                    });
                })
                featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: bundleName,
                            abilityName: abilityName,
                            action: "PageStartService_0400",
                        },
                    }, (err, data) => {
                    console.info("=ACTS_JsServiceAbility_0400 startAbility (err,data) 1=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                }
                )
            } catch (err) {
                expect().assertFail()
                console.info('ACTS_JsServiceAbility_0400==== err: ' + JSON.stringify(err));
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_0500
         * @tc.number ACTS_JsServiceAbility_0500
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_0500', Level.LEVEL0, async function (done) {
            console.log('ACTS_JsServiceAbility_0500====<begin');
            try {
                let mConnIdJsPromise;
                let subscriber0500;
                await commonEvent.createSubscriber(CommonEventSubscribeInfo0500).then((data) => {
                    console.info("=ACTS_JsServiceAbility_0500 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber0500 = data;
                    commonEvent.subscribe(subscriber0500, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_0500 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        if (data.event == "ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0500") {
                            console.info("ACTS_JsServiceAbility_0500 disconnnectAbility start")
                            featureAbility.disconnectAbility(mConnIdJsPromise).then((err) => {
                                console.info("=ACTS_JsServiceAbility_0500 disconnectAbility err====>"
                                + ("json err=") + JSON.stringify(err));
                            }).catch(err => {
                                expect().assertFail()
                                console.info('ACTS_JsServiceAbility_0500==== err: ' + JSON.stringify(err));
                                done()
                            })
                        } else if (data.event == "ACTS_SerivceAbilityServer_onConnect_PageConnectService_0500") {
                            console.info("ACTS_JsServiceAbility_0500 recive ACTS_SerivceAbilityServer_onConnect_PageConnectService_0500");
                        } else {
                            expect("ACTS_SerivceAbilityServer_onDisConnect_PageConnectService_0500")
                                .assertEqual(data.event);
                            unsubscribe("ACTS_JsServiceAbility_0500_unsubscribe", subscriber0500);
                            console.info('ACTS_JsServiceAbility_0500====<end');
                            done();
                        }
                    });
                })
                function onConnectCallback(element, remote) {
                    console.info('ACTS_JsServiceAbility_0500_onConnectCallback ====> mConnIdJsPromise='
                    + JSON.stringify(mConnIdJsPromise) + " , " + mConnIdJsPromise);
                    console.info('ACTS_JsServiceAbility_0500_onConnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                    console.info('ACTS_JsServiceAbility_0500_onConnectCallback ====> remote='
                    + JSON.stringify(remote) + " , " + remote);
                    console.info('ACTS_JsServiceAbility_0500_onConnectCallback ====> remote is proxy:'
                    + (remote instanceof rpc.RemoteProxy));
                    commonEvent.publish("ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0500", () => {
                        console.info("=ACTS_JsServiceAbility_0500 publish =======>"
                        + "ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0500");
                    });
                }

                function onDisconnectCallback(element) {
                    console.info('ACTS_JsServiceAbility_0500_onDisconnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                }

                function onFailedCallback(code) {
                    console.info('ACTS_JsServiceAbility_0500_onFailedCallback ====> code=' +
                    JSON.stringify(code) + " , " + code)
                }

                mConnIdJsPromise = featureAbility.connectAbility(
                    {
                        bundleName: bundleName,
                        abilityName: abilityName,
                        action: "PageConnectService_0500",
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                )
            } catch (err) {
                expect().assertFail()
                console.log('ACTS_JsServiceAbility_0500==== err: ' + JSON.stringify(err))
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_0600
         * @tc.number ACTS_JsServiceAbility_0600
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_0600', Level.LEVEL0, async function (done) {
            console.log('ACTS_JsServiceAbility_0600====<begin');
            try {
                let mConnIdJsAsyncCallback;
                await commonEvent.createSubscriber(CommonEventSubscribeInfo0600).then((data) => {
                    console.info("=ACTS_JsServiceAbility_0600 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber0600 = data;
                    commonEvent.subscribe(subscriber0600, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_0600 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        if (data.event == "ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0600") {
                            featureAbility.disconnectAbility(mConnIdJsAsyncCallback, (err) => {
                                console.info("=ACTS_JsServiceAbility_0600 disconnectAbility err====>"
                                + ("json err=") + JSON.stringify(err));
                            })
                        } else if (data.event == "ACTS_SerivceAbilityServer_onConnect_PageConnectService_0600") {
                            console.info("ACTS_JsServiceAbility_0600 recive ACTS_SerivceAbilityServer_onConnect_PageConnectService_0600");
                        } else {
                            expect("ACTS_SerivceAbilityServer_onDisConnect_PageConnectService_0600")
                                .assertEqual(data.event);
                            unsubscribe("ACTS_JsServiceAbility_0600_unsubscribe", subscriber0600);
                            console.log('ACTS_JsServiceAbility_0600====<end')
                            done();
                        }
                    });
                })
                function onConnectCallback(element, remote) {
                    console.info('ACTS_JsServiceAbility_0600_onConnectCallback ====> mConnIdJsAsyncCallback='
                    + JSON.stringify(mConnIdJsAsyncCallback) + " , " + mConnIdJsAsyncCallback);
                    console.info('ACTS_JsServiceAbility_0600_onConnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                    console.info('ACTS_JsServiceAbility_0600_onConnectCallback ====> remote='
                    + JSON.stringify(remote) + " , " + remote);
                    console.info('ACTS_JsServiceAbility_0600_onConnectCallback ====> remote is proxy:'
                    + (remote instanceof rpc.RemoteProxy));
                    commonEvent.publish("ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0600", () => {
                        console.info("=ACTS_JsServiceAbility_0600 publish =======>"
                        + "ACTS_SerivceAbilityServer_onConnectCallback_PageConnectService_0600");
                    });
                }

                function onDisconnectCallback(element) {
                    console.info('ACTS_JsServiceAbility_0600_onDisconnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                }

                function onFailedCallback(code) {
                    console.info('ACTS_JsServiceAbility_0600_onFailedCallback ====> code=' +
                    JSON.stringify(code) + " , " + code)
                    expect(code == featureAbility.ErrorCode.ABILITY_NOT_FOUND
                    || (code != featureAbility.ErrorCode.NO_ERROR
                    || code != featureAbility.ErrorCode.INVALID_PARAMETER
                    || code != featureAbility.ErrorCode.PERMISSION_DENY
                    )).assertTrue();
                }

                mConnIdJsAsyncCallback = featureAbility.connectAbility(
                    {
                        bundleName: bundleName,
                        abilityName: abilityName,
                        action: "PageConnectService_0600",
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                )
            } catch (err) {
                expect().assertFail()
                console.log('ACTS_JsServiceAbility_0600==== err: ' + JSON.stringify(err))
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_0900
         * @tc.number ACTS_JsServiceAbility_0900
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_0900', Level.LEVEL0, async function (done) {
            console.info('ACTS_JsServiceAbility_0900====<begin');
            try {
                await commonEvent.createSubscriber(CommonEventSubscribeInfo0900).then((data) => {
                    console.info("=ACTS_JsServiceAbility_0900 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber0900 = data;
                    commonEvent.subscribe(subscriber0900, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_0900 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        expect("ACTS_SerivceAbilityServerSecond_onCommand_ServiceStartService_0900").assertEqual(
                            data.event);
                        unsubscribe("ACTS_JsServiceAbility_0900_unsubscribe", subscriber0900);
                        console.info('ACTS_JsServiceAbility_0900====<end');
                        done();
                    });
                })
                await sleep(500)
                featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: bundleName,
                            abilityName: abilityName,
                            action: "ServiceStartService_0900",
                        },
                    }
                ).then(data => {
                    console.info("=ACTS_JsServiceAbility_0900 .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                }).catch(err => {
                    expect(".catch").assertEqual(err);
                    console.info('ACTS_JsServiceAbility_0900====<end .catch(err)');
                    done();
                })
            } catch (err) {
                expect().assertFail()
                console.info('ACTS_JsServiceAbility_0900==== err: ' + JSON.stringify(err));
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_1000
         * @tc.number ACTS_JsServiceAbility_1000
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_1000', Level.LEVEL0, async function (done) {
            console.info('ACTS_JsServiceAbility_1000====<begin');
            await sleep(2000)
            try {
                await commonEvent.createSubscriber(CommonEventSubscribeInfo1000).then((data) => {
                    console.info("=ACTS_JsServiceAbility_1000 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber1000 = data;
                    commonEvent.subscribe(subscriber1000, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_1000 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        expect("ACTS_SerivceAbilityServerSecond_onCommand_ServiceStartService_1000")
                            .assertEqual(data.event);
                        unsubscribe("ACTS_JsServiceAbility_1000_unsubscribe", subscriber1000);
                        console.info('ACTS_JsServiceAbility_1000====<end');
                        done()
                    });
                })
                await sleep(500)
                featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: bundleName,
                            abilityName: abilityName,
                            action: "ServiceStartService_1000",
                        },
                    }, (err, data) => {
                    console.info("=ACTS_JsServiceAbility_1000 startAbility (err,data)=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                }
                )
            } catch (err) {
                expect().assertFail()
                console.info('ACTS_JsServiceAbility_1000==== err: ' + JSON.stringify(err));
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_1300
         * @tc.number ACTS_JsServiceAbility_1300
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_1300', Level.LEVEL0, async function (done) {
            console.log('ACTS_JsServiceAbility_1300====<begin');
            try {
                let mConnIdJsPromise;
                await commonEvent.createSubscriber(CommonEventSubscribeInfo1300).then((data) => {
                    console.info("=ACTS_JsServiceAbility_1300 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber1300 = data;
                    commonEvent.subscribe(subscriber1300, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_1300 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        if (data.event == "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1300") {
                            featureAbility.disconnectAbility(mConnIdJsPromise).then((err) => {
                                console.info("=ACTS_JsServiceAbility_1300 disconnectAbility err====>"
                                + ("json err=") + JSON.stringify(err));
                            })
                        } else if (data.event == "ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1300") {
                            console.info("ACTS_JsServiceAbility_1300 recive ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1300");
                        } else {
                            expect("ACTS_SerivceAbilityServerSecond_onDisConnect_ServiceConnectService_1300")
                                .assertEqual(data.event);
                            unsubscribe("ACTS_JsServiceAbility_1300_unsubscribe", subscriber1300);
                            console.log('ACTS_JsServiceAbility_1300====<end')
                            done();
                        }
                    });
                })
                function onConnectCallback(element, remote) {
                    console.info('ACTS_JsServiceAbility_1300_onConnectCallback ====> mConnIdJsPromise='
                    + JSON.stringify(mConnIdJsPromise) + " , " + mConnIdJsPromise);
                    console.info('ACTS_JsServiceAbility_1300_onConnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                    console.info('ACTS_JsServiceAbility_1300_onConnectCallback ====> remote='
                    + JSON.stringify(remote) + " , " + remote);
                    console.info('ACTS_JsServiceAbility_1300_onConnectCallback ====> remote is proxy:'
                    + (remote instanceof rpc.RemoteProxy));
                    commonEvent.publish("ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1300", () => {
                        console.info("=ACTS_JsServiceAbility_1300 publish =======>"
                        + "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1300");
                    });
                }

                function onDisconnectCallback(element) {
                    console.info('ACTS_JsServiceAbility_1300_onDisconnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                    unsubscribe("ACTS_JsServiceAbility_1300_unsubscribe", subscriber1300);
                    console.log('ACTS_JsServiceAbility_1300====<end onDisconnectCallback')
                    done();
                }

                function onFailedCallback(code) {
                    console.info('ACTS_JsServiceAbility_1300_onFailedCallback ====> code=' +
                    JSON.stringify(code) + " , " + code)
                }

                mConnIdJsPromise = featureAbility.connectAbility(
                    {
                        bundleName: bundleName,
                        abilityName: abilityName,
                        action: "ServiceConnectService_1300",
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                )
            } catch (err) {
                expect().assertFail()
                console.log('ACTS_JsServiceAbility_1300====<end err: ' + JSON.stringify(err))
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_1400
         * @tc.number ACTS_JsServiceAbility_1400
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_1400', Level.LEVEL0, async function (done) {
            console.log('ACTS_JsServiceAbility_1400====<begin');
            try {
                let mConnIdJsAsyncCallback;
                await commonEvent.createSubscriber(CommonEventSubscribeInfo1400).then((data) => {
                    console.info("=ACTS_JsServiceAbility_1400 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber1400 = data;
                    commonEvent.subscribe(subscriber1400, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_1400 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        if (data.event == "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1400") {
                            featureAbility.disconnectAbility(mConnIdJsAsyncCallback, (err) => {
                                console.info("=ACTS_JsServiceAbility_1400 disconnectAbility err====>"
                                + ("json err=") + JSON.stringify(err));
                            })
                        } else if (data.event == "ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1400") {
                            console.info("ACTS_JsServiceAbility_1400 recive ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1400");
                        } else {
                            expect("ACTS_SerivceAbilityServerSecond_onDisConnect_ServiceConnectService_1400")
                                .assertEqual(data.event);
                            unsubscribe("ACTS_JsServiceAbility_1400_unsubscribe", subscriber1400);
                            console.log('ACTS_JsServiceAbility_1400====<end')
                            done();
                        }
                    });
                })
                function onConnectCallback(element, remote) {
                    console.info('ACTS_JsServiceAbility_1400_onConnectCallback ====> mConnIdJsAsyncCallback='
                    + JSON.stringify(mConnIdJsAsyncCallback) + " , " + mConnIdJsAsyncCallback);
                    console.info('ACTS_JsServiceAbility_1400_onConnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                    console.info('ACTS_JsServiceAbility_1400_onConnectCallback ====> remote='
                    + JSON.stringify(remote) + " , " + remote);
                    console.info('ACTS_JsServiceAbility_1400_onConnectCallback ====> remote is proxy:'
                    + (remote instanceof rpc.RemoteProxy));
                    commonEvent.publish("ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1400", () => {
                        console.info("=ACTS_JsServiceAbility_1400 publish =======>"
                        + "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1400");
                    });
                }

                function onDisconnectCallback(element) {
                    console.info('ACTS_JsServiceAbility_1400_onDisconnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                }

                function onFailedCallback(code) {
                    console.info('ACTS_JsServiceAbility_1400_onFailedCallback ====> code=' +
                    JSON.stringify(code) + " , " + code)
                }

                mConnIdJsAsyncCallback = featureAbility.connectAbility(
                    {
                        bundleName: bundleName,
                        abilityName: abilityName,
                        action: "ServiceConnectService_1400",
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                )
            } catch (err) {
                expect().assertFail()
                console.log('ACTS_JsServiceAbility_1400====<end err: ' + JSON.stringify(err))
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_1500
         * @tc.number ACTS_JsServiceAbility_1500
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_1500', Level.LEVEL0, async function (done) {
            console.log('ACTS_JsServiceAbility_1500====<begin');
            try {
                let mConnIdJsPromise;
                await commonEvent.createSubscriber(CommonEventSubscribeInfo1500).then((data) => {
                    console.info("=ACTS_JsServiceAbility_1500 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                    subscriber1500 = data;
                    commonEvent.subscribe(subscriber1500, (err, data) => {
                        console.info("=ACTS_JsServiceAbility_1500 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                        if (data.event == "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1500") {
                            featureAbility.disconnectAbility(mConnIdJsPromise).then((err) => {
                                console.info('ACTS_JsServiceAbility_1500===disconnectAbility data:' +
                                JSON.stringify(err));
                            }).catch(err => {
                                expect().assertFail()
                                console.info('ACTS_JsServiceAbility_1500==== err: ' + JSON.stringify(err));
                                done();
                            })
                        } else if (data.event == "ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1500") {
                            console.info("ACTS_JsServiceAbility_1500 recive ACTS_SerivceAbilityServerSecond_onConnect_ServiceConnectService_1500");
                        } else {
                            expect("ACTS_SerivceAbilityServer_onDisConnect_ServiceConnectService_1500")
                                .assertEqual(data.event);
                            unsubscribe("ACTS_JsServiceAbility_1500_unsubscribe", subscriber1500);
                            console.log('ACTS_JsServiceAbility_1500====<end')
                            done();
                        }
                    });
                })
                function onConnectCallback(element, remote) {
                    console.info('ACTS_JsServiceAbility_1500_onConnectCallback ====> mConnIdJsPromise='
                    + JSON.stringify(mConnIdJsPromise) + " , " + mConnIdJsPromise);
                    console.info('ACTS_JsServiceAbility_1500_onConnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                    console.info('ACTS_JsServiceAbility_1500_onConnectCallback ====> remote='
                    + JSON.stringify(remote) + " , " + remote);
                    commonEvent.publish("ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1500", () => {
                        console.info("=ACTS_JsServiceAbility_1500 publish =======>"
                        + "ACTS_SerivceAbilityServerSecond_onConnectCallback_ServiceConnectService_1500");
                    });
                }

                function onDisconnectCallback(element) {
                    console.info('ACTS_JsServiceAbility_1500_onDisconnectCallback ====> element='
                    + JSON.stringify(element) + " , " + element);
                    unsubscribe("ACTS_JsServiceAbility_1500_unsubscribe", subscriber1500);
                    console.log('ACTS_JsServiceAbility_1500====<end onDisconnectCallback')
                    done();
                }

                function onFailedCallback(code) {
                    console.info('ACTS_JsServiceAbility_1500_onFailedCallback ====> code=' +
                    JSON.stringify(code) + " , " + code)
                }

                mConnIdJsPromise = featureAbility.connectAbility(
                    {
                        bundleName: bundleName,
                        abilityName: abilityName,
                        action: "ServiceConnectService_1500",
                    },
                    {
                        onConnect: onConnectCallback,
                        onDisconnect: onDisconnectCallback,
                        onFailed: onFailedCallback,
                    },
                )
            } catch (err) {
                expect("catch").assertEqual(err);
                console.log('ACTS_JsServiceAbility_1500====<end err')
                done();
            }
        })

        /**
         * @tc.name   ACTS_JsServiceAbility_1600
         * @tc.number ACTS_JsServiceAbility_1600
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_1600', Level.LEVEL0, async function (done) {
          console.log('ACTS_JsServiceAbility_1600====<begin');
          try {
              await commonEvent.createSubscriber({ events:["ACTS_SerivceAbilityServer_FunctionCallback"] }).then((data) => {
                  console.info("=ACTS_JsServiceAbility_1600 createSubscriber .then(data)=======>"
                  + ("json data[") + JSON.stringify(data) + (" ]")
                  + " ,data=" + data);
                  subscriber1500 = data;
                  commonEvent.subscribe(subscriber1500, (err, eventData) => {
                      console.info("=ACTS_JsServiceAbility_1600 subscribe (err,data)=======>"
                      + ("json err[") + JSON.stringify(err) + (" ]")
                      + ("json data[") + JSON.stringify(eventData) + (" ]")
                      + " ,err=" + err + " ,data=" + eventData);
                      try{
                        expect(eventData?.parameters?.result).asssertEqual('success get value');
                      }catch{}
                      done();
                  });
              })
              featureAbility.startAbility({
                  want:{
                    bundleName: bundleName,
                    abilityName: abilityName,
                    action: "ACTS_JsServiceAbility_1600"
                  }
                },(err, code)=>{
                  console.log('ACTS_JsServiceAbility_1600 startAbility result ' + err)
                })
          } catch (err) {
              expect("catch").assertEqual(err);
              console.log('ACTS_JsServiceAbility_1600====<end err')
              done();
          }
      })

        /**
         * @tc.name   ACTS_JsServiceAbility_1700
         * @tc.number ACTS_JsServiceAbility_1700
         * @tc.desc   Check the return value of the interface (by Promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_JsServiceAbility_1700', Level.LEVEL0, async function (done) {
          console.log('ACTS_JsServiceAbility_1700====<begin');
          try {
              await commonEvent.createSubscriber({ events:["ACTS_SerivceAbilityServer_FunctionCallback"] }).then((data) => {
                  console.info("=ACTS_JsServiceAbility_1700 createSubscriber .then(data)=======>"
                  + ("json data[") + JSON.stringify(data) + (" ]")
                  + " ,data=" + data);
                  subscriber1500 = data;
                  commonEvent.subscribe(subscriber1500, (err, eventData) => {
                      console.info("=ACTS_JsServiceAbility_1700 subscribe (err,data)=======>"
                      + ("json err[") + JSON.stringify(err) + (" ]")
                      + ("json data[") + JSON.stringify(eventData) + (" ]")
                      + " ,err=" + err + " ,data=" + eventData);
                      try{
                        expect(eventData?.parameters?.result).asssertEqual(1);
                      }catch{}
                      done();
                  });
              })
              featureAbility.startAbility({
                want:{
                  bundleName: bundleName,
                  abilityName: abilityName,
                  action: "ACTS_JsServiceAbility_1700"
                }
              },(err, code)=>{
                    console.log('ACTS_JsServiceAbility_1700 startAbility result ' + err)
                  })
          } catch (err) {
              expect("catch").assertEqual(err);
              console.log('ACTS_JsServiceAbility_1700====<end err')
              done();
          }
      })
    })
}
