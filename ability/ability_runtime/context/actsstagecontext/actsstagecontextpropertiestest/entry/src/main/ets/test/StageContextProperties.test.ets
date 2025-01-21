/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, afterEach, beforeAll, beforeEach } from '@ohos/hypium'
import commonEvent from '@ohos.commonEventManager'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Driver, ON } from '@ohos.UiTest';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import base from '@ohos.base';

let driver = Driver.create();
let TAG: string = '';
let mSubscriber: commonEvent.CommonEventSubscriber;
let subscriberInfo_AbilityContext: commonEvent.CommonEventSubscribeInfo = {
  events: ["StartMainAbility3_CommonEvent_ContextOne", "StartMainAbility4_CommonEvent_ContextOne",
    "AssistContextTwo_StageAbilityA_Start_CommonEvent", "ACTS_INPUTMETHOD_CONTEXT_EVENT"],
};
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function beforeEachLoadmanagement() {
  abilityDelegator.executeShellCommand("hilog -Q pidoff", async (err, data) => {
  });
  abilityDelegator.executeShellCommand("hilog -Q domainoff", async (err, data) => {
  });
  abilityDelegator.executeShellCommand("hilog -G 20M", async (err, data) => {
  });
}

export default function stageContextPropertiesTest(abilityContext: common.UIAbilityContext) {

  describe('ActsStageContextPropertiesTest', () => {

    beforeEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, 3000)
    })
    beforeAll(async (done: Function) => {
      console.log("ActsStageContextPropertiesTest afterAll called");
      await abilityContext.startAbility({
        bundleName: "com.example.stagecontextpropertiestest",
        abilityName: "MainAbility2"
      }).then((data) => {
        console.log('ActsStageContextPropertiesTest - startMainAbility2: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log("ActsStageContextPropertiesTest - startMainAbility2 failed: "
          + JSON.stringify(err));
        done()
      })

      setTimeout(() => {
        console.log("ActsStageContextPropertiesTest afterAll end");
        done();
      }, 3000);
    })

    afterEach(async (done: Function) => {
      console.log("ActsStageContextPropertiesTest afterEach called");
      let wantInfo: Want = {
        bundleName: "com.example.stagecontextpropertiestest",
        abilityName: "MainAbility"
      }
      await abilityContext.startAbility(wantInfo).then((data) => {
        console.log("ActsStageContextPropertiesTest startMainAbility data : " + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log("ActsStageContextPropertiesTest startMainAbility err : " + JSON.stringify(err));
      })

      setTimeout(() => {
        console.log("ActsStageContextPropertiesTest afterEach end");
        done();
      }, 1500);
    })

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0100
     * @tc.name: Check that context paths of different Ability in the same hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0100', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0100"
      console.log(TAG + "--- start");

      checkAbilityContextDir(abilityContext);
      checkContextDirEqualA(abilityContext, globalThis.abilityContext2);
      done()
      console.log(TAG + "--- end");
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0200
     * @tc.name: Check that context paths of different Ability in the same hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0200', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0200"
      console.log(TAG + "--- start");
      checkApplicationContextDir(abilityContext.getApplicationContext());
      checkApplicationContextDir(globalThis.abilityStageContext.getApplicationContext());
      checkApplicationContextDir(globalThis.abilityContext2.getApplicationContext());
      checkContextDirEqualA(abilityContext.getApplicationContext(),
        globalThis.abilityContext2.getApplicationContext())
      checkContextDirEqualA(abilityContext.getApplicationContext(),
        globalThis.abilityStageContext.getApplicationContext())
      done()
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0300
     * @tc.name: Check that context paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0300', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0300"
      console.log(TAG + " --- start");

      checkAbilityContextDir(abilityContext);

      await commonEvent.createSubscriber(subscriberInfo_AbilityContext).then(async (data) => {
        console.log(TAG + " Create Subscriber");
        mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.log(TAG + " Subscribe CallBack data: " + JSON.stringify(data)
            + "err: " + JSON.stringify(err));
          checkContextDirEqualB(abilityContext, globalThis.abilityContextA)
          commonEvent.unsubscribe(mSubscriber, () => {
            console.log(TAG + " UnSubscribe CallBack");
            done();
          });
        });
      })

      await abilityContext.startAbility({
        bundleName: "com.example.stagecontextpropertiestest",
        abilityName: "MainAbility3",
      }).then((data) => {
        console.log(TAG + ' - startAbility: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log(TAG + " - start failed" + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0400
     * @tc.name: Check that ApplicationContext paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0400', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0400"
      console.log(TAG + " --- start");

      checkAbilityStageContextDir();

      await commonEvent.createSubscriber(subscriberInfo_AbilityContext).then(async (data) => {
        console.log(TAG + " Create Subscriber");
        let mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.log(TAG + " Subscribe CallBack data: " + JSON.stringify(data)
            + "err: " + JSON.stringify(err));
          checkContextDirEqualB(globalThis.abilityStageContext, globalThis.abilityStageContextA)
          commonEvent.unsubscribe(mSubscriber, () => {
            console.log(TAG + " UnSubscribe CallBack");
            done();
          });
        });
      })

      await abilityContext.startAbility({
        bundleName: "com.example.stagecontextpropertiestest",
        abilityName: "MainAbility3",
      }).then((data) => {
        console.log(TAG + ' - startAbility: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log(TAG + " - start failed" + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0500
     * @tc.name: Check that ApplicationContext paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0500', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0500"
      console.log(TAG + " --- start");
      checkApplicationContextDir(abilityContext.getApplicationContext());

      await commonEvent.createSubscriber(subscriberInfo_AbilityContext).then(async (data) => {
        console.log(TAG + " Create Subscriber");
        mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.log(TAG + " Subscribe CallBack data: " + JSON.stringify(data)
            + "err: " + JSON.stringify(err));
          checkContextDirEqualA(abilityContext.getApplicationContext(),
            globalThis.abilityContextA.getApplicationContext())
          checkContextDirEqualA(abilityContext.getApplicationContext(),
            globalThis.abilityStageContextA.getApplicationContext())
          checkContextDirEqualA(abilityContext.getApplicationContext(),
            globalThis.abilityStageContext.getApplicationContext())
          commonEvent.unsubscribe(mSubscriber, () => {
            console.log(TAG + " UnSubscribe CallBack");
            done();
          });
        });
      })

      await abilityContext.startAbility({
        bundleName: "com.example.stagecontextpropertiestest",
        abilityName: "MainAbility3",
      }).then((data) => {
        console.log(TAG + ' - startAbility: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log(TAG + " - start failed" + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    });


    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0600
     * @tc.name: Check that context paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0600', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0600"
      console.log(TAG + " --- start");
      checkAbilityContextDir(abilityContext);

      await commonEvent.createSubscriber(subscriberInfo_AbilityContext).then(async (data) => {
        console.log(TAG + " Create Subscriber");
        mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.log(TAG + " Subscribe CallBack data: " + JSON.stringify(data)
            + "err: " + JSON.stringify(err));
          if (data.event == "StartMainAbility4_CommonEvent_ContextOne") {
            checkContextDirEqualC(abilityContext, data.parameters.abilityContextAssistTwo)
            commonEvent.unsubscribe(mSubscriber, () => {
              console.log(TAG + " UnSubscribe CallBack");
              done();
            });
          }
        });
      })

      await abilityContext.startAbility({
        bundleName: "com.example.actsstagecontextassisttwo",
        abilityName: "MainAbility4",
        parameters: {
          startId: 1,
        }
      }).then((data) => {
        console.log(TAG + ' - startAbility: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log(TAG + " - start failed" + JSON.stringify(err));
        expect().assertFail()
        done()
      })

      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text(""));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);
        await driver.click(point.x, point.y);
      }
      done()
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0700
     * @tc.name: Check that context paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0700', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0700"
      console.log(TAG + " --- start");
      checkAbilityStageContextDir();

      await commonEvent.createSubscriber(subscriberInfo_AbilityContext).then(async (data) => {
        console.log(TAG + " Create Subscriber");
        mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.log(TAG + " Subscribe CallBack data: " + JSON.stringify(data)
            + "err: " + JSON.stringify(err));
          if (data.event == "AssistContextTwo_StageAbilityA_Start_CommonEvent") {
            checkContextDirEqualC(abilityContext, data.parameters.abilityStageContextAssistOne)
            commonEvent.unsubscribe(mSubscriber, () => {
              console.log(TAG + " UnSubscribe CallBack");
              done();
            });
          }
        });
      })

      await abilityContext.startAbility({
        bundleName: "com.example.actsstagecontextassisttwo",
        abilityName: "MainAbility4",
        parameters: {
          startId: 2,
        }
      }).then((data) => {
        console.log(TAG + ' - startAbility: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log(TAG + " - start failed" + JSON.stringify(err));
        expect().assertFail()
        done()
      })

      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text(""));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);
        await driver.click(point.x, point.y);
      }
      done()
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0800
     * @tc.name: Check that ApplicationContext paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_0800', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0800"
      console.log(TAG + " --- start");
      let num = 0;
      let abilityAppContext: common.ApplicationContext;
      let abilityStageAppContext: common.ApplicationContext;
      checkApplicationContextDir(abilityContext.getApplicationContext());

      await commonEvent.createSubscriber(subscriberInfo_AbilityContext).then(async (data) => {
        console.log(TAG + " Create Subscriber");
        mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.log(TAG + " Subscribe CallBack data: " + JSON.stringify(data)
            + "err: " + JSON.stringify(err));
          if (data.event == 'AssistContextTwo_StageAbilityA_Start_CommonEvent') {
            console.log(TAG + " AssistContextTwo_StageAbilityA_Start_CommonEvent")
            num++;
            abilityStageAppContext = data.parameters.abilityStageAppContextAssistOne
          }
          if (data.event == 'StartMainAbility4_CommonEvent_ContextOne') {
            console.log(TAG + " StartMainAbility4_CommonEvent_ContextOne")
            num++;
            abilityAppContext = data.parameters.abilityAppContextAssistTwo
          }
          if (num == 2) {
            console.log(TAG + " start expect");
            checkContextDirEqualA(abilityContext.getApplicationContext(), abilityAppContext)
            checkContextDirEqualA(abilityContext.getApplicationContext(), abilityStageAppContext)
            checkContextDirEqualA(abilityContext.getApplicationContext(),
              globalThis.abilityStageContext.getApplicationContext())
            commonEvent.unsubscribe(mSubscriber, () => {
              console.log(TAG + " UnSubscribe CallBack");
              done();
            });
          }
        });
      })

      await abilityContext.startAbility({
        bundleName: "com.example.actsstagecontextassisttwo",
        abilityName: "MainAbility4",
        parameters: {
          startId: 3,
        }
      }).then((data) => {
        console.log(TAG + ' - startAbility: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log(TAG + " - start failed" + JSON.stringify(err));
        expect().assertFail()
        done()
      })

      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text(""));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);
        await driver.click(point.x, point.y);
      }
      done()
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0900
     * @tc.name: Check that label paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 0
     */
    it('SUB_AA_OpenHarmony_Context_0900', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_0900"
      console.log(TAG + " --- start");
      let result: string = await globalThis.abilityContextRes.resourceManager.getString(16777219);
      console.log(TAG + " : result = " + JSON.stringify(result));
      expect(result).assertEqual("entry_MainAbility");
      done();
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_1000
     * @tc.name: Check that label paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_1000', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_1000"
      console.log(TAG + " --- start");
      let result: string = await globalThis.abilityStageContextRes.resourceManager.getString(16777219);
      console.log(TAG + " : result = " + JSON.stringify(result));
      expect(result).assertEqual("entry_MainAbility");
      done();
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_1100
     * @tc.name: Check that label paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_1100', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_1100"
      console.log(TAG + " --- start");
      let result: string = await globalThis.abilityStageContextRes.getApplicationContext()
        .resourceManager.getString(16777219);
      console.log(TAG + " : result = " + JSON.stringify(result));
      expect(result).assertEqual("feature_MainAbility");
      done();
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_1200
     * @tc.name: Check that label paths of different Ability in the different hap are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_1200', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_1200"
      console.log(TAG + " --- start");

      await commonEvent.createSubscriber(subscriberInfo_AbilityContext).then(async (data) => {
        console.log(TAG + " Create Subscriber");
        mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.log(TAG + " Subscribe CallBack data: " + JSON.stringify(data)
            + "err: " + JSON.stringify(err));
          console.log(TAG, JSON.stringify(globalThis.abilityContextA))
          console.log(TAG, JSON.stringify(globalThis.abilityContextA.resourceManager))
          let result: string = globalThis.abilityContextA.resourceManager.getStringSync(16777219);
          console.log(TAG + " : results = " + JSON.stringify(result));
          expect(result).assertEqual("feature_MainAbility");
          checkContextDirEqualB(abilityContext, globalThis.abilityContextA)
          commonEvent.unsubscribe(mSubscriber, () => {
            console.log(TAG + " UnSubscribe CallBack");
            done();
          });
        });
      })

      await abilityContext.startAbility({
        bundleName: "com.example.stagecontextpropertiestest",
        abilityName: "MainAbility3",
      }).then((data) => {
        console.log(TAG + ' - startAbility: ' + JSON.stringify(data));
      }).catch((err: base.BusinessError) => {
        console.log(TAG + " - start failed" + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_1300
     * @tc.name: Call createBundleContext through context and pass in the wrong package
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_1300', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_1300"
      console.log(TAG + " --- start");
      try {
        abilityContext.createBundleContext(" ");
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " createBundleContext = " + JSON.stringify(error));
        done()
      }
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_1400
     * @tc.name: Check that context paths of UIAbility and Isolated AppExtension are the same.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_1400', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_1400";
      console.log(TAG + "--- start");
      checkAbilityContextDir(abilityContext);
      let applicationContext = abilityContext.getApplicationContext();
      checkApplicationContextDir(applicationContext);

      commonEvent.createSubscriber(subscriberInfo_AbilityContext).then((data) => {
        console.debug(TAG + " Create Subscribe");
        mSubscriber = data;
        commonEvent.subscribe(mSubscriber, (err, data) => {
          console.debug(TAG + " subscribeCallBack data:" + JSON.stringify(data));
          if (data.event === "ACTS_INPUTMETHOD_CONTEXT_EVENT") {
            checkContextDirEqualA(abilityContext.filesDir, data.parameters.filesDir);
            checkContextDirEqualA(applicationContext.filesDir, data.parameters.appfilesDir);
            commonEvent.unsubscribe(mSubscriber, () => {
              console.debug(TAG + " unSubscribeCallback");
              done();
            });
          }
        });
      })
      abilityDelegator.executeShellCommand('aa start -b com.example.stagecontextpropertiestest -a inputMethod')
        .then(data => {
        })
        .catch((err: base.BusinessError) => {
          console.error(TAG + " executeShellCommand ====> result err" + JSON.stringify(err));
        })
      console.log(TAG + "--- end");
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_1500
     * @tc.name: Check that file created in the extensionContext of isolated AppExtension sandbox can not be opened in UIAbility sanbox.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_1500', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_1500"
      console.log(TAG + "--- start");
      checkAbilityContextDir(abilityContext);
      await abilityDelegator.executeShellCommand('aa start -b com.example.stagecontextpropertiestest -a inputMethod')
        .then(data => {
        })
        .catch((err: base.BusinessError) => {
          console.error(TAG + " executeShellCommand ====> result err" + JSON.stringify(err));
        })

      try {
        fs.openSync(abilityContext.filesDir + '/inputTest1.txt', fs.OpenMode.READ_WRITE);
      } catch (error) {
        console.error("openSync err:" + JSON.stringify(error));
        expect(error.code).assertEqual(13900002);
      }

      done();
      console.log(TAG + "--- end");
    });

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_1600
     * @tc.name: Check that file created in the extensionAppContext of isolated AppExtension sandbox can not be opened in UIAbility sanbox.
     * @tc.desc: Function test
     * @tc.level 3
     */
    it('SUB_AA_OpenHarmony_Context_1600', 0, async (done: Function) => {
      TAG = "SUB_AA_OpenHarmony_Context_1600"
      console.log(TAG + "--- start");
      let applicationContext = abilityContext.getApplicationContext();
      checkApplicationContextDir(applicationContext);
      await abilityDelegator.executeShellCommand('aa start -b com.example.stagecontextpropertiestest -a inputMethod')
        .then(data => {
        })
        .catch((err: base.BusinessError) => {
          console.error(TAG + " executeShellCommand ====> result err" + JSON.stringify(err));
        })

      try {
        fs.openSync(applicationContext.filesDir + '/inputTest2.txt', fs.OpenMode.READ_WRITE);
      } catch (error) {
        console.error("openSync err:" + JSON.stringify(error));
        expect(error.code).assertEqual(13900002);
      }

      done();
      console.log(TAG + "--- end");
    });
  })
}

