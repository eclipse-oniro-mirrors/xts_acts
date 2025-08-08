/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, afterEach, TestType, Size, Level  } from '@ohos/hypium';
import mdns from '@ohos.net.mdns';
import featureAbility from '@ohos.ability.featureAbility';

let bundleName = featureAbility.getContext();
let delayTime = 3000;

let startSearching_status;
let stopSearching_status;
let found_status;
let lost_status;

function startSearching() {
    console.log(`SUB_Telephony_ run startSearching function`);
    startSearching_status = true;
}

function stopSearching() {
    console.log(`SUB_Telephony_ run stopSearching function`);
    stopSearching_status = true;
}

function found() {
    console.log(`SUB_Telephony_ run found function`);
    found_status = true;
}

function lost() {
    console.log(`SUB_Telephony_ run lost function`);
    lost_status = true;
}

let localServiceInfo = {
    serviceType: "_print._tcp",
    serviceName: "into type",
    port: 5555,
    host: {
        address: "10.14.0.7",
        family: 1,
        port: 5555,
    },
    serviceAttribute: [
        {
            key: "111",
            value: [1]
        }
    ]
}

function myExpect(value) {
    expect(value.serviceType).assertEqual(localServiceInfo.serviceType);
    expect(value.serviceName).assertEqual(localServiceInfo.serviceName);
    expect(value.port).assertEqual(localServiceInfo.port);
    expect(value.host.address).assertEqual(localServiceInfo.host.address);
    expect(value.host.family).assertEqual(localServiceInfo.host.family);
    expect(value.host.port).assertEqual(localServiceInfo.host.port);
    expect(value.serviceAttribute[0].key[0]).assertEqual(localServiceInfo.serviceAttribute[0].key[0]);
    expect(value.serviceAttribute[0].value[0]).assertEqual(localServiceInfo.serviceAttribute[0].value[0]);
}

