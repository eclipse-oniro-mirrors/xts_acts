/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let ListenTimes : number = 0;
const NetBearTypeBEARER_CELLULAR = connection.NetBearType.BEARER_CELLULAR;
const NetBearTypeBEARER_WIFI = connection.NetBearType.BEARER_WIFI;
const NetBearTypeBEARER_BLUETOOTH = connection.NetBearType.BEARER_BLUETOOTH;
const NetBearTypeBEARER_ETHERNET = connection.NetBearType.BEARER_ETHERNET;
const NetBearTypeBEARER_VPN = connection.NetBearType.BEARER_VPN;
const NetCapNET_CAPABILITY_MMS = connection.NetCap.NET_CAPABILITY_MMS;
const NetCapNET_CAPABILITY_NOT_METERED = connection.NetCap.NET_CAPABILITY_NOT_METERED;
const NetCapNET_CAPABILITY_INTERNET = connection.NetCap.NET_CAPABILITY_INTERNET;
const NetCapNET_CAPABILITY_NOT_VPN = connection.NetCap.NET_CAPABILITY_NOT_VPN;
const NetCapNET_NET_CAPABILITY_VALIDATED = connection.NetCap.NET_CAPABILITY_VALIDATED;
const NetCapNET_CAPABILITY_PORTAL = connection.NetCap.NET_CAPABILITY_PORTAL;
const NetCapNET_CAPABILITY_CHECKING_CONNECTIVITY = connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY;

let netConnOnEvent6 = async (caseName: string,netConn: connection.NetConnection) =>{
    hilog.info(domain, tag, '%{public}s', caseName+ ' : ==  Subscribing to Events start  === ');
    netConn.on('netAvailable', (value) => {
        ListenTimes+=1;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netAvailable " + JSON.stringify(value));
    });
    netConn.on('netCapabilitiesChange', (value: connection.NetCapabilityInfo) => {
        ListenTimes+=10;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netCapabilitiesChange " + JSON.stringify(value));
    });
    netConn.onNetLost((value) => {
        ListenTimes+=100;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netLost" + JSON.stringify(value));
    });
    netConn.onNetUnavailable((value) => {
        ListenTimes+=1000;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netUnavailable " + JSON.stringify(value));
    });
    netConn.onNetBlockStatusChange((value) => {
        ListenTimes+=10000;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netBlockStatusChange " + JSON.stringify(value));
    });
    hilog.info(domain, tag, '%{public}s', caseName+ ": ==  Subscribing to Events end  === ");
}
let netConnOnEvent4 =async (caseName: string,netConn: connection.NetConnection) =>{
    hilog.info(domain, tag, '%{public}s', caseName+ ' : ==  Subscribing to Events start  === ');
    netConn.on('netAvailable', (value) => {
        ListenTimes+=1;
        hilog.info(domain, tag, '%{public}s', caseName+" ===on netAvailable " + JSON.stringify(value));
    });
    netConn.on('netCapabilitiesChange', (value: connection.NetCapabilityInfo) => {
        ListenTimes+=10;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netCapabilitiesChange " + JSON.stringify(value));
    });
    netConn.onNetLost((value) => {
        ListenTimes+=100;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netLost" + JSON.stringify(value));
    });
    hilog.info(domain, tag, '%{public}s', caseName+ ": ==  Subscribing to Events end  === ");
}

