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
import featureAbility from '@ohos.ability.featureAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import commonEvent from '@ohos.commonEventManager';
import base from '@ohos.base';
import ability from '@ohos.ability.ability';

let subscriber:commonEvent.CommonEventSubscriber;
let dataAssert = "";
export default function connectAbilityTest_PA() {
  let TAG = "";
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
  let timeoutId = 0;
  let subscribeInfo:commonEvent.CommonEventSubscribeInfo = {
    events: ["service_event", "service2_event", "service3_event", "service4_event", "service5_event",
      "service6_event", "service7_event", "service8_event", "service9_event", "service10_event", "service11_event"]
  };


  describe('FreeInstall_FA_ConnectAbility_PA', ()=> {
    beforeAll(async (done:Function) => {
      console.info("FreeInstall_FA_ConnectAbility_PA before all called");
      console.info("FreeInstall_FA_ConnectAbility_PA commonEvent.createSubscriber start!!!");
      commonEvent.createSubscriber(subscribeInfo, CreateSubscriberCallBack);
      await sleep(2000);
      let cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      abilityDelegator.executeShellCommand(cmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(cmd1, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd2, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));

      })
      await sleep(500);
      let cmdum = "bm uninstall -n com.example.different.hmservice";
      abilityDelegator.executeShellCommand(cmdum, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async (done:Function) => {
      console.info("FreeInstall_FA_ConnectAbility_PA after each called");
      dataAssert = ""
      await sleep(1000);
      if ("FreeInstall_FA_ConnectAbility_PA_1100" === TAG) {
        let cmd14 = "bm uninstall -n com.ohos.hag.famanager";
        abilityDelegator.executeShellCommand(cmd14, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand14 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await sleep(500);
      clearTimeout(timeoutId);
      done();
    });

    /*
    * @tc.number  FreeInstall_FA_ConnectAbility_PA_0100
    * @tc.name    Deviceid is empty,atomic service does not exist locally
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("FreeInstall_FA_ConnectAbility_PA_0100", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0100-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0100";
      let cmdmyapp7 = "cp data/test/ConnectFaMyApplication7.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
        "haps/entry/files";
      abilityDelegator.executeShellCommand(cmdmyapp7, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(async () => {
        let str1:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility",
          }
        };
        startService(TAG, str1);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0100-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0200
     * @tc.name    Deviceid is empty,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_PA_0200", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0200-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0200";
      let cmdapp9 = "bm install -p data/test/ConnectFaMyApplication9.hap";
      abilityDelegator.executeShellCommand(cmdapp9, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(async () => {
        let str2:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility2",
          }
        };
        startService(TAG, str2);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0200-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0300
     * @tc.name    The bundleName passed in is different from the local
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_PA_0300", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0300-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0300";
      timeoutId = setTimeout(async () => {
        let str3:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility3",
          }
        };
        startService(TAG, str3);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0300-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0400
     * @tc.name    Do not pass flags, atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_PA_0400", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0400-------------");
      timeoutId = setTimeout(async () => {
        TAG = "FreeInstall_FA_ConnectAbility_PA_0400";
        let str4:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility4",
          }
        };
        startService(TAG, str4);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0400-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0500
     * @tc.name    Do not pass flags, atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_PA_0500", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0500-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0500";
      let cmdin = "bm install -p data/test/ConnectDifferentApplication.hap";
      abilityDelegator.executeShellCommand(cmdin, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      timeoutId = setTimeout(async () => {
        let str5:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility5",
          }
        };
        startService(TAG, str5);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0500-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0600
     * @tc.name    Incorrect deviceid passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_PA_0600", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0600-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0600";
      timeoutId = setTimeout(async () => {
        let str6:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility6",
          }
        };
        startService(TAG, str6);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0600-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0700
     * @tc.name    Incorrect bundleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_PA_0700", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0700-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0700";

      timeoutId = setTimeout(async () => {
        let str7:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility7",
          }
        };
        startService(TAG, str7);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0700-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0800
     * @tc.name    Pass in an empty abilityName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_PA_0800", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0800-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0800";

      timeoutId = setTimeout(async () => {
        let str8:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility8",
          }
        };
        startService(TAG, str8);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0800-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_0900
     * @tc.name    No atomic service under path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_PA_0900", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_0900-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_0900";
      let cmdrm = "rm -r /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/*";
      abilityDelegator.executeShellCommand(cmdrm, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })

      timeoutId = setTimeout(async () => {
        await sleep(500);
        let str9:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility9",
          }
        };
        startService(TAG, str9);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_0900-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_1000
     * @tc.name    Incorrect moduleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_PA_1000", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_1000-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_1000";

      timeoutId = setTimeout(async () => {
        let str10:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility10",
          }
        };
        startService(TAG, str10);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_1000-------------");
      }, 20000);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_PA_1100
     * @tc.name    Pass in parameters
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_PA_1100", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_FA_ConnectAbility_PA_1100-------------");
      TAG = "FreeInstall_FA_ConnectAbility_PA_1100";
      let cmdmyapp8 = "cp data/test/ConnectFaMyApplication8.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
        "haps/entry/files";
      abilityDelegator.executeShellCommand(cmdmyapp8, (err: base.BusinessError, d: ESObject) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })

      timeoutId = setTimeout(async () => {
        let str11:ability.StartAbilityParameter = {
          "want": {
            "bundleName": "com.example.myapplication.hmservice",
            "abilityName": "com.example.myapplication.ServiceAbility11",
          }
        };
        startService(TAG, str11);
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_PA_1100-------------");
      }, 20000);
      done();
    });
  }
  )
}

export function sleep(time:number):Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

async function startService(msg:string, str:ability.StartAbilityParameter) {
  console.info(msg + ' startService successful. str: ' + JSON.stringify(str));
  featureAbility.startAbility(str)
    .then((data) => {
      console.info(msg + ' startService successful. Data: ' + JSON.stringify(data));
    }).catch((error:base.BusinessError) => {
    console.error(msg + ' startService  failed. Cause: ' + JSON.stringify(error));
  })
}

function checkParameters(msg1:string, data:commonEvent.CommonEventData) {
  if (data.parameters?.['assertData'] === "onFailed") {
    dataAssert = "onFailed";
  } else if (data.parameters?.['assertData'] === "onDisconnect") {
    dataAssert = "onDisconnect";
  } else if (data.parameters?.['assertData'] === "onConnect") {
    dataAssert = "onConnect";
  }
}

function SubscribeCallBack(err:base.BusinessError, data:commonEvent.CommonEventData) {
  if (err.code) {
    console.error("commonEvent subscribe failed " + JSON.stringify(err));
  } else {
    if (data.event === "service_event") {
      console.info("commonEvent subscribe service " + JSON.stringify(data));
      checkParameters("commonEvent service", data)
    } else if (data.event === "service2_event") {
      console.info("commonEvent subscribe service2 " + JSON.stringify(data));
      checkParameters("commonEvent service2", data)
    } else if (data.event === "service3_event") {
      console.info("commonEvent subscribe service3 " + JSON.stringify(data));
      checkParameters("commonEvent service3", data)
    } else if (data.event === "service4_event") {
      console.info("commonEvent subscribe service4 " + JSON.stringify(data));
      checkParameters("commonEvent service4", data)
    } else if (data.event === "service5_event") {
      console.info("commonEvent subscribe service5 " + JSON.stringify(data));
      checkParameters("commonEvent service5", data)
    } else if (data.event === "service6_event") {
      console.info("commonEvent subscribe service6 " + JSON.stringify(data));
      checkParameters("commonEvent service6", data)
    } else if (data.event === "service7_event") {
      console.info("commonEvent subscribe service7 " + JSON.stringify(data));
      checkParameters("commonEvent service7", data)
    } else if (data.event === "service8_event") {
      console.info("commonEvent subscribe service8 " + JSON.stringify(data));
      checkParameters("commonEvent service8", data)
    } else if (data.event === "service9_event") {
      console.info("commonEvent subscribe service9 " + JSON.stringify(data));
      checkParameters("commonEvent service9", data)
    } else if (data.event === "service10_event") {
      console.info("commonEvent subscribe service10 " + JSON.stringify(data));
      checkParameters("commonEvent service10", data)
    } else if (data.event === "service11_event") {
      console.info("commonEvent subscribe service11 " + JSON.stringify(data));
      checkParameters("commonEvent service11", data)
    }
  }
}


function CreateSubscriberCallBack(err:base.BusinessError, commonEventSubscriber:commonEvent.CommonEventSubscriber) {
  if (err !=null && err.code) {
    console.error("commonEvent createSubscriber failed " + JSON.stringify(err));
  } else {
    console.info("----commonEvent createSubscriber------");
    subscriber = commonEventSubscriber;
    commonEvent.subscribe(subscriber, SubscribeCallBack);
  }
}
