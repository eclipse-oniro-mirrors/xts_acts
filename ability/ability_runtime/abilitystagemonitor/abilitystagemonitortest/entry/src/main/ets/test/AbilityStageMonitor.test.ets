/*
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

import { describe, it, expect, afterEach } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let moduleName1: ESObject
let monitor: ESObject
let want: ESObject
let timeout = 3000;
let addMonitor = false;
let removeMonitor = false;

function sleep(delay: number) {
  let start = (new Date()).getTime();
  while ((new Date()).getTime() - start < delay) {
    continue;
  }
}

function test(time: number) {
  sleep(time);
}

export default function abilityStageMonitorTest() {
  describe('ActsAbilityTest', () => {

    afterEach(async (done: Function) => {
      console.log("SUB_AA_AbilityStageMonitor afterEach called");

      setTimeout(() => {
        console.log("SUB_AA_AbilityStageMonitor afterEach called");
        done();
      }, 1000);
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0100
     * @tc.name: Call waitAbilityStageMonitor in the form of callback, and enter the monitor
     * @tc.desc: Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 1
     */
    it('SUB_AA_AbilityStageMonitor_0100', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStage_0100 begin")
      try {
        let stage: AbilityDelegatorRegistry.AbilityStageMonitor= {
          moduleName: "feature_assista",
          srcEntrance: "./ets/Application/MyAbilityStage.ts",
        }
        abilityDelegator.waitAbilityStageMonitor(stage, (err, data) => {
          console.log("SUB_AA_AbilityStage_0100 waitAbilityStageMonitor callback " +
            "err = " + err + ", data = " + JSON.stringify(data));
          moduleName1 = data.context.currentHapModuleInfo.name;
          expect(moduleName1).assertEqual("feature_assista")
          done();
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStage_0100 waitAbilityStageMonitor callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }

      console.info("SUB_AA_AbilityStage_0100 start ability");

      want = {
        bundleName: "com.example.abilitystagemonitortest",
        abilityName: "MainAbility"
      };

      try {
        abilityDelegator.startAbility(want, (err, data) => {
          console.info("SUB_AA_AbilityStage_0100 startAbility callback err: " + JSON.stringify(err) + "data: " +
          JSON.stringify(data));
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStage_0100 startAbility callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }

    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0200
     * @tc.name: Call waitAbilityStageMonitor in the form of a promise, and enter the monitor
     * @tc.desc: Verify that the promise form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0200', 0, async (done: Function) => {
      console.log("SUB_AA_AbilityStage_0200 begin")

      monitor = {
        moduleName: "feature_assistd",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }

      console.log("SUB_AA_AbilityStageMonitor_0200 wait abilityStage");

      abilityDelegator.waitAbilityStageMonitor(monitor).then((abilityStage) => {
        console.log("SUB_AA_AbilityStageMonitor_0200 waitAbilityStageMonitor promise " +
          "abilityStage: " + JSON.stringify(abilityStage));
        moduleName1 = abilityStage.context.currentHapModuleInfo.name;
        expect(moduleName1).assertEqual(monitor.moduleName)
        done();
      }).catch((err: ESObject) => {
        console.log("SUB_AA_AbilityStageMonitor_0200 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      })

      console.log("SUB_AA_AbilityStageMonitor_0200 start ability");

      want = {
        bundleName: "com.example.abilitystagemonitortest",
        abilityName: "MainAbility3"
      };

      try {
        abilityDelegator.startAbility(want, (err, data) => {
          console.log("SUB_AA_AbilityStageMonitor_0200 startAbility callback err: " +
          JSON.stringify(err) + "data: " + JSON.stringify(data));
        });
      } catch (error) {
        console.log("SUB_AA_AbilityStageMonitor_0200 startAbility callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0300
     * @tc.name: Call waitAbilityStageMonitor in the form of callBack, enter the monitor, timeout
     * @tc.desc: Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0300', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_0300 begin")

      monitor = {
        moduleName: "feature_assistf",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }

      try {
        console.info("SUB_AA_AbilityStageMonitor_0300 wait abilityStage");
        abilityDelegator.waitAbilityStageMonitor(monitor, timeout, (err, data) => {
          moduleName1 = data.context.currentHapModuleInfo.name;
          console.info("SUB_AA_AbilityStageMonitor_0300 waitAbilityStageMonitor callback, err: " +
            err + ", data =" + JSON.stringify(data));
          expect(moduleName1).assertEqual(monitor.moduleName)
          done();
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStageMonitor_0300 waitAbilityStageMonitor callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }

      console.info("SUB_AA_AbilityStageMonitor_0300 start ability");

      want = {
        bundleName: "com.example.abilitystagemonitortest",
        abilityName: "MainAbilityf5"
      };

      try {
        abilityDelegator.startAbility(want, (err, data) => {
          console.info("SUB_AA_AbilityStageMonitor_0300 startAbility callback err: " +
          JSON.stringify(err) + "data: " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStageMonitor_0300 startAbility callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0400
     * @tc.name: Call waitAbilityStageMonitor in the form of promise, input monitor, timeout
     * @tc.desc: Verify that the promise form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0400', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_0400 begin")

      monitor = {
        moduleName: "feature_assistc",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }

      console.info("SUB_AA_AbilityStageMonitor_0400 wait abilityStage");

      abilityDelegator.waitAbilityStageMonitor(monitor, timeout).then((abilityStage) => {
        moduleName1 = abilityStage.context.currentHapModuleInfo.name;
        console.info("stageMonitor waitAbilityStageMonitor callback, abilityStage: " +
        JSON.stringify(abilityStage));
        expect(moduleName1).assertEqual(monitor.moduleName)
        done();
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_0400 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      })

      console.info("SUB_AA_AbilityStageMonitor_0400 start ability");

      test(1000)

      want = {
        bundleName: "com.example.abilitystagemonitortest",
        abilityName: "MainAbility2"
      };

      try {
        abilityDelegator.startAbility(want, (err, data) => {
          console.info("SUB_AA_AbilityStageMonitor_0400 startAbility callback err: " +
          JSON.stringify(err) + "data: " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStageMonitor_0400 startAbility callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0500
     * @tc.name: Call waitAbilityStageMonitor, the moduleName in the parameter monitor does not exist
     * @tc.desc: Verify that the moduleName passed in by waitAbilityStageMonitor
     * does not exist and throw an exception
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0500', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_0500 begin")

      monitor = {
        moduleName: "feature_as1",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }

      console.info("SUB_AA_AbilityStageMonitor_0500 wait abilityStage");

      await abilityDelegator.waitAbilityStageMonitor(monitor).then((abilityStage) => {
        console.info("stageMonitor waitAbilityStageMonitor callback, abilityStage = " + JSON.stringify(abilityStage));
        expect().assertFail()
        done()
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_0500 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
        done()
      })

      console.info("SUB_AA_AbilityStageMonitor_0500 start ability");

      want = {
        bundleName: "com.example.abilitystagemonitortest",
        abilityName: "MainAbility4"
      };

      try {
        abilityDelegator.startAbility(want, (err, data) => {
          console.info("SUB_AA_AbilityStageMonitor_0500 startAbility callback err: " +
          JSON.stringify(err) + "data: " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStageMonitor_0500 startAbility callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }

    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0600
     * @tc.name: Call waitAbilityStageMonitor, the srcEntrance in the parameter monitor does not exist
     * @tc.desc: Verify that the srcEntrance passed in by waitAbilityStageMonitor
     * does not exist and throw an exception
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0600', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_0600 begin")

      monitor = {
        moduleName: "feature_assistg",
        srcEntrance: "./ets/Application/AbilityStageA.ts",
      }

      console.info("SUB_AA_AbilityStageMonitor_0600 wait abilityStage");

      await abilityDelegator.waitAbilityStageMonitor(monitor).then((abilityStage) => {
        console.info("stageMonitor waitAbilityStageMonitor callback, abilityStage: " + JSON.stringify(abilityStage));
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_0600 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
        done()
      })

      console.info("SUB_AA_AbilityStageMonitor_0600 start ability");

      want = {
        bundleName: "com.example.abilitystagemonitortest",
        abilityName: "MainAbility6"
      };

      try {
        abilityDelegator.startAbility(want, (err, data) => {
          console.info("SUB_AA_AbilityStageMonitor_0600 startAbility callback err: " +
          JSON.stringify(err) + "data: " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStageMonitor_0600 startAbility callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0700
     * @tc.name: Call the promise form of addAbilityStageMonitor to add monitoring,
     * and call the promise form of removeAbilityStageMonitor to cancel monitoring
     * @tc.desc: Verify that addAbilityStageMonitor can add monitoring,
     * verify that removeAbilityStageMonitor can cancel monitoring
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0700', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_0700 begin")

      addMonitor = false;
      removeMonitor = false;
      monitor = {
        moduleName: "feature_assisth",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }

      console.info("SUB_AA_AbilityStageMonitor_0700 wait abilityStage");

      await abilityDelegator.addAbilityStageMonitor(monitor).then((data) => {
        console.info("stageMonitor addAbilityStageMonitor promise, data = " + data);
        addMonitor = true;
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_0700 addAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });

      await abilityDelegator.waitAbilityStageMonitor(monitor).then((abilityStage) => {
        console.info("stageMonitor waitAbilityStageMonitor callback, abilityStage: " + JSON.stringify(abilityStage));
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_0700 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
      })

      console.info("SUB_AA_AbilityStageMonitor_0700 removeAbilityStageMonitor");

      await abilityDelegator.removeAbilityStageMonitor(monitor).then((data) => {
        console.info("stageMonitor addAbilityStageMonitor promise, data = " + data);
        removeMonitor = true;
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_0700 removeAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });
      expect(addMonitor).assertTrue();
      expect(removeMonitor).assertTrue();
      done()
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0800
     * @tc.name: Call the callback form of addAbilityStageMonitor to add monitoring,
     * and call the callback form of removeAbilityStageMonitor to cancel monitoring
     * @tc.desc: Verify that addAbilityStageMonitor can add monitoring,
     * verify that removeAbilityStageMonitor can cancel monitoring
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0800', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_0800 begin")

      addMonitor = false;
      removeMonitor = false;
      monitor = {
        moduleName: "feature_assisti",
        srcEntrance: "./ets/Application/AbilityStage.ts",
      }

      console.info("SUB_AA_AbilityStageMonitor_0800 wait abilityStage");

      try {
        abilityDelegator.addAbilityStageMonitor(monitor, (err, data) => {
          console.info("SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback, data = " + data +
            "err: " + err);
          addMonitor = true;
        })
      } catch (error) {
        console.log("SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }

      await abilityDelegator.waitAbilityStageMonitor(monitor).then((abilityStage) => {
        console.info("stageMonitor waitAbilityStageMonitor callback, abilityStage: " + JSON.stringify(abilityStage));
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_0800 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
      })

      try {
        console.info("SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor");
        abilityDelegator.removeAbilityStageMonitor(monitor, (err, data) => {
          console.info("SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor callback, data = " +
            data + "err: " + err);
          removeMonitor = true;
        })
      } catch (error) {
        console.log("SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }

      setTimeout(() => {
        expect(addMonitor).assertTrue()
        expect(removeMonitor).assertTrue()
        done()
      }, 6000);

    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0900
     * @tc.name: Call waitAbilityStageMonitor, input monitor, timeout is 3 seconds
     * @tc.desc: Verify that waitAbilityStageMonitor is
     * created after listening for less than 3 seconds
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0900', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_0900 begin")

      monitor = {
        moduleName: "feature_assisth",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }

      console.info("SUB_AA_AbilityStageMonitor_0900 wait abilityStage");

      await abilityDelegator.waitAbilityStageMonitor(monitor, timeout).then((abilityStage) => {
        console.info("SUB_AA_AbilityStageMonitor_0900 waitAbilityStageMonitor promise, abilityStage: " +
        JSON.stringify(abilityStage));
        expect().assertFail()
        done();
      }).catch((err: ESObject) => {
        console.info("stageMonitor waitAbilityStageMonitor err = " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
        done();
      })

      test(3000)

      console.info("SUB_AA_AbilityStageMonitor_0900 start ability");

      want = {
        bundleName: "com.example.abilitystagemonitortest",
        abilityName: "MainAbility7"
      };

      try {
        abilityDelegator.startAbility(want, (err, data) => {
          console.info("SUB_AA_AbilityStageMonitor_0900 startAbility callback err: " +
          JSON.stringify(err) + "data: " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("SUB_AA_AbilityStageMonitor_0900 startAbility callback err: " + JSON.stringify(error));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_1000
     * @tc.name: Call the promise form of addAbilityStageMonitor to add monitoring,
     * call the promise form of removeAbilityStageMonitor to cancel monitoring,
     * and the moduleName in the parameter monitor does not exist
     * @tc.desc: Verify that addAbilityStageMonitor can add monitoring,
     * verify that removeAbilityStageMonitor can cancel monitoring
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_1000', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_1000 begin")

      addMonitor = false;
      removeMonitor = false;
      monitor = {
        moduleName: "feature_assa",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }

      console.info("SUB_AA_AbilityStageMonitor_1000 wait abilityStage");

      await abilityDelegator.addAbilityStageMonitor(monitor).then((data) => {
        console.info("SUB_AA_AbilityStageMonitor_1000 addAbilityStageMonitor promise, data = " + data);
        addMonitor = true;
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_1000 removeAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });

      console.info("stageMonitor removeAbilityStageMonitor");

      await abilityDelegator.removeAbilityStageMonitor(monitor).then((data) => {
        console.info("SUB_AA_AbilityStageMonitor_1000 addAbilityStageMonitor promise, data = " + data);
        removeMonitor = true;
      }).catch((err: ESObject) => {
        console.info("SUB_AA_AbilityStageMonitor_1000 removeAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });
      expect(addMonitor).assertTrue();
      expect(removeMonitor).assertTrue();
      done()
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitorSync_0100
     * @tc.name: Call the synchronous method of addAbilityStageMonitorSync to add monitoring,
     * call the ynchronous method of removeAbilityStageMonitorSync to cancel monitoring,
     * @tc.desc: Verify that addAbilityStageMonitorSync can add monitoring,
     * verify that removeAbilityStageMonitorSync can cancel monitoring
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitorSync_0100', 0, async (done: Function) => {
      console.info("SUB_AA_AbilityStageMonitor_1000 begin")
      monitor = {
        moduleName: "feature_assa",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }
      console.info("SUB_AA_AbilityStageMonitorSync_0100 wait abilityStage");
      globalThis.delegator = abilityDelegator
      try {
        await globalThis.delegator.addAbilityStageMonitorSync(monitor);
        console.info("SUB_AA_AbilityStageMonitorSync_0100 addAbilityStageMonitorSyce finish");
      } catch (error) {
        expect().assertFail()
        done()
      }
      try {
        await globalThis.delegator.removeAbilityStageMonitorSync(monitor);
        console.info("SUB_AA_AbilityStageMonitorSync_0100 removeAbilityStageMonitorSync finish");
      } catch (error) {
        expect().assertFail()
        done()
      }
      expect(true).assertTrue();
      done()
    })
  })
};