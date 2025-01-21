/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import connection from '@ohos.net.connection';
import { describe, expect, it } from '@ohos/hypium';

export default function Telephony_NetworkManagerRegisterTest() {

    describe('Telephony_NetworkManagerRegisterTest', function () {

        const TIMEOUT = 1000;

        /**
         * @tc.number Telephony_NetworkManager_register_Async_0100
         * @tc.name Enter  bearerTypes and networkCap asempty, set class NetConnection,
         * call Register() to activate the default network, and see if the callback information is generated
         @tc.desc Function test
         */
        it('Telephony_NetworkManager_register_Async_0100', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_0100';
            let netConn = connection.createNetConnection();
            netConn.register(function (error) {
                console.log("Telephony_NetworkManager_register_Async_0100 register ");
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    expect(true).assertFalse();
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                    expect(value.NetHandle !== undefined).assertTrue();
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                console.log("Telephony_NetworkManager_register_Async_0100 netLost end");
                console.log("Telephony_NetworkManager_register_Async_0100 unregister start");
                netConn.unregister(function (error) {
                    console.log("Telephony_NetworkManager_register_Async_0100 unregister ");
                    if (error) {
                        console.info(caseName + " register fail: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_0200
         * @tc.name Enter  bearerTypes and networkCap asempty, set class NetConnection,
         * call Register() to activate the default network, and see if the callback information is generated
         @tc.desc Function test
         */
        it('Telephony_NetworkManager_register_Async_0200', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_0200';
            let netSpecifier = {
                netCapabilities: {
                    bearerTypes: [1],
                }
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregisterresult: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /*
          *@tc.number Telephony_NetworkManager_register_Async_0300
          *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
          * call Register ()to activate the default network,and see if the callback information is generated
          *@tc.desc Function test
          */
        it('Telephony_NetworkManager_register_Async_0300', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_0300';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [11],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.info(caseName + " register fail: " + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /*
          *@tc.number Telephony_NetworkManager_register_Async_0400
          *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
          * call Register ()to activate the default network,and see if the callback information is generated
          *@tc.desc Function test
          */
        it('Telephony_NetworkManager_register_Async_0400', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_0400';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [12],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable" + JSON.stringify(value))
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange" + JSON.stringify(value))
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregisterresult: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /*
        *@tc.number Telephony_NetworkManager_register_Async_0500
        *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
        * call Register() to activate the default network,and see if the callback information is generated
        *@tc.desc Function test
        */
        it('Telephony_NetworkManager_register_Async_0500', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_rgister_Async_0500';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [15],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /*
        *@tc.number Telephony_NetworkManager_register_Async_0600
        *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
        * call Register() to activate the default network,and see if the callback information is generated
        *@tc.desc Function test
        */
        it('Telephony_NetworkManager_register_Async_0600', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_rgister_Async_0600';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [16],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregisterresult: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /*
        *@tc.number Telephony_NetworkManager_register_Async_0700
        *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
        * call Register() to activate the default network,and see if the callback information is generated
        *@tc.desc Function test
        */
        it('Telephony_NetworkManager_register_Async_0700', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_rgister_Async_0700';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [17],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /*
        *@tc.number Telephony_NetworkManager_register_Async_0800
        *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
        * call Register() to activate the default network,and see if the callback information is generated
        *@tc.desc Function test
        */
        it('Telephony_NetworkManager_register_Async_0800', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_rgister_Async_0800';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [1],
                    networkCap: [0],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });
        /*
        *@tc.number Telephony_NetworkManager_register_Async_0900
        *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
        * call Register() to activate the default network,and see if the callback information is generated
        *@tc.desc Function test
        */
        it('Telephony_NetworkManager_register_Async_0900', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_rgister_Async_0900';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [1],
                    networkCap: [12],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /*
        *@tc.number Telephony_NetworkManager_register_Async_1000
        *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
        * call Register() to activate the default network,and see if the callback information is generated
        *@tc.desc Function test
        */
        it('Telephony_NetworkManager_register_Async_1000', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_rgister_Async_1000';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [1],
                    networkCap: [12],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_1100
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1100', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1100';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [1],
                    networkCap: [15],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_1200
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1200', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1200';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [1],
                    networkCap: [16],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });


        /**
         * @tc.number Telephony_NetworkManager_register_Async_1300
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1300', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1300';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [1],
                    networkCap: [17],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange " + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable " + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });


        /**
         * @tc.number Telephony_NetworkManager_register_Async_1400
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1400', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1400';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [2],
                    networkCap: [12],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_1500
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1500', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1500';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [3],
                    networkCap: [12],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });


        /**
         * @tc.number Telephony_NetworkManager_register_Async_1600
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1600', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1600';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [4],
                    networkCap: [12],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_1700
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1700', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1700';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [5],
                    networkCap: [17],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_1800
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1800', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1800';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [4],
                    networkCap: [12],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                        return;
                    }
                    let netConn1 = connection.createNetConnection(netSpecifier, TIMEOUT);
                    netConn1.register(function (error) {
                        if (error) {
                            console.info(caseName + " register fail: " + JSON.stringify(error));
                            done();
                            return;
                        }
                        netConn1.unregister((error) => {
                            if (error) {
                                console.info(caseName + " unregister result: " + JSON.stringify(error));
                                expect(true).assertFalse();
                                done();
                            }
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_1900
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_1900', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_1900';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [6],
                    networkCap: [18],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register finish: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_2000
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */

        it('Telephony_NetworkManager_register_Async_2000', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_2000';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [0],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail " + error);
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange " + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost " + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable " + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister fail " + error);
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_2100
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */
        it('Telephony_NetworkManager_register_Async_2100', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_2100';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [0],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                        return;
                    }
                    let netSpecifier1 = {
                        netCapabilities: {
                            linkUpBandwidthKbps: 0,
                            linkDownBandwidthKbps: 0,
                            bearerTypes: [0],
                            networkCap: [12],
                        }, bearerPrivateIdentifier: '123'
                    }
                    let netConn1 = connection.createNetConnection(netSpecifier1, TIMEOUT);
                    netConn1.register(function (error) {
                        if (error) {
                            console.info(caseName + " register fail: " + JSON.stringify(error));
                            expect(true).assertFalse();
                            done();
                            return;
                        }
                        netConn1.unregister((error) => {
                            if (error) {
                                console.info(caseName + " unregister result: " + JSON.stringify(error));
                                expect(true).assertFalse();
                                done();
                            }
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_2200
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */
        it('Telephony_NetworkManager_register_Async_2200', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_2200';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [0],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                        return;
                    }
                    let netSpecifier1 = {
                        netCapabilities: {
                            linkUpBandwidthKbps: 0,
                            linkDownBandwidthKbps: 0,
                            bearerTypes: [1],
                            networkCap: [12],
                        }, bearerPrivateIdentifier: '123'
                    }
                    let netConn1 = connection.createNetConnection(netSpecifier1, TIMEOUT);
                    netConn1.register(function (error) {
                        if (error) {
                            console.info(caseName + " register fail: " + JSON.stringify(error));
                            expect(true).assertFalse();
                            done();
                            return;
                        }
                        netConn1.unregister((error) => {
                            if (error) {
                                console.info(caseName + " unregister result: " + JSON.stringify(error));
                                expect(true).assertFalse();
                                done();
                            }
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_register_Async_2300
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */
        it('Telephony_NetworkManager_register_Async_2300', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_register_Async_2300';
            let netConn = connection.createNetConnection();
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    expect(true).assertFalse();
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_unregister_Async_0100
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */
        it('Telephony_NetworkManager_unregister_Async_0100', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_unregister_Async_0100';
            let netSpecifier = {
                netCapabilities: {
                    linkUpBandwidthKbps: 0,
                    linkDownBandwidthKbps: 0,
                    bearerTypes: [0],
                    networkCap: [0],
                }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });


        /**
         * @tc.number Telephony_NetworkManager_unregister_Async_0200
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */
        it('Telephony_NetworkManager_unregister_Async_0200', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_unregister_Async_0200';
            let netConn = connection.createNetConnection();
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    expect(true).assertFalse();
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });

        /**
         * @tc.number Telephony_NetworkManager_unregister_Async_0300
         * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
         *          call Register () to activate the default network ,and see if the callback information is generated
         * @tc.desc Function test
         */
        it('Telephony_NetworkManager_unregister_Async_0300', 0, async function (done) {
            let caseName = 'Telephony_NetworkManager_unregister_Async_0300';
            let netConn = connection.createNetConnection();
            netConn.register(function (error) {
                if (error) {
                    console.info(caseName + " register fail: " + JSON.stringify(error));
                    expect(true).assertFalse();
                    done();
                    return;
                }
                netConn.on('netAvailable', function (value) {
                    console.log("netAvailable " + JSON.stringify(value));
                });
                netConn.on('netBlockStatusChange', function (value) {
                    console.log("netBlockStatusChange " + JSON.stringify(value));
                });
                netConn.on('netCapabilitiesChange', function (value) {
                    console.log("netCapabilitiesChange " + JSON.stringify(value));
                });
                netConn.on('netConnectionPropertiesChange', function (value) {
                    console.log("netConnectionPropertiesChange" + JSON.stringify(value));
                });
                netConn.on('netLost', function (value) {
                    console.log("netLost" + JSON.stringify(value));
                });
                netConn.on('netUnavailable', function (value) {
                    console.log("netUnavailable" + JSON.stringify(value));
                });
                expect(true).assertTrue();
                netConn.unregister((error) => {
                    if (error) {
                        console.info(caseName + " unregister result: " + JSON.stringify(error));
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            });
        });
    });
}