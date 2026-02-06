/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import rpc from '@ohos.rpc';
import featureAbility from '@ohos.ability.featureAbility';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Want from '@ohos.app.ability.Want';
import ability from '@ohos.ability.ability';
import base from '@ohos.base';



export default function ConnectAbilityTest() {
  let TAG = "";
  let Tempassert = "";
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let timeoutId = 0;

  describe('FreeInstall_FA_ConnectAbility', () => {
    beforeAll(async (done: Function) => {
      console.info("FreeInstall_FA_ConnectAbility before all called");
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      let cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      console.info(TAG + " abilityDelegator : " + JSON.stringify(abilityDelegator));
      abilityDelegator.executeShellCommand(cmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(cmd1, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd2, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async (done: Function) => {
      console.info("FreeInstall_FA_ConnectAbility after each called");
      Tempassert = ""
      if ("FreeInstall_FA_ConnectAbility_2000" === TAG) {
        let cmd14 = "bm uninstall -n com.ohos.hag.famanager";
        abilityDelegator.executeShellCommand(cmd14, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand14 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      clearTimeout(timeoutId);
      done();
    });


    // /*
    // * @tc.number  FreeInstall_FA_ConnectAbility_0100
    // * @tc.name    Pass in the local deviceid,atomic service does not exist locally
    // * @tc.desc    Function test
    // * @tc.level   0
    // */
    // it("FreeInstall_FA_ConnectAbility_0100", Level.LEVEL0, async (done: Function) => {
    //   console.log("------------start FreeInstall_FA_ConnectAbility_0100-------------");
    //   TAG = "FreeInstall_FA_ConnectAbility_0100";
    //   let cmd4 = "cp data/test/ConnectFaMyApplication6.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps" +
    //     "/entry/files";
    //   abilityDelegator.executeShellCommand(cmd4, (err: base.BusinessError, d: ESObject) => {
    //     console.info(TAG + " executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
    //   })

    //   timeoutId = setTimeout(async () => {
    //     let deviceid = "0";
    //     abilityDelegator.getCurrentTopAbility((err, data) => {
    //       console.log(TAG + 'getCurrentTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
    //       console.log(TAG + 'getCurrentTopAbility result deviceid:' + JSON.stringify(data.deviceId));
    //       deviceid = data.deviceId;
    //     })
    //     let request1: Want = {
    //       "deviceId": deviceid,
    //       "bundleName": "com.example.myapplication.hmservice",
    //       "abilityName": "com.example.myapplication6.ServiceAbility",
    //       "moduleName": "myapplication6",
    //       "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
    //     }
    //     connectabillity(TAG, request1, (status: string) => {
    //       Tempassert = status;
    //     });
    //     setTimeout(() => {
    //       expect(Tempassert).assertEqual("onConnect");
    //     }, 500)
    //   }, 2000);
    //   console.log("------------end FreeInstall_FA_ConnectAbility_0100-------------");
    //   done();
    // });

    // /*
    //  * @tc.number  FreeInstall_FA_ConnectAbility_0200
    //  * @tc.name    Pass in the local deviceid,atomic service exists locally
    //  * @tc.desc    Function test
    //  * @tc.level   0
    //  */
    // it("FreeInstall_FA_ConnectAbility_0200", Level.LEVEL0, async (done: Function) => {
    //   console.log("------------start FreeInstall_FA_ConnectAbility_0200-------------");
    //   TAG = "FreeInstall_FA_ConnectAbility_0200";
    //   let cmdapp10 = "bm install -p data/test/ConnectFaMyApplication10.hap";
    //   abilityDelegator.executeShellCommand(cmdapp10, (err: base.BusinessError, d: ESObject) => {
    //     console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
    //   })
    //   timeoutId = setTimeout(async () => {
    //     let deviceid = "0";
    //     abilityDelegator.getCurrentTopAbility((err, data) => {
    //       console.log(TAG + 'getCurrentTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
    //       console.log(TAG + 'getCurrentTopAbility result deviceid:' + JSON.stringify(data.deviceId));
    //       deviceid = data.deviceId;
    //     })
    //     let request2: Want = {
    //       "deviceId": deviceid,
    //       "bundleName": "com.example.myapplication.hmservice",
    //       "abilityName": "com.example.myapplication10.ServiceAbility",
    //       "moduleName": "myapplication10",
    //       "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
    //     }
    //     connectabillity(TAG, request2, (status: string) => {
    //       Tempassert = status;
    //     });
    //     setTimeout(() => {
    //       expect(Tempassert).assertEqual("onConnect");
    //     }, 500)
    //   }, 2000);
    //   console.log("------------end FreeInstall_FA_ConnectAbility_0200-------------");
    //   done();
    // });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0300
     * @tc.name    Deviceid is empty,atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_0300", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_0300-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0300";
      let cmd3 = "cp data/test/ConnectFaMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd3, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })

      timeoutId = setTimeout(async () => {
        let request3: Want = {
          "deviceId": "",
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication1",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request3, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_0300-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0400
     * @tc.name    Deviceid is empty,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_0400", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_0400-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0400";
      let cmdapp11 = "bm install -p data/test/ConnectFaMyApplication11.hap";
      abilityDelegator.executeShellCommand(cmdapp11, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(async () => {
        let request4: Want = {
          "deviceId": "",
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication11.ServiceAbility",
          "moduleName": "myapplication11",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request4, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_0400-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0500
     * @tc.name    The bundleName passed in is different from the local
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0500", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_0500-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0500";

      timeoutId = setTimeout(async () => {
        let request5: Want = {
          "bundleName": "com.example.different.hmservice",
          "abilityName": "com.example.different.ServiceAbility",
          "moduleName": "entry",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request5, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_0500-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0600
     * @tc.name    Pass in an empty bundleName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0600", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_0600-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0600";

      timeoutId = setTimeout(async () => {
        let request6: Want = {
          "bundleName": "",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication1",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request6, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_0600-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0700
     * @tc.name    Pass in an empty abilityName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0700", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_0700-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0700";

      timeoutId = setTimeout(async () => {
        let request7: Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "",
          "moduleName": "myapplication1",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request7, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_0700-------------");
      done();
    });

    /*
    * @tc.number  FreeInstall_FA_ConnectAbility_0800
    * @tc.name    Incorrect deviceid passed in
    * @tc.desc    Function test
    * @tc.level   1
    */
    it("FreeInstall_FA_ConnectAbility_0800", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_0800-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0800";

      timeoutId = setTimeout(async () => {
        let request8: Want = {
          "deviceId": "xxxxxx",
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication2.ServiceAbility",
          "moduleName": "myapplication2",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request8, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_0800-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0900
     * @tc.name    Incorrect bundleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0900", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_0900-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0900";

      timeoutId = setTimeout(async () => {
        let request9: Want = {
          "bundleName": "com.example.xxx.hmservice",
          "abilityName": "com.example.myapplication2.ServiceAbility",
          "moduleName": "myapplication2",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request9, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_0900-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1000
     * @tc.name    Incorrect flags passed in,atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1000", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1000-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1000";

      timeoutId = setTimeout(async () => {
        let request10: Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication2.ServiceAbility",
          "moduleName": "myapplication2",
          "flags": 1111111,
        }
        connectabillity(TAG, request10, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1000-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1200
     * @tc.name    No atomic service under path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1200", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1200-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1200";
      let cmdrm = "rm -r /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/*";
      abilityDelegator.executeShellCommand(cmdrm, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(async () => {
        let request12: Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication3",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request12, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1200-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1300
     * @tc.name    The application is not in the foreground [start MainAbility2 first, then connect]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1300", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1300-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1300";
      featureAbility.startAbility({
        "want": {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication.MainAbility2",
        }
      })
        .then((data) => {
          console.info(TAG + " startmainability2 successful. Data: " + JSON.stringify(data))
        }).catch((error:base.BusinessError) => {
        console.error(TAG + " startmainability2 failed. Cause: " + JSON.stringify(error));
      })

      timeoutId = setTimeout(async () => {
        let request13: Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication3",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request13, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1300-------------");
      done();
    });

  })
}

export function sleep(time:number):Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

export function tips(msg:string) {
  Prompt.showToast({
    message: msg,
    duration: 2000,
    bottom: '150px'
  });
}

export async function connectabillity(msg:string, request:Want,callback:(status:string)=>void) {
  console.info(msg + "START");
  let options:ability.ConnectOptions = {
    onConnect:  (element, proxy) =>{
      console.info("FreeInstall_FA_ConnectAbility onConnect success!!!")
      console.info(msg + " onConnect success!!! ");
      console.info(msg + " onConnect: " + JSON.stringify(element));
      console.info(msg + " onConnect: " + JSON.stringify(proxy));
      if (proxy == null) {
        console.error("FreeInstall_FA_ConnectAbility proxy null");
        return;
      }
      let option = new rpc.MessageOption();
      let data = new rpc.MessageParcel();
      let reply = new rpc.MessageParcel();
      data.writeInterfaceToken("ohos.appexecfwk.IApplicationStateObserver");
      proxy.sendRequest(0, data, reply, option);
      callback("onConnect");
      tips("连接成功");
    },
    onDisconnect:  (element)=> {
      console.info("FreeInstall_FA_ConnectAbility onDisconnect success!!!")
      console.info(msg + " onDisconnect success!!!");
      console.info(msg + " onDisconnect: " + JSON.stringify(element));
      callback("onDisconnect");
      tips("连接断开");
    },
    onFailed:(code)=> {
      console.info("FreeInstall_FA_ConnectAbility onFailed!!!")
      console.info(msg + " onFailed!!! ");
      console.info(msg + " onFailed: " + JSON.stringify(code));
      callback("onFailed");
      tips("连接失败");
    }
  }
  let connection = await featureAbility.connectAbility(request, options);
  console.info(msg + "request：" + JSON.stringify(request));
  console.info(msg + "options：" + JSON.stringify(options));
  console.info(msg + "connection=" + JSON.stringify(connection));
  console.info(msg + "END");
}