function checkApplicationContextDir(applicationContext) {
  expect(applicationContext.cacheDir).assertEqual("/data/storage/el2/base/cache");
  expect(applicationContext.tempDir).assertEqual("/data/storage/el2/base/temp");
  expect(applicationContext.filesDir).assertEqual("/data/storage/el2/base/files");
  expect(applicationContext.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
  expect(applicationContext.databaseDir).assertEqual("/data/storage/el2/database");
  expect(applicationContext.preferencesDir).assertEqual("/data/storage/el2/base/preferences");
  expect(applicationContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
}

function checkAbilityContextDir(abilityContext) {
  expect(abilityContext.cacheDir).assertEqual("/data/storage/el2/base/haps/entry_test/cache");
  expect(abilityContext.tempDir).assertEqual("/data/storage/el2/base/haps/entry_test/temp");
  expect(abilityContext.filesDir).assertEqual("/data/storage/el2/base/haps/entry_test/files");
  expect(abilityContext.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
  expect(abilityContext.databaseDir).assertEqual("/data/storage/el2/database/entry_test");
  expect(abilityContext.preferencesDir).assertEqual("/data/storage/el2/base/haps/entry_test/preferences");
  expect(abilityContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
}

function checkContextDirEqualA(abilityContext, abilityContext2) {
  expect(abilityContext.cacheDir).assertEqual(abilityContext2.cacheDir);
  expect(abilityContext.tempDir).assertEqual(abilityContext2.tempDir);
  expect(abilityContext.filesDir).assertEqual(abilityContext2.filesDir);
  expect(abilityContext.distributedFilesDir).assertEqual(abilityContext2.distributedFilesDir);
  expect(abilityContext.databaseDir).assertEqual(abilityContext2.databaseDir);
  expect(abilityContext.storageDir).assertEqual(abilityContext2.storageDir);
  expect(abilityContext.bundleCodeDir).assertEqual(abilityContext2.bundleCodeDir);
}

function checkContextDirEqualB(abilityContext, abilityContext2) {
  expect(abilityContext2.cacheDir == "/data/storage/el2/base/haps/feature_assistone/cache" &&
    abilityContext2.cacheDir != abilityContext.cacheDir).assertTrue();
  expect(abilityContext2.databaseDir == "/data/storage/el2/database/feature_assistone" &&
    abilityContext2.databaseDir != abilityContext.databaseDir).assertTrue();
  expect(abilityContext2.filesDir == "/data/storage/el2/base/haps/feature_assistone/files" &&
    abilityContext2.filesDir != abilityContext.filesDir).assertTrue();
  expect(abilityContext2.preferencesDir == "/data/storage/el2/base/haps/feature_assistone/preferences" &&
    abilityContext2.preferencesDir != abilityContext.preferencesDir).assertTrue();
  expect(abilityContext2.tempDir == "/data/storage/el2/base/haps/feature_assistone/temp" &&
    abilityContext2.tempDir != abilityContext.tempDir).assertTrue();
  expect(abilityContext.distributedFilesDir).assertEqual(abilityContext2.distributedFilesDir);
  expect(abilityContext.bundleCodeDir).assertEqual(abilityContext2.bundleCodeDir);
}

function checkContextDirEqualC(abilityContext, abilityContext2) {
  expect(abilityContext2.cacheDir == "/data/storage/el2/base/haps/entry_assisttow/cache" &&
    abilityContext2.cacheDir != abilityContext.cacheDir).assertTrue();
  expect(abilityContext2.databaseDir == "/data/storage/el2/database/entry_assisttow" &&
    abilityContext2.databaseDir != abilityContext.databaseDir).assertTrue();
  expect(abilityContext2.filesDir == "/data/storage/el2/base/haps/entry_assisttow/files" &&
    abilityContext2.filesDir != abilityContext.filesDir).assertTrue();
  expect(abilityContext2.preferencesDir == "/data/storage/el2/base/haps/entry_assisttow/preferences" &&
    abilityContext2.preferencesDir != abilityContext.preferencesDir).assertTrue();
  expect(abilityContext2.tempDir == "/data/storage/el2/base/haps/entry_assisttow/temp" &&
    abilityContext2.tempDir != abilityContext.tempDir).assertTrue();
  expect(abilityContext.distributedFilesDir).assertEqual(abilityContext2.distributedFilesDir);
  expect(abilityContext.bundleCodeDir).assertEqual(abilityContext2.bundleCodeDir);
}

function checkAbilityStageContextDir() {
  expect(globalThis.abilityStageContext.cacheDir).assertEqual("/data/storage/el2/base/haps/entry_test/cache");
  expect(globalThis.abilityStageContext.tempDir).assertEqual("/data/storage/el2/base/haps/entry_test/temp");
  expect(globalThis.abilityStageContext.filesDir).assertEqual("/data/storage/el2/base/haps/entry_test/files");
  expect(globalThis.abilityStageContext.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
  expect(globalThis.abilityStageContext.databaseDir).assertEqual("/data/storage/el2/database/entry_test");
  expect(globalThis.abilityStageContext.preferencesDir)
    .assertEqual("/data/storage/el2/base/haps/entry_test/preferences");
  expect(globalThis.abilityStageContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
}