export default function NetworkManagerMdnsTest() {

    describe('NetworkManagerMdnsTest', function () {

        afterEach(async function () {
            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`removeLocalService fail ${JSON.stringify(err)}`);
                } else {
                    console.log(` removeLocalService success ${JSON.stringify(data)}`);
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Async_0100
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Async_0100';
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success`);
                    myExpect(data);
                    mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                        if (err) {
                            console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.log(`${caseName} removeLocalService success`);
                            myExpect(data);
                            done();
                        }
                    });
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Async_0400
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Async_0400';
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success`);
                    myExpect(data);
                    mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                        if (err) {
                            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                            expect(err != undefined).assertEqual(true);
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect().assertFail();
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success`);
                                    myExpect(data);
                                    done();
                                }
                            });
                        } else {
                            console.log(`${caseName} addLocalService success`);
                            expect().assertFail();
                            done();
                        }
                    });
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Async_0500
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Async_0500';
            let localServiceInfo = {}
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect(err != undefined).assertEqual(true);
                    done();
                } else {
                    console.log(`${caseName} addLocalService success`);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Async_0600
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Async_0600';
            try {
                mdns.addLocalService(null, localServiceInfo, (err, data) => {
                    if (err) {
                        console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.log(`${caseName} addLocalService success`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (err) {
                console.log(`${caseName} addLocalService into catch ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true)
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Promise_0100
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Promise_0100';
            mdns.addLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} addLocalService success `);
                myExpect(data);
                mdns.removeLocalService(bundleName, localServiceInfo).then((data) => {
                    console.log(`${caseName} removeLocalService success `);
                    myExpect(data);
                    done();
                }).catch((err) => {
                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Promise_0400
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Promise_0400';
            mdns.addLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} addLocalService success `);
                myExpect(data);
                mdns.addLocalService(bundleName, localServiceInfo).then((data) => {
                    console.log(`${caseName} addLocalService success `);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect(err != undefined).assertEqual(true);
                    mdns.removeLocalService(bundleName, localServiceInfo).then((data) => {
                        console.log(`${caseName} removeLocalService success `);
                        myExpect(data);
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                });
            }).catch((err) => {
                console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Promise_0500
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Promise_0500';
            let localServiceInfo = {}
            mdns.addLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} addLocalService success `);
                expect().assertFail();
            }).catch((err) => {
                console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_addLocalService_Promise_0600
         * @tc.name Test addLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_addLocalService_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_addLocalService_Promise_0600';
            try {
                mdns.addLocalService(null, localServiceInfo).then((data) => {
                    console.log(`${caseName} addLocalService success `);
                    expect().assertFail();
                }).catch((err) => {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.log(`${caseName} addLocalService into catch ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true)
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Async_0100
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Async_0100';
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success `);
                    myExpect(data);
                    mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                        if (err) {
                            console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.log(`${caseName} removeLocalService success `);
                            expect(err).assertEqual(undefined);
                            myExpect(data);
                            done();
                        }
                    });
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Async_0400
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Async_0400';
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success `);
                    myExpect(data);
                    mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                        if (err) {
                            console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.log(`${caseName} removeLocalService success `);
                            expect(err).assertEqual(undefined);
                            myExpect(data);
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect(err != undefined).assertEqual(true);
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success `);
                                    expect().assertFail();
                                    done();
                                }
                            });
                        }
                    });
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Async_0500
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Async_0500';
            let localServiceInfo = {}
            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                    expect(err != undefined).assertEqual(true);
                    done();
                } else {
                    console.log(`${caseName} removeLocalService success `);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Async_0600
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Async_0600';
            try {
                mdns.removeLocalService(null, localServiceInfo, (err, data) => {
                    if (err) {
                        console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.log(`${caseName} removeLocalService success `);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (err) {
                console.log(`${caseName} removeLocalService into catch ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            }
        });

        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Promise_0100
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Promise_0100';
            mdns.addLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} addLocalService success `);
                myExpect(data);
                mdns.removeLocalService(bundleName, localServiceInfo).then((data) => {
                    console.log(`${caseName} removeLocalService success`);
                    myExpect(data);
                    done();
                }).catch((err) => {
                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Promise_0400
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Promise_0400';
            mdns.addLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} addLocalService success `);
                myExpect(data);
                mdns.removeLocalService(bundleName, localServiceInfo).then((data) => {
                    console.log(`${caseName} removeLocalService success`);
                    myExpect(data);
                    mdns.removeLocalService(bundleName, localServiceInfo).then((data) => {
                        console.log(`${caseName} removeLocalService success`);
                        expect().assertFail();
                        myExpect(data);
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                        expect(err != undefined).assertEqual(true);
                        done();
                    });
                }).catch((err) => {
                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Promise_0500
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Promise_0500';
            let localServiceInfo = {}
            mdns.removeLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} removeLocalService success`);
                expect().assertFail();
                done();
            }).catch((err) => {
                console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_removeLocalService_Promise_0600
         * @tc.name Test removeLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_removeLocalService_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_removeLocalService_Promise_0600';
            try {
                mdns.removeLocalService(null, localServiceInfo).then((data) => {
                    console.log(`${caseName} removeLocalService success`);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.log(`${caseName} removeLocalService into catch ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetManager_createDiscoveryService_0100
         * @tc.name Test createDiscoveryService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_createDiscoveryService_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_createDiscoveryService_0100';
            let discoveryService = mdns.createDiscoveryService(bundleName, "_print._tcp");
            if (discoveryService != undefined) {
                console.log(`${caseName} createDiscoveryService success`);
                expect(discoveryService).assertInstanceOf('Object');
                done();
            } else {
                console.log(`${caseName} createDiscoveryService fail`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Telephony_NetManager_createDiscoveryService_0400
         * @tc.name Test createDiscoveryService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_createDiscoveryService_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_createDiscoveryService_0400';
            let discoveryService = mdns.createDiscoveryService(bundleName, null);
            if (discoveryService != undefined) {
                console.log(`${caseName} createDiscoveryService success`);
                expect().assertFail();
                done();
            } else {
                console.log(`${caseName} createDiscoveryService fail`);
                expect(discoveryService == undefined).assertEqual(true);
                done();
            }
        });

        /**
         * @tc.number SUB_Telephony_NetManager_createDiscoveryService_0500
         * @tc.name Test createDiscoveryService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_createDiscoveryService_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_createDiscoveryService_0500';
            let discoveryService = mdns.createDiscoveryService(null, "_print._tcp");
            if (discoveryService != undefined) {
                console.log(`${caseName} createDiscoveryService success`);
                expect().assertFail();
                done();
            } else {
                console.log(`${caseName} createDiscoveryService fail`);
                expect(discoveryService == undefined).assertEqual(true);
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetManager_resolveLocalService_Async_0100
         * @tc.name Test resolveLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_resolveLocalService_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_resolveLocalService_Async_0100';
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success`);
                    myExpect(data);
                    mdns.resolveLocalService(bundleName, localServiceInfo, (err, data) => {
                        if (err) {
                            console.log(`${caseName} resolveLocalService fail ${JSON.stringify(err)}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.log(`${caseName} resolveLocalService success `);
                            expect(err).assertEqual(undefined);
                            expect(data.serviceType).assertEqual(localServiceInfo.serviceType);
                            expect(data.serviceName).assertEqual(localServiceInfo.serviceName);
                            expect(data.port).assertEqual(localServiceInfo.port);
                            expect(typeof (data.host.address)).assertEqual(typeof (localServiceInfo.host.address));
                            expect(data.host.family).assertEqual(localServiceInfo.host.family);
                            expect(data.host.port).assertEqual(localServiceInfo.host.port);
                            expect(data.serviceAttribute[0].key[0]).assertEqual(localServiceInfo.serviceAttribute[0].key[0]);
                            expect(data.serviceAttribute[0].value[0]).assertEqual(localServiceInfo.serviceAttribute[0].value[0]);
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect().assertFail();
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success `);
                                    expect(err).assertEqual(undefined);
                                    myExpect(data);
                                    done();
                                }
                            });
                        }
                    });
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_resolveLocalService_Async_0400
         * @tc.name Test resolveLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_resolveLocalService_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_resolveLocalService_Async_0400';
            let localServiceInfo = {};
            mdns.resolveLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} resolveLocalService fail ${JSON.stringify(err)}`);
                    expect(err != undefined).assertEqual(true);
                    done();
                } else {
                    console.log(`${caseName} resolveLocalService success `);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_resolveLocalService_Async_0500
         * @tc.name Test resolveLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_resolveLocalService_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_resolveLocalService_Async_0500';
            try {
                mdns.resolveLocalService(null, localServiceInfo, (err, data) => {
                    if (err) {
                        console.log(`${caseName} resolveLocalService fail ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.log(`${caseName} resolveLocalService success `);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (err) {
                console.log(`${caseName} resolveLocalService into catch ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            }
        });

        /**
         * @tc.number SUB_Telephony_NetManager_resolveLocalService_Promise_0100
         * @tc.name Test resolveLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_resolveLocalService_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_resolveLocalService_Promise_0100';
            mdns.addLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} addLocalService success `);
                myExpect(data);
                mdns.resolveLocalService(bundleName, localServiceInfo).then((data) => {
                    console.log(`${caseName} resolveLocalService success `);
                    expect(data.serviceType).assertEqual(localServiceInfo.serviceType);
                    expect(data.serviceName).assertEqual(localServiceInfo.serviceName);
                    expect(data.port).assertEqual(localServiceInfo.port);
                    expect(typeof (data.host.address)).assertEqual(typeof (localServiceInfo.host.address));
                    expect(data.host.family).assertEqual(localServiceInfo.host.family);
                    expect(data.host.port).assertEqual(localServiceInfo.host.port);
                    expect(data.serviceAttribute[0].key[0]).assertEqual(localServiceInfo.serviceAttribute[0].key[0]);
                    expect(data.serviceAttribute[0].value[0]).assertEqual(localServiceInfo.serviceAttribute[0].value[0]);
                    mdns.removeLocalService(bundleName, localServiceInfo).then((data) => {
                        console.log(`${caseName} removeLocalService success `);
                        myExpect(data);
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.log(`${caseName} resolveLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_resolveLocalService_Promise_0400
         * @tc.name Test resolveLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_resolveLocalService_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_resolveLocalService_Promise_0400';
            let localServiceInfo = {};
            mdns.resolveLocalService(bundleName, localServiceInfo).then((data) => {
                console.log(`${caseName} resolveLocalService success `);
                expect().assertFail();
                done();
            }).catch((err) => {
                console.log(`${caseName} resolveLocalService fail ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_resolveLocalService_Promise_0500
         * @tc.name Test resolveLocalService() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_resolveLocalService_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_resolveLocalService_Promise_0500';
            try {
                mdns.resolveLocalService(null, localServiceInfo).then((data) => {
                    console.log(`${caseName} resolveLocalService success `);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log(`${caseName} resolveLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.log(`${caseName} resolveLocalService into catch ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            }
        });


        /**
         * @tc.number SUB_Telephony_NetManager_startSearchingMDNS_0100
         * @tc.name Test startSearchingMDNS() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_startSearchingMDNS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_startSearchingMDNS_0100';
            startSearching_status = false;
            let discoveryService = mdns.createDiscoveryService(bundleName, "_print._tcp");
            discoveryService.on("discoveryStart", startSearching);
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success `);
                    discoveryService.startSearchingMDNS();
                    setTimeout(() => {
                        discoveryService.stopSearchingMDNS();
                        setTimeout(() => {
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect().assertFail();
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success `);
                                    expect(err).assertEqual(undefined);
                                    setTimeout(() => {
                                        expect(startSearching_status).assertEqual(true);
                                        discoveryService.off("discoveryStart");
                                        done();
                                    }, delayTime)
                                }
                            });
                        }, delayTime)
                    }, delayTime)
                }
            });
        });


        /**
         * @tc.number SUB_Telephony_NetManager_stopSearchingMDNS_0100
         * @tc.name Test stopSearchingMDNS() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_stopSearchingMDNS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_stopSearchingMDNS_0100';
            stopSearching_status = false;
            let discoveryService = mdns.createDiscoveryService(bundleName, "_print._tcp");
            discoveryService.on("discoveryStop", stopSearching);
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success `);
                    discoveryService.startSearchingMDNS();
                    setTimeout(() => {
                        discoveryService.stopSearchingMDNS();
                        setTimeout(() => {
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect().assertFail();
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success `);
                                    expect(err).assertEqual(undefined);
                                    setTimeout(() => {
                                        expect(stopSearching_status).assertEqual(true);
                                        discoveryService.off("discoveryStop");
                                        done();
                                    }, delayTime)
                                }
                            });
                        }, delayTime)
                    }, delayTime)
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_on_discoveryStart_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_on_discoveryStart_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_on_discoveryStart_0100';
            startSearching_status = false;
            let discoveryService = mdns.createDiscoveryService(bundleName, "_print._tcp");
            discoveryService.on("discoveryStart", startSearching);
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success`);
                    discoveryService.startSearchingMDNS();
                    setTimeout(() => {
                        discoveryService.stopSearchingMDNS();
                        setTimeout(() => {
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect().assertFail();
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success`);
                                    expect(err).assertEqual(undefined);
                                    setTimeout(() => {
                                        expect(startSearching_status).assertEqual(true);
                                        discoveryService.off("discoveryStart");
                                        done();
                                    }, delayTime)
                                }
                            });
                        }, delayTime)
                    }, delayTime)
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_on_discoveryStop_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_on_discoveryStop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_on_discoveryStop_0100';
            stopSearching_status = false;
            let discoveryService = mdns.createDiscoveryService(bundleName, "_print._tcp");
            discoveryService.on("discoveryStop", stopSearching);
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success `);
                    discoveryService.startSearchingMDNS();
                    setTimeout(() => {
                        discoveryService.stopSearchingMDNS();
                        setTimeout(() => {
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect().assertFail();
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success `);
                                    expect(err).assertEqual(undefined);
                                    setTimeout(() => {
                                        expect(stopSearching_status).assertEqual(true);
                                        discoveryService.off("discoveryStop");
                                        done();
                                    }, delayTime)
                                }
                            });
                        }, delayTime)
                    }, delayTime)
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_on_serviceFound_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_on_serviceFound_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_on_serviceFound_0100';
            found_status = false;
            let discoveryService = mdns.createDiscoveryService(bundleName, "_print._tcp");
            discoveryService.on("serviceFound", found);
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success `);
                    discoveryService.startSearchingMDNS();
                    setTimeout(() => {
                        discoveryService.stopSearchingMDNS();
                        setTimeout(() => {
                            mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                                if (err) {
                                    console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                    expect().assertFail();
                                    done();
                                } else {
                                    console.log(`${caseName} removeLocalService success `);
                                    expect(err).assertEqual(undefined);
                                    setTimeout(() => {
                                        expect(found_status).assertEqual(true);
                                        discoveryService.off("serviceFound");
                                        done();
                                    }, delayTime)
                                }
                            });
                        }, delayTime)
                    }, delayTime)
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_on_serviceLost_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_on_serviceLost_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_on_serviceLost_0100';
            lost_status = false;
            let discoveryService = mdns.createDiscoveryService(bundleName, "_print._tcp");
            discoveryService.on("serviceLost", lost);
            mdns.addLocalService(bundleName, localServiceInfo, (err, data) => {
                if (err) {
                    console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                } else {
                    console.log(`${caseName} addLocalService success `);
                    discoveryService.startSearchingMDNS();
                    setTimeout(() => {
                        mdns.removeLocalService(bundleName, localServiceInfo, (err, data) => {
                            if (err) {
                                console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                                expect().assertFail();
                                done();
                            } else {
                                console.log(`${caseName} removeLocalService success `);
                                expect(err).assertEqual(undefined);
                                setTimeout(() => {
                                    expect(lost_status).assertEqual(true);
                                    discoveryService.off("serviceLost");
                                    done();
                                }, delayTime)
                            }
                        });
                    }, delayTime)
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetManager_MdnsError_0100
         * @tc.name Test MdnsError enum
         * @tc.desc Function test
         */
        it('SUB_Telephony_NetManager_MdnsError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let caseName = 'SUB_Telephony_NetManager_MdnsError_0100';
            expect(mdns.MdnsError.INTERNAL_ERROR == 0 ).assertTrue();
            expect(mdns.MdnsError.ALREADY_ACTIVE == 1 ).assertTrue();
            expect(mdns.MdnsError.MAX_LIMIT == 2 ).assertTrue();
            console.info(caseName + "test finish!");
            done();                
        });
        
    });
}