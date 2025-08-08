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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium'
import rpc from '@ohos.rpc';
import featureAbility from '@ohos.ability.featureAbility';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Want from '@ohos.app.ability.Want';
import ability from '@ohos.ability.ability';
import base from '@ohos.base';


export default function ConnectAbilityTest1() {
  let TAG = "";
  let Tempassert = "";
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let timeoutId = 0;

  describe('FreeInstall_FA_ConnectAbilityOne', () => {
    beforeAll(async (done: Function) => {
      console.info("FreeInstall_FA_ConnectAbility before all called");
      let cmd:string = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      console.info(TAG + " abilityDelegator : " + JSON.stringify(abilityDelegator));
      abilityDelegator.executeShellCommand(cmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      let cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(cmd1, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      let cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd2, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async (done: Function) => {
      console.info("FreeInstall_FA_ConnectAbility after each called");
      Tempassert = ""
      if ("FreeInstall_FA_ConnectAbility_1600" === TAG) {
        let cmd14 = "bm uninstall -n com.ohos.hag.famanager";
        abilityDelegator.executeShellCommand(cmd14, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand14 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      done();
    });


    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1500
     * @tc.name    The application is not in the foreground,
                   [start another project first, then connect,atomic service does not exist locally]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1500", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1500-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1500";
      let cmddif = "bm install -p data/test/ConnectDifferentApplication.hap";
      abilityDelegator.executeShellCommand(cmddif, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      featureAbility.startAbility({
        "want": {
          "bundleName": "com.example.different.hmservice",
          "abilityName": "MainAbility",
        }
      })
        .then((data) => {
          console.info(TAG + " startother successful. Data: " + JSON.stringify(data))
        }).catch((error:base.BusinessError) => {
        console.error(TAG + " startother  failed. Cause: " + JSON.stringify(error));
      })
      timeoutId = setTimeout(async () => {
        let request15:Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication5.ServiceAbility5",
          "moduleName": "myapplication5",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request15, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 10000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1500-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1600
     * @tc.name    The application is not in the foreground,
                   [start another project first, then connect,atomic service exists locally]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1600", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1600-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1600";
      let cmdmyapp4 = "bm install -p data/test/ConnectFaMyApplication4.hap";
      abilityDelegator.executeShellCommand(cmdmyapp4, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      featureAbility.startAbility({
        "want": {
          "bundleName": "com.example.different.hmservice",
          "abilityName": "MainAbility",
        }
      })
        .then((data) => {
          console.info(TAG + " startother successful. Data: " + JSON.stringify(data))
        }).catch((error:base.BusinessError) => {
        console.error(TAG + " startother  failed. Cause: " + JSON.stringify(error));
      })

      timeoutId = setTimeout(() => {
        let request16:Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication4.ServiceAbility4",
          "moduleName": "myapplication4",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request16, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500)
      }, 10000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1600-------------");
      done();
    });

    /*
    * @tc.number  FreeInstall_FA_ConnectAbility_1400
    * @tc.name    The application is not in the foreground [start myapp2 first, then connect]
    * @tc.desc    Function test
    * @tc.level   1
    */
    it("FreeInstall_FA_ConnectAbility_1400", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1400-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1400";
      featureAbility.startAbility({
        "want": {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication2.MainAbility",
        }
      })
        .then((data) => {
          console.info(TAG + " startmyapp2 successful. Data: " + JSON.stringify(data))
        }).catch((error:base.BusinessError) => {
        console.error(TAG + " startmyapp2 failed. Cause: " + JSON.stringify(error));
      })
      timeoutId = setTimeout(() => {
        let request14:Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication3",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request14, (status: string) => {
          Tempassert = status;
        });
        setTimeout(async () => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500);
      }, 10000)
      done();
      console.log("------------end FreeInstall_FA_ConnectAbility_1400-------------");
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1700
     * @tc.name    Do not pass flags, connect to the service of another project
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_1700", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1700-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1700";
      let cmddif = "bm install -p data/test/ConnectDifferentApplication.hap";
      await abilityDelegator.executeShellCommand(cmddif, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(() => {
        let request17:Want = {
          "bundleName": "com.example.different.hmservice",
          "abilityName": "com.example.different.ServiceAbility",
          "moduleName": "entry",
        }
        connectabillity(TAG, request17, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500);
      }, 10000)
      console.log("------------end FreeInstall_FA_ConnectAbility_1700-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1800
     * @tc.name    Incorrect moduleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1800", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1800-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1800";

      timeoutId = setTimeout(async () => {
        let request18:Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "xxxxx",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request18, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 10000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1800-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1900
     * @tc.name    The target is atomized as hapA, and hapB is placed under the path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1900", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_1900-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1900";
      let cmdmyapp5 = "cp data/test/ConnectFaMyApplication5.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
        "haps/entry/files";
      await abilityDelegator.executeShellCommand(cmdmyapp5, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(async () => {
        let request19:Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication3",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request19, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 10000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1900-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_2000
     * @tc.name    Pass in parameters
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_2000", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_2000-------------");
      TAG = "FreeInstall_FA_ConnectAbility_2000";
      let cmdmyapp5 = "cp data/test/ConnectFaMyApplication5.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
        "haps/entry/files";
      abilityDelegator.executeShellCommand(cmdmyapp5, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(async () => {
        let request20:Want = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication5.ServiceAbility5",
          "moduleName": "myapplication5",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          "parameters": {
            "name": 1111, "key1": "value1", "site": "nice to meet you!"
          },
        }
        connectabillity(TAG, request20, (status: string) => {
          Tempassert = status;
        });
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500)
      }, 10000)
      done();
      console.log("------------end FreeInstall_FA_ConnectAbility_2000-------------");
    });
  }
  )
}

export function sleep(time:number):Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

function tips(msg: string) {
  Prompt.showToast({
    message: msg,
    duration: 2000,
    bottom: '150px'
  });
}

async function connectabillity(msg: string, request: Want,callback:(status:string)=>void) {
  console.info(msg + "START");
  let options: ability.ConnectOptions = {
    onConnect: (element, proxy) => {
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
    onDisconnect: (element) => {
      console.info("FreeInstall_FA_ConnectAbility onDisconnect success!!!")
      console.info(msg + " onDisconnect success!!!");
      console.info(msg + " onDisconnect: " + JSON.stringify(element));
      callback("onDisconnect");
      tips("连接断开");
    },
    onFailed: (code) => {
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