let netConnOnEvent3 =async (caseName: string,netConn: connection.NetConnection) =>{
    hilog.info(domain, tag, '%{public}s', caseName+ ": ==  Subscribing to Events start  === ");
    netConn.on('netAvailable', (value) => {
        ListenTimes+=1;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netAvailable " + JSON.stringify(value));
    });
    netConn.on('netConnectionPropertiesChange', (value) => {
        ListenTimes+=10;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netConnectionPropertiesChange" + JSON.stringify(value));
    });
    netConn.onNetLost((value) => {
        ListenTimes+=100;
        hilog.info(domain, tag, '%{public}s', caseName+ " ===on netLost" + JSON.stringify(value));
    });
    hilog.info(domain, tag, '%{public}s', caseName+  ": ==  Subscribing to Events end  === ");
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
export default function ConnectionRegisterTest() {

    describe("ConnectionRegisterTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeEach(() => {
            ListenTimes = 0;
        })
        const TIMEOUT = 1000;

        /**
         * @tc.number SUB_NetworkManager_Register_Async_0100
         * @tc.name testNetworkManagerRegisterAsync_static_0100
         * @tc.desc activate the default network, and see if the callback information is generated
         * @tc.level Level1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it('testNetworkManagerRegisterAsync_static_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName = 'testNetworkManagerRegisterAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let netConn = connection.createNetConnection();
                hilog.info(domain, tag, '%{public}s', caseName+ ' register start');
                netConn.register((error: BusinessError<void>|null) => {
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                    if (error?.code != 0) {
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' register success ');
                    }
                });
                await netConnOnEvent4(caseName, netConn);
                await Utils.msSleep(3000);
                hilog.info(domain, tag, '%{public}s', caseName+" unregister start" );
                netConn.unregister((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName + "unregister fail: " + JSON.stringify(error));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName + " unregister success " );
                        hilog.info(domain, tag, '%{public}s', caseName + " ListenTimes is :" +ListenTimes);
                        ExpectTrue( ListenTimes == 11 || ListenTimes == 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + " catch err is :  "+JSON.stringify(err) );
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName +  "  --test end ");
                done();
            }
        });

        /**
         * @tc.number SUB_NetworkManager_Register_Async_0200
         * @tc.name testNetworkManagerRegisterAsync_static_0200
         * @tc.desc activate the default network, and see if the callback information is generated
         * @tc.level Level1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it('testNetworkManagerRegisterAsync_static_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName = 'testNetworkManagerRegisterAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let netSpecifier: connection.NetSpecifier = {
                    netCapabilities: {
                        bearerTypes: [NetBearTypeBEARER_WIFI,NetBearTypeBEARER_CELLULAR],
                    }
                }
                let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
                hilog.info(domain, tag, '%{public}s', caseName+ ' register start');
                netConn.register((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  register fail: '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                        done();
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName+ '  register success');
                    }
                });
                await netConnOnEvent6(caseName, netConn)
                await Utils.msSleep(3000);
                hilog.info(domain, tag, '%{public}s', caseName+" unregister start" );
                netConn.unregister((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +  " unregister fail: " + JSON.stringify(error));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName + " unregister success " );
                        hilog.info(domain, tag, '%{public}s', caseName + " ListenTimes is :" +ListenTimes);
                        ExpectTrue( ListenTimes == 11 || ListenTimes == 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + " catch err is :  "+JSON.stringify(err) );
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName +  "  --test end ");
                done();
            }
        });


        /**
         *@tc.number SUB_NetworkManager_Register_Async_2300
         *@tc.name testNetworkManagerRegisterAsync_static_2300
         *@tc.desc  activate the default network ,and see if the callback information is generated
         * @tc.level Level0
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it('testNetworkManagerRegisterAsync_static_2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = 'testNetworkManagerRegisterAsync_static_2300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let netConn = connection.createNetConnection();
                hilog.info(domain, tag, '%{public}s', caseName+ ' register start');
                netConn.register((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  register fail: '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                        done();
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName+ '  register success');
                    }
                });
                await netConnOnEvent6(caseName, netConn)
                await Utils.msSleep(3000);
                hilog.info(domain, tag, '%{public}s', caseName+" unregister start" );
                netConn.unregister((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +  " unregister fail: " + JSON.stringify(error));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName + " unregister success " );
                        hilog.info(domain, tag, '%{public}s', caseName + " ListenTimes is :" +ListenTimes);
                        ExpectTrue( ListenTimes == 11 || ListenTimes == 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                    done();
                });
            }catch (err){
                hilog.info(domain, tag, '%{public}s', caseName +  "  catch err is: "+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName +  "  --test end ");
                done();
            }
        });

        /**
         * @tc.number SUB_NetworkManager_Register_Async_2500
         * @tc.name testNetworkManagerRegisterAsync_static_2500
         * @tc.desc activate the default network, and see if the callback information is generated
         * @tc.level Level1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it('testNetworkManagerRegisterAsync_static_2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName = 'testNetworkManagerRegisterAsync_static_2500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let netConn = connection.createNetConnection();
                hilog.info(domain, tag, '%{public}s', caseName+ ' register start');
                netConn.register((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  register fail: '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                        done();
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName+ '  register success');
                    }
                });
                await netConnOnEvent3(caseName, netConn);
                await Utils.msSleep(3000);
                hilog.info(domain, tag, '%{public}s', caseName+" unregister start" );
                netConn.unregister((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName + "unregister fail: " + JSON.stringify(error));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName + " unregister success " );
                        hilog.info(domain, tag, '%{public}s', caseName + " ListenTimes is :" +ListenTimes);
                        ExpectTrue( ListenTimes == 11 || ListenTimes == 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + " catch err is :  "+JSON.stringify(err) );
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName +  "  --test end ");
                done();
            }
        });

        /**
         * @tc.number SUB_NetworkManager_Register_Async_2600
         * @tc.name testNetworkManagerRegisterAsync_static_2600
         * @tc.desc activate the default network, and see if the callback information is generated
         * @tc.level Level1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it('testNetworkManagerRegisterAsync_static_2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName = 'testNetworkManagerRegisterAsync_static_2600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let netSpecifier: connection.NetSpecifier = {
                    netCapabilities: {
                        bearerTypes: [NetBearTypeBEARER_WIFI,NetBearTypeBEARER_CELLULAR],
                    }
                }
                let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
                hilog.info(domain, tag, '%{public}s', caseName+ ' register start');
                netConn.register((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  register fail: '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                        done();
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName+ '  register success');
                    }
                });
                await netConnOnEvent3(caseName, netConn)
                await Utils.msSleep(2000);
                hilog.info(domain, tag, '%{public}s', caseName+" unregister start" );
                netConn.unregister((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +  " unregister fail: " + JSON.stringify(error));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName + " unregister success " );
                        hilog.info(domain, tag, '%{public}s', caseName + " ListenTimes is :" +ListenTimes);
                        ExpectTrue( ListenTimes == 11 || ListenTimes == 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + " catch err is :  "+JSON.stringify(err) );
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName +  "  --test end ");
                done();
            }
        });

        /**
         *@tc.number SUB_NetworkManager_Register_Async_2700
         *@tc.name testNetworkManagerRegisterAsync_static_2700
         *@tc.desc  activate the default network ,and see if the callback information is generated
         * @tc.level Level0
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it('testNetworkManagerRegisterAsync_static_2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = 'testNetworkManagerRegisterAsync_static_2700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let netConn = connection.createNetConnection();
                hilog.info(domain, tag, '%{public}s', caseName+ ' register start');
                netConn.register((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  register fail: '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                        done();
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName+ '  register success');
                    }
                });
                await netConnOnEvent3(caseName, netConn)
                await Utils.msSleep(2000);
                hilog.info(domain, tag, '%{public}s', caseName+" unregister start" );
                netConn.unregister((error: BusinessError<void>|null) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +  " unregister fail: " + JSON.stringify(error));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName + " unregister success " );
                        hilog.info(domain, tag, '%{public}s', caseName + " ListenTimes is :" +ListenTimes);
                        ExpectTrue( ListenTimes == 11 || ListenTimes == 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + " ---End");
                    done();
                });
            }catch (err){
                hilog.info(domain, tag, '%{public}s', caseName +  "  catch err is: "+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName +  "  --test end ");
                done();
            }
        });
    })
}
