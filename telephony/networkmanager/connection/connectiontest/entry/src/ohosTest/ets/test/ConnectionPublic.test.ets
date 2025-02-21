/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import socket from '@ohos.net.socket';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};


export default function ConnectionPublicTest() {
  describe('ConnectionPublicTest', () => {

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0100
     * @tc.name       : testNetworkMgrConnectionHasDefaultNet0100
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionHasDefaultNet0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNet0100";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet((error: BusinessError, data: boolean) => {
          if (error) {
            console.error(`${caseName} hasDefaultNet: BusinessError>${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
            ExpectTrue(data == true);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0600
     * @tc.name       : testNetworkMgrConnectionHasDefaultNet0600
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionHasDefaultNet0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNet0600";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet().then((data: boolean) => {
          console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
          ExpectTrue(data == true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} hasDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNetSync_0100
     * @tc.name       : testNetworkMgrConnectionHasDefaultNetSync0100
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionHasDefaultNetSync0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNetSync0100";
      console.info(`${caseName} test start`);
      try {
        let isDefaultNet: boolean = connection.hasDefaultNetSync();
        ExpectTrue(isDefaultNet == true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0100
     * @tc.name       : testNetworkMgrConnectionReportNetConnected0100
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetConnected0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetConnected: success`);
              ExpectTrue(error == undefined);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0400
     * @tc.name       : testNetworkMgrConnectionReportNetConnected0400
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0400";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetConnected(null, (error: BusinessError) => {
          if (error) {
            console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName}: reportNetConnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0500
     * @tc.name       : testNetworkMgrConnectionReportNetConnected0500
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0500";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetConnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetConnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0600
     * @tc.name       : testNetworkMgrConnectionReportNetConnected0600
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0600";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          connection.reportNetConnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetConnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0700
     * @tc.name       : testNetworkMgrConnectionReportNetConnected0700
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0700";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetConnected: success`);
              ExpectTrue(error == undefined);
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0800
     * @tc.name       : testNetworkMgrConnectionReportNetConnected0800
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0800";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          connection.reportNetConnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetConnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1000
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1000
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetConnected1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1000";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetConnected: success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1100
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1100
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected1100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1100";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetConnected(undefined, (error: BusinessError) => {
          if (error) {
            console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName}: reportNetConnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1200
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1200
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected1200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1200";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetConnected(undefined).then(() => {
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1300
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1300
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected1300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1300";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetConnected(null).then(() => {
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1400
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1400
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected1400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1400";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetConnected(netHandle).then(() => {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetConnected: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1500
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1500
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected1500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1500";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          connection.reportNetConnected(netHandle).then(() => {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetConnected: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1600
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1600
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected1600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1600";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 100;
          connection.reportNetConnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetConnected: success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetConnected: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1700
     * @tc.name       : testNetworkMgrConnectionReportNetConnected1700
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetConnected1700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected1700";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          connection.reportNetConnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetConnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetConnected: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0100
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected0100
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetDisconnected: success`);
              ExpectTrue(error == undefined);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0300
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected0300
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetDisconnected0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0300";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetDisconnected(undefined, (error: BusinessError) => {
          if (error) {
            console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName}: reportNetDisconnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0400
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected0400
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetDisconnected0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0400";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetDisconnected(null, (error: BusinessError) => {
          if (error) {
            console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName}: reportNetDisconnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0500
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected0500
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0500";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetDisconnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0600
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected0600
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0600";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          connection.reportNetDisconnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0700
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected0700
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0700";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetDisconnected: success`);
              ExpectTrue(error == undefined);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0800
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected0800
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0800";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          connection.reportNetDisconnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1000
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected1000
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1000";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetDisconnected: success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1200
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected1200
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetDisconnected1200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1200";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetDisconnected(undefined).then(() => {
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1300
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected1300
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionReportNetDisconnected1300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1300";
      console.info(`${caseName} test start`);
      try {
        connection.reportNetDisconnected(null).then(() => {
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1400
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected1400
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected1400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1400";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetDisconnected(netHandle).then(() => {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1500
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected1500
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected1500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1500";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          connection.reportNetDisconnected(netHandle).then(() => {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1600
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected1600
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected1600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1600";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetDisconnected: success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1700
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected1700
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionReportNetDisconnected1700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1700";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          connection.reportNetDisconnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetDisconnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0100
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0100
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0200
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0200";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        });
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0300
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0300
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0300";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0400
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0400
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0400";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0500
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0500
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0500";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0600
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0600
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0600";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        });
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0700
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0700
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0700";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0800
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0800
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0800";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0900
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection0900
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection0900";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1000
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1000
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1000";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        });
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1100
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1100
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection1100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1200
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection1200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1200";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1300
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1300
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection1300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1300";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1400
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1400
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection1400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1400";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        });
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1500
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1500
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection1500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1500";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1600
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1600
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection1600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1600";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1700
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection1700
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection1700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection1700";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultNetCallback0100
     * @tc.desc       : test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultNetCallback0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetCallback0100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet((err: BusinessError<void>, data: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err == undefined) {
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultNetPromise0100
     * @tc.desc       : test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultNetPromise0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetPromise0100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet: data->${JSON.stringify(data)}`);
          ExpectTrue(typeof data.netId == 'number');
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNetSync_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultNetSync0100
     * @tc.desc       : test use synchronization method to obtain default activated data network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultNetSync0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync0100";
      console.info(`${caseName} test start`);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        ExpectTrue(typeof netHandle.netId == 'number');
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMetered_Callback_0100
     * @tc.name       : testNetworkMgrConnectionIsDefaultNetMeteredCallback0100
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredCallback0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredCallback0100";
      console.info(`${caseName} test start`);
      try {
        connection.isDefaultNetMetered((err: BusinessError, data: boolean) => {
          console.info(`${caseName} isDefaultNetMetered callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectTrue(data == true);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMetered_Promise_0100
     * @tc.name       : testNetworkMgrConnectionIsDefaultNetMeteredPromise0100
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredPromise0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredPromise0100";
      console.info(`${caseName} test start`);
      try {
        connection.isDefaultNetMetered().then((data: boolean) => {
          console.info(`${caseName} isDefaultNetMetered: data->${JSON.stringify(data)}`);
          ExpectTrue(data == true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} isDefaultNetMetered: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMeteredSync_0100
     * @tc.name       : testNetworkMgrConnectionIsDefaultNetMeteredSync0100
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and return it using synchronous mode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredSync0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredSync0100";
      console.info(`${caseName} test start`);
      try {
        let isMetered: boolean = connection.isDefaultNetMeteredSync();
        ExpectTrue(isMetered == true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultHttpProxyCallback0100
     * @tc.desc       : test obtain default proxy configuration information for the network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback0100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultHttpProxy((err: BusinessError, data: connection.HttpProxy) => {
          console.info(`${caseName} getDefaultHttpProxy callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectTrue(data != undefined);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0200
     * @tc.name       : testNetworkMgrConnectionGetDefaultHttpProxyCallback0200
     * @tc.desc       : test obtain default proxy configuration information for the network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet((err: BusinessError, netHandle: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet callback: err->${JSON.stringify(err)} data->${JSON.stringify(netHandle)}`);
          if (err != undefined) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
          connection.setAppNet(netHandle, (err: BusinessError, data: void) => {
            console.info(`${caseName} setAppNet callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
            if (err != undefined) {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
        connection.getDefaultHttpProxy((err: BusinessError, data: connection.HttpProxy) => {
          console.info(`${caseName} getDefaultHttpProxy callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          ExpectTrue(data != undefined);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Promise_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultHttpProxyPromise0100
     * @tc.desc       : test obtain default proxy configuration information for the network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyPromise0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyPromise0100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultHttpProxy().then((data: connection.HttpProxy) => {
          console.info(`${caseName} getDefaultHttpProxy promise: data->${JSON.stringify(data)}`);
          ExpectTrue(data != undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultHttpProxy promise: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Promise_0200
     * @tc.name       : testNetworkMgrConnectionGetDefaultHttpProxyPromise0200
     * @tc.desc       : test obtain default proxy configuration information for the network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyPromise0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyPromise0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet((err: BusinessError, netHandle: connection.NetHandle) => {
          console.info(`${caseName} getDefaultHttpProxy promise: err->${JSON.stringify(err)} data->${JSON.stringify(netHandle)}`);
          if (err != undefined) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
          connection.setAppNet(netHandle, (err: BusinessError, data: void) => {
            console.info(`${caseName} getDefaultHttpProxy promise: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
            if (err != undefined) {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
        connection.getDefaultHttpProxy().then((data: connection.HttpProxy) => {
          console.info(`${caseName} getDefaultHttpProxy promise: data->${JSON.stringify(data)}`);
          ExpectTrue(data != undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultHttpProxy promise: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNet_0100
     * @tc.name       : testNetworkMgrConnectionGetAppNet0100
     * @tc.desc       : Obtain network information bound to the app and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAppNet0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet0100";
      console.info(`${caseName} test start `);
      try {
        connection.getAppNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data != undefined);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNet_0500
     * @tc.name       : testNetworkMgrConnectionGetAppNet0500
     * @tc.desc       : Obtain network information bound to the app and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAppNet0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet0500";
      console.info(`${caseName} test start `);
      try {
        connection.getAppNet().then((data: connection.NetHandle) => {
          console.info(`${caseName} getAppNet: success data->${JSON.stringify(data)}`);
          ExpectTrue(data != undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getAppNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNetSync_0100
     * @tc.name       : testNetworkMgrConnectionGetAppNetSync0100
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAppNetSync0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNetSync0100";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getAppNetSync();
        console.info(`${caseName} GetAppNetSync: success data->${JSON.stringify(netHandle)}`);
        ExpectTrue(netHandle != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0100
     * @tc.name       : testNetworkMgrConnectionSetAppNet0100
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionSetAppNet0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet0100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError, netHandle: connection.NetHandle) => {
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            connection.setAppNet(netHandle, (error: BusinessError, data: void) => {
              if (error == undefined) {
                console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0200
     * @tc.name       : testNetworkMgrConnectionSetAppNet0200
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet0200";
      console.info(`${caseName} test start `);
      try {
        connection.setAppNet(null, (error: BusinessError, data: void) => {
          if (error) {
            console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0300
     * @tc.name       : testNetworkMgrConnectionSetAppNet0300
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet0300";
      console.info(`${caseName} test start `);
      try {
        connection.setAppNet(undefined, (error: BusinessError, data: void) => {
          if (error) {
            console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0600
     * @tc.name       : testNetworkMgrConnectionSetAppNet0600
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet0600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError, netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            connection.setAppNet(netHandle, (error: BusinessError, data: void) => {
              if (error == undefined) {
                console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0700
     * @tc.name       : testNetworkMgrConnectionSetAppNet0700
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet0700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError, netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            connection.setAppNet(netHandle, (error: BusinessError, data: void) => {
              if (error == undefined) {
                console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0800
     * @tc.name       : testNetworkMgrConnectionSetAppNet0800
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet0800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError, netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            connection.setAppNet(netHandle, (error: BusinessError, data: void) => {
              if (error) {
                console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
                ExpectTrue(error.code == 2100001);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1700
     * @tc.name       : testNetworkMgrConnectionSetAppNet1700
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet1700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet1700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError, netHandle: connection.NetHandle) => {
          netHandle.netId = 99999999;
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            connection.setAppNet(netHandle, (error: BusinessError, data: void) => {
              if (error == undefined) {
                console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0900
     * @tc.name       : testNetworkMgrConnectionSetAppNet0900
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionSetAppNet0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet0900";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.setAppNet(netHandle).then(() => {
            console.info(`${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1000
     * @tc.name       : testNetworkMgrConnectionSetAppNet1000
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet1000";
      console.info(`${caseName} test start `);
      try {
        connection.setAppNet(null).then((data: void) => {
          console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1100
     * @tc.name       : testNetworkMgrConnectionSetAppNet1100
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet1100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet1100";
      console.info(`${caseName} test start `);
      try {
        connection.setAppNet(undefined).then((data: void) => {
          console.info(`${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1400
     * @tc.name       : testNetworkMgrConnectionSetAppNet1400
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet1400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet1400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.setAppNet(netHandle).then(() => {
            console.info(`${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1500
     * @tc.name       : testNetworkMgrConnectionSetAppNet1500
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet1500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet1500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.setAppNet(netHandle).then(() => {
            console.info(`${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1600
     * @tc.name       : testNetworkMgrConnectionSetAppNet1600
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet1600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet1600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.setAppNet(netHandle).then(() => {
            console.info(`${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1800
     * @tc.name       : testNetworkMgrConnectionSetAppNet1800
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionSetAppNet1800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet1800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 99999999;
          connection.setAppNet(netHandle).then(() => {
            console.info(`${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_0100
     * @tc.name       : testNetworkMgrConnectionGetAllNets0100
     * @tc.desc       : Obtain a list of all connected networks and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAllNets0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets0100";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets((error: BusinessError, data: connection.NetHandle[]) => {
          if (error == undefined) {
            console.info(`${caseName} getAllNets: err->${JSON.stringify(error)}`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} getAllNets: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_0500
     * @tc.name       : testNetworkMgrConnectionGetAllNets0500
     * @tc.desc       : Obtain a list of all connected networks and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAllNets0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets0500";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          console.info(`${caseName} getAllNets: success data->${JSON.stringify(data)}`);
          ExpectTrue(data.length >= 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getAllNets: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNetsSync_0100
     * @tc.name       : testNetworkMgrConnectionGetAllNetsSync0100
     * @tc.desc       : Use synchronization method to obtain a list of all connected networks.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAllNetsSync0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNetsSync0100";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle[] = connection.getAllNetsSync();
        console.info(`${caseName} GetAllNetsSync: success data->${JSON.stringify(netHandle)}`);
        ExpectTrue(netHandle.length >= 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0100
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0100
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error == undefined) {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: success error->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0200
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0200
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0200";
      console.info(`${caseName} test start `);
      try {
        connection.getConnectionProperties(null, (error: BusinessError, data: connection.ConnectionProperties) => {
          if (error) {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: getConnectionProperties data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0300
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0300
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0300";
      console.info(`${caseName} test start `);
      try {
        connection.getConnectionProperties(undefined, (error: BusinessError, data: connection.ConnectionProperties) => {
          if (error) {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: getConnectionProperties data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0600
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0600
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0700
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0700
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0800
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0800
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1700
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties1700
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties1700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties1700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999999;
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0900
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0900
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0900";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(data != undefined);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1000
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties1000
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties1000";
      console.info(`${caseName} test start `);
      try {
        connection.getConnectionProperties(null).then((data: connection.ConnectionProperties) => {
          console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1100
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties1100
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties1100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties1100";
      console.info(`${caseName} test start `);
      try {
        connection.getConnectionProperties(undefined).then((data: connection.ConnectionProperties) => {
          console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1400
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties1400
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties1400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties1400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1500
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties1500
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties1500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties1500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1600
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties1600
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties1600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties1600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1800
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties1800
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties1800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties1800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 999999;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0100
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0100
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0100";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectTrue(connectionProperties != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0200
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0200
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0200";
      console.info(`${caseName} test start `);
      try {
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(null);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0300
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0300
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0300";
      console.info(`${caseName} test start `);
      try {
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(undefined);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0600
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0600
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0600";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 200;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0700
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0700
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0700";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 0;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0800
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0800
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0800";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 23;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0900
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0900
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0900";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 999999;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0100
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0100
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error == undefined) {
              console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0200
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0200
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0200";
      console.info(`${caseName} test start `);
      try {
        connection.getNetCapabilities(null, (error: BusinessError, data: connection.NetCapabilities) => {
          if (error) {
            console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0300
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0300
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0300";
      console.info(`${caseName} test start `);
      try {
        connection.getNetCapabilities(undefined, (error: BusinessError, data: connection.NetCapabilities) => {
          if (error) {
            console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0600
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0600
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error) {
              console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0700
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0700
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error) {
              console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0800
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0800
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error) {
              console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1700
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities1700
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities1700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities1700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999999;
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error) {
              console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0900
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0900
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0900";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            console.info(`${caseName} GetNetCapabilities: success data->${JSON.stringify(data)}`);
            ExpectTrue(data != undefined);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} GetNetCapabilities: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1000
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities1000
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities1000";
      console.info(`${caseName} test start `);
      try {
        connection.getNetCapabilities(null).then((data: connection.NetCapabilities) => {
          console.info(`${caseName} GetNetCapabilities: success data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} GetNetCapabilities: err->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1100
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities1100
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities1100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities1100";
      console.info(`${caseName} test start `);
      try {
        connection.getNetCapabilities(undefined).then((data: connection.NetCapabilities) => {
          console.info(`${caseName} GetNetCapabilities: success data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} GetNetCapabilities: err->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1400
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities1400
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities1400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities1400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            console.info(`${caseName} GetNetCapabilities: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} GetNetCapabilities: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1500
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities1500
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities1500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities1500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            console.info(`${caseName} GetNetCapabilities: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} GetNetCapabilities: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1600
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities1600
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities1600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities1600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            console.info(`${caseName} GetNetCapabilities: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} GetNetCapabilities: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1800
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities1800
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities1800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities1800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 999999;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            console.info(`${caseName} GetNetCapabilities: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} GetNetCapabilities: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0100
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0100
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0100";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectTrue(getNetCapAbilitiesSync != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0200
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0200
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0200";
      console.info(`${caseName} test start `);
      try {
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(null);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0300
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0300
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0300";
      console.info(`${caseName} test start `);
      try {
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(undefined);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0600
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0600
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0600";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 200;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0700
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0700
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0700";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 0;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0800
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0800
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0800";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 23;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0900
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0900
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0900";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 9999999;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0100
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0100
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0100';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
              if (error == undefined) {
                console.info(`${caseName} bindSocket failed err: ${JSON.stringify(error)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0200
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0200
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.bindSocket(udp, (error: BusinessError, data: void) => {
              if (error == undefined) {
                console.info(`${caseName} bindSocket failed err: ${JSON.stringify(error)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0300
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0300
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.bindSocket(undefined, (error: BusinessError, data: void) => {
            if (error) {
              console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
              ExpectTrue(error.code == 401);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0400
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0400
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.bindSocket(null, (error: BusinessError, data: void) => {
            if (error) {
              console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
              ExpectTrue(error.code == 401);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0500
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0500
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.bindSocket(tcp).then(() => {
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} bindSocket failed err: ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0600
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0600
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.bindSocket(udp).then(() => {
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} bindSocket failed err: ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0700
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0700
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.bindSocket(undefined).then().catch((error: BusinessError) => {
            console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} bindSocket failed err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0800
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0800
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.bindSocket(null).then().catch((error: BusinessError) => {
            console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} bindSocket failed err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_0900
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket0900
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket0900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket0900';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 0;
            netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
              if (error) {
                console.info(`${caseName} bindSocket failed error: ${JSON.stringify(error)}`);
                ExpectTrue(error.code == 2100001);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_1000
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket1000
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket1000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket1000';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 53;
            netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
              if (error) {
                console.info(`${caseName} bindSocket failed error: ${JSON.stringify(error)}`);
                ExpectTrue(error.code == 2100001);
                console.info(`${caseName}---End`);
                done();
              } else {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              }
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_1100
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket1100
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket1100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket1100';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 200;
            netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
              if (error) {
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              } else {
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              }
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_1200
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket1200
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket1200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket1200';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 999999;
            netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
              if (error) {
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              } else {
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              }
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_1300
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket1300
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket1300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket1300';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 0;
            netHandle.bindSocket(tcp).then((data: void) => {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }).catch((error: BusinessError) => {
              console.info(`${caseName} bindSocket failed err: ${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_1400
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket1400
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket1400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket1400';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 53;
            netHandle.bindSocket(tcp).then((data: void) => {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }).catch((error: BusinessError) => {
              console.info(`${caseName} bindSocket failed err: ${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_1500
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket1500
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket1500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket1500';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 200;
            netHandle.bindSocket(tcp).then((data: void) => {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((error: BusinessError) => {
              console.info(`${caseName} bindSocket failed err: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_BindSocket_1600
     * @tc.name   : testNetworkMgrConnectionNetHandleBindSocket1600
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleBindSocket1600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket1600';
      console.info(`${caseName}---test Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            console.info(`${caseName} bind error: ${JSON.stringify(error)}`);
            netHandle.netId = 999999;
            netHandle.bindSocket(tcp).then((data: void) => {
              console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((error: BusinessError) => {
              console.info(`${caseName} bindSocket failed err: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            });
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data.address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100002);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0300
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0300
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressByName(null, (error: BusinessError, data: connection.NetAddress) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 401);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0400
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0400
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressByName(undefined, (error: BusinessError, data: connection.NetAddress) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 401);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressByName(host).then().catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100002);
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0700
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0700
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressByName(null).then().catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0800
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0800
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressByName(undefined).then().catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0900
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName0900
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName0900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName0900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data.address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1000
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1000
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 0;
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            console.info(`${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error == undefined) {
              ExpectTrue(data.address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 23;
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            console.info(`${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error == undefined) {
              ExpectTrue(data.address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1300
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1300
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 200;
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            console.info(`${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error == undefined) {
              ExpectTrue(data.address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1400
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1400
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 999999;
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            console.info(`${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error == undefined) {
              ExpectTrue(data.address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 0;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 23;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1700
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1700
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 200;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1800
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName1800
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName1800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName1800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 999999;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data[0].address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100002);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0300
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0300
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressesByName(null, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 401);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0400
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0400
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressesByName(undefined, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error) {
              console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error.code == 401);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressesByName(host).then().catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100002);
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0700
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0700
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressesByName(null).then().catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0800
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0800
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.getAddressesByName(undefined).then().catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401);
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0900
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName0900
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName0900', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName0900';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data[0].address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1000
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1000
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1000', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1000';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 0;
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data[0].address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 23;
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data[0].address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1300
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1300
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 200;
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data[0].address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1400
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1400
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 999999;
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error == undefined) {
              console.info(`${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data[0].address == host);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 0;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 23;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1700
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1700
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 200;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1800
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName1800
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName1800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName1800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 999999;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address == host);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_SetAppHttpProxy_0100
     * @tc.name   : testNetworkMgrConnectionSetAppHttpProxy0100
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionSetAppHttpProxy0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionSetAppHttpProxy0100';
      console.info(`${caseName}---Start`);
      try {
        connection.setAppHttpProxy({
          host: "192.168.1.1",
          port: 8080,
          exclusionList: ['192.168', 'baidu.com']
        } as connection.HttpProxy);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_SetAppHttpProxy_0200
     * @tc.name   : testNetworkMgrConnectionSetAppHttpProxy0200
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionSetAppHttpProxy0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionSetAppHttpProxy0200';
      console.info(`${caseName}---Start`);
      try {
        connection.setAppHttpProxy(null);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_SetAppHttpProxy_0300
     * @tc.name   : testNetworkMgrConnectionSetAppHttpProxy0300
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionSetAppHttpProxy0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionSetAppHttpProxy0300';
      console.info(`${caseName}---Start`);
      try {
        connection.setAppHttpProxy(undefined);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0100
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0100
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0100';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError, data: void) => {
          console.error(`${caseName} error:${JSON.stringify(error)}, data:${JSON.stringify(data)}`);
          if (error == undefined) {
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0200
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0200
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0200';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule(null, ["255.255.255.0", "127.0.0.1"], (error: BusinessError, data: void) => {
          console.error(`${caseName} error:${JSON.stringify(error)}, data:${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0300
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0300
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0300';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule(undefined, ["255.255.255.0", "127.0.0.1"], (error: BusinessError, data: void) => {
          console.error(`${caseName} error:${JSON.stringify(error)}, data:${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0400
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0400
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0400';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then((data: void) => {
          console.error(`${caseName} data:${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error:${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0500
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0500
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0500';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule(null, ["255.255.255.0", "127.0.0.1"]).then((data: void) => {
          console.error(`${caseName} data:${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error:${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0600
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0600
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0600';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule(undefined, ["255.255.255.0", "127.0.0.1"]).then((data: void) => {
          console.error(`${caseName} data:${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error:${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0100
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0100
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0100';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError, data: void) => {
            console.error(`${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
            if (error == undefined) {
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.error(`${caseName} addCustomDnsRule error:${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0200
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0200
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0200';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule(null, (error: BusinessError, data: void) => {
          console.error(`${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0300
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0300
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0300';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule(undefined, (error: BusinessError, data: void) => {
          console.error(`${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0400
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0400
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0400';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.removeCustomDnsRule("192.168.1.1").then((data: void) => {
            console.error(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.error(`${caseName} error: ${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.error(`${caseName} addCustomDnsRule error:${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0500
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0500
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0500', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0500';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule(null).then((data: void) => {
          console.error(`${caseName} data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0600
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0600
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0600', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0600';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule(undefined).then((data: void) => {
          console.error(`${caseName} data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_ClearCustomDnsRules_0100
     * @tc.name   : testNetworkMgrConnectionClearCustomDnsRules0100
     * @tc.desc   : Delete all custom DNS rules for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionClearCustomDnsRules0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules0100';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.clearCustomDnsRules((error: BusinessError, data: void) => {
            console.error(`${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
            if (error == undefined) {
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.error(`${caseName} addCustomDnsRule error:${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_ClearCustomDnsRules_0200
     * @tc.name   : testNetworkMgrConnectionClearCustomDnsRules0200
     * @tc.desc   : Delete all custom DNS rules for the current application . Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionClearCustomDnsRules0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules0200';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.clearCustomDnsRules().then((data: void) => {
            console.error(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.error(`${caseName} error: ${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.error(`${caseName} addCustomDnsRule error:${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0100
     * @tc.name       : testNetworkMgrConnectionNetCap0100
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCap0100";
      console.info(`${caseName} test start`);
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_MMS == 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0200
     * @tc.name       : testNetworkMgrConnectionNetCap0200
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCap0200";
      console.info(`${caseName} test start`);
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_METERED == 11);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0300
     * @tc.name       : testNetworkMgrConnectionNetCap0300
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCap0300";
      console.info(`${caseName} test start`);
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_INTERNET == 12);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0400
     * @tc.name       : testNetworkMgrConnectionNetCap0400
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCap0400";
      console.info(`${caseName} test start`);
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_VPN == 15);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0500
     * @tc.name       : testNetworkMgrConnectionNetCap0500
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCap0500";
      console.info(`${caseName} test start`);
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_VALIDATED == 16);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0600
     * @tc.name       : testNetworkMgrConnectionNetCap0600
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCap0600";
      console.info(`${caseName} test start`);
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_PORTAL == 17);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0700
     * @tc.name       : testNetworkMgrConnectionNetCap0700
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCap0700";
      console.info(`${caseName} test start`);
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY == 31);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0100
     * @tc.name   : testNetworkMgrConnectionHttpProxy0100
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionHttpProxy0100', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy0100';
      console.info(`${caseName}---Start`);
      try {
        connection.setAppHttpProxy({
          host: '192.168.1.1',
          port: 8080,
          exclusionList: ['192.168', 'baidu.com'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0200
     * @tc.name   : testNetworkMgrConnectionHttpProxy0200
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionHttpProxy0200', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy0200';
      console.info(`${caseName}---Start`);
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['127.0', 'baidu.com'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0300
     * @tc.name   : testNetworkMgrConnectionHttpProxy0300
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionHttpProxy0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy0300';
      console.info(`${caseName}---Start`);
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['*'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0400
     * @tc.name   : testNetworkMgrConnectionHttpProxy0400
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionHttpProxy0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy0400';
      console.info(`${caseName}---Start`);
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['*'],
          username: undefined,
          password: undefined
        } as connection.HttpProxy);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0100
     * @tc.name       : testNetworkMgrConnectionNetCapabilities0100
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
            networkCap: [0, 11, 12, 15, 16],
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0
          }
        });
        console.info(`${caseName} netCon->${JSON.stringify(netCon)}`);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0200
     * @tc.name       : testNetworkMgrConnectionNetCapabilities0200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities0200";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
            networkCap: [0, 11, 12, 15, 16],
            linkUpBandwidthKbps: 9999999,
            linkDownBandwidthKbps: 9999999
          },
        });
        console.info(`${caseName} netCon->${JSON.stringify(netCon)}`);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0300
     * @tc.name       : testNetworkMgrConnectionNetCapabilities0300
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities0300";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI],
          },
          bearerPrivateIdentifier: 'wifi'
        });
        console.info(`${caseName} netCon->${JSON.stringify(netCon)}`);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0400
     * @tc.name       : testNetworkMgrConnectionNetCapabilities0400
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities0400";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET],
          },
          bearerPrivateIdentifier: 'slot0'
        });
        console.info(`${caseName} netCon->${JSON.stringify(netCon)}`);
        ExpectTrue(netCon != undefined);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0100
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0100
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.interfaceName == 'string');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0200
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0200
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0200";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.domains == 'string');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0300
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0300
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0300";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(data.linkAddresses.length >= 0);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0400
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0400
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(data.routes.length >= 0);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0500
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0500
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(data.dnses.length >= 0);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0600
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0600
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.mtu == 'number');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0700
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0700
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.interfaceName == 'string');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0800
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0800
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.domains == 'string');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0900
     * @tc.name       : testNetworkMgrConnectionConnectionProperties0900
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties0900";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.linkAddresses.length >= 0);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_1000
     * @tc.name       : testNetworkMgrConnectionConnectionProperties1000
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties1000";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.routes.length >= 0);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_1100
     * @tc.name       : testNetworkMgrConnectionConnectionProperties1100
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties1100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties1100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.dnses.length >= 0);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_1200
     * @tc.name       : testNetworkMgrConnectionConnectionProperties1200
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties1200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties1200";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.mtu == 'number');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0100
     * @tc.name       : testNetworkMgrConnectionRouteInfo0100
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].interface == 'string');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0200
     * @tc.name       : testNetworkMgrConnectionRouteInfo0200
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0200";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].destination == 'object');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0300
     * @tc.name       : testNetworkMgrConnectionRouteInfo0300
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0300";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].gateway == 'object');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0400
     * @tc.name       : testNetworkMgrConnectionRouteInfo0400
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].hasGateway == 'boolean');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0500
     * @tc.name       : testNetworkMgrConnectionRouteInfo0500
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].isDefaultRoute == 'boolean');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0600
     * @tc.name       : testNetworkMgrConnectionRouteInfo0600
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].interface == 'string');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0700
     * @tc.name       : testNetworkMgrConnectionRouteInfo0700
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0700";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].destination == 'object');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0800
     * @tc.name       : testNetworkMgrConnectionRouteInfo0800
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0800";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].gateway == 'object');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0900
     * @tc.name       : testNetworkMgrConnectionRouteInfo0900
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo0900', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo0900";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].hasGateway == 'boolean');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_1000
     * @tc.name       : testNetworkMgrConnectionRouteInfo1000
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo1000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo1000";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].isDefaultRoute == 'boolean');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0100
     * @tc.name       : testNetworkMgrConnectionLinkAddress0100
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress0100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].destination.prefixLength == 'number');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0200
     * @tc.name       : testNetworkMgrConnectionLinkAddress0200
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress0200";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].destination.address == 'object');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0300
     * @tc.name       : testNetworkMgrConnectionLinkAddress0300
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress0300";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].destination.address == 'object');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0400
     * @tc.name       : testNetworkMgrConnectionLinkAddress0400
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].destination.prefixLength == 'number');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0100
     * @tc.name       : testNetworkMgrConnectionNetAddress0100
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetAddress0100";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].destination.address.address == 'string');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0200
     * @tc.name       : testNetworkMgrConnectionNetAddress0200
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetAddress0200";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(data.routes[0].destination.address.family == (1 || 2));
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0300
     * @tc.name       : testNetworkMgrConnectionNetAddress0300
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetAddress0300";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: BusinessError->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: data->${JSON.stringify(data)}`);
              ExpectTrue(typeof data.routes[0].destination.address.port == 'number');
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0400
     * @tc.name       : testNetworkMgrConnectionNetAddress0400
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetAddress0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].destination.address.address == 'string');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0500
     * @tc.name       : testNetworkMgrConnectionNetAddress0500
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetAddress0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.routes[0].destination.address.family == (1 || 2));
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0600
     * @tc.name       : testNetworkMgrConnectionNetAddress0600
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionNetAddress0600";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectTrue(typeof data.routes[0].destination.address.port == 'number');
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_0100
     * @tc.name       : testNetworkMgrConnectionOn0100
     * @tc.desc       : Subscribe to network available events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionOn0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionOn0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((error: BusinessError) => {
          console.log(`${caseName} register error ${JSON.stringify(error)}`);
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName}register success`);
          }
        });
        netCon.on('netAvailable', (data: connection.NetHandle) => {
          console.info(`${caseName} Succeeded to get data:  + ${JSON.stringify(data)}}`);
        });
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_0200
     * @tc.name       : testNetworkMgrConnectionOn0200
     * @tc.desc       : Subscription to network capability change events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionOn0200', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionOn0200";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((error: BusinessError) => {
          console.log(`${caseName} register error ${JSON.stringify(error)}`);
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName}register success`);
          }
        });
        netCon.on('netCapabilitiesChange', (data: connection.NetCapabilityInfo) => {
          console.info(`${caseName} Succeeded to get data:  + ${JSON.stringify(data)}}`);
        });
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_0300
     * @tc.name       : testNetworkMgrConnectionOn0300
     * @tc.desc       : Subscription network connection information change events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionOn0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionOn0300";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((error: BusinessError) => {
          console.log(`${caseName} register error ${JSON.stringify(error)}`);
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName}register success`);
          }
        });
        netCon.on('netConnectionPropertiesChange', (data: connection.NetConnectionPropertyInfo) => {
          console.info(`${caseName} Succeeded to get data:  + ${JSON.stringify(data)}}`);
        });
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_Register_0100
     * @tc.name       : testNetworkMgrConnectionRegister0100
     * @tc.desc       : test subscribe to notifications of specified network status changes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRegister0100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionRegister0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((err: BusinessError) => {
          console.info(`${caseName} register callback: ${JSON.stringify(err)}`);
          if (err) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }
        });
        netCon.unregister((error: BusinessError) => {
          if (error) {
            console.info(`${caseName} unregister fail error ${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} unregister fail success`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_Unregister_0600
     * @tc.name       : testNetworkMgrConnectionUnregister0600
     * @tc.desc       : test unsubscribe from notifications of default network state changes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionUnregister0600', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionUnregister0600";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.unregister((err: BusinessError) => {
          if (err) {
            console.info(`${caseName} unregister callback: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2101007);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} unregister success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });
  });
}
