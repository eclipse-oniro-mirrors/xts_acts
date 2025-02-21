// @ts-nocheck

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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import rpc from '@ohos.rpc';
import featureAbility from '@ohos.ability.featureAbility';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'


export default function ConnectAbilityTest1() {
  var TAG = "";
  var Tempassert = "";
  var abilityDelegator = undefined

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  describe('FreeInstall_FA_ConnectAbilityOne', function () {
    beforeAll(async function (done) {
      console.info("FreeInstall_FA_ConnectAbility before all called");
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      var cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      console.info(TAG + " abilityDelegator : " + JSON.stringify(abilityDelegator));
      abilityDelegator.executeShellCommand(cmd, (err: any, d: any) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(cmd1, (err: any, d: any) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd2, (err: any, d: any) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async function (done) {
      console.info("FreeInstall_FA_ConnectAbility after each called");
      Tempassert = ""
      if ("FreeInstall_FA_ConnectAbility_1600" === TAG) {
        var cmd14 = "bm uninstall -n com.ohos.hag.famanager";
        abilityDelegator.executeShellCommand(cmd14, (err: any, d: any) => {
          console.info("executeShellCommand14 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      done();
    });

    function tips(msg) {
      Prompt.showToast({
        message: msg,
        duration: 2000,
        bottom: '150px'
      });
    }

    async function connectabillity(msg, request) {
      console.info(msg + "START");
      let options = {
        onConnect: function (element, proxy) {
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
          Tempassert = "onConnect";
          tips("连接成功");
        },
        onDisconnect: function (element) {
          console.info("FreeInstall_FA_ConnectAbility onDisconnect success!!!")
          console.info(msg + " onDisconnect success!!!");
          console.info(msg + " onDisconnect: " + JSON.stringify(element));
          Tempassert = "onDisconnect";
          tips("连接断开");
        },
        onFailed: function (code) {
          console.info("FreeInstall_FA_ConnectAbility onFailed!!!")
          console.info(msg + " onFailed!!! ");
          console.info(msg + " onFailed: " + JSON.stringify(code));
          Tempassert = "onFailed";
          tips("连接失败");
        }
      }
      let connection = await featureAbility.connectAbility(request, options);
      console.info(msg + "request：" + JSON.stringify(request));
      console.info(msg + "options：" + JSON.stringify(options));
      console.info(msg + "connection=" + JSON.stringify(connection));
      console.info(msg + "END");
    }



    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1500
     * @tc.name    The application is not in the foreground,
                   [start another project first, then connect,atomic service does not exist locally]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1500", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1500-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1500";
      var cmddif = "bm install -p data/test/ConnectDifferentApplication.hap";
      abilityDelegator.executeShellCommand(cmddif, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var str = {
        "want": {
          "bundleName": "com.example.different.hmservice",
          "abilityName": "MainAbility",
        }
      };
      featureAbility.startAbility(str)
        .then((data) => {
          console.info(TAG + " startother successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
          console.error(TAG + " startother  failed. Cause: " + JSON.stringify(error));
        })
      setTimeout(async () => {
        var request15 = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication5.ServiceAbility5",
          "moduleName": "myapplication5",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request15);
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
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
    it("FreeInstall_FA_ConnectAbility_1600", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1600-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1600";
      var cmdmyapp4 = "bm install -p data/test/ConnectFaMyApplication4.hap";
      abilityDelegator.executeShellCommand(cmdmyapp4, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var str = {
        "want": {
          "bundleName": "com.example.different.hmservice",
          "abilityName": "MainAbility",
        }
      };
      featureAbility.startAbility(str)
        .then((data) => {
          console.info(TAG + " startother successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
          console.error(TAG + " startother  failed. Cause: " + JSON.stringify(error));
        })

      setTimeout(function () {
        var request16 = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication4.ServiceAbility4",
          "moduleName": "myapplication4",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request16);
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1600-------------");
      done();
    });

    /*
    * @tc.number  FreeInstall_FA_ConnectAbility_1400
    * @tc.name    The application is not in the foreground [start myapp2 first, then connect]
    * @tc.desc    Function test
    * @tc.level   1
    */
    it("FreeInstall_FA_ConnectAbility_1400", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1400-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1400";
      var str = {
        "want": {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication2.MainAbility",
        }
      }
      console.info(TAG + " startmyapp2 str: " + JSON.stringify(str));
      featureAbility.startAbility(str)
        .then((data) => {
          console.info(TAG + " startmyapp2 successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
          console.error(TAG + " startmyapp2 failed. Cause: " + JSON.stringify(error));
        })
      setTimeout(() => {
        var request14 = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication3",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request14);
        setTimeout(async () => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500);
      }, 2000)
      done();
      console.log("------------end FreeInstall_FA_ConnectAbility_1400-------------");
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1700
     * @tc.name    Do not pass flags, connect to the service of another project
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_1700", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1700-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1700";
      var cmddif = "bm install -p data/test/ConnectDifferentApplication.hap";
      await abilityDelegator.executeShellCommand(cmddif, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(() => {
        var request17 = {
          "bundleName": "com.example.different.hmservice",
          "abilityName": "com.example.different.ServiceAbility",
          "moduleName": "entry",
        }
        connectabillity(TAG, request17);
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500);
      }, 2000)
      console.log("------------end FreeInstall_FA_ConnectAbility_1700-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1800
     * @tc.name    Incorrect moduleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1800", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1800-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1800";

      setTimeout(async () => {
        var request18 = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "xxxxx",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request18);
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1800-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1900
     * @tc.name    The target is atomized as hapA, and hapB is placed under the path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1900", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1900-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1900";
      var cmdmyapp5 = "cp data/test/ConnectFaMyApplication5.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
        "haps/entry/files";
      await abilityDelegator.executeShellCommand(cmdmyapp5, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        var request19 = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication1.ServiceAbility_feature",
          "moduleName": "myapplication3",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        connectabillity(TAG, request19);
        setTimeout(() => {
          expect(Tempassert).assertEqual("onFailed");
        }, 500)
      }, 2000);
      console.log("------------end FreeInstall_FA_ConnectAbility_1900-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_2000
     * @tc.name    Pass in parameters
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_2000", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_2000-------------");
      TAG = "FreeInstall_FA_ConnectAbility_2000";
      var cmdmyapp5 = "cp data/test/ConnectFaMyApplication5.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
        "haps/entry/files";
      abilityDelegator.executeShellCommand(cmdmyapp5, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        var request20 = {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication5.ServiceAbility5",
          "moduleName": "myapplication5",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          "parameters": {
            "name": 1111, "key1": "value1", "site": "nice to meet you!"
          },
        }
        connectabillity(TAG, request20);
        setTimeout(() => {
          expect(Tempassert).assertEqual("onConnect");
        }, 500)
      }, 4000)
      done();
      console.log("------------end FreeInstall_FA_ConnectAbility_2000-------------");
    });
  }
  )